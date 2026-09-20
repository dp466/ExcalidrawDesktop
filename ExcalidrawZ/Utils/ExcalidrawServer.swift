//
//  ExcalidrawServer.swift
//  ExcalidrawZ
//
//  Created by Dove Zachary on 2024/8/9.
//

import Foundation
import FlyingFox
import FlyingSocks

import ChocofordUI

struct ExcalidrawServerLogger: Logging {
    func logDebug(_ debug: @autoclosure () -> String) {
            
    }
    
    func logInfo(_ info: @autoclosure () -> String) {
        
    }
    
    func logWarning(_ warning: @autoclosure () -> String) {
        
    }
    
    func logError(_ error: @autoclosure () -> String) {
        
    }
    
    func logCritical(_ critical: @autoclosure () -> String) {
        
    }
}

class ExcalidrawServer {
    static var port: UInt16 {
        if ExcalidrawFeaturePolicy.isLocalMacOSFork { return 8497 }
#if DEBUG
        return 8486
#else
        return 8487
#endif
    }
    static var editorURL: URL {
        URL(string: "http://127.0.0.1:\(port)/index.html")!
    }
    let server = HTTPServer(
        address: try! .inet(ip4: "127.0.0.1", port: ExcalidrawServer.port),
        logger: ExcalidrawServerLogger()
    )
    init(autoStart: Bool = true) {
        if isPreview { return }
        if autoStart {
            Task {
                try? await self.start()
            }
        }
    }
    
    deinit {
        let server = self.server
        Task {
            await server.stop()
        }
    }
    
    func start() async throws {
        await server.appendRoute(
            "GET /*",
            to: .directory(
                for: .main,
                subPath: "excalidraw-latest",
                serverPath: ""
            )
        )
        try await server.run()
    }
    
    
    func stop() async {
        await server.stop()
    }
}
