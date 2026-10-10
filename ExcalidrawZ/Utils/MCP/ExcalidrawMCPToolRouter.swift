//
//  ExcalidrawMCPToolRouter.swift
//  ExcalidrawZ
//
//  Created by Codex on 2026/06/14.
//

import Foundation

actor ExcalidrawMCPToolRouter {
    private let store: ExcalidrawMCPDiagramSessionStore
    private var elementConverter: ExcalidrawMCPUpstreamToolHandler.ElementConverter?
    private var serviceMode: ExcalidrawMCPServiceMode

    init(
        serviceMode: ExcalidrawMCPServiceMode = .full,
        store: ExcalidrawMCPDiagramSessionStore = ExcalidrawMCPDiagramSessionStore()
    ) {
        self.serviceMode = serviceMode
        self.store = store
    }

    func setServiceMode(_ mode: ExcalidrawMCPServiceMode) {
        serviceMode = mode
    }

    func setSessionUpdateHandler(
        _ handler: ExcalidrawMCPDiagramSessionStore.UpdateHandler?
    ) async {
        await store.setUpdateHandler(handler)
    }

    func setElementConverter(
        _ converter: ExcalidrawMCPUpstreamToolHandler.ElementConverter?
    ) async {
        elementConverter = converter
    }

    func handle(
        _ request: MCPJSONRPCRequest,
        context: MCPRequestContext = .init(clientID: "in-process", protocolVersion: "2025-11-25")
    ) async -> MCPJSONRPCResponse? {
        do {
            try request.validate()
            try Task.checkCancellation()
            var result = try await result(for: request, context: context)
            guard request.expectsResponse else { return nil }
            if context.isModern, var object = result.objectValue {
                object["resultType"] = .string("complete")
                // Cacheable modern discovery/list results require these fields.
                // Use the same conservative envelope for tool results: app mode,
                // access and document state can change between requests.
                object["ttlMs"] = .number(0)
                object["cacheScope"] = .string("private")
                var meta = object["_meta"]?.objectValue ?? [:]
                meta["io.modelcontextprotocol/serverInfo"] = Self.serverInfo
                object["_meta"] = .object(meta)
                result = .object(object)
            }
            return .success(id: request.id, result: result)
        } catch let error as MCPJSONRPCError {
            guard request.expectsResponse else { return nil }
            return .failure(id: request.id, error: error)
        } catch {
            guard request.expectsResponse else { return nil }
            return .failure(id: request.id, error: .internalError(error.localizedDescription))
        }
    }

    private func result(for request: MCPJSONRPCRequest, context: MCPRequestContext) async throws -> MCPJSONValue {
        switch request.method {
            case "initialize":
                guard !context.isModern else { throw MCPJSONRPCError.methodNotFound(request.method) }
                return await initializeResult(protocolVersion: context.protocolVersion)
            case "notifications/initialized":
                guard !context.isModern, !request.expectsResponse else {
                    throw MCPJSONRPCError.invalidRequest("initialized must be a legacy notification.")
                }
                return .object([:])
            case "server/discover":
                guard context.isModern else { throw MCPJSONRPCError.methodNotFound(request.method) }
                return .object([
                    "supportedVersions": .array(MCPTransportPolicy.supportedVersions.map(MCPJSONValue.string)),
                    "capabilities": .object(["tools": .object([:])]),
                    "instructions": .string(await instructionsForCurrentMode())
                ])
            case "ping":
                return .object([:])
            case "tools/list":
                let tools = await toolsForCurrentMode()
                return .object([
                    "tools": .array(tools.map(\.jsonValue))
                ])
            case "tools/call":
                return try await callTool(params: request.params, clientID: context.clientID)
            default:
                throw MCPJSONRPCError.methodNotFound(request.method)
        }
    }

    private static var serverInfo: MCPJSONValue {
        .object([
            "name": .string("ExcalidrawDesktop"),
            "version": .string(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "0")
        ])
    }

    private func initializeResult(protocolVersion: String) async -> MCPJSONValue {
        let instructions = await instructionsForCurrentMode()

        return .object([
            "protocolVersion": .string(protocolVersion),
            "capabilities": .object([
                "tools": .object([:])
            ]),
            "serverInfo": Self.serverInfo,
            "instructions": .string(instructions)
        ])
    }

    private func callTool(params: MCPJSONValue?, clientID: String) async throws -> MCPJSONValue {
        guard let object = params?.objectValue,
              let name = object["name"]?.stringValue
        else {
            throw MCPJSONRPCError.invalidParams("tools/call requires params.name.")
        }

        if let arguments = object["arguments"], arguments.objectValue == nil {
            throw MCPJSONRPCError.invalidParams("tools/call arguments must be an object.")
        }
        let arguments = object["arguments"]?.objectValue ?? [:]
        let mode = await effectiveServiceMode()
        var tools = await toolsForCurrentMode()
        if mode == .full {
            tools += ExcalidrawMCPOptimizedToolCatalog.tools + ExcalidrawMCPUpstreamToolCatalog.tools
        }
        guard let tool = tools.first(where: { $0.name == name }) else {
            throw MCPJSONRPCError.invalidParams("Unknown tool: \(name)")
        }
        try MCPJSONSchemaValidator.validate(.object(arguments), schema: tool.inputSchema)
        let result: ExcalidrawMCPToolResult
        switch mode {
            case .basic:
                let handler = makeUpstreamToolHandler()
                result = try await ExcalidrawMCPDiagramCommandService.shared.performExclusive {
                    try await handler.callTool(name: name, arguments: arguments)
                }
            case .optimized:
                let handler = makeOptimizedToolHandler()
                result = try await ExcalidrawMCPDiagramCommandService.shared.performExclusive {
                    try await handler.callTool(name: name, arguments: arguments)
                }
            case .full:
                if ExcalidrawMCPFullToolCatalog.tools.contains(where: { $0.name == name }) {
                    result = try await ExcalidrawMCPDiagramCommandService.shared.callTool(
                        name: name, arguments: arguments, clientID: clientID
                    )
                } else if ExcalidrawMCPOptimizedToolCatalog.tools.contains(where: { $0.name == name }) {
                    let handler = makeOptimizedToolHandler()
                    result = try await ExcalidrawMCPDiagramCommandService.shared.performExclusive {
                        try await handler.callTool(name: name, arguments: arguments)
                    }
                } else {
                    let handler = makeUpstreamToolHandler()
                    result = try await ExcalidrawMCPDiagramCommandService.shared.performExclusive {
                        try await handler.callTool(name: name, arguments: arguments)
                    }
                }
        }
        return result.jsonValue
    }

    private func toolsForCurrentMode() async -> [ExcalidrawMCPTool] {
        switch await effectiveServiceMode() {
            case .basic:
                return ExcalidrawMCPUpstreamToolCatalog.tools
            case .optimized:
                return ExcalidrawMCPOptimizedToolCatalog.tools
            case .full:
                return ExcalidrawMCPFullToolCatalog.tools
        }
    }

    private func instructionsForCurrentMode() async -> String {
        switch await effectiveServiceMode() {
            case .basic:
                return "Use read_me first, then create_view with Excalidraw elements JSON."
            case .optimized:
                return ExcalidrawMCPOptimizedContract.instructions
            case .full:
                return ExcalidrawMCPFullToolCatalog.instructions
        }
    }

    private func effectiveServiceMode() async -> ExcalidrawMCPServiceMode {
        guard serviceMode == .optimized else {
            return serviceMode
        }

        let canUseOptimizedMCPServices = await MainActor.run {
            Store.shared.canUseOptimizedMCPServices
        }

        return canUseOptimizedMCPServices ? .optimized : .basic
    }

    private func makeUpstreamToolHandler() -> ExcalidrawMCPUpstreamToolHandler {
        let converter = elementConverter
        return ExcalidrawMCPUpstreamToolHandler(
            convertRawElements: { elements in
                guard let converter else {
                    throw MCPJSONRPCError.internalError("MCP element converter is unavailable.")
                }
                return try await converter(elements)
            },
            publishDiagram: { [store] elements, sourceElementCount, viewportUpdate in
                let session = try await store.publishSession(
                    elements: elements,
                    sourceElementCount: sourceElementCount,
                    viewportUpdate: viewportUpdate,
                    notifiesUpdateHandler: false
                )
                _ = try await ExcalidrawMCPAppBridge.shared.apply(
                    session,
                    createFileIfNeeded: .init(name: nil, groupID: nil)
                )
                return ExcalidrawMCPUpstreamToolHandler.PublishedDiagram(
                    checkpointID: session.checkpointID
                )
            },
            saveCheckpointData: { [store] id, data in
                _ = try await store.saveCheckpoint(id: id, data: data)
            },
            readCheckpointData: { [store] id in
                await store.checkpoint(id: id)?.dataValue
            },
            readCheckpointElements: { [store] id in
                await store.checkpoint(id: id)?.elements
            }
        )
    }

    private func makeOptimizedToolHandler() -> ExcalidrawMCPOptimizedToolHandler {
        let converter = elementConverter
        return ExcalidrawMCPOptimizedToolHandler(
            convertRawElements: { elements in
                guard let converter else {
                    throw MCPJSONRPCError.internalError("MCP element converter is unavailable.")
                }
                return try await converter(elements)
            },
            publishDiagram: { [store] elements, sourceElementCount, viewportUpdate, clientUpdateID in
                try await ExcalidrawMCPAppBridge.shared.ensureOptimizedUpdateViewAllowed()
                let session = try await store.publishSession(
                    elements: elements,
                    sourceElementCount: sourceElementCount,
                    viewportUpdate: viewportUpdate,
                    notifiesUpdateHandler: false
                )
                let applyResult = try await ExcalidrawMCPAppBridge.shared.apply(
                    session,
                    clientUpdateID: clientUpdateID
                )
                return ExcalidrawMCPOptimizedToolHandler.PublishedDiagram(
                    appPreCheckpointID: applyResult.preCheckpointID?.uuidString,
                    appPostCheckpointID: applyResult.postCheckpointID?.uuidString,
                    appCheckpointWarning: applyResult.checkpointWarning
                )
            },
            readCheckpointElements: { [store] id in
                await store.checkpoint(id: id)?.elements
            },
            getAppContext: {
                await ExcalidrawMCPAppBridge.shared.optimizedAppContext()
            },
            getCurrentFile: {
                await ExcalidrawMCPAppBridge.shared.optimizedCurrentFile()
            },
            listGroups: {
                try await ExcalidrawMCPAppBridge.shared.optimizedListGroups()
            },
            listLocalFolders: {
                try await ExcalidrawMCPAppBridge.shared.optimizedListLocalFolders()
            },
            listLocalFiles: { folderID, deep, limit in
                try await ExcalidrawMCPAppBridge.shared.optimizedListLocalFiles(
                    folderID: folderID,
                    deep: deep,
                    limit: limit
                )
            },
            readView: { options in
                try await ExcalidrawMCPAppBridge.shared.optimizedReadView(
                    options: options
                )
            },
            createFile: { name, groupID in
                try await ExcalidrawMCPAppBridge.shared.optimizedCreateFile(
                    name: name,
                    groupID: groupID
                )
            },
            createLocalFile: { name, localFolderID in
                try await ExcalidrawMCPAppBridge.shared.optimizedCreateLocalFile(
                    name: name,
                    localFolderID: localFolderID
                )
            },
            openFile: { fileID in
                try await ExcalidrawMCPAppBridge.shared.optimizedOpenFile(
                    fileID: fileID
                )
            },
            openLocalFile: { fileURL in
                try await ExcalidrawMCPAppBridge.shared.optimizedOpenLocalFile(
                    fileURL: fileURL
                )
            },
            setCanvasPreferences: { update in
                try await ExcalidrawMCPAppBridge.shared.optimizedSetCanvasPreferences(
                    update
                )
            }
        )
    }
}

private extension MCPJSONValue {
    var boolValue: Bool? {
        guard case .bool(let value) = self else { return nil }
        return value
    }
}
