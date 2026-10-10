import Foundation
import XCTest
@testable import ExcalidrawZ

final class MCPLibraryAssetStoreTests: XCTestCase {
    func testPortableAssetsRoundTripAndCanRollbackFailedMetadataCommit() throws {
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent("mcp-library-assets-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: directory) }
        let store = MCPLibraryAssetStore(directory: directory)
        let id = UUID()
        let first = ["icon": resource("icon", extra: ["customData": .object(["source": .string("diagram")])])]
        XCTAssertNil(try store.save(first, libraryID: id))
        XCTAssertEqual(try store.load(libraryID: id), first)
        let backup = try store.save(["second": resource("second")], libraryID: id)
        XCTAssertNotNil(backup)
        try store.restore(backup, libraryID: id)
        XCTAssertEqual(try store.load(libraryID: id), first)
        try store.remove(libraryID: id)
        XCTAssertEqual(try store.load(libraryID: id), [:])
    }

    func testInvalidAssetsAreRejectedBeforeCreatingStorage() throws {
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent("mcp-library-invalid-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: directory) }
        let store = MCPLibraryAssetStore(directory: directory)
        XCTAssertThrowsError(try store.save(["wrong": resource("different")], libraryID: UUID()))
        XCTAssertThrowsError(try store.save(["remote": resource("remote", extra: ["dataURL": .string("https://example.com/image.png")])], libraryID: UUID()))
        XCTAssertThrowsError(try store.save(["broken": resource("broken", extra: ["dataURL": .string("data:image/png;base64," + Data("not an image".utf8).base64EncodedString())])], libraryID: UUID()))
        XCTAssertFalse(FileManager.default.fileExists(atPath: directory.path))
    }

    func testSVGRequiresAnSVGRootAndDoesNotResolveExternalEntities() throws {
        let valid: MCPJSONValue = .object(["id": .string("vector"), "mimeType": .string("image/svg+xml"), "dataURL": .string("data:image/svg+xml;base64," + Data("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"1\" height=\"1\"><rect width=\"1\" height=\"1\"/></svg>".utf8).base64EncodedString())])
        XCTAssertNoThrow(try MCPLibraryAssetStore.validate(["vector": valid]))
        let invalid: MCPJSONValue = .object(["id": .string("vector"), "mimeType": .string("image/svg+xml"), "dataURL": .string("data:image/svg+xml;base64," + Data("<html><svg/></html>".utf8).base64EncodedString())])
        XCTAssertThrowsError(try MCPLibraryAssetStore.validate(["vector": invalid]))
    }

    private func resource(_ id: String, extra: [String: MCPJSONValue] = [:]) -> MCPJSONValue {
        var value: [String: MCPJSONValue] = ["id": .string(id), "mimeType": .string("image/png"), "dataURL": .string("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAusB9Wl6nU8AAAAASUVORK5CYII="), "created": .number(0)]
        value.merge(extra) { _, right in right }
        return .object(value)
    }
}
