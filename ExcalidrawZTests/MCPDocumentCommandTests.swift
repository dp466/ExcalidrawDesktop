import Foundation
import XCTest
@testable import ExcalidrawZ

final class MCPDocumentCommandTests: XCTestCase {
    func testNamesCannotTurnFolderCreationIntoPathTraversal() throws {
        for value in ["", "  ", ".", "..", ".hidden", "../escape", "a/b", "a\\b", "a:b", "line\nfeed", String(repeating: "é", count: 111)] {
            XCTAssertThrowsError(try MCPDocumentCommandValidation.name(value), value)
        }
        XCTAssertEqual(try MCPDocumentCommandValidation.name("  Montréal — réseau  "), "Montréal — réseau")
    }

    func testApprovedPathsUseComponentBoundariesAndRejectSymlinkEscapes() throws {
        let temporary = FileManager.default.temporaryDirectory.appendingPathComponent("mcp-scope-\(UUID().uuidString)", isDirectory: true)
        let root = temporary.appendingPathComponent("approved", isDirectory: true)
        let outside = temporary.appendingPathComponent("outside", isDirectory: true)
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
        try FileManager.default.createDirectory(at: outside, withIntermediateDirectories: true)
        defer { try? FileManager.default.removeItem(at: temporary) }
        let symlink = root.appendingPathComponent("escape")
        try FileManager.default.createSymbolicLink(at: symlink, withDestinationURL: outside)
        XCTAssertTrue(MCPDocumentCommandValidation.contained(root.appendingPathComponent("diagrams/new.excalidraw"), in: root))
        XCTAssertFalse(MCPDocumentCommandValidation.contained(temporary.appendingPathComponent("approved-other/file.excalidraw"), in: root))
        XCTAssertFalse(MCPDocumentCommandValidation.contained(symlink.appendingPathComponent("file.excalidraw"), in: root))
    }

    func testLibraryInsertionRemapsRelationshipsAndPreservesExtensionFields() throws {
        let box = element("box", fields: ["frameId": .string("frame"), "groupIds": .array([.string("group")]), "boundElements": .array([.object(["id": .string("label"), "type": .string("text")])]), "customData": .object(["service": .string("Nordcom")]), "futureProperty": .array([.number(42)])])
        let frame = element("frame", type: "frame", x: 5, y: 10)
        let label = element("label", type: "text", fields: ["containerId": .string("box"), "groupIds": .array([.string("group")])])
        let arrow = element("arrow", type: "arrow", fields: ["startBinding": .object(["elementId": .string("box"), "focus": .number(0.3)]), "endBinding": .object(["elementId": .string("external")])])
        let input: MCPJSONValue = .array([box, frame, label, arrow])
        let first = try MCPDocumentCommandValidation.insertion(input, x: 100, y: 200)
        let second = try MCPDocumentCommandValidation.insertion(input, x: 100, y: 200)
        XCTAssertEqual(Set(first.compactMap { $0["id"]?.stringValue }).count, 4)
        XCTAssertTrue(Set(first.compactMap { $0["id"]?.stringValue }).isDisjoint(with: second.compactMap { $0["id"]?.stringValue }))
        XCTAssertEqual(first[0]["frameId"], first[1]["id"])
        XCTAssertEqual(first[2]["containerId"], first[0]["id"])
        XCTAssertEqual(first[0]["boundElements"]?.arrayValue?.first?["id"], first[2]["id"])
        XCTAssertEqual(first[3]["startBinding"]?["elementId"], first[0]["id"])
        XCTAssertEqual(first[3]["startBinding"]?["focus"], .number(0.3))
        XCTAssertEqual(first[3]["endBinding"], .null)
        XCTAssertEqual(first[0]["groupIds"], first[2]["groupIds"])
        XCTAssertNotEqual(first[0]["groupIds"], box["groupIds"])
        XCTAssertEqual(first[0]["customData"], box["customData"])
        XCTAssertEqual(first[0]["futureProperty"], box["futureProperty"])
        XCTAssertEqual(first[1]["x"], .number(100))
        XCTAssertEqual(first[1]["y"], .number(200))
    }

    func testLibraryInsertionRejectsPartialOrAmbiguousInputBeforeMutation() throws {
        XCTAssertThrowsError(try MCPDocumentCommandValidation.elements(.array([])))
        XCTAssertThrowsError(try MCPDocumentCommandValidation.elements(.array([element("same"), element("same")])))
        XCTAssertThrowsError(try MCPDocumentCommandValidation.elements(.array([.object(["id": .string("missingGeometry"), "type": .string("rectangle")])])))
        XCTAssertThrowsError(try MCPDocumentCommandValidation.insertion(.array([element("box")]), x: .infinity, y: 0))
    }

    func testInsertionAssetsCannotOverwriteExistingFileIDsAndPreserveExtensions() throws {
        let image = element("image", type: "image", fields: ["fileId": .string("original")])
        let resource: MCPJSONValue = .object(["id": .string("original"), "dataURL": .string("embedded"), "customData": .object(["credit": .string("owner")])])
        let first = try MCPDocumentCommandValidation.remappingAssets(in: [image], files: ["original": resource])
        let second = try MCPDocumentCommandValidation.remappingAssets(in: [image], files: ["original": resource])
        let id = try XCTUnwrap(first.elements.first?["fileId"]?.stringValue)
        XCTAssertNotEqual(id, "original")
        XCTAssertNotEqual(first.elements, second.elements)
        XCTAssertEqual(first.files[id]?["id"], .string(id))
        XCTAssertEqual(first.files[id]?["dataURL"], resource["dataURL"])
        XCTAssertEqual(first.files[id]?["customData"], resource["customData"])
        XCTAssertThrowsError(try MCPDocumentCommandValidation.remappingAssets(in: [image], files: [:]))
    }

    func testCheckpointDiffUsesRawElementDataAndIgnoresDeletedTombstones() {
        let before: MCPJSONValue = .object(["elements": .array([element("removed"), element("changed", fields: ["customData": .object(["role": .string("old")])]), element("unchanged")]), "files": .object([:]), "appState": .object([:])])
        let after: MCPJSONValue = .object(["elements": .array([element("removed", fields: ["isDeleted": .bool(true)]), element("changed", fields: ["customData": .object(["role": .string("new")])]), element("unchanged"), element("added")]), "files": .object([:]), "appState": .object([:])])
        let diff = MCPDocumentCommandValidation.sceneDiff(before: before, after: after)
        XCTAssertEqual(diff["added_ids"], .array([.string("added")]))
        XCTAssertEqual(diff["removed_ids"], .array([.string("removed")]))
        XCTAssertEqual(diff["changed_ids"], .array([.string("changed")]))
        XCTAssertEqual(diff["app_state_changed"], .bool(false))
        XCTAssertEqual(diff["assets_changed"], .bool(false))
    }

    private func element(_ id: String, type: String = "rectangle", x: Double = 20, y: Double = 30, fields: [String: MCPJSONValue] = [:]) -> MCPJSONValue {
        var value: [String: MCPJSONValue] = ["id": .string(id), "type": .string(type), "x": .number(x), "y": .number(y), "width": .number(40), "height": .number(50)]
        value.merge(fields) { _, right in right }
        return .object(value)
    }
}
