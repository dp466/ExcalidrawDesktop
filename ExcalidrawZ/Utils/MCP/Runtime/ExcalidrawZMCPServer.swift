import Foundation
import FlyingFox
import FlyingSocks

final class ExcalidrawZMCPServer: Sendable {
    static let defaultPort: UInt16 = 8490
    let port: UInt16
    let router: ExcalidrawMCPToolRouter
    private let server: HTTPServer
    private let handler: ExcalidrawMCPHTTPHandler

    init(
        port: UInt16 = ExcalidrawZMCPServer.defaultPort,
        router: ExcalidrawMCPToolRouter = ExcalidrawMCPToolRouter(),
        credentials: ExcalidrawMCPCredentialStore = .init(),
        authenticate: (@Sendable (String?) throws -> String?)? = nil,
        onActivity: @escaping @Sendable (Int, String?) async -> Void = { _, _ in }
    ) {
        self.port = port
        self.router = router
        let requests = MCPActiveRequests(onActivity: onActivity)
        handler = ExcalidrawMCPHTTPHandler(port: port, router: router, requests: requests,
                                           authenticate: authenticate ?? credentials.authenticate)
        // HTTPServer(port:) binds all interfaces. Bind explicitly to IPv4 loopback.
        var address = sockaddr_in()
        address.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        address.sin_family = sa_family_t(AF_INET)
        address.sin_port = port.bigEndian
        address.sin_addr = in_addr(s_addr: UInt32(0x7f000001).bigEndian)
        server = HTTPServer(address: address, timeout: 120, logger: ExcalidrawServerLogger(), handler: handler)
    }

    func start() async throws { try await server.run() }
    func waitUntilListening() async throws { try await server.waitUntilListening(timeout: 5) }
    func stop() async {
        await handler.requests.cancelAll()
        await server.stop()
    }
    func revokeClient(_ clientID: String) async { await handler.requests.cancelClient(clientID) }
}

/// Internal visibility allows tests without enabling the app's server.
struct ExcalidrawMCPHTTPHandler: HTTPHandler {
    let port: UInt16
    let router: ExcalidrawMCPToolRouter
    let authenticate: @Sendable (String?) throws -> String?
    let requests: MCPActiveRequests
    let execute: @Sendable (MCPJSONRPCRequest, MCPRequestContext) async -> MCPJSONRPCResponse?

    init(port: UInt16, router: ExcalidrawMCPToolRouter, credentials: ExcalidrawMCPCredentialStore, requests: MCPActiveRequests) {
        self.init(port: port, router: router, requests: requests, authenticate: credentials.authenticate)
    }
    init(port: UInt16, router: ExcalidrawMCPToolRouter, requests: MCPActiveRequests, authenticate: @escaping @Sendable (String?) throws -> String?, execute: (@Sendable (MCPJSONRPCRequest, MCPRequestContext) async -> MCPJSONRPCResponse?)? = nil) {
        self.port = port; self.router = router; self.requests = requests; self.authenticate = authenticate
        self.execute = execute ?? { request, context in await router.handle(request, context: context) }
    }

    func handleRequest(_ request: HTTPRequest) async throws -> HTTPResponse {
        guard MCPTransportPolicy.allowsHost(request.headers[.host], port: port),
              MCPTransportPolicy.allowsOrigin(request.headers[HTTPHeader("Origin")], port: port) else {
            return HTTPResponse(statusCode: .forbidden, headers: HTTPHeaders([.connection: "close"]))
        }
        if request.path == "/health", request.method == .GET {
            return HTTPResponse(statusCode: .ok, headers: HTTPHeaders([.contentType: "application/json", .cacheControl: "no-store"]), body: Data("{\"status\":\"ok\"}".utf8))
        }
        guard request.path == "/mcp" else { return HTTPResponse(statusCode: .notFound) }
        guard request.method == .POST else {
            return HTTPResponse(statusCode: .methodNotAllowed, headers: HTTPHeaders([HTTPHeader("Allow"): "POST"]))
        }
        let clientID: String?
        do { clientID = try authenticate(request.headers[.authorization]) }
        catch { return HTTPResponse(statusCode: .serviceUnavailable, headers: HTTPHeaders([.connection: "close"])) }
        guard let clientID else {
            return HTTPResponse(statusCode: .unauthorized, headers: HTTPHeaders([HTTPHeader("WWW-Authenticate"): "Bearer realm=\"ExcalidrawDesktop\"", .connection: "close"]))
        }
        guard request.headers[.contentType]?.split(separator: ";").first?.trimmingCharacters(in: .whitespaces).lowercased() == "application/json" else {
            return HTTPResponse(statusCode: .unsupportedMediaType, headers: HTTPHeaders([.connection: "close"]))
        }
        guard MCPTransportPolicy.acceptsResponseTypes(request.headers[HTTPHeader("Accept")]) else {
            return HTTPResponse(statusCode: .notAcceptable, headers: HTTPHeaders([.connection: "close"]))
        }
        if let count = request.bodySequence.count, count > MCPTransportPolicy.maximumBodyBytes {
            return HTTPResponse(statusCode: .payloadTooLarge, headers: HTTPHeaders([.connection: "close"]))
        }
        var data = Data()
        for try await chunk in request.bodySequence {
            guard chunk.count <= MCPTransportPolicy.maximumBodyBytes - data.count else {
                return HTTPResponse(statusCode: .payloadTooLarge, headers: HTTPHeaders([.connection: "close"]))
            }
            data.append(chunk)
        }
        let rpc: MCPJSONRPCRequest
        do { _ = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed]) }
        catch { return try Self.jsonResponse(.failure(id: nil, error: .parseError("Invalid JSON.")), status: .badRequest) }
        do { rpc = try JSONDecoder().decode(MCPJSONRPCRequest.self, from: data) }
        catch { return try Self.jsonResponse(.failure(id: nil, error: .invalidRequest("A single JSON-RPC request or notification is required.")), status: .badRequest) }
        let protocolVersion: String
        do {
            for name in ["Host", "Origin", "Authorization", "MCP-Protocol-Version", "Mcp-Method", "Mcp-Name"] {
                guard request.headers.values(for: HTTPHeader(name)).count <= 1 else {
                    throw MCPJSONRPCError.headerMismatch("Duplicate security or metadata headers are not accepted.")
                }
            }
            protocolVersion = try MCPTransportPolicy.validate(
                rpc,
                headers: Dictionary(request.headers.map { ($0.key.rawValue, $0.value) }, uniquingKeysWith: { _, value in value })
            )
        } catch let error as MCPJSONRPCError {
            return try Self.jsonResponse(.failure(id: rpc.id, error: error), status: .badRequest)
        }
        let context = MCPRequestContext(clientID: clientID, protocolVersion: protocolVersion)
        if !rpc.expectsResponse {
            switch rpc.method {
                case "notifications/initialized": break
                case "notifications/cancelled":
                    guard let requestID = rpc.params?["requestId"] else {
                        return try Self.jsonResponse(.failure(id: nil, error: .invalidParams("Cancellation requires requestId.")), status: .badRequest)
                    }
                    switch requestID {
                        case .string: break
                        case .number(let value) where value.isFinite: break
                        default: return try Self.jsonResponse(.failure(id: nil, error: .invalidParams("requestId must be a string or number.")), status: .badRequest)
                    }
                    await requests.cancel(clientID: clientID, requestID: requestID)
                default:
                    return try Self.jsonResponse(.failure(id: nil, error: .methodNotFound(rpc.method)), status: .badRequest)
            }
            return HTTPResponse(statusCode: .accepted)
        }
        if rpc.method != "tools/call" {
            guard let response = await execute(rpc, context) else {
                return HTTPResponse(statusCode: .accepted)
            }
            return try Self.jsonResponse(response, status: context.isModern && response.error?.code == -32601 ? .notFound : .ok)
        }
        let key: String
        do { key = try await requests.reserve(clientID: clientID, request: rpc) }
        catch let error as MCPJSONRPCError { return try Self.jsonResponse(.failure(id: rpc.id, error: error), status: .badRequest) }
        let lifetime = MCPStreamLifetime()
        let stream = AsyncStream<Data> { continuation in
            let task = Task {
                await requests.attach(key, task: lifetime)
                let heartbeat = Task {
                    while !Task.isCancelled {
                        do { try await Task.sleep(nanoseconds: 5_000_000_000) } catch { return }
                        continuation.yield(Data(": keep-alive\n\n".utf8))
                    }
                }
                defer { heartbeat.cancel(); continuation.finish() }
                if let token = rpc.metadata["progressToken"] {
                    continuation.yield(Self.progress(token: token, progress: 0, message: "Executing diagram command."))
                }
                let response = await execute(rpc, context)
                if !Task.isCancelled, let response, let encoded = try? response.mcpJSONData() {
                    if let token = rpc.metadata["progressToken"] {
                        continuation.yield(Self.progress(token: token, progress: 1, message: "Diagram command completed."))
                    }
                    continuation.yield(Self.event(encoded))
                }
                await requests.complete(key)
            }
            lifetime.set(task)
            continuation.onTermination = { @Sendable _ in lifetime.cancel() }
        }
        return HTTPResponse(
            statusCode: .ok,
            headers: HTTPHeaders([.contentType: "text/event-stream", .cacheControl: "no-cache, no-store", HTTPHeader("X-Accel-Buffering"): "no"]),
            body: HTTPBodySequence(from: MCPEventBytes(stream: stream, lifetime: lifetime))
        )
    }

    static func jsonResponse(_ value: MCPJSONRPCResponse, status: HTTPStatusCode = .ok) throws -> HTTPResponse {
        HTTPResponse(statusCode: status, headers: HTTPHeaders([.contentType: "application/json", .cacheControl: "no-store"]), body: try value.mcpJSONData())
    }
    private static func event(_ data: Data) -> Data {
        var output = Data("event: message\ndata: ".utf8)
        output.append(data); output.append(Data("\n\n".utf8)); return output
    }
    private static func progress(token: MCPJSONValue, progress: Double, message: String) -> Data {
        let value = MCPJSONValue.object([
            "jsonrpc": .string("2.0"), "method": .string("notifications/progress"),
            "params": .object(["progressToken": token, "progress": .number(progress), "total": .number(1), "message": .string(message)])
        ])
        return event((try? value.mcpJSONData()) ?? Data())
    }
}

actor MCPActiveRequests {
    private struct Entry {
        let clientID: String
        let rpcKey: String
        let name: String
        var lifetime: MCPStreamLifetime?
    }
    private var entries: [String: Entry] = [:]
    private let onActivity: @Sendable (Int, String?) async -> Void
    init(onActivity: @escaping @Sendable (Int, String?) async -> Void = { _, _ in }) { self.onActivity = onActivity }
    func reserve(clientID: String, request: MCPJSONRPCRequest) async throws -> String {
        let rpcKey = try Self.key(clientID: clientID, id: request.id ?? .null)
        guard !entries.values.contains(where: { $0.rpcKey == rpcKey }) else { throw MCPJSONRPCError.invalidRequest("This JSON-RPC request ID is already in flight.") }
        guard entries.count < 8 else { throw MCPJSONRPCError.invalidRequest("Too many MCP requests are in flight; retry after completion.") }
        let key = UUID().uuidString
        entries[key] = Entry(clientID: clientID, rpcKey: rpcKey, name: request.params?["name"]?.stringValue ?? request.method)
        await publishActivity(); return key
    }
    func attach(_ key: String, task: MCPStreamLifetime) {
        guard entries[key] != nil else { task.cancel(); return }
        entries[key]?.lifetime = task
    }
    func complete(_ key: String) async { entries.removeValue(forKey: key); await publishActivity() }
    func cancel(clientID: String, requestID: MCPJSONValue) async {
        guard let rpcKey = try? Self.key(clientID: clientID, id: requestID),
              let key = entries.first(where: { $0.value.rpcKey == rpcKey })?.key else { return }
        entries.removeValue(forKey: key)?.lifetime?.cancel()
        await publishActivity()
    }
    func cancelClient(_ clientID: String) async {
        let keys = entries.filter { $0.value.clientID == clientID }.map(\.key)
        for key in keys { entries.removeValue(forKey: key)?.lifetime?.cancel() }
        await publishActivity()
    }
    func cancelAll() async {
        for entry in entries.values { entry.lifetime?.cancel() }
        entries.removeAll()
        await publishActivity()
    }
    private static func key(clientID: String, id: MCPJSONValue) throws -> String {
        clientID + ":" + (try id.mcpJSONData()).base64EncodedString()
    }
    private func publishActivity() async { await onActivity(entries.count, entries.values.first?.name) }
}

/// A response iterator is released when transmission fails. Cancel work even if
/// AsyncStream still has a producer; keep-alives make disconnects observable.
private struct MCPEventBytes: AsyncBufferedSequence {
    typealias Element = UInt8
    let stream: AsyncStream<Data>
    private let owner: MCPResponseBodyOwner
    init(stream: AsyncStream<Data>, lifetime: MCPStreamLifetime) {
        self.stream = stream
        owner = MCPResponseBodyOwner(lifetime: lifetime)
    }
    func makeAsyncIterator() -> Iterator { Iterator(stream: stream, owner: owner) }
    final class Iterator: AsyncBufferedIteratorProtocol {
        typealias Element = UInt8
        typealias Buffer = [UInt8]
        private var iterator: AsyncStream<Data>.Iterator
        private var buffered = [UInt8]()
        private var offset = 0
        private let owner: MCPResponseBodyOwner
        init(stream: AsyncStream<Data>, owner: MCPResponseBodyOwner) {
            iterator = stream.makeAsyncIterator(); self.owner = owner
        }
        deinit { owner.lifetime.cancel() }
        func next() async throws -> UInt8? { try await nextBuffer(suggested: 1)?.first }
        func nextBuffer(suggested count: Int) async throws -> [UInt8]? {
            try Task.checkCancellation()
            if offset == buffered.count {
                guard let data = await iterator.next() else { return nil }
                buffered = Array(data); offset = 0
            }
            let end = Swift.min(offset + Swift.max(1, count), buffered.count)
            let result = Array(buffered[offset..<end]); offset = end
            return result
        }
    }
}

/// Owned only by the response and its iterator, never by the producer task.
/// Cancellation also applies if sending the headers fails before body iteration.
private final class MCPResponseBodyOwner: Sendable {
    let lifetime: MCPStreamLifetime
    init(lifetime: MCPStreamLifetime) { self.lifetime = lifetime }
    deinit { lifetime.cancel() }
}

final class MCPStreamLifetime: @unchecked Sendable {
    private let lock = NSLock()
    private var task: Task<Void, Never>?
    private var cancelled = false
    func set(_ value: Task<Void, Never>) {
        lock.lock(); task = value; let shouldCancel = cancelled; lock.unlock()
        if shouldCancel { value.cancel() }
    }
    func cancel() {
        lock.lock(); cancelled = true; let value = task; lock.unlock()
        value?.cancel()
    }
}
