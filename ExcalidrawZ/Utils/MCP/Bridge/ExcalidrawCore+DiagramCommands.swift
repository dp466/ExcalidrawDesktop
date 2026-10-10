import Foundation

extension ExcalidrawCore {
    /// The command is passed as data, never interpolated into executable JavaScript.
    @MainActor
    func performDiagramCommand(_ payload: [String: MCPJSONValue]) async throws -> MCPJSONValue {
        let input = String(decoding: try MCPJSONValue.object(payload).mcpJSONData(), as: UTF8.self)
        try Task.checkCancellation()
        let raw = try await withTaskCancellationHandler {
          try await webView.callAsyncJavaScript(
            """
            try {
                const helper = window.excalidrawZHelper;
                if (!helper?.diagramCommand) throw new Error("The diagram command engine is unavailable.");
                const value = await helper.diagramCommand(JSON.parse(input));
                if (value?.error) return JSON.stringify({ok: false, error: {
                    code: value.error.code, message: value.error.message,
                    details: value.error.data ?? null
                }});
                return JSON.stringify({ok: true, value});
            } catch (error) {
                return JSON.stringify({ok: false, error: {
                    code: error?.code ?? "command_failed",
                    message: error?.message ?? String(error),
                    details: error?.data ?? null
                }});
            }
            """,
            arguments: ["input": input], contentWorld: .page
          )
        } onCancel: {
            if let requestID = payload["request_id"]?.stringValue {
                Task { @MainActor [weak self] in
                    _ = try? await self?.webView.callAsyncJavaScript(
                        "window.excalidrawZHelper?.diagramCancel?.(requestID, clientID)",
                        arguments: ["requestID": requestID, "clientID": payload["client_id"]?.stringValue ?? "local"],
                        contentWorld: .page
                    )
                }
            }
        }
        guard let text = raw as? String else { throw InvalidJavaScriptResult() }
        let envelope = try MCPJSONValue.parse(from: Data(text.utf8))
        guard envelope["ok"] == .bool(true), let value = envelope["value"] else {
            throw ExcalidrawMCPCommandError(
                code: envelope["error"]?["code"]?.stringValue ?? "command_failed",
                message: envelope["error"]?["message"]?.stringValue ?? "Diagram command failed.",
                details: envelope["error"]?["details"]
            )
        }
        return value
    }
}

struct ExcalidrawMCPCommandError: Error, LocalizedError, Sendable {
    let code: String
    let message: String
    var details: MCPJSONValue? = nil
    var errorDescription: String? { message }
}
