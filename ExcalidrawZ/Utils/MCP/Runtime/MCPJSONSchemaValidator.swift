import Foundation

/// Validates the bounded, local JSON Schema 2020-12 subset emitted by our catalogs.
/// External refs are never resolved. Unsupported constraints fail closed.
enum MCPJSONSchemaValidator {
    static func validate(_ value: MCPJSONValue, schema: MCPJSONValue) throws {
        var budget = 100_000
        try validate(value, schema: schema, path: "arguments", depth: 0, budget: &budget)
    }

    private static func validate(_ value: MCPJSONValue, schema: MCPJSONValue, path: String, depth: Int, budget: inout Int) throws {
        budget -= 1
        guard depth <= 64, budget > 0 else { throw MCPJSONRPCError.invalidParams("Schema validation limit exceeded.") }
        if schema == .bool(true) { return }
        if schema == .bool(false) { throw invalid(path, "is not allowed") }
        guard let rules = schema.objectValue else { throw MCPJSONRPCError.internalError("Invalid tool input schema.") }
        let supported: Set<String> = ["$schema", "type", "properties", "required", "additionalProperties", "items", "enum", "const", "oneOf", "anyOf", "allOf", "minimum", "maximum", "exclusiveMinimum", "exclusiveMaximum", "minItems", "maxItems", "minLength", "maxLength", "description", "title", "default", "examples", "x-mcp-header"]
        guard Set(rules.keys).isSubset(of: supported) else { throw MCPJSONRPCError.internalError("Unsupported tool schema constraint.") }
        if let dialect = rules["$schema"]?.stringValue, dialect != "https://json-schema.org/draft/2020-12/schema" {
            throw MCPJSONRPCError.internalError("Unsupported tool schema dialect.")
        }
        if let constant = rules["const"], constant != value { throw invalid(path, "must match the required constant") }
        if let choices = rules["enum"]?.arrayValue, !choices.contains(value) { throw invalid(path, "is not an allowed value") }
        if let type = rules["type"] {
            let types = type.stringValue.map { [$0] } ?? type.arrayValue?.compactMap(\.stringValue) ?? []
            guard types.contains(where: { matches(value, type: $0) }) else { throw invalid(path, "has the wrong type") }
        }
        for keyword in ["oneOf", "anyOf"] {
            if let branches = rules[keyword]?.arrayValue {
                var matches = 0
                for branch in branches {
                    do { try validate(value, schema: branch, path: path, depth: depth + 1, budget: &budget); matches += 1 }
                    catch let error as MCPJSONRPCError {
                        guard error.code == -32602 else { throw error }
                    }
                }
                guard keyword == "oneOf" ? matches == 1 : matches > 0 else { throw invalid(path, "does not match \(keyword)") }
            }
        }
        for branch in rules["allOf"]?.arrayValue ?? [] {
            try validate(value, schema: branch, path: path, depth: depth + 1, budget: &budget)
        }
        if let object = value.objectValue {
            let properties = rules["properties"]?.objectValue ?? [:]
            for required in rules["required"]?.arrayValue?.compactMap(\.stringValue) ?? [] {
                guard object[required] != nil else { throw invalid(path + "." + required, "is required") }
            }
            for (key, item) in object {
                if let rule = properties[key] {
                    try validate(item, schema: rule, path: path + "." + key, depth: depth + 1, budget: &budget)
                } else if let rule = rules["additionalProperties"] {
                    try validate(item, schema: rule, path: path + "." + key, depth: depth + 1, budget: &budget)
                }
            }
        }
        if let array = value.arrayValue {
            if let min = rules["minItems"]?.numberValue, Double(array.count) < min { throw invalid(path, "has too few items") }
            if let max = rules["maxItems"]?.numberValue, Double(array.count) > max { throw invalid(path, "has too many items") }
            if let itemSchema = rules["items"] {
                for (index, item) in array.enumerated() {
                    try validate(item, schema: itemSchema, path: "\(path)[\(index)]", depth: depth + 1, budget: &budget)
                }
            }
        }
        if let string = value.stringValue {
            if let min = rules["minLength"]?.numberValue, Double(string.unicodeScalars.count) < min { throw invalid(path, "is too short") }
            if let max = rules["maxLength"]?.numberValue, Double(string.unicodeScalars.count) > max { throw invalid(path, "is too long") }
        }
        if let number = value.numberValue {
            guard number.isFinite else { throw invalid(path, "must be finite") }
            if let min = rules["minimum"]?.numberValue, number < min { throw invalid(path, "is below minimum") }
            if let max = rules["maximum"]?.numberValue, number > max { throw invalid(path, "exceeds maximum") }
            if let min = rules["exclusiveMinimum"]?.numberValue, number <= min { throw invalid(path, "is below exclusive minimum") }
            if let max = rules["exclusiveMaximum"]?.numberValue, number >= max { throw invalid(path, "exceeds exclusive maximum") }
        }
    }

    private static func matches(_ value: MCPJSONValue, type: String) -> Bool {
        switch (value, type) {
            case (.object, "object"), (.array, "array"), (.string, "string"), (.bool, "boolean"), (.null, "null"): return true
            case (.number(let number), "number"): return number.isFinite
            case (.number(let number), "integer"): return number.isFinite && number.rounded() == number
            default: return false
        }
    }
    private static func invalid(_ path: String, _ reason: String) -> MCPJSONRPCError {
        .invalidParams("\(path) \(reason).")
    }
}
