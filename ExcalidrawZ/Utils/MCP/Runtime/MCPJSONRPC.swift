//
//  MCPJSONRPC.swift
//  ExcalidrawZ
//
//  Created by Codex on 2026/06/14.
//

import Foundation

struct MCPJSONRPCRequest: Decodable, Sendable {
    let jsonrpc: String?
    let id: MCPJSONValue?
    let method: String
    let params: MCPJSONValue?

    private enum CodingKeys: String, CodingKey { case jsonrpc, id, method, params }

    init(jsonrpc: String?, id: MCPJSONValue?, method: String, params: MCPJSONValue?) {
        self.jsonrpc = jsonrpc; self.id = id; self.method = method; self.params = params
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        jsonrpc = try container.decodeIfPresent(String.self, forKey: .jsonrpc)
        // Preserve an explicit null so it cannot silently become a notification.
        id = container.contains(.id) ? try container.decode(MCPJSONValue.self, forKey: .id) : nil
        method = try container.decode(String.self, forKey: .method)
        params = container.contains(.params) ? try container.decode(MCPJSONValue.self, forKey: .params) : nil
    }

    var expectsResponse: Bool {
        id != nil
    }

    var metadata: [String: MCPJSONValue] {
        params?["_meta"]?.objectValue ?? [:]
    }

    func validate() throws {
        guard jsonrpc == "2.0", !method.isEmpty else {
            throw MCPJSONRPCError.invalidRequest("A JSON-RPC 2.0 method is required.")
        }
        if let id {
            switch id {
                case .string: break
                case .number(let number) where number.isFinite: break
                default: throw MCPJSONRPCError.invalidRequest("Request IDs must be strings or numbers.")
            }
        }
        if let params, params.objectValue == nil {
            throw MCPJSONRPCError.invalidParams("MCP params must be an object.")
        }
    }
}

/// Identity comes from the bearer credential, never the client's self-reported metadata.
struct MCPRequestContext: Sendable {
    let clientID: String
    let protocolVersion: String
    var isModern: Bool { protocolVersion == MCPTransportPolicy.modernVersion }
}

struct MCPJSONRPCResponse: Encodable, Sendable {
    let jsonrpc = "2.0"
    let id: MCPJSONValue?
    let result: MCPJSONValue?
    let error: MCPJSONRPCError?

    static func success(id: MCPJSONValue?, result: MCPJSONValue) -> MCPJSONRPCResponse {
        MCPJSONRPCResponse(id: id, result: result, error: nil)
    }

    static func failure(id: MCPJSONValue?, error: MCPJSONRPCError) -> MCPJSONRPCResponse {
        MCPJSONRPCResponse(id: id, result: nil, error: error)
    }

    private enum CodingKeys: String, CodingKey { case jsonrpc, id, result, error }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(jsonrpc, forKey: .jsonrpc)
        try container.encode(id ?? .null, forKey: .id)
        try container.encodeIfPresent(result, forKey: .result)
        try container.encodeIfPresent(error, forKey: .error)
    }
}

struct MCPJSONRPCError: Encodable, Error, Sendable {
    let code: Int
    let message: String
    let data: MCPJSONValue?

    static func parseError(_ message: String) -> MCPJSONRPCError {
        MCPJSONRPCError(code: -32700, message: message, data: nil)
    }

    static func invalidRequest(_ message: String) -> MCPJSONRPCError {
        MCPJSONRPCError(code: -32600, message: message, data: nil)
    }

    static func methodNotFound(_ method: String) -> MCPJSONRPCError {
        MCPJSONRPCError(code: -32601, message: "Method not found: \(method)", data: nil)
    }

    static func invalidParams(_ message: String) -> MCPJSONRPCError {
        MCPJSONRPCError(code: -32602, message: message, data: nil)
    }

    static func internalError(_ message: String) -> MCPJSONRPCError {
        MCPJSONRPCError(code: -32603, message: message, data: nil)
    }

    static func headerMismatch(_ message: String) -> MCPJSONRPCError {
        MCPJSONRPCError(code: -32020, message: message, data: nil)
    }

    static func unsupportedProtocolVersion(_ requested: String) -> MCPJSONRPCError {
        MCPJSONRPCError(code: -32022, message: "Unsupported protocol version.", data: .object([
            "requested": .string(requested),
            "supported": .array(MCPTransportPolicy.supportedVersions.map(MCPJSONValue.string))
        ]))
    }
}

extension MCPJSONRPCError: LocalizedError {
    var errorDescription: String? {
        message
    }
}

extension Encodable {
    func mcpJSONData(prettyPrinted: Bool = false) throws -> Data {
        let encoder = JSONEncoder()
        if prettyPrinted {
            encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        } else {
            encoder.outputFormatting = [.sortedKeys]
        }
        return try encoder.encode(self)
    }
}
