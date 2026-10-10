import Foundation
import LLMCore

/// Hosted chat uses the same serialized command service as external clients.
/// Its document/window target comes from trusted invocation context, never from
/// model-supplied arguments. Ask/protected contexts retain their proposal tools.
struct FullDiagramTool: Tool {
    static let allowedTools = ["get_capabilities", "read_diagram", "apply_operations", "create_diagram", "layout_diagram", "analyze_diagram", "render_diagram", "history", "import_assets"]
    var name: String { "diagram_command" }
    var displayName: String { "Diagram commands" }
    var description: String {
        """
        Inspect, create, arrange, analyze, render and edit the current diagram using the same atomic command service as Codex and Claude Code. Available tool values: \(Self.allowedTools.joined(separator: ", ")).
        Use arguments matching that command's Full MCP schema; get_capabilities explains supported operations. The document and window are fixed by this chat's context. Workflow: read_diagram to obtain revision, create_diagram or apply_operations with expected_revision and a unique request_id, analyze_diagram, render_diagram, then refine. A mutation applies as one undo step and records checkpoints. A stale revision changes nothing. Reuse the same request_id only for an exact retry.
        create_diagram accepts nodes, edges, containers, preset (technical_clean/presentation/sketch), direction (UP/DOWN/LEFT/RIGHT). apply_operations includes ordinary editing, import_scene, replace_scene, Mermaid ({type:"mermaid",source:"flowchart ..."}) and math ({type:"math",mode:"formula",latex:"..."} or {type:"math",mode:"function",expression:"x^2"}). Native math preparation renders formulas and plots locally before the atomic commit. This tool is available in Agent mode with readable managed or linked local files; use existing proposal tools in Ask mode.
        """
    }
    var inputSchema: ToolInputSchema {
        let basic = ToolInputSchema.parameters(ToolParameters(properties: [
            "tool": ParameterProperty(type: "string", description: "The current-diagram command to execute.", enum: Self.allowedTools),
            "arguments": ParameterProperty(type: "object", description: "Command arguments. Mutations require expected_revision from read_diagram and request_id. document_id/window_id are supplied from trusted context."),
            "approvalReason": ParameterProperty(type: "string", description: "Reason to request approval if the requested diagram change needs it.")
        ], required: ["tool", "arguments"]))
        // Retain each actual MCP command schema instead of asking the hosted
        // model to infer operation fields from an untyped arguments object.
        let variants = ExcalidrawMCPFullToolCatalog.tools.filter { Self.allowedTools.contains($0.name) }.map { tool -> MCPJSONValue in
            var arguments = tool.inputSchema.objectValue ?? [:]
            var properties = arguments["properties"]?.objectValue ?? [:]
            properties.removeValue(forKey: "document_id"); properties.removeValue(forKey: "window_id")
            arguments["properties"] = .object(properties)
            arguments["required"] = .array((arguments["required"]?.arrayValue ?? []).filter { $0 != .string("document_id") && $0 != .string("window_id") })
            return .object(["type": .string("object"), "properties": .object([
                "tool": .object(["type": .string("string"), "const": .string(tool.name)]), "arguments": .object(arguments),
                "approvalReason": .object(["type": .string("string")])
            ]), "required": .array([.string("tool"), .string("arguments")]), "additionalProperties": .bool(false)])
        }
        guard let prototype = try? basic.resolve(),
              let prototypeData = try? JSONEncoder().encode(prototype),
              var schema = try? MCPJSONValue.parse(from: prototypeData).objectValue else { return basic }
        // Provider function schemas require an object root. Keep the ordinary
        // properties there, then constrain the command/arguments pairing.
        schema["oneOf"] = .array(variants)
        schema["additionalProperties"] = .bool(false)
        guard let data = try? MCPJSONValue.object(schema).mcpJSONData(),
              let raw = try? JSONDecoder().decode(type(of: prototype), from: data) else { return basic }
        return .raw(raw)
    }

    func execute(_ input: String, context: (any ChatInvocationContext)?) async throws -> ToolResult {
        try AIChatToolExecutionGate.ensureAIEnabled()
        guard let invocation = context as? ExcalidrawChatInvocationContext else { throw ToolError.executionFailed("Missing current diagram invocation context.") }
        guard invocation.canvasTarget == .normal, !invocation.isCurrentFileContextProtected, invocation.hasActiveFile else {
            throw ToolError.executionFailed("Diagram commands require readable Agent-mode managed or linked local file context. Use the existing proposal tools for Ask mode or protected files.")
        }
        guard try await LockedContentAIGuard.canToolAccess(fileID: invocation.currentFileID) else { return LockedContentAIGuard.lockedToolResult }
        guard let object = try MCPJSONValue.parse(from: Data(input.utf8)).objectValue,
              let tool = object["tool"]?.stringValue, Self.allowedTools.contains(tool),
              var arguments = object["arguments"]?.objectValue else {
            throw ToolError.invalidInput("Expected tool and arguments for an allowed current-diagram command.")
        }
        if tool == "render_diagram", !invocation.currentModelSupportsImageInput {
            throw ToolError.executionFailed("The selected model cannot receive rendered images. Use read_diagram and analyze_diagram instead.")
        }
        guard let documentID = invocation.currentDocumentID ?? invocation.currentFileID?.uuidString else {
            throw ToolError.executionFailed("The chat has no captured document target. Start a new chat turn from the intended drawing.")
        }
        if let requested = arguments["document_id"]?.stringValue, requested != documentID {
            throw ToolError.invalidInput("The diagram command cannot target a document outside this chat's captured context.")
        }
        if let requested = arguments["window_id"]?.stringValue, requested != invocation.windowID {
            throw ToolError.invalidInput("The diagram command cannot target another window.")
        }
        arguments["document_id"] = .string(documentID)
        if let windowID = invocation.windowID { arguments["window_id"] = .string(windowID) }
        let result = try await ExcalidrawMCPDiagramCommandService.shared.callTool(name: tool, arguments: arguments, clientID: "hosted-ai")
        if result.isError, let structured = result.structuredContent {
            return .text(String(decoding: try structured.mcpJSONData(), as: UTF8.self))
        }
        let parts: [ToolResult.Part] = result.content.compactMap { content in
            if let text = content.text { return .text(text) }
            if content.type == "image", let encoded = content.data, let data = Data(base64Encoded: encoded) {
                return .image(.data(data, mediaType: content.mimeType ?? "image/png"))
            }
            return nil
        }
        return .parts(parts.isEmpty ? [.text("ok")] : parts)
    }
}
