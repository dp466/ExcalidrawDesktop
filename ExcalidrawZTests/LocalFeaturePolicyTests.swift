import XCTest
@testable import ExcalidrawZ

final class LocalFeaturePolicyTests: XCTestCase {
    func testLocalMacForkKeepsLocalFeaturesWithoutSubscription() {
#if os(macOS) && !APP_STORE
        XCTAssertTrue(ExcalidrawFeaturePolicy.isLocalMacOSFork)
        XCTAssertFalse(ExcalidrawFeaturePolicy.allowsCloudAIServices)
        XCTAssertTrue(
            ExcalidrawFeaturePolicy.allowsPresentation(subscriptionAllows: false)
        )
        XCTAssertTrue(
            ExcalidrawFeaturePolicy.allowsOptimizedMCP(
                serverAvailable: true,
                subscriptionAllows: false
            )
        )
#endif
    }

    func testOptimizedMCPStillRequiresAnAvailableLocalServer() {
        XCTAssertFalse(
            ExcalidrawFeaturePolicy.allowsOptimizedMCP(
                serverAvailable: false,
                subscriptionAllows: true
            )
        )
    }

    func testLocalMCPExecutionIsScopedAndDoesNotEnableCloudAITools() async throws {
        let defaults = UserDefaults.standard
        let key = AIChatPreferences.isAIEnabledDefaultsKey
        let originalValue = defaults.object(forKey: key)
        defer {
            if let originalValue {
                defaults.set(originalValue, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }

        defaults.set(false, forKey: key)
        XCTAssertThrowsError(try AIChatToolExecutionGate.ensureAIEnabled())

        try await AIChatToolExecutionGate.withLocalMCPExecution {
            XCTAssertNoThrow(try AIChatToolExecutionGate.ensureAIEnabled())
        }

        XCTAssertThrowsError(try AIChatToolExecutionGate.ensureAIEnabled())
    }

    func testOptimizedToolCatalogHasUsefulContractsWithoutGeneratedResources() {
        let tools = Dictionary(
            uniqueKeysWithValues: ExcalidrawMCPOptimizedToolCatalog.tools.map { ($0.name, $0) }
        )
        XCTAssertGreaterThanOrEqual(tools.count, 25)

        for tool in tools.values {
            XCTAssertFalse(tool.description.isEmpty, "Missing description for \(tool.name)")
            XCTAssertNotEqual(tool.description, "ExcalidrawZ MCP tool.")
            XCTAssertEqual(tool.inputSchema["type"]?.stringValue, "object")
        }

        assertSchema(tools["replace_view"], contains: "elements", required: "elements")
        assertSchema(tools["read_file"], contains: "query")
        assertSchema(tools["navigate_canvas"], contains: "action", required: "action")
        assertSchema(tools["insert_math"], contains: "mode")
        assertSchema(tools["adjust_elements"], contains: "ops", required: "ops")
        assertSchema(tools["read_canvas_image"], contains: "scope")
        assertSchema(tools["export"], contains: "kind", required: "kind")
        assertSchema(tools["rename_file"], contains: "new_name", required: "new_name")
        assertSchema(tools["list_files"], contains: "limit")
        assertSchema(tools["get_current_file_checkpoints"], contains: "limit")
        assertSchema(tools["list_library_items"], contains: "library_id", required: "library_id")
        assertSchema(tools["query_library_item"], contains: "item_id", required: "item_id")
        assertSchema(tools["add_library_item_to_canvas"], contains: "item_id", required: "item_id")
        assertSchema(tools["restore_file_history"], contains: "checkpoint_id", required: "checkpoint_id")
        assertSchema(tools["create_local_file"], contains: "local_folder_id", required: "local_folder_id")
        assertSchema(tools["open_local_file"], contains: "file_url", required: "file_url")

        XCTAssertFalse(ExcalidrawMCPOptimizedContract.instructions.contains("resources are unavailable"))
        XCTAssertFalse(ExcalidrawMCPOptimizedRecall.guide.contains("guide resource is unavailable"))
    }

    private func assertSchema(
        _ tool: ExcalidrawMCPTool?,
        contains property: String,
        required requiredProperty: String? = nil,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        guard let tool else {
            XCTFail("Tool is missing", file: file, line: line)
            return
        }
        guard case .object(let properties) = tool.inputSchema["properties"] else {
            XCTFail("Tool \(tool.name) has no object properties", file: file, line: line)
            return
        }
        XCTAssertNotNil(properties[property], "Missing \(property) in \(tool.name)", file: file, line: line)

        if let requiredProperty {
            let required = tool.inputSchema["required"]?.arrayValue?.compactMap(\.stringValue) ?? []
            XCTAssertTrue(required.contains(requiredProperty), "\(requiredProperty) is not required", file: file, line: line)
        }
    }
}
