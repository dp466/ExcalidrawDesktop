import XCTest
@testable import ExcalidrawZ

final class FileCoverPreviewPreparationTests: XCTestCase {
    func testDecodePreservesContentAndAppliesPreviewID() async throws {
        let content = try makeDocumentData(files: [:])

        let file = try await FileCoverPreviewPreparation.decode(
            data: content,
            id: "preview-id"
        )

        XCTAssertEqual(file.id, "preview-id")
        XCTAssertEqual(file.content, content)
        XCTAssertTrue(file.files.isEmpty)
    }

    func testSceneDataPublishesHydratedFilesWithoutChangingDocumentFields() async throws {
        let content = try makeDocumentData(files: [:])
        var file = try ExcalidrawFile(data: content, id: "preview-id")
        file.files = [
            "image-1": .init(
                mimeType: "image/png",
                id: "image-1",
                dataURL: "data:image/png;base64,AA=="
            )
        ]

        let preparedData = try await FileCoverPreviewPreparation.sceneData(
            for: file,
            updatingContentFiles: true
        )
        let prepared = try XCTUnwrap(
            JSONSerialization.jsonObject(with: preparedData) as? [String: Any]
        )
        let elements = try XCTUnwrap(prepared["elements"] as? [[String: Any]])
        let files = try XCTUnwrap(prepared["files"] as? [String: Any])

        XCTAssertTrue(elements.isEmpty)
        XCTAssertEqual(prepared["source"] as? String, "test")
        XCTAssertNotNil(files["image-1"])
    }

    func testSceneDataReusesDecodedContentWhenFilesDidNotChange() async throws {
        let content = try makeDocumentData(files: [:])
        let file = try ExcalidrawFile(data: content, id: "preview-id")

        let preparedData = try await FileCoverPreviewPreparation.sceneData(
            for: file,
            updatingContentFiles: false
        )

        XCTAssertEqual(preparedData, content)
    }

    func testAlreadyCancelledPreparationDoesNotPublishData() async {
        let content = try! makeDocumentData(files: [:])
        let file = try! ExcalidrawFile(data: content, id: "preview-id")
        let task = Task {
            withUnsafeCurrentTask { $0?.cancel() }
            return try await FileCoverPreviewPreparation.sceneData(
                for: file,
                updatingContentFiles: false
            )
        }

        do {
            _ = try await task.value
            XCTFail("Cancelled preview preparation unexpectedly completed")
        } catch is CancellationError {
            // Expected: cancellation must prevent stale preview work from publishing.
        } catch {
            XCTFail("Unexpected cancellation error: \(error)")
        }
    }

    private func makeDocumentData(files: [String: Any]) throws -> Data {
        try JSONSerialization.data(withJSONObject: [
            "type": "excalidraw",
            "version": 2,
            "source": "test",
            "elements": [],
            "appState": [:],
            "files": files,
        ])
    }
}
