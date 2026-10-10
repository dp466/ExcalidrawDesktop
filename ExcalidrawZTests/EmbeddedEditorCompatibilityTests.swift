#if os(macOS)
import XCTest
import WebKit
import AppKit
@testable import ExcalidrawZ

/// Exercises the actual bundled production editor, rather than mocked exports.
@MainActor
final class EmbeddedEditorCompatibilityTests: XCTestCase {
    private var testWindows: [NSWindow] = []
    private var testCores: [ExcalidrawCore] = []

    private func host(_ webView: WKWebView) {
        let window = NSWindow(contentRect: CGRect(x: 0, y: 0, width: 900, height: 700), styleMask: [.titled], backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.title = "Excalidraw compatibility fixture"
        window.contentView = webView
        // Keep the rendered fixture behind the user's foreground app.
        window.orderBack(nil)
        testWindows.append(window)
    }

    override func tearDown() {
        testWindows.forEach { $0.close() }
        testWindows.removeAll()
        testCores.removeAll()
        super.tearDown()
    }

    private func readyEditor() async throws -> WKWebView {
        // Exercise the application's navigation/readiness gate. The public JS API
        // appears before asynchronous media-store initialization has completed.
        let core = ExcalidrawCore(highRefreshRequested: false)
        testCores.append(core)
        let webView = core.webView
        webView.frame = CGRect(x: 0, y: 0, width: 900, height: 700)
        host(webView)
        webView.load(URLRequest(url: ExcalidrawServer.editorURL))
        guard await core.waitUntilReadyForFileLoad(fileID: "compatibility-fixture", timeout: 15) else {
            XCTFail("Bundled editor did not initialize on its local server")
            throw NSError(domain: "EmbeddedEditorTest", code: 1)
        }
        return webView
    }

    func testLargeDocumentUsesBoundedArgumentTransport() async throws {
        let core = ExcalidrawCore()
        core.webView.frame = CGRect(x: 0, y: 0, width: 900, height: 700)
        host(core.webView)
        core.webView.load(URLRequest(url: ExcalidrawServer.editorURL))
        var ready = false
        for _ in 0..<300 {
            if (try? await core.webView.evaluateJavaScript("Boolean(window.excalidrawZHelper?._api)")) as? Bool == true {
                ready = true
                break
            }
            try await Task.sleep(nanoseconds: 50_000_000)
        }
        XCTAssertTrue(ready)
        let data = try JSONSerialization.data(withJSONObject: [
            "type": "excalidraw", "version": 2, "source": "test",
            "elements": [], "appState": [:], "files": [:],
            "transportPadding": String(repeating: "é漢字\"\n", count: 500_000)
        ])
        XCTAssertGreaterThan(data.count, 5_000_000)
        XCTAssertLessThan(ExcalidrawWebActor.fileLoadScript.utf8.count, 512)
        let id = "large-\"-é-漢字"
        let result = try await core.webActor.loadFile(id: id, requestID: "bounded-load", data: data)
        XCTAssertEqual(result.fileId, id)
        XCTAssertEqual(result.requestId, "bounded-load")
        XCTAssertEqual(result.elementCount, 0)
    }

    func testForcedSaveBeforeDirtyMetadataAndRetry() async throws {
        let core = ExcalidrawCore()
        core.webView.frame = CGRect(x: 0, y: 0, width: 900, height: 700)
        host(core.webView)
        core.webView.load(URLRequest(url: ExcalidrawServer.editorURL))
        var ready = false
        for _ in 0..<300 {
            if (try? await core.webView.evaluateJavaScript("Boolean(window.excalidrawZHelper?._api)")) as? Bool == true {
                ready = true
                break
            }
            try await Task.sleep(nanoseconds: 50_000_000)
        }
        XCTAssertTrue(ready)
        let empty = Data(#"{"type":"excalidraw","version":2,"source":"https://excalidraw.com","elements":[],"appState":{},"files":{}}"#.utf8)
        await core.documentSyncController.load(fileID: "save-a", data: empty)
        XCTAssertEqual(core.documentSyncController.currentLoadedFileID, "save-a")
        // No parent is attached: no UI dirty metadata reaches the native save scheduler.
        _ = try await core.webView.callAsyncJavaScript("""
        const api = window.excalidrawZHelper._api;
        api.updateScene({elements:[{id:'unsignalled-edit',type:'rectangle',x:10,y:10,width:100,height:80,angle:0,strokeColor:'#1e1e1e',backgroundColor:'transparent',fillStyle:'solid',strokeWidth:1,strokeStyle:'solid',roughness:1,opacity:100,groupIds:[],frameId:null,roundness:null,seed:1,version:1,versionNonce:1,isDeleted:false,boundElements:null,updated:1,link:null,locked:false}]});
        return true;
        """, arguments: [:], in: nil, contentWorld: .page)
        let root = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
        defer { try? FileManager.default.removeItem(at: root) }
        // A regular file used as a parent path guarantees the first write fails.
        let blockedParent = root.appendingPathComponent("blocked")
        try Data().write(to: blockedParent)
        let destination = blockedParent.appendingPathComponent("A.excalidraw")
        let target = FileState.CapturedCanvasSaveTarget(id: "save-a", kind: .localFile(url: destination, newCheckpoint: false, suppressCheckpoint: true))
        let failed = await core.documentSyncController.flushPendingDirtySnapshotToCapturedTarget(reason: "test-failure", expectedFileID: "save-a", target: target, forceCurrentSnapshot: true)
        XCTAssertFalse(failed)
        XCTAssertEqual(core.documentSyncController.currentLoadedFileID, "save-a")
        try FileManager.default.removeItem(at: blockedParent)
        try FileManager.default.createDirectory(at: blockedParent, withIntermediateDirectories: true)
        let saved = await core.documentSyncController.flushPendingDirtySnapshotToCapturedTarget(reason: "test-retry", expectedFileID: "save-a", target: target, forceCurrentSnapshot: true)
        XCTAssertTrue(saved)
        await core.documentSyncController.load(fileID: "save-b", data: empty)
        let persisted = try XCTUnwrap(JSONSerialization.jsonObject(with: Data(contentsOf: destination)) as? [String: Any])
        let elements = try XCTUnwrap(persisted["elements"] as? [[String: Any]])
        XCTAssertEqual(elements.compactMap { $0["id"] as? String }, ["unsignalled-edit"])
        XCTAssertEqual(core.documentSyncController.currentLoadedFileID, "save-b")

        // Exercise the real FileState transition while older appState-only disk writes are queued.
        let state = FileState()
        state.mcpCheckpointSuppressionDepth = 1
        let activeA = FileState.ActiveFile.temporaryFile(destination)
        let openedA = await state.requestActiveFileChange(activeA)
        XCTAssertTrue(openedA)
        state.excalidrawWebCoordinator = core
        await core.documentSyncController.load(fileID: activeA.id, data: try Data(contentsOf: destination))
        for _ in 0..<8 {
            state.updateAppStateOnlyForCurrentFile(expectedFileID: activeA.id, content: empty)
        }
        state.beginApplicationTermination()
        let canQuit = await state.flushPendingCanvasSnapshotBeforeTermination()
        XCTAssertTrue(canQuit)
        await Task.yield() // Model the awaited backup after the final save.
        XCTAssertTrue(core.webView.snapshotSaveInProgress)
        XCTAssertTrue(state.isFinalizingActiveFileClose)
        let switchedDuringQuit = await state.requestActiveFileChange(nil)
        XCTAssertFalse(switchedDuringQuit)
        XCTAssertEqual(state.currentActiveFile?.id, activeA.id)
        state.cancelApplicationTermination()
        XCTAssertFalse(core.webView.snapshotSaveInProgress)
        XCTAssertFalse(state.isFinalizingActiveFileClose)
        let quitDisk = try XCTUnwrap(JSONSerialization.jsonObject(with: Data(contentsOf: destination)) as? [String: Any])
        XCTAssertEqual((quitDisk["elements"] as? [[String: Any]])?.compactMap { $0["id"] as? String }, ["unsignalled-edit"])
        for _ in 0..<8 {
            state.updateAppStateOnlyForCurrentFile(expectedFileID: activeA.id, content: empty)
        }
        let nextURL = root.appendingPathComponent("B.excalidraw")
        try empty.write(to: nextURL)
        let activeB = FileState.ActiveFile.temporaryFile(nextURL)
        let switched = await state.requestActiveFileChange(activeB)
        XCTAssertTrue(switched)
        XCTAssertEqual(state.currentActiveFile?.id, activeB.id)
        XCTAssertFalse(core.webView.snapshotSaveInProgress)
        let finalDisk = try XCTUnwrap(JSONSerialization.jsonObject(with: Data(contentsOf: destination)) as? [String: Any])
        XCTAssertEqual((finalDisk["elements"] as? [[String: Any]])?.compactMap { $0["id"] as? String }, ["unsignalled-edit"])

    }

    func testMediumSceneLoadAndSnapshotTimings() async throws {
        let webView = try await readyEditor()
        let result = try await webView.callAsyncJavaScript("""
        const h = window.excalidrawZHelper;
        const elements = Array.from({length:1000}, (_,i)=>({id:'perf-'+i,type:'rectangle',x:(i%40)*110,y:Math.floor(i/40)*90,width:100,height:80,angle:0,strokeColor:'#1e1e1e',backgroundColor:'transparent',fillStyle:'solid',strokeWidth:1,strokeStyle:'solid',roughness:1,opacity:100,groupIds:[],frameId:null,roundness:null,seed:i+1,version:1,versionNonce:i+1,isDeleted:false,boundElements:null,updated:1,link:null,locked:false}));
        const scene = {type:'excalidraw',version:2,source:'https://excalidraw.com',elements,appState:{viewBackgroundColor:'#ffffff'},files:{}};
        const bytes = Array.from(new TextEncoder().encode(JSON.stringify(scene)));
        const loadStart=performance.now();
        await h.loadFileBuffer(bytes, 'performance-fixture', 'performance-load');
        const loadMs=performance.now()-loadStart;
        const timings=[];
        for(let i=0;i<10;i++) {
          const start=performance.now();
          await h.getCurrentFileSnapshot();
          timings.push(performance.now()-start);
        }
        timings.sort((a,b)=>a-b);
        const frames=[];
        let previous=await new Promise(requestAnimationFrame);
        for(let i=0;i<120;i++) {
          h.setCamera({scrollX:-i*8,scrollY:-i*4,zoom:1});
          const now=await new Promise(requestAnimationFrame);
          frames.push(now-previous);
          previous=now;
        }
        frames.sort((a,b)=>a-b);
        return {elements:1000,loadMs,snapshotMedianMs:timings[5],snapshotMaxMs:timings[9],sceneBytes:bytes.length,panFrameMedianMs:frames[60],panFrameP95Ms:frames[114],panFrameMaxMs:frames[119],panFramesOver50ms:frames.filter(n=>n>50).length};
        """, arguments: [:], in: nil, contentWorld: .page)
        let value = try XCTUnwrap(result as? [String: Any])
        XCTAssertEqual(value["elements"] as? Int, 1000)
        let data = try JSONSerialization.data(withJSONObject: value, options: [.sortedKeys])
        let report = String(decoding: data, as: UTF8.self)
        print("LOCAL_EDITOR_MEASUREMENT " + report)
        let attachment = XCTAttachment(string: report)
        attachment.name = "Bundled WebKit medium-scene timings"
        attachment.lifetime = .keepAlways
        add(attachment)
    }

    func testLiveSceneNonceAndViewportBridgeClassification() async throws {
        let webView = try await readyEditor()
        let result = try await webView.callAsyncJavaScript("""
        const h = window.excalidrawZHelper;
        const api = h._api;
        const events = [];
        window.webkit = {messageHandlers:{excalidrawZ:{postMessage:m=>events.push(m)}}};
        const element = {id:'nonce-fixture',type:'rectangle',x:0,y:0,width:100,height:80,angle:0,strokeColor:'#1e1e1e',backgroundColor:'transparent',fillStyle:'solid',strokeWidth:1,strokeStyle:'solid',roughness:1,opacity:100,groupIds:[],frameId:null,roundness:null,seed:1,version:1,versionNonce:1,isDeleted:false,boundElements:null,updated:1,link:null,locked:false};
        await h.loadFileString(JSON.stringify({type:'excalidraw',version:2,elements:[element],appState:{viewBackgroundColor:'#ffffff'},files:{}}),'nonce-file','nonce-load');
        const pause = () => new Promise(resolve=>setTimeout(resolve,1150));
        await pause();
        events.length=0;
        const initialElements=JSON.stringify(api.getSceneElementsIncludingDeleted());
        h.setCamera({scrollX:120,scrollY:40,zoom:1});
        await pause();
        const panNonce=api._excalidrawZ.getSceneNonce();
        const panElementsUnchanged=initialElements===JSON.stringify(api.getSceneElementsIncludingDeleted());
        const pan=events.filter(m=>m.event==='onStateChanged').map(m=>m.data.data);
        const cameraMessages=events.filter(m=>m.event==='onCameraChanged').length;
        events.length=0;
        api.updateScene({appState:{currentItemStrokeColor:'#e03131'}});
        await pause();
        const preference=events.filter(m=>m.event==='onStateChanged').map(m=>m.data.data);
        events.length=0;
        api.mutateElement(api.getSceneElements()[0],{x:200});
        await pause();
        const edit=events.filter(m=>m.event==='onStateChanged').map(m=>m.data.data);
        return {panElementsUnchanged,editNonceChanged:panNonce!==api._excalidrawZ.getSceneNonce(),cameraMessages,pan,preference,edit};
        """, arguments: [:], in: nil, contentWorld: .page)
        let value = try XCTUnwrap(result as? [String: Any])
        // A forced renderer refresh can change the nonce without changing content.
        // Assert the observable contract: pan keeps elements and save routing unchanged.
        XCTAssertEqual(value["panElementsUnchanged"] as? Bool, true)
        XCTAssertEqual(value["editNonceChanged"] as? Bool, true)
        XCTAssertEqual(value["cameraMessages"] as? Int, 0)
        let pan = try XCTUnwrap((value["pan"] as? [[String: Any]])?.last)
        XCTAssertEqual(pan["viewportDirty"] as? Bool, true)
        XCTAssertEqual(pan["persistentAppStateDirty"] as? Bool, false)
        XCTAssertEqual(pan["contentDirty"] as? Bool, false)
        let preference = try XCTUnwrap((value["preference"] as? [[String: Any]])?.last)
        XCTAssertEqual(preference["persistentAppStateDirty"] as? Bool, true)
        XCTAssertEqual(preference["contentDirty"] as? Bool, false)
        let edit = try XCTUnwrap((value["edit"] as? [[String: Any]])?.last)
        XCTAssertEqual(edit["contentDirty"] as? Bool, true)
    }

    func testExperimentalRefreshDefaultsOffAndPersistsOptIn() throws {
        let name = "ExperimentalRefreshTest-\(UUID().uuidString)"
        let defaults = try XCTUnwrap(UserDefaults(suiteName: name))
        defer { defaults.removePersistentDomain(forName: name) }
        XCTAssertFalse(ExperimentalEditorRefresh.isRequested(in: defaults))
        defaults.set(true, forKey: ExperimentalEditorRefresh.defaultsKey)
        XCTAssertTrue(ExperimentalEditorRefresh.isRequested(in: defaults))
        defaults.set(false, forKey: ExperimentalEditorRefresh.defaultsKey)
        XCTAssertFalse(ExperimentalEditorRefresh.isRequested(in: defaults))
        XCTAssertFalse(ExperimentalEditorRefresh.configure(WKWebViewConfiguration(), enabled: false))
    }

    func testExperimentalRefreshOffOnOffWithBundledEditor() async throws {
        guard ExperimentalEditorRefresh.isAvailable else { throw XCTSkip("Experimental WebKit preference is unavailable") }
        for enabled in [false, true, false] {
            let core = ExcalidrawCore(highRefreshRequested: enabled)
            let webView = core.webView
            webView.frame = CGRect(x: 0, y: 0, width: 900, height: 700)
            host(webView)
            webView.load(URLRequest(url: ExcalidrawServer.editorURL))
            var ready = false
            for _ in 0..<300 {
                if (try? await webView.evaluateJavaScript("Boolean(window.excalidrawZHelper?._api)")) as? Bool == true { ready = true; break }
                try await Task.sleep(nanoseconds: 50_000_000)
            }
            XCTAssertTrue(ready)
            let elements: [[String: Any]] = (0..<1000).map { i in
                ["id": "refresh-\(i)", "type": "rectangle", "x": (i % 40) * 110,
                 "y": (i / 40) * 90, "width": 100, "height": 80, "angle": 0,
                 "strokeColor": "#1e1e1e", "backgroundColor": "transparent", "fillStyle": "solid",
                 "strokeWidth": 1, "strokeStyle": "solid", "roughness": 1, "opacity": 100,
                 "groupIds": [], "seed": i + 1, "version": 1, "versionNonce": i + 1,
                 "isDeleted": false, "updated": 1, "locked": false]
            }
            let scene = try JSONSerialization.data(withJSONObject: ["type": "excalidraw", "version": 2,
                "elements": elements, "appState": ["viewBackgroundColor": "#ffffff"], "files": [:]])
            // Use the real readiness/load gate; helper existence precedes native initialization.
            await core.documentSyncController.load(fileID: "refresh-test", data: scene)
            XCTAssertEqual(core.documentSyncController.currentLoadedFileID, "refresh-test")
            let result = try await webView.callAsyncJavaScript("""
            const h=window.excalidrawZHelper;
            for(let i=0;i<20;i++) await new Promise(requestAnimationFrame);
            const frames=[]; let previous=await new Promise(requestAnimationFrame);
            for(let i=0;i<180;i++) {
              h.setCamera({scrollX:-i*8,scrollY:-i*4,zoom:1});
              const now=await new Promise(requestAnimationFrame);frames.push(now-previous);previous=now;
            }
            frames.sort((a,b)=>a-b);
            const snapshot=await h.getCurrentFileSnapshot();
            return {snapshotPresent:!!snapshot,elementCount:h._api.getSceneElements().length,median:frames[90],p95:frames[171],max:frames[179],over50:frames.filter(x=>x>50).length};
            """, arguments: [:], in: nil, contentWorld: .page)
            let value = try XCTUnwrap(result as? [String: Any])
            XCTAssertEqual(value["elementCount"] as? Int, 1000)
            XCTAssertEqual(value["snapshotPresent"] as? Bool, true)
            let data = try JSONSerialization.data(withJSONObject: value, options: [.sortedKeys])
            print("EXPERIMENTAL_REFRESH enabled=\(enabled) " + String(decoding: data, as: UTF8.self))
            // Timing is evidence, not a flaky hardware/power-policy assertion.
            webView.window?.close()
        }
    }

    func testStandardSceneWithImageExportsAndReopens() async throws {
        let webView = try await readyEditor()
        let result = try await webView.callAsyncJavaScript("""
        const h = window.excalidrawZHelper;
        const pixel = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR4nGP4z8DwHwAFAAH/iZk9HQAAAABJRU5ErkJggg==";
        const base = {x:50,y:50,width:100,height:80,angle:0,strokeColor:'#1e1e1e',backgroundColor:'transparent',fillStyle:'solid',strokeWidth:1,strokeStyle:'solid',roughness:1,opacity:100,groupIds:[],frameId:null,roundness:null,seed:1,version:1,versionNonce:1,isDeleted:false,boundElements:null,updated:1,link:null,locked:false};
        const scene = {type:'excalidraw',version:2,source:'https://excalidraw.com',appState:{viewBackgroundColor:'#ffffff'},elements:[{...base,id:'test-rectangle',type:'rectangle'},{...base,id:'test-image',type:'image',x:200,fileId:'pixel',status:'saved',scale:[1,1]}],files:{pixel:{id:'pixel',dataURL:pixel,mimeType:'image/png',created:1}}};
        await h.loadFileBuffer(Array.from(new TextEncoder().encode(JSON.stringify(scene))), 'test-a', 'test-load-a');
        const snapshot = await h.getCurrentFileSnapshot();
        const png = await h.exportElementsToBlob(snapshot.elements, snapshot.files, {exportEmbedScene:true});
        const svg = await h.exportElementsToSvg(snapshot.elements, snapshot.files, true);
        const saved = JSON.stringify({...scene,elements:snapshot.elements,appState:{viewBackgroundColor:'#ffffff'},files:snapshot.files});
        await h.loadFileBuffer(Array.from(new TextEncoder().encode(JSON.stringify({...scene,elements:[],files:{}}))), 'test-b', 'test-load-b');
        await h.loadFileBuffer(Array.from(new TextEncoder().encode(saved)), 'test-a', 'test-reopen-a');
        const reopened = await h.getCurrentFileSnapshot();
        return {ids:reopened.elements.filter(e=>!e.isDeleted).map(e=>e.id),image:reopened.files.pixel.dataURL===pixel,png:png.blobData.length,svg:svg.svg.includes('<svg'),svgText:svg.svg,type:JSON.parse(saved).type};
        """, arguments: [:], in: nil, contentWorld: .page)
        let value = try XCTUnwrap(result as? [String: Any])
        XCTAssertEqual(value["ids"] as? [String], ["test-rectangle", "test-image"])
        XCTAssertEqual(value["image"] as? Bool, true)
        XCTAssertGreaterThan(value["png"] as? Int ?? 0, 100)
        XCTAssertEqual(value["svg"] as? Bool, true)
        XCTAssertEqual(value["type"] as? String, "excalidraw")
        let svgText = try XCTUnwrap(value["svgText"] as? String)
        let svgURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString + ".svg")
        try Data(svgText.utf8).write(to: svgURL)
        defer { try? FileManager.default.removeItem(at: svgURL) }
        let printer = PrinterWebView(filename: "Compatibility")
        let pdf = try await printer.exportPDFData(fileURL: svgURL)
        XCTAssertTrue(pdf.starts(with: Data("%PDF".utf8)))
        XCTAssertGreaterThan(pdf.count, 100)

    }
}
#endif
