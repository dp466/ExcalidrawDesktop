#if os(macOS)
import XCTest
import CoreData
@testable import ExcalidrawZ

@MainActor
final class AutosavePersistenceTests: XCTestCase {
    func testHostedTestsUseOnlyInMemoryStores() {
        XCTAssertTrue(AppRuntime.isRunningTests)
        let stores = PersistenceController.shared.container.persistentStoreCoordinator.persistentStores
        XCTAssertEqual(stores.count, 2)
        XCTAssertTrue(stores.allSatisfy { $0.type == NSInMemoryStoreType })
    }

    func testAutosaveWaitsForDiskAndKeepsRecoveryWhenOriginalWriteFails() async throws {
        let root = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
        defer { try? FileManager.default.removeItem(at: root) }
        let destination = root.appendingPathComponent("drawing.excalidraw")
        var scene = ExcalidrawFile()
        try XCTUnwrap(scene.content).write(to: destination)
        let state = FileState()
        state.mcpCheckpointSuppressionDepth = 1
        let recovery = root.appendingPathComponent("recovery")
        state.autosaveRecoveryStore = LocalAutosaveRecoveryStore(directory: recovery)
        let active = FileState.ActiveFile.temporaryFile(destination)
        let opened = await state.requestActiveFileChange(active)
        XCTAssertTrue(opened)
        state.shouldIgnoreUpdate = false // Emulate completed canvas loading.
        scene.id = active.id
        try await state.persistAutosave(scene)
        let disk = try Data(contentsOf: destination)
        _ = try ExcalidrawFile(data: disk)
        if case .saved = state.autosaveStatus {} else { XCTFail("Must acknowledge completed disk save") }

        // A directory occupying the destination guarantees atomic file replacement fails.
        try FileManager.default.removeItem(at: destination)
        try FileManager.default.createDirectory(at: destination, withIntermediateDirectories: true)
        do {
            try await state.persistAutosave(scene)
            XCTFail("Storage failure must propagate")
        } catch {}
        if case .failed = state.autosaveStatus {} else { XCTFail("Failure must stay visible") }
        let enumerator = FileManager.default.enumerator(at: recovery, includingPropertiesForKeys: nil)!
        let copies = enumerator.compactMap { $0 as? URL }.filter { $0.pathExtension == "excalidraw" }
        XCTAssertFalse(copies.isEmpty)
        _ = try ExcalidrawFile(data: Data(contentsOf: XCTUnwrap(copies.first)))

        try FileManager.default.removeItem(at: destination)
        try await state.persistAutosave(scene)
        _ = try ExcalidrawFile(data: Data(contentsOf: destination))
        if case .saved = state.autosaveStatus {} else { XCTFail("A successful retry must clear the failure") }
    }

    func testStaleDocumentCannotOverwriteNewSelection() async throws {
        let root = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
        defer { try? FileManager.default.removeItem(at: root) }
        let a = root.appendingPathComponent("a.excalidraw")
        let b = root.appendingPathComponent("b.excalidraw")
        var scene = ExcalidrawFile()
        let initial = try XCTUnwrap(scene.content)
        try initial.write(to: a)
        try initial.write(to: b)
        let state = FileState()
        state.autosaveRecoveryStore = LocalAutosaveRecoveryStore(directory: root.appendingPathComponent("recovery"))
        scene.id = FileState.ActiveFile.temporaryFile(a).id
        let opened = await state.requestActiveFileChange(.temporaryFile(b))
        XCTAssertTrue(opened)
        do { try await state.persistAutosave(scene); XCTFail("Stale document must be rejected") }
        catch is CancellationError {} catch { XCTFail("Unexpected error: \(error)") }
        XCTAssertEqual(try Data(contentsOf: b), initial)
    }
    func testRecoveryFailureDoesNotRejectSuccessfulPrimarySave() async throws {
        let root = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
        defer { try? FileManager.default.removeItem(at: root) }
        let destination = root.appendingPathComponent("drawing.excalidraw")
        let blockedRecovery = root.appendingPathComponent("recovery")
        try Data("not a directory".utf8).write(to: blockedRecovery)
        var scene = ExcalidrawFile()
        try XCTUnwrap(scene.content).write(to: destination)
        let state = FileState()
        state.mcpCheckpointSuppressionDepth = 1
        state.autosaveRecoveryStore = LocalAutosaveRecoveryStore(directory: blockedRecovery)
        let active = FileState.ActiveFile.temporaryFile(destination)
        let opened = await state.requestActiveFileChange(active)
        XCTAssertTrue(opened)
        state.shouldIgnoreUpdate = false // Emulate completed canvas loading.
        scene.id = active.id
        // Success lets the snapshot coordinator acknowledge and clear native dirty state.
        try await state.persistAutosave(scene)
        _ = try ExcalidrawFile(data: Data(contentsOf: destination))
        if case .savedWithRecoveryWarning = state.autosaveStatus {} else {
            XCTFail("Primary save must succeed with a distinct recovery warning")
        }
    }

}
#endif
