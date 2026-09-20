//
//  AIChatToolExecutionGate.swift
//  ExcalidrawZ
//

import LLMCore

enum AIChatToolExecutionGate {
    @TaskLocal private static var isLocalMCPExecution = false

    static func ensureAIEnabled() throws {
        guard isLocalMCPExecution || AIChatAvailability.canUseAI else {
            throw ToolError.executionFailed("AI features are disabled.")
        }
    }

    /// Runs a shared native tool for the explicitly enabled local MCP server.
    /// This only bypasses the cloud-AI availability check for the current task;
    /// the tool's file-access and lock-state checks still execute.
    static func withLocalMCPExecution<Result>(
        _ operation: () async throws -> Result
    ) async rethrows -> Result {
        try await $isLocalMCPExecution.withValue(true, operation: operation)
    }
}

struct LockedContentProtectedTool: Tool {
    private let tool: any Tool

    init(_ tool: any Tool) {
        self.tool = tool
    }

    var name: String { tool.name }
    var displayName: String { tool.displayName }
    var description: String { tool.description }
    var inputSchema: ToolInputSchema { tool.inputSchema }
    var approvalRequirement: ApprovalRequirement { tool.approvalRequirement }

    func approvalPolicy(input: String) -> ApprovalPolicy {
        tool.approvalPolicy(input: input)
    }

    func execute(_ input: String, context: (any ChatInvocationContext)?) async throws -> ToolResult {
        if let lockedToolResult = try await LockedContentAIGuard.lockedToolResultIfNeeded(
            input: input,
            context: context,
            toolName: tool.name
        ) {
            return lockedToolResult
        }

        return try await LockedContentAIGuard.withProtectedContentAccessDenied {
            try await tool.execute(input, context: context)
        }
    }
}
