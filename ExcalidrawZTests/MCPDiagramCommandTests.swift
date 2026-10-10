import XCTest
@testable import ExcalidrawZ

final class MCPDiagramCommandTests: XCTestCase {
    @MainActor
    func testDocumentSwitchWaitsForCapturedAutomationToFinish() async throws {
        let state = FileState()
        let a = FileState.ActiveFile.temporaryFile(URL(fileURLWithPath: "/private/tmp/mcp-a.excalidraw"))
        let b = FileState.ActiveFile.temporaryFile(URL(fileURLWithPath: "/private/tmp/mcp-b.excalidraw"))
        let opened = await state.requestActiveFileChange(a)
        XCTAssertTrue(opened)
        XCTAssertTrue(state.beginDiagramAutomation(documentID: a.id))
        let switched = await state.requestActiveFileChange(b)
        XCTAssertFalse(switched)
        XCTAssertEqual(state.currentActiveFile, a)
        state.endDiagramAutomation()
        let resumed = await state.requestActiveFileChange(b)
        XCTAssertTrue(resumed)
        XCTAssertEqual(state.currentActiveFile, b)
    }
    actor Counter {
        var value = 0
        func increment() -> Int { value += 1; return value }
        func count() -> Int { value }
    }

    func testDurableReceiptsDoNotRepeatMutationsAcrossRestart() async throws {
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        defer { try? FileManager.default.removeItem(at: directory) }
        let receipt = directory.appendingPathComponent("receipts.json")
        let counter = Counter()
        let execute: @Sendable (String, [String: MCPJSONValue], String) async throws -> ExcalidrawMCPToolResult = { _, _, _ in
            let count = await counter.increment()
            return .init(text: "committed", structuredContent: .object(["count": .number(Double(count))]))
        }
        let arguments: [String: MCPJSONValue] = ["action": .string("create"), "name": .string("Fixture"), "request_id": .string("first")]
        let first = ExcalidrawMCPDiagramCommandService(receiptURL: receipt, executor: execute)
        let committed = try await first.callTool(name: "document_command", arguments: arguments, clientID: "client-a")
        let restarted = ExcalidrawMCPDiagramCommandService(receiptURL: receipt, executor: execute)
        let replay = try await restarted.callTool(name: "document_command", arguments: arguments, clientID: "client-a")
        XCTAssertEqual(committed.jsonValue, replay.jsonValue)
        var different = arguments; different["name"] = .string("Other")
        let conflict = try await restarted.callTool(name: "document_command", arguments: different, clientID: "client-a")
        XCTAssertTrue(conflict.isError)
        XCTAssertEqual(conflict.structuredContent?["error"]?["code"], .string("request_id_conflict"))
        _ = try await restarted.callTool(name: "document_command", arguments: arguments, clientID: "client-b")
        let count = await counter.count()
        XCTAssertEqual(count, 2)
        // Model process death after the write-ahead receipt, before outcome save.
        var disk = try XCTUnwrap(JSONSerialization.jsonObject(with: Data(contentsOf: receipt)) as? [String: [String: Any]])
        disk["client-a\u{0}first"]?.removeValue(forKey: "result")
        try JSONSerialization.data(withJSONObject: disk).write(to: receipt)
        let interrupted = ExcalidrawMCPDiagramCommandService(receiptURL: receipt, executor: execute)
        let unknown = try await interrupted.callTool(name: "document_command", arguments: arguments, clientID: "client-a")
        XCTAssertEqual(unknown.structuredContent?["error"]?["code"], .string("request_outcome_unknown"))
        let finalCount = await counter.count()
        XCTAssertEqual(finalCount, 2)
    }

    func testTypedOperationsRejectMalformedBatchesBeforeExecution() throws {
        let schema = try XCTUnwrap(ExcalidrawMCPFullToolCatalog.tools.first { $0.name == "apply_operations" }?.inputSchema)
        let base: [String: MCPJSONValue] = ["document_id": .string("doc"), "expected_revision": .string("revision"), "request_id": .string("test")]
        var malformed = base
        malformed["operations"] = .array([.object(["type": .string("resize"), "ids": .array([.string("node")]), "width": .number(20)])])
        XCTAssertThrowsError(try MCPJSONSchemaValidator.validate(.object(malformed), schema: schema))
        var valid = base
        valid["operations"] = .array([.object(["type": .string("rotate"), "ids": .array([.string("node")]), "angle": .number(0.5), "relative": .bool(true)])])
        XCTAssertNoThrow(try MCPJSONSchemaValidator.validate(.object(valid), schema: schema))
        valid["client_id"] = .string("spoofed")
        XCTAssertThrowsError(try MCPJSONSchemaValidator.validate(.object(valid), schema: schema))
    }

    func testNativeImageContentDoesNotDuplicateBase64InMetadata() {
        let result = ExcalidrawMCPDiagramCommandService.response(.object([
            "revision": .string("exact"), "image": .object(["data": .string("bytes"), "mime_type": .string("image/png")])
        ]))
        XCTAssertEqual(result.content.count, 2)
        XCTAssertNil(result.structuredContent?["image"])
        XCTAssertEqual(result.structuredContent?["revision"], .string("exact"))
        XCTAssertEqual(result.jsonValue["content"]?.arrayValue?[1]["type"], .string("image"))
    }

    func testAssetHydrationPreservesExtensionMetadata() throws {
        let data = Data(#"{"type":"excalidraw","version":2,"source":"test","elements":[],"appState":{},"files":{"asset":{"id":"asset","mimeType":"image/png","dataURL":"data:image/png;base64,aGVsbG8=","created":1,"extensionMetadata":{"source":"fixture"}}}}"#.utf8)
        var file = try ExcalidrawFile(data: data)
        try file.updateContentFilesFromFiles()
        let result = try MCPJSONValue.parse(from: XCTUnwrap(file.content))
        XCTAssertEqual(result["files"]?["asset"]?["extensionMetadata"]?["source"], .string("fixture"))
    }
}
