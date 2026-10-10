import Foundation

/// Pure validation shared by the HTTP handler and protocol regression tests.
enum MCPTransportPolicy {
    static let modernVersion = "2026-07-28"
    static let legacyVersions = ["2025-11-25", "2025-06-18", "2025-03-26"]
    static let supportedVersions = [modernVersion] + legacyVersions
    static let maximumBodyBytes = 16 * 1_024 * 1_024

    static func allowsHost(_ value: String?, port: UInt16) -> Bool {
        guard let value else { return false }
        return ["127.0.0.1:\(port)", "localhost:\(port)"].contains(value.lowercased())
    }

    static func allowsOrigin(_ value: String?, port: UInt16) -> Bool {
        guard let value else { return true } // Native clients normally omit Origin.
        return ["http://127.0.0.1:\(port)", "http://localhost:\(port)"].contains(value.lowercased())
    }

    static func acceptsResponseTypes(_ value: String?) -> Bool {
        var accepted = Set<String>()
        for entry in (value ?? "").lowercased().split(separator: ",") {
            let parts = entry.split(separator: ";").map { $0.trimmingCharacters(in: .whitespaces) }
            guard let type = parts.first else { continue }
            let qualities = parts.dropFirst().compactMap { parameter -> String? in
                let pair = parameter.split(separator: "=", maxSplits: 1, omittingEmptySubsequences: false)
                guard pair.first?.trimmingCharacters(in: .whitespaces) == "q" else { return nil }
                return pair.count == 2 ? pair[1].trimmingCharacters(in: .whitespaces) : ""
            }
            guard qualities.count <= 1 else { continue }
            if let quality = qualities.first {
                guard let number = Double(quality), number > 0, number <= 1 else { continue }
            }
            accepted.insert(type)
        }
        return accepted.contains("application/json") && accepted.contains("text/event-stream")
    }

    static func validate(
        _ request: MCPJSONRPCRequest,
        headers: [String: String]
    ) throws -> String {
        try request.validate()
        let headers = Dictionary(headers.map { ($0.key.lowercased(), $0.value) }, uniquingKeysWith: { _, last in last })
        let headerVersion = headers["mcp-protocol-version"]
        let bodyVersion = request.metadata["io.modelcontextprotocol/protocolVersion"]?.stringValue

        for version in [headerVersion, bodyVersion].compactMap({ $0 }) {
            guard supportedVersions.contains(version) else {
                throw MCPJSONRPCError.unsupportedProtocolVersion(version)
            }
        }

        if request.method == "initialize", headerVersion != modernVersion, bodyVersion != modernVersion {
            guard let requested = request.params?["protocolVersion"]?.stringValue,
                  request.params?["capabilities"]?.objectValue != nil,
                  let clientInfo = request.params?["clientInfo"]?.objectValue,
                  clientInfo["name"]?.stringValue != nil, clientInfo["version"]?.stringValue != nil else {
                throw MCPJSONRPCError.invalidParams("initialize requires protocolVersion, capabilities and clientInfo.")
            }
            return legacyVersions.contains(requested) ? requested : legacyVersions[0]
        }

        // No legacy session ID is issued. A credential is not a protocol
        // session: reconnecting processes independently declare their version
        // in each HTTP request. The legacy transport specifies this fallback.
        let isModern = headerVersion == modernVersion || bodyVersion == modernVersion
        let version = isModern ? modernVersion : (headerVersion ?? "2025-03-26")
        guard isModern else { return version }

        // Notification headers are not defined by the modern revision. Reject the legacy
        // cancellation/initialized notifications on modern HTTP instead of running them.
        guard request.expectsResponse else {
            throw MCPJSONRPCError.invalidRequest("This protocol revision defines no client notifications over HTTP.")
        }
        guard let bodyVersion,
              request.metadata["io.modelcontextprotocol/clientCapabilities"]?.objectValue != nil else {
            throw MCPJSONRPCError.invalidParams("Request metadata requires protocolVersion and clientCapabilities.")
        }
        guard headerVersion == bodyVersion else {
            throw MCPJSONRPCError.headerMismatch("MCP-Protocol-Version is missing or differs from request metadata.")
        }
        guard headers["mcp-method"] == request.method else {
            throw MCPJSONRPCError.headerMismatch("Mcp-Method is missing or differs from method.")
        }
        let name: String?
        switch request.method {
            case "tools/call", "prompts/get": name = request.params?["name"]?.stringValue
            case "resources/read": name = request.params?["uri"]?.stringValue
            default: name = nil
        }
        if ["tools/call", "prompts/get", "resources/read"].contains(request.method) {
            guard let name, let header = headers["mcp-name"], try decodeHeaderValue(header) == name else {
                throw MCPJSONRPCError.headerMismatch("Mcp-Name is missing or differs from the request name.")
            }
        }
        if let clientInfo = request.metadata["io.modelcontextprotocol/clientInfo"] {
            guard clientInfo["name"]?.stringValue != nil, clientInfo["version"]?.stringValue != nil else {
                throw MCPJSONRPCError.invalidParams("clientInfo requires name and version.")
            }
        }
        if let token = request.metadata["progressToken"] {
            switch token {
                case .string, .number: break
                default: throw MCPJSONRPCError.invalidParams("progressToken must be a string or number.")
            }
        }
        return version
    }

    static func decodeHeaderValue(_ value: String) throws -> String {
        guard value.unicodeScalars.allSatisfy({ $0.value == 9 || (32...126).contains($0.value) }) else {
            throw MCPJSONRPCError.headerMismatch("A mirrored header contains invalid characters.")
        }
        if value.hasPrefix("=?base64?"), value.hasSuffix("?=") {
            let encoded = String(value.dropFirst(9).dropLast(2))
            guard let data = Data(base64Encoded: encoded), let decoded = String(data: data, encoding: .utf8) else {
                throw MCPJSONRPCError.headerMismatch("A mirrored header has invalid Base64 encoding.")
            }
            return decoded
        }
        guard value == value.trimmingCharacters(in: .whitespacesAndNewlines) else {
            throw MCPJSONRPCError.headerMismatch("Mirrored header whitespace requires Base64 encoding.")
        }
        return value
    }
}
