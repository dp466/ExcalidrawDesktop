#if os(macOS)
import XCTest
import AppKit
import CoreData
import Security
import SwiftUI
@testable import ExcalidrawZ

/// Opt-in host for the real Codex/Claude Code acceptance workflow. It exposes
/// only an isolated local folder and the test application's in-memory database.
@MainActor
final class MCPRealClientAcceptanceTests: XCTestCase {
    private let root = URL(fileURLWithPath: "/private/tmp/full-mcp-validation", isDirectory: true)

    func testRealClientsAcceptanceHarness() async throws {
        guard ProcessInfo.processInfo.environment["EXCALIDRAW_MCP_REAL_CLIENT_TEST"] == "1" else {
            throw XCTSkip("Run the dedicated real-client acceptance harness explicitly.")
        }
        try await runHarness(exposeClients: true)
    }

    func testNativeCommandServiceTransactionAndPersistence() async throws {
        try await runHarness(exposeClients: false)
    }

    private func runHarness(exposeClients: Bool) async throws {
        let root = exposeClients ? self.root : FileManager.default.temporaryDirectory.appendingPathComponent("mcp-native-service-" + UUID().uuidString, isDirectory: true)
        defer { if !exposeClients { try? FileManager.default.removeItem(at: root) } }
        let persistence = PersistenceController.shared
        let stores = persistence.container.persistentStoreCoordinator.persistentStores
        guard AppRuntime.isRunningTests, !stores.isEmpty, stores.allSatisfy({ $0.type == NSInMemoryStoreType }) else {
            XCTFail("Real-client acceptance must use the test application's in-memory stores")
            return
        }
        let context = persistence.container.viewContext
        let manager = FileManager.default
        try manager.createDirectory(at: root, withIntermediateDirectories: true, attributes: [.posixPermissions: 0o700])
        try manager.setAttributes([.posixPermissions: 0o700], ofItemAtPath: root.path)
        let configURL = root.appendingPathComponent("client-config.json")
        let readyURL = root.appendingPathComponent("ready.json")
        let finishedURL = root.appendingPathComponent("finished")
        // Only the opt-in client harness owns these coordination files.
        // The native regression uses a fresh UUID directory and creates none.
        if exposeClients {
            for url in [configURL, readyURL, finishedURL] {
                guard manager.fileExists(atPath: url.path) else { continue }
                do { try manager.removeItem(at: url) }
                catch let error as NSError where error.domain == NSCocoaErrorDomain && error.code == NSFileNoSuchFileError {
                    // Removal is idempotent; an earlier runner's cleanup may have
                    // completed between a filesystem observation and this call.
                }
            }
        }
        defer {
            if exposeClients {
                try? manager.removeItem(at: configURL)
                try? manager.removeItem(at: readyURL)
            }
        }

        let documents = root.appendingPathComponent("documents", isDirectory: true)
        try manager.createDirectory(at: documents, withIntermediateDirectories: true, attributes: [.posixPermissions: 0o700])
        let folder = try LocalFolder(url: documents, context: context)
        try context.save()
        let folderID = folder.objectID.uriRepresentation().absoluteString
        let initialURL = documents.appendingPathComponent("Acceptance starting canvas.excalidraw")
        let initialScene = Data(##"{"type":"excalidraw","version":2,"source":"mcp-real-client-acceptance","elements":[],"appState":{"viewBackgroundColor":"#ffffff"},"files":{}}"##.utf8)
        try initialScene.write(to: initialURL, options: .atomic)

        let state = FileState()
        state.currentActiveGroup = .localFolder(folder)
        guard await state.requestActiveFileChange(.localFile(initialURL)) else {
            XCTFail("Could not open the isolated acceptance canvas")
            return
        }
        let status = MCPAcceptanceCanvasStatus()
        let host = NSHostingView(rootView: MCPAcceptanceCanvas(fileState: state, status: status)
            .environment(\.managedObjectContext, context)
            .environmentObject(AppPreference())
            .environmentObject(ExportState())
            .environmentObject(ToolState())
            .environmentObject(CanvasPreferencesState()))
        let window = NSWindow(contentRect: CGRect(x: 0, y: 0, width: 1200, height: 850), styleMask: [.titled, .closable, .resizable], backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.title = "MCP real-client acceptance — isolated documents"
        window.contentView = host
        // Keep the rendered fixture behind the user's foreground app.
        window.orderBack(nil)
        defer { window.close() }
        ExcalidrawMCPAppBridge.shared.register(fileState: state, context: context)

        let documentID = try XCTUnwrap(state.currentActiveFile?.id)
        let readinessDeadline = Date().addingTimeInterval(45)
        while state.excalidrawWebCoordinator?.documentSyncController.currentLoadedFileID != documentID {
            if let error = status.error { throw MCPAcceptanceHarnessError.editor(error) }
            guard Date() < readinessDeadline else { throw MCPAcceptanceHarnessError.editor("Bundled editor did not load the isolated document within 45 seconds.") }
            try await Task.sleep(nanoseconds: 100_000_000)
        }

        // Exercise the actual native service before exposing it to clients.
        // Direct JS tests cannot catch an invalid native revision preflight.
        let service = ExcalidrawMCPDiagramCommandService.shared
        let inspected = try await service.callTool(name: "read_diagram", arguments: ["document_id": .string(documentID)], clientID: "acceptance-preflight")
        let revision = try XCTUnwrap(inspected.structuredContent?["revision"])
        let edit = try await service.callTool(name: "apply_operations", arguments: [
            "document_id": .string(documentID), "expected_revision": revision,
            "request_id": .string(UUID().uuidString), "operations": .array([.object([
                "type": .string("create"), "elements": .array([.object([
                    "type": .string("rectangle"), "id": .string("acceptance-preflight-node"),
                    "x": .number(0), "y": .number(0), "width": .number(180), "height": .number(80)
                ])])
            ])])
        ], clientID: "acceptance-preflight")
        guard !edit.isError, edit.structuredContent?["changed"] == .bool(true) else {
            throw MCPAcceptanceHarnessError.editor("Native transaction preflight failed: " + String(describing: edit.structuredContent))
        }
        for (kind, format) in [("file", "excalidraw"), ("image", "png"), ("image", "svg"), ("pdf", "pdf")] {
            var arguments: [String: MCPJSONValue] = ["document_id": .string(documentID), "kind": .string(kind)]
            if kind == "image" { arguments["format"] = .string(format); arguments["editable"] = .bool(true) }
            let exported = try await service.callTool(name: "export_diagram", arguments: arguments, clientID: "acceptance-preflight")
            guard !exported.isError, let urlString = exported.structuredContent?["url"]?.stringValue,
                  let url = URL(string: urlString), url.isFileURL else {
                throw MCPAcceptanceHarnessError.editor("Native " + format + " export preflight failed: " + String(describing: exported.structuredContent))
            }
            let bytes = try Data(contentsOf: url)
            XCTAssertGreaterThan(bytes.count, 100)
            XCTAssertNotNil(exported.structuredContent?["revision"])
            try FileManager.default.removeItem(at: url)
        }
        let undone = try await service.callTool(name: "history", arguments: [
            "document_id": .string(documentID), "expected_revision": try XCTUnwrap(edit.structuredContent?["revision"]),
            "request_id": .string(UUID().uuidString), "operation": .string("undo")
        ], clientID: "acceptance-preflight")
        guard !undone.isError else { throw MCPAcceptanceHarnessError.editor("Native undo preflight failed.") }
        let restored = try await service.callTool(name: "read_diagram", arguments: ["document_id": .string(documentID)], clientID: "acceptance-preflight")
        guard restored.structuredContent?["total"] == .number(0) else {
            throw MCPAcceptanceHarnessError.editor("Native undo did not restore the blank starting scene.")
        }

        guard exposeClients else { return }

        let identities = try ["codex", "claudeCode"].map { name in
            (name: name, id: UUID().uuidString, token: try Self.randomToken())
        }
        let tokens = Dictionary(uniqueKeysWithValues: identities.map { ("Bearer " + $0.token, $0.id) })
        let port: UInt16 = 18490
        let endpoint = "http://127.0.0.1:\(port)/mcp"
        let server = ExcalidrawZMCPServer(port: port, router: ExcalidrawMCPToolRouter(serviceMode: .full), authenticate: { bearer in
            guard let bearer else { return nil }
            return tokens.first { ExcalidrawMCPCredentialStore.constantTimeEqual($0.key, bearer) }?.value
        })
        let serving = Task { try await server.start() }
        do {
            try await server.waitUntilListening()
            let clients = Dictionary(uniqueKeysWithValues: identities.map {
                ($0.name, ["client_id": $0.id, "token": $0.token])
            })
            try Self.writePrivateJSON(["url": endpoint, "clients": clients], to: configURL)
            try Self.writePrivateJSON([
                "url": endpoint,
                "protocol_versions": MCPTransportPolicy.supportedVersions,
                "document_id": documentID,
                "local_folder_id": folderID,
                "documents_path": documents.path,
                "finished_path": finishedURL.path,
                "client_config_path": configURL.path
            ], to: readyURL)
            let deadline = Date().addingTimeInterval(20 * 60)
            while !manager.fileExists(atPath: finishedURL.path) {
                if let error = status.error { throw MCPAcceptanceHarnessError.editor(error) }
                guard Date() < deadline else { throw MCPAcceptanceHarnessError.timeout }
                try await Task.sleep(nanoseconds: 1_000_000_000)
            }
            await server.stop()
            serving.cancel()
        } catch {
            await server.stop()
            serving.cancel()
            throw error
        }
    }

    private static func randomToken() throws -> String {
        var bytes = [UInt8](repeating: 0, count: 32)
        guard SecRandomCopyBytes(kSecRandomDefault, bytes.count, &bytes) == errSecSuccess else {
            throw MCPAcceptanceHarnessError.randomness
        }
        return Data(bytes).base64EncodedString()
    }

    private static func writePrivateJSON(_ value: [String: Any], to url: URL) throws {
        let data = try JSONSerialization.data(withJSONObject: value, options: [.prettyPrinted, .sortedKeys])
        try data.write(to: url, options: .atomic)
        try FileManager.default.setAttributes([.posixPermissions: 0o600], ofItemAtPath: url.path)
    }
}

private enum MCPAcceptanceHarnessError: LocalizedError {
    case editor(String), timeout, randomness
    var errorDescription: String? {
        switch self {
        case .editor(let message): message
        case .timeout: "Real-client acceptance did not write its finished flag within 20 minutes."
        case .randomness: "Secure random generation failed for the in-memory test credentials."
        }
    }
}

@MainActor
private final class MCPAcceptanceCanvasStatus: ObservableObject {
    var error: String?
}

/// Uses the production canvas/save hooks without normal library/sidebar startup
/// actions or the user's MCP settings. Real document switches hydrate this view.
@MainActor
private struct MCPAcceptanceCanvas: View {
    @ObservedObject var fileState: FileState
    let status: MCPAcceptanceCanvasStatus
    @State private var scene: ExcalidrawFile?
    @State private var loading: ExcalidrawCanvasView.LoadingState = .loading

    var body: some View {
        ExcalidrawCanvasView(file: $scene, loadingState: $loading, onPersistSnapshot: { snapshot in
            try await fileState.persistAutosave(snapshot)
            guard fileState.currentActiveFile?.id == snapshot.id else { throw CancellationError() }
            scene = snapshot
        }, onError: { status.error = $0.localizedDescription })
        .environmentObject(fileState)
        .task(id: fileState.currentActiveFile?.id) {
            guard let active = fileState.currentActiveFile else { scene = nil; return }
            fileState.excalidrawWebCoordinator?.documentSyncController.setTargetFileID(active.id)
            do {
                let data: Data
                switch active {
                case .localFile(let url): data = try await FileSyncCoordinator.shared.openFile(url)
                case .file(let file): data = try await file.loadContent(applyingLocalViewport: true)
                default: throw MCPAcceptanceHarnessError.editor("Acceptance supports the isolated app-managed and linked local documents only.")
                }
                let opened = try await ExcalidrawFile.decodeForOpening(data: data, id: active.id)
                guard !Task.isCancelled, fileState.currentActiveFile?.id == active.id else { return }
                scene = opened
            } catch is CancellationError {
                return
            } catch {
                status.error = error.localizedDescription
            }
        }
    }
}
#endif
