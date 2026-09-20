//
//  ExcalidrawMCPOptimizedResources.swift
//  ExcalidrawZ
//
//  Created by Codex on 2026/06/21.
//

import Foundation

enum ExcalidrawMCPOptimizedResources {
    static func text(named resourceName: String, fallback: String) -> String {
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: "md"),
              let text = try? String(contentsOf: url, encoding: .utf8) else {
            return fallback
        }
        return text
    }

    static func schema(named key: String) -> MCPJSONValue {
        schemaIfAvailable(named: key)
            ?? fallbackSchema(named: key)
            ?? ExcalidrawMCPToolSchemas.emptyObject
    }

    static func schemaIfAvailable(named key: String) -> MCPJSONValue? {
        schemas[key]
    }

    static func fallbackSchema(named key: String) -> MCPJSONValue? {
        fallbackSchemas[key]
    }

    static func description(named key: String, fallback: String = "ExcalidrawZ MCP tool.") -> String {
        descriptions[key]?.stringValue ?? fallbackDescriptions[key] ?? fallback
    }

    private static let schemas: [String: MCPJSONValue] = {
        guard case .object(let object) = jsonResource(named: "ExcalidrawMCPOptimizedSchemas") else {
            return [:]
        }
        return object
    }()

    private static let descriptions: [String: MCPJSONValue] = {
        guard case .object(let object) = jsonResource(named: "ExcalidrawMCPOptimizedToolDescriptions") else {
            return [:]
        }
        return object
    }()

    private static let fallbackDescriptions: [String: String] = [
        "read_me": "Read the local ExcalidrawZ MCP guide before creating or editing a drawing.",
        "get_app_context": "Read the local app state and the current file target available to MCP.",
        "get_current_file": "Read metadata for the file currently open in ExcalidrawZ.",
        "list_groups": "List ExcalidrawZ groups that can contain app-managed files.",
        "list_local_folders": "List local folders that ExcalidrawZ is permitted to access.",
        "list_local_files": "List Excalidraw files inside an approved local folder.",
        "create_file": "Create and open an app-managed Excalidraw file.",
        "create_local_file": "Create and open an Excalidraw file inside an approved local folder.",
        "open_file": "Open an app-managed Excalidraw file by its identifier.",
        "open_local_file": "Open a local Excalidraw file by its file URL.",
        "read_view": "Read the elements and selected canvas state from the current view.",
        "set_canvas_preferences": "Update supported presentation and canvas display preferences.",
        "replace_view": "Replace the current canvas elements with a validated Excalidraw element array.",
        "read_file": "Read a filtered, paginated view of elements in the current Excalidraw file.",
        "navigate_canvas": "Read or change the current Excalidraw canvas camera and zoom.",
        "read_canvas_image": "Render the current Excalidraw canvas or viewport as an image.",
        "export": "Export the current Excalidraw file to a local PNG, SVG, or PDF artifact.",
        "insert_math": "Insert a rendered LaTeX formula or function graph into the current canvas.",
        "adjust_elements": "Apply a validated list of element operations to the current canvas.",
        "rename_file": "Rename an app-managed or local Excalidraw file.",
        "list_files": "List app-managed Excalidraw files available to the local app.",
        "get_current_file_checkpoints": "List file-history checkpoints for the current file.",
        "list_library_items": "List items in an Excalidraw library.",
        "restore_file_history": "Restore an Excalidraw file from a selected history checkpoint."
    ]

    /// These contracts keep the local server useful when the optional generated
    /// resource bundle is absent. Simple LLMCore tools are resolved from their
    /// own declarations by the adapter; this table covers optimized base tools
    /// and complex AI tools whose source declaration points at a bundle resource.
    private static let fallbackSchemas: [String: MCPJSONValue] = [
        "list_groups": emptySchema,
        "list_local_folders": emptySchema,
        "list_local_files": objectSchema(properties: [
            "local_folder_id": stringProperty("Approved local folder identifier."),
            "deep": booleanProperty("Include files from descendant folders."),
            "limit": integerProperty("Maximum number of files to return.")
        ]),
        "read_view": objectSchema(properties: [
            "include_elements": booleanProperty("Include current canvas elements."),
            "include_app_state": booleanProperty("Include supported current app state."),
            "include_files": booleanProperty("Include embedded file metadata.")
        ]),
        "create_file": objectSchema(properties: [
            "name": stringProperty("Optional file name."),
            "group_id": stringProperty("Optional destination group identifier.")
        ]),
        "create_local_file": objectSchema(properties: [
            "name": stringProperty("Optional file name."),
            "local_folder_id": stringProperty("Approved destination local folder identifier.")
        ], required: ["local_folder_id"]),
        "open_file": objectSchema(properties: [
            "file_id": stringProperty("App-managed file identifier.")
        ], required: ["file_id"]),
        "open_local_file": objectSchema(properties: [
            "file_url": stringProperty("Local file URL returned by another MCP tool.")
        ], required: ["file_url"]),
        "set_canvas_preferences": objectSchema(properties: [
            "theme": stringProperty("Canvas theme.", values: ["light", "dark"]),
            "viewBackgroundColor": stringProperty("Canvas background CSS color."),
            "gridModeEnabled": booleanProperty("Show the canvas grid."),
            "zenModeEnabled": booleanProperty("Use zen mode."),
            "viewModeEnabled": booleanProperty("Use view-only mode."),
            "objectsSnapModeEnabled": booleanProperty("Enable object snapping."),
            "isMidpointSnappingEnabled": booleanProperty("Enable midpoint snapping."),
            "stats": booleanProperty("Show canvas statistics."),
            "bindingPreference": stringProperty("Element binding preference.", values: ["enabled", "disabled"]),
            "preferredSelectionTool": stringProperty("Preferred selection tool.", values: ["selection", "lasso"]),
            "boxSelectionMode": stringProperty("Box selection behavior.", values: ["contain", "overlap"])
        ]),
        "replace_view": objectSchema(properties: [
            "elements": stringProperty("Strict JSON array string containing Excalidraw elements."),
            "client_update_id": stringProperty("Optional caller update identifier used for correlation.")
        ], required: ["elements"]),
        "read_file": objectSchema(properties: [
            "query": stringProperty("Optional case-insensitive element text query."),
            "ids": arrayProperty("Element identifiers to include."),
            "types": arrayProperty("Element types to include."),
            "selected_only": booleanProperty("Only include selected elements."),
            "frame_id": stringProperty("Only include elements in this frame."),
            "group_id": stringProperty("Only include elements in this group."),
            "offset": integerProperty("Pagination offset."),
            "limit": integerProperty("Maximum element count."),
            "include_files": booleanProperty("Include embedded file metadata."),
            "include_deleted": booleanProperty("Include deleted elements."),
            "max_points": integerProperty("Maximum points retained per linear element.")
        ]),
        "navigate_canvas": objectSchema(properties: [
            "action": stringProperty(
                "Viewport operation.",
                values: [
                    "get_camera", "set_camera", "scroll_to_center", "scroll_to_element",
                    "zoom_to_fit", "zoom_to_fit_elements", "zoom_to"
                ]
            ),
            "elementId": stringProperty("Target element identifier."),
            "elementIds": arrayProperty("Target element identifiers."),
            "camera": objectProperty("Camera patch for set_camera."),
            "zoom": numberProperty("Requested zoom value."),
            "options": objectProperty("Optional navigation animation and zoom limits.")
        ], required: ["action"]),
        "insert_math": objectSchema(properties: [
            "mode": stringProperty("Math renderer mode.", values: ["formula", "function"]),
            "latex": stringProperty("LaTeX source used in formula mode."),
            "expression": stringProperty("Function expression used in function mode."),
            "color": stringProperty("Foreground or plot color."),
            "expressions": arrayProperty("Function expression objects to plot.", itemType: "object"),
            "expressions_json": stringProperty("JSON array string of function expression objects."),
            "width": numberProperty("Rendered image width."),
            "height": numberProperty("Rendered image height."),
            "x_min": numberProperty("Minimum x-axis value."),
            "x_max": numberProperty("Maximum x-axis value."),
            "y_min": numberProperty("Minimum y-axis value."),
            "y_max": numberProperty("Maximum y-axis value."),
            "x_label": stringProperty("X-axis label."),
            "y_label": stringProperty("Y-axis label."),
            "show_grid": booleanProperty("Show the plot grid."),
            "background_color": stringProperty("Rendered image background CSS color."),
            "focus": booleanProperty("Focus the inserted math element."),
            "position": objectProperty("Insertion position accepted by Excalidraw.")
        ]),
        "adjust_elements": objectSchema(properties: [
            "version": stringProperty("Optional adjust-elements contract version."),
            "dryRun": booleanProperty("Validate and preview without changing the canvas."),
            "ops": arrayProperty("Ordered Excalidraw element operation objects.", itemType: "object")
        ], required: ["ops"]),
        "export": objectSchema(properties: [
            "kind": stringProperty("Export artifact kind.", values: ["image", "file", "pdf"]),
            "format": stringProperty("Image format when kind is image.", values: ["png", "svg"]),
            "editable": booleanProperty("Embed editable scene data in image exports."),
            "with_background": booleanProperty("Include the canvas background."),
            "color_scheme": stringProperty("Export color scheme.", values: ["light", "dark"]),
            "export_scale": integerProperty("PNG scale: 1, 2, or 3.")
        ], required: ["kind"]),
        "rename_file": objectSchema(properties: [
            "new_name": stringProperty("New visible file name without the .excalidraw extension."),
            "file_id": stringProperty("Optional app-managed file UUID; defaults to the current file.")
        ], required: ["new_name"]),
        "get_current_file_checkpoints": objectSchema(properties: [
            "limit": integerProperty("Maximum checkpoint count."),
            "ai_only": booleanProperty("Only return automated and MCP checkpoints.")
        ])
    ]

    private static let emptySchema = objectSchema(properties: [:])

    private static func objectSchema(
        properties: [String: MCPJSONValue],
        required: [String] = []
    ) -> MCPJSONValue {
        var schema: [String: MCPJSONValue] = [
            "type": .string("object"),
            "properties": .object(properties),
            "additionalProperties": .bool(false)
        ]
        if !required.isEmpty {
            schema["required"] = .array(required.map(MCPJSONValue.string))
        }
        return .object(schema)
    }

    private static func stringProperty(_ description: String, values: [String] = []) -> MCPJSONValue {
        var property: [String: MCPJSONValue] = [
            "type": .string("string"),
            "description": .string(description)
        ]
        if !values.isEmpty {
            property["enum"] = .array(values.map(MCPJSONValue.string))
        }
        return .object(property)
    }

    private static func booleanProperty(_ description: String) -> MCPJSONValue {
        .object(["type": .string("boolean"), "description": .string(description)])
    }

    private static func integerProperty(_ description: String) -> MCPJSONValue {
        .object(["type": .string("integer"), "description": .string(description)])
    }

    private static func numberProperty(_ description: String) -> MCPJSONValue {
        .object(["type": .string("number"), "description": .string(description)])
    }

    private static func arrayProperty(_ description: String, itemType: String = "string") -> MCPJSONValue {
        .object([
            "type": .string("array"),
            "description": .string(description),
            "items": .object(["type": .string(itemType)])
        ])
    }

    private static func objectProperty(_ description: String) -> MCPJSONValue {
        .object([
            "type": .string("object"),
            "description": .string(description),
            "additionalProperties": .bool(true)
        ])
    }

    private static func jsonResource(named resourceName: String) -> MCPJSONValue? {
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let value = try? MCPJSONValue.parse(from: data) else {
            return nil
        }
        return value
    }
}
