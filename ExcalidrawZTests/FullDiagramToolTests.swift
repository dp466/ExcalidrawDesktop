import XCTest
@testable import ExcalidrawZ

final class FullDiagramToolTests: XCTestCase {
    func testHostedDiagramToolsCannotManageOtherDocumentsOrLibraries() {
        let allowed = Set(FullDiagramTool.allowedTools)
        XCTAssertTrue(allowed.contains("apply_operations"))
        XCTAssertTrue(allowed.contains("render_diagram"))
        XCTAssertFalse(allowed.contains("document_command"))
        XCTAssertFalse(allowed.contains("library_command"))
        XCTAssertFalse(allowed.contains("checkpoint_command"))
        XCTAssertFalse(allowed.contains("export_diagram"))
    }

    func testHostedDiagramCommandsStayOutOfAskAndProtectedRosters() {
        XCTAssertTrue(ExcalidrawAgentConfig.toolNames.contains("diagram_command"))
        XCTAssertFalse(ExcalidrawAgentConfig.askToolNames.contains("diagram_command"))
        XCTAssertFalse(ExcalidrawAgentConfig.limitedFileAccessToolNames.contains("diagram_command"))
        XCTAssertTrue(ExcalidrawAgentConfig.canvasModifyingToolNames.contains("diagram_command"))
    }

    func testHostedSchemaDescribesOperationsWithoutAllowingUntrustedTargets() throws {
        let resolved = try FullDiagramTool().inputSchema.resolve()
        let schema = try MCPJSONValue.parse(from: JSONEncoder().encode(resolved))
        XCTAssertEqual(schema["type"], .string("object"))
        XCTAssertEqual(schema["oneOf"]?.arrayValue?.count, FullDiagramTool.allowedTools.count)
        XCTAssertNoThrow(try MCPJSONSchemaValidator.validate(.object([
            "tool": .string("get_capabilities"), "arguments": .object([:])
        ]), schema: schema))
        let read: MCPJSONValue = .object(["tool": .string("read_diagram"), "arguments": .object(["limit": .number(20)])])
        XCTAssertNoThrow(try MCPJSONSchemaValidator.validate(read, schema: schema))
        let foreignTarget: MCPJSONValue = .object(["tool": .string("read_diagram"), "arguments": .object(["document_id": .string("another-document")])])
        XCTAssertThrowsError(try MCPJSONSchemaValidator.validate(foreignTarget, schema: schema))
        let incompleteMutation: MCPJSONValue = .object(["tool": .string("apply_operations"), "arguments": .object(["operations": .array([])])])
        XCTAssertThrowsError(try MCPJSONSchemaValidator.validate(incompleteMutation, schema: schema))
    }
}
