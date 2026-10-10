#if os(macOS)
import XCTest
import WebKit
import AppKit
@testable import ExcalidrawZ

/// Exercises MCP commands in the bundled production editor. Every test owns a
/// standalone core/window and an in-memory fixture; no user drawing is opened.
@MainActor
final class MCPEmbeddedDiagramTests: XCTestCase {
    private var windows: [NSWindow] = []
    private var cores: [ExcalidrawCore] = []
    private let outputRoot = URL(fileURLWithPath: "/private/tmp/full-mcp-validation", isDirectory: true)

    override func tearDown() {
        windows.forEach { $0.close() }
        windows.removeAll()
        cores.removeAll()
        super.tearDown()
    }

    private func fixture() async throws -> (ExcalidrawCore, String) {
        let core = ExcalidrawCore(highRefreshRequested: false)
        cores.append(core)
        let window = NSWindow(contentRect: CGRect(x: 0, y: 0, width: 1100, height: 800), styleMask: [.titled], backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.title = "MCP isolated diagram fixture"
        core.webView.frame = CGRect(x: 0, y: 0, width: 1100, height: 800)
        window.contentView = core.webView
        // Keep the rendered fixture behind the user's foreground app.
        window.orderBack(nil)
        windows.append(window)
        core.webView.load(URLRequest(url: ExcalidrawServer.editorURL))
        let id = "mcp-fixture-" + UUID().uuidString
        guard await core.waitUntilReadyForFileLoad(fileID: id, timeout: 20) else {
            XCTFail("Bundled editor did not initialize")
            throw NSError(domain: "MCPEmbeddedDiagramTests", code: 1)
        }
        let scene = Data(##"{"type":"excalidraw","version":2,"source":"mcp-test","elements":[],"appState":{"viewBackgroundColor":"#ffffff"},"files":{}}"##.utf8)
        let outcome = await core.documentSyncController.load(fileID: id, data: scene, force: true, validateCurrentParentFile: false)
        XCTAssertTrue(outcome.didLoad)
        XCTAssertEqual(core.documentSyncController.currentLoadedFileID, id)
        return (core, id)
    }

    private func run(_ core: ExcalidrawCore, script: String, arguments: [String: Any] = [:]) async throws -> [String: Any] {
        let raw = try await core.webView.callAsyncJavaScript(script, arguments: arguments, contentWorld: .page)
        return try XCTUnwrap(raw as? [String: Any])
    }

    private func storePNG(_ value: [String: Any], name: String) throws {
        let base64 = try XCTUnwrap(value["png"] as? String)
        let data = try XCTUnwrap(Data(base64Encoded: base64))
        XCTAssertTrue(data.starts(with: Data([137, 80, 78, 71])))
        let representation = try XCTUnwrap(NSBitmapImageRep(data: data))
        XCTAssertLessThanOrEqual(representation.pixelsWide, 1030)
        XCTAssertLessThanOrEqual(representation.pixelsHigh, 1030)
        try FileManager.default.createDirectory(at: outputRoot, withIntermediateDirectories: true)
        try data.write(to: outputRoot.appendingPathComponent(name + ".png"), options: .atomic)
        let attachment = XCTAttachment(data: data, uniformTypeIdentifier: "public.png")
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
    }

    func testConsecutiveBlankDocumentSwitchInOccludedEditor() async throws {
        let (core, originalID) = try await fixture()
        windows.last?.orderOut(nil)
        let start = Date()
        let value = try await run(core, script: #"""
        const h=window.excalidrawZHelper;
        const before=await h.diagramCommand({action:'inspect',document_id:documentID});
        const scene=JSON.stringify({type:'excalidraw',version:2,elements:[],files:{},appState:{viewBackgroundColor:'#ffffff'}});
        const first=await h.loadFileString(scene,documentID+'-second','blank-switch-1');
        const middle=await h.diagramCommand({action:'inspect',document_id:documentID+'-second'});
        const second=await h.loadFileString(scene,documentID+'-third','blank-switch-2');
        const after=await h.diagramCommand({action:'inspect',document_id:documentID+'-third'});
        const edit=await h.diagramCommand({action:'apply_operations',document_id:documentID+'-third',expected_revision:after.revision,request_id:'immediate-after-load',operations:[{type:'create',elements:[{id:'undo-me',type:'rectangle',x:20,y:20,width:100,height:60}]}]});
        await new Promise(resolve=>setTimeout(resolve,300));
        const undo=await h.diagramCommand({action:'history',document_id:documentID+'-third',expected_revision:(await h.diagramCommand({action:'inspect',document_id:documentID+'-third'})).revision,request_id:'undo-after-load',operation:'undo'});
        const undone=await h.diagramCommand({action:'inspect',document_id:documentID+'-third'});
        return {firstCount:first.elementCount,secondCount:second.elementCount,documentID:h.currentFileId,
          changedRevision:before.revision!==middle.revision&&middle.revision!==after.revision,
          loading:h._api.getAppState().isLoading,total:after.total,undoChanged:undo.changed,undoTotal:undone.total,error:after.error?.code??edit.error?.code??undo.error?.code??null};
        """#, arguments: ["documentID": originalID])
        XCTAssertNil(value["error"] as? String)
        XCTAssertEqual(value["firstCount"] as? Int, 0)
        XCTAssertEqual(value["secondCount"] as? Int, 0)
        XCTAssertEqual(value["documentID"] as? String, originalID + "-third")
        XCTAssertEqual(value["changedRevision"] as? Bool, true)
        XCTAssertEqual(value["loading"] as? Bool, false)
        XCTAssertEqual(value["total"] as? Int, 0)
        XCTAssertEqual(value["undoChanged"] as? Bool, true)
        XCTAssertEqual(value["undoTotal"] as? Int, 0)
        XCTAssertLessThan(Date().timeIntervalSince(start), 3)
    }

    func testAtomicBatchErrorsRevisionAndNativeEnvelope() async throws {
        let (core, id) = try await fixture()
        let value = try await run(core, script: #"""
        const h=window.excalidrawZHelper;
        const read=()=>h.diagramCommand({action:'inspect',document_id:documentID});
        let initial=await read();
        const seed=await h.diagramCommand({action:'apply_operations',document_id:documentID,expected_revision:initial.revision,request_id:'seed',client_id:'fixture',operations:[{type:'create',elements:[{id:'a',type:'rectangle',x:20,y:20,width:100,height:60,label:{text:'Atomic'}}]}]});
        await new Promise(requestAnimationFrame);
        const before=await read();
        const invalid=await h.diagramCommand({action:'apply_operations',document_id:documentID,expected_revision:before.revision,request_id:'invalid',client_id:'fixture',operations:[{type:'move',ids:['a'],dx:70},{type:'resize',ids:['missing'],width:10,height:10}]});
        const after=await read();
        const revisionBeforeHuman=after.revision;
        h._api.mutateElement(h._api.getSceneElements().find(e=>e.id==='a'),{x:80});
        const stale=await h.diagramCommand({action:'apply_operations',document_id:documentID,expected_revision:revisionBeforeHuman,request_id:'stale',client_id:'fixture',operations:[{type:'move',ids:['a'],dx:20}]});
        const current=await read();
        return {seedError:seed.error?.code??null,atomicError:invalid.error?.code,operationIndex:invalid.error?.data?.operation_index,before:JSON.stringify(before.elements),after:JSON.stringify(after.elements),staleError:stale.error?.code,revision:current.revision};
        """#, arguments: ["documentID": id])
        XCTAssertNil(value["seedError"] as? String)
        XCTAssertEqual(value["atomicError"] as? String, "element_not_found")
        XCTAssertEqual(value["operationIndex"] as? Int, 1)
        XCTAssertEqual(value["before"] as? String, value["after"] as? String)
        XCTAssertEqual(value["staleError"] as? String, "revision_conflict")
        let revision = try XCTUnwrap(value["revision"] as? String)
        do {
            _ = try await core.performDiagramCommand([
                "action": .string("apply_operations"), "document_id": .string(id),
                "expected_revision": .string(revision), "request_id": .string("native-error"),
                "operations": .array([.object(["type": .string("move"), "ids": .array([.string("missing")]), "dx": .number(1)])])
            ])
            XCTFail("Native wrapper must throw a typed error from the JS envelope")
        } catch let error as ExcalidrawMCPCommandError {
            XCTAssertEqual(error.code, "element_not_found")
            XCTAssertEqual(error.details?["operation_index"], .number(0))
        }
    }

    func testSingleUndoRedoRequestDeduplicationAndPreparationRace() async throws {
        let (core, id) = try await fixture()
        let value = try await run(core, script: #"""
        const h=window.excalidrawZHelper;
        const read=()=>h.diagramCommand({action:'inspect',document_id:documentID});
        const command=async(action,args={})=>h.diagramCommand({action,document_id:documentID,expected_revision:(await read()).revision,request_id:crypto.randomUUID(),client_id:'fixture',...args});
        await command('apply_operations',{operations:[{type:'create',elements:[{id:'a',type:'rectangle',x:20,y:20,width:100,height:60}]}]});
        await new Promise(requestAnimationFrame);
        const before=(await read()).elements.find(e=>e.id==='a');
        const payload={action:'apply_operations',document_id:documentID,expected_revision:(await read()).revision,request_id:'once',client_id:'fixture',operations:[{type:'move',ids:['a'],dx:50},{type:'style',ids:['a'],style:{backgroundColor:'#dbeafe'}}]};
        const first=await h.diagramCommand(payload); await new Promise(requestAnimationFrame);
        const retry=await h.diagramCommand(payload);
        const after=(await read()).elements.find(e=>e.id==='a');
        const undo=await command('history',{operation:'undo'}); await new Promise(requestAnimationFrame);
        const undone=(await read()).elements.find(e=>e.id==='a');
        const redo=await command('history',{operation:'redo'}); await new Promise(requestAnimationFrame);
        const redone=(await read()).elements.find(e=>e.id==='a');
        const fonts=document.fonts;
        const descriptor=Object.getOwnPropertyDescriptor(fonts,'ready');
        let release;
        Object.defineProperty(fonts,'ready',{configurable:true,value:new Promise(resolve=>release=resolve)});
        let race;
        try {
          const pending=command('create_diagram',{nodes:[{id:'racy',text:'Should not commit'}]});
          // Allow command() to inspect and enter its font wait.
          await new Promise(resolve=>setTimeout(resolve,50));
          h._api.mutateElement(h._api.getSceneElements().find(e=>e.id==='a'),{y:123});
          release(); race=await pending;
        } finally { if(descriptor) Object.defineProperty(fonts,'ready',descriptor); else delete fonts.ready; }
        return {beforeX:before.x,afterX:after.x,undoX:undone.x,redoX:redone.x,undoColor:undone.backgroundColor,redoColor:redone.backgroundColor,undoChanged:undo.changed,redoChanged:redo.changed,retryEqual:JSON.stringify(first)===JSON.stringify(retry),raceError:race.error?.code,racyAbsent:!(await read()).elements.some(e=>e.id==='racy')};
        """#, arguments: ["documentID": id])
        XCTAssertEqual(value["beforeX"] as? Int, 20)
        XCTAssertEqual(value["afterX"] as? Int, 70)
        XCTAssertEqual(value["undoX"] as? Int, 20)
        XCTAssertEqual(value["redoX"] as? Int, 70)
        XCTAssertEqual(value["redoColor"] as? String, "#dbeafe")
        XCTAssertEqual(value["retryEqual"] as? Bool, true)
        XCTAssertEqual(value["undoChanged"] as? Bool, true)
        XCTAssertEqual(value["redoChanged"] as? Bool, true)
        XCTAssertEqual(value["raceError"] as? String, "revision_conflict")
        XCTAssertEqual(value["racyAbsent"] as? Bool, true)
    }

    func testRawSceneAssetsFramesBindingsAndExportRoundTrip() async throws {
        let (core, id) = try await fixture()
        let value = try await run(core, script: #"""
        const h=window.excalidrawZHelper;
        const read=()=>h.diagramCommand({action:'inspect',document_id:documentID,include_assets:true});
        const edit=async(operations,extras={})=>h.diagramCommand({action:'apply_operations',document_id:documentID,expected_revision:(await read()).revision,request_id:crypto.randomUUID(),client_id:'fixture',operations,...extras});
        const first=await edit([{type:'create',elements:[{id:'a',type:'rectangle',x:50,y:60,width:180,height:100,label:{text:'Équipe A'}},{id:'b',type:'rectangle',x:400,y:60,width:180,height:100,label:{text:'Node B'}},{id:'slide',type:'frame',x:10,y:10,width:650,height:350,name:'Architecture'}]},{type:'connect',from:'a',to:'b',arrow:{label:'Traffic'}},{type:'frame',frame_id:'slide',ids:['a','b']}]);
        if(first.error) return {error:first.error.code};
        const pixel='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR4nGP4z8DwHwAFAAH/iZk9HQAAAABJRU5ErkJggg==';
        const asset=await h.diagramCommand({action:'import_assets',document_id:documentID,expected_revision:(await read()).revision,request_id:'asset',client_id:'fixture',assets:[{id:'image',file_id:'pixel',data_url:pixel,x:100,y:210,width:48,height:48}]});
        if(asset.error) return {error:asset.error.code};
        let snapshot=await h.getCurrentFileSnapshot();
        const raw=snapshot.elements.map(e=>e.id==='a'?{...e,futureExtension:{schema:7,retained:true},customData:{role:'node',vendor:'fixture'}}:e);
        const replaced=await edit([{type:'replace_scene',elements:raw,files:snapshot.files,app_state:{viewBackgroundColor:'#f8fafc'}}]);
        if(replaced.error) return {error:replaced.error.code};
        await edit([{type:'move',ids:['a'],dx:20},{type:'resize',ids:['b'],width:200,height:110}]);
        await new Promise(requestAnimationFrame);
        snapshot=await h.getCurrentFileSnapshot();
        const arrow=snapshot.elements.find(e=>e.type==='arrow');
        const preview=await h.diagramCommand({action:'render_diagram',document_id:documentID,max_dimension:1024});
        const svg=await h.exportElementsToSvg(snapshot.elements,snapshot.files,true);
        const save=JSON.stringify({type:'excalidraw',version:2,elements:snapshot.elements,files:snapshot.files,appState:{viewBackgroundColor:'#f8fafc'}});
        await h.loadFileString(JSON.stringify({type:'excalidraw',version:2,elements:[],files:{},appState:{}}),documentID+'-empty','roundtrip-empty');
        await h.loadFileString(save,documentID,'roundtrip-reopen');
        const reopened=await h.getCurrentFileSnapshot();
        const a=reopened.elements.find(e=>e.id==='a'), label=reopened.elements.find(e=>e.containerId==='a');
        return {extension:a.futureExtension,customData:a.customData,frame:a.frameId,labelFrame:label.frameId,arrowStart:arrow.startBinding?.elementId,arrowEnd:arrow.endBinding?.elementId,assetPreserved:reopened.files.pixel.dataURL===pixel,svg:svg.svg.includes('<svg'),png:preview.image?.data,error:preview.error?.code??null};
        """#, arguments: ["documentID": id])
        XCTAssertNil(value["error"] as? String)
        XCTAssertEqual((value["extension"] as? [String: Any])?["retained"] as? Bool, true)
        XCTAssertEqual((value["customData"] as? [String: Any])?["vendor"] as? String, "fixture")
        XCTAssertEqual(value["frame"] as? String, "slide")
        XCTAssertEqual(value["labelFrame"] as? String, "slide")
        XCTAssertEqual(value["arrowStart"] as? String, "a")
        XCTAssertEqual(value["arrowEnd"] as? String, "b")
        XCTAssertEqual(value["assetPreserved"] as? Bool, true)
        XCTAssertEqual(value["svg"] as? Bool, true)
        try storePNG(value, name: "mixed-scene-roundtrip")
    }

    func testMeasuredLayoutVisualFixturesAndPerformance() async throws {
        let (core, id) = try await fixture()
        let value = try await run(core, script: #"""
        const h=window.excalidrawZHelper;
        const read=()=>h.diagramCommand({action:'inspect',document_id:documentID});
        const nodes=Array.from({length:100},(_,i)=>({id:'node-'+i,text:'Node '+i+' — Équipe'}));
        const edges=Array.from({length:99},(_,i)=>({from:'node-'+Math.floor(i/3),to:'node-'+(i+1)}));
        const start=performance.now();
        const graph=await h.diagramCommand({action:'create_diagram',document_id:documentID,expected_revision:(await read()).revision,request_id:'graph100',client_id:'fixture',nodes,edges,preset:'technical_clean',direction:'RIGHT'});
        const layoutMS=performance.now()-start;
        const findings=await h.diagramCommand({action:'analyze_diagram',document_id:documentID});
        const render=await h.diagramCommand({action:'render_diagram',document_id:documentID,max_dimension:1024});
        const common={type:'rectangle',x:0,y:0,width:100,height:60};
        const skeletons=Array.from({length:1000},(_,i)=>({...common,id:'mixed-'+i,x:(i%40)*140,y:Math.floor(i/40)*100}));
        const largeStart=performance.now();
        const large=await h.diagramCommand({action:'apply_operations',document_id:documentID,expected_revision:(await read()).revision,request_id:'scene1000',client_id:'fixture',operations:[{type:'replace_scene',elements:h.createElements(skeletons,{regenerateIds:false}),files:{}}]});
        const page=await h.diagramCommand({action:'inspect',document_id:documentID,offset:990,limit:20});
        const pageMS=performance.now()-largeStart;
        return {error:graph.error?.code??large.error?.code??render.error?.code??null,layoutMS,pageMS,total:page.total,pageCount:page.elements?.length,findings:findings.findings.filter(e=>['overlap','label_overlap','clipped_label'].includes(e.code)),png:render.image?.data};
        """#, arguments: ["documentID": id])
        XCTAssertNil(value["error"] as? String)
        XCTAssertEqual(value["total"] as? Int, 1000)
        XCTAssertEqual(value["pageCount"] as? Int, 10)
        XCTAssertEqual((value["findings"] as? [[String: Any]])?.count, 0)
        XCTAssertLessThan(value["layoutMS"] as? Double ?? .infinity, 15_000)
        XCTAssertLessThan(value["pageMS"] as? Double ?? .infinity, 10_000)
        print("MCP_EMBEDDED_PERFORMANCE layout100_ms=\(value["layoutMS"] ?? "missing") mixed1000_ms=\(value["pageMS"] ?? "missing")")
        try storePNG(value, name: "network-100-nodes")
    }

    func testArchitectureWorkflowAndPresentationVisualFixtures() async throws {
        let (core, id) = try await fixture()
        for (name, preset, direction) in [("architecture", "technical_clean", "RIGHT"), ("workflow", "sketch", "DOWN"), ("presentation", "presentation", "RIGHT")] {
            let value = try await run(core, script: #"""
            const h=window.excalidrawZHelper;
            const read=()=>h.diagramCommand({action:'inspect',document_id:documentID});
            const edit=async(action,args={})=>h.diagramCommand({action,document_id:documentID,expected_revision:(await read()).revision,request_id:crypto.randomUUID(),client_id:'fixture',...args});
            await edit('apply_operations',{operations:[{type:'replace_scene',elements:[],files:{}}]});
            const nodes=[{id:'request',text:'Request\nÉquipe / Client'},{id:'gateway',text:'Gateway / Validation',type:'diamond'},{id:'service',text:'Diagram service\nLong multilingual label'},{id:'editor',text:'Embedded Excalidraw editor'},{id:'store',text:'Document store'},{id:'preview',text:'Preview and refine'}];
            const edges=[{from:'request',to:'gateway',label:'Connect'},{from:'gateway',to:'service',label:'Authorized'},{from:'service',to:'editor',label:'Apply atomic edit'},{from:'editor',to:'store',label:'Save'},{from:'editor',to:'preview',label:'Render'},{from:'preview',to:'service',label:'Refine'}];
            const result=await edit('create_diagram',{nodes,edges,preset:stylePreset,direction:layoutDirection,containers:stylePreset==='presentation'?[{id:'slide',name:'Complete diagram workflow',child_ids:nodes.map(e=>e.id)}]:[]});
            const findings=await h.diagramCommand({action:'analyze_diagram',document_id:documentID});
            const render=await h.diagramCommand({action:'render_diagram',document_id:documentID,max_dimension:1024});
            const scene=await read();
            return {aspectRatio:scene.bounds.width/scene.bounds.height,error:result.error?.code??render.error?.code??null,findings:findings.findings.filter(e=>['overlap','label_overlap','clipped_label'].includes(e.code)),png:render.image?.data};
            """#, arguments: ["documentID": id, "stylePreset": preset, "layoutDirection": direction])
            XCTAssertNil(value["error"] as? String, name)
            XCTAssertEqual((value["findings"] as? [[String: Any]])?.count, 0, "\(name): \(value["findings"] ?? "missing findings")")
            XCTAssertLessThan(value["aspectRatio"] as? Double ?? .infinity, 2.8, name)
            try storePNG(value, name: name)
        }
    }
}
#endif
