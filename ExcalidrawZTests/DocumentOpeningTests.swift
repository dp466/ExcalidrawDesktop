import XCTest
@testable import ExcalidrawZ

final class DocumentOpeningTests: XCTestCase {
    private func fixture() throws -> Data {
        let element: [String: Any] = [
            "id": "shape", "type": "rectangle", "x": 10, "y": 10,
            "width": 100, "height": 80, "angle": 0, "strokeColor": "#1e1e1e",
            "backgroundColor": "transparent", "fillStyle": "solid", "strokeWidth": 1,
            "strokeStyle": "solid", "roughness": 1, "opacity": 100, "groupIds": [],
            "seed": 1, "version": 1, "versionNonce": 1, "isDeleted": false,
            "updated": 1, "locked": false
        ]
        return try JSONSerialization.data(withJSONObject: [
            "type": "excalidraw", "version": 2, "source": "https://excalidraw.com",
            "elements": (0..<5000).map { index in
                var item = element; item["id"] = "shape-\(index)"; return item
            },
            "appState": ["viewBackgroundColor": "#ffffff"],
            "files": ["image": ["mimeType": "image/png", "id": "image",
                                "dataURL": "data:image/png;base64," + String(repeating: "A", count: 4_000_000)]]
        ])
    }

    @MainActor
    func testBackgroundDecodePreservesLargeSceneAndOriginalBytes() async throws {
        let data = try fixture()
        let start = Date()
        let synchronous = try ExcalidrawFile(data: data, id: "opening")
        let synchronousDuration = Date().timeIntervalSince(start)
        let backgroundStart = Date()
        let asynchronous = try await ExcalidrawFile.decodeForOpening(data: data, id: "opening")
        print("OPENING BENCHMARK: bytes=\(data.count), elements=5000, synchronous_ui_seconds=\(synchronousDuration), background_wall_seconds=\(Date().timeIntervalSince(backgroundStart))")
        XCTAssertEqual(asynchronous, synchronous)
        XCTAssertEqual(asynchronous.content, data)
        XCTAssertEqual(asynchronous.elements.count, 5000)
        XCTAssertEqual(asynchronous.files["image"]?.dataURL, synchronous.files["image"]?.dataURL)
    }

    func testInvalidJSONFailsInsteadOfProducingBlankDrawing() async {
        do {
            _ = try await ExcalidrawFile.decodeForOpening(data: Data("invalid".utf8), id: "bad")
            XCTFail("Invalid content should fail")
        } catch {}
    }

    func testCancelledOpenDoesNotPublishDecodedScene() async throws {
        let data = try fixture()
        let task = Task {
            withUnsafeCurrentTask { $0?.cancel() }
            return try await ExcalidrawFile.decodeForOpening(data: data, id: "cancelled")
        }
        do {
            _ = try await task.value
            XCTFail("Cancelled opening should fail")
        } catch is CancellationError {} catch { XCTFail("Unexpected error: \(error)") }
    }
}
