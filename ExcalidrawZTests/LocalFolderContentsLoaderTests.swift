import XCTest
@testable import ExcalidrawZ

final class LocalFolderContentsLoaderTests: XCTestCase {
    func testRecognizesSupportedFileNames() {
        XCTAssertTrue(LocalFolderContentsLoader.isSupportedFile(URL(fileURLWithPath: "/tmp/a.excalidraw")))
        XCTAssertTrue(LocalFolderContentsLoader.isSupportedFile(URL(fileURLWithPath: "/tmp/a.excalidraw.svg")))
        XCTAssertTrue(LocalFolderContentsLoader.isSupportedFile(URL(fileURLWithPath: "/tmp/a.excalidraw.png")))
        XCTAssertFalse(LocalFolderContentsLoader.isSupportedFile(URL(fileURLWithPath: "/tmp/a.svg")))
        XCTAssertFalse(LocalFolderContentsLoader.isSupportedFile(URL(fileURLWithPath: "/tmp/a.png")))
    }

    func testLoadsOnlySupportedFilesAndSortsByName() throws {
        let folder = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
        defer { try? FileManager.default.removeItem(at: folder) }

        for name in ["Zulu.excalidraw", "alpha.excalidraw.svg", "ignored.txt"] {
            XCTAssertTrue(FileManager.default.createFile(
                atPath: folder.appendingPathComponent(name).path,
                contents: Data()
            ))
        }

        let snapshot = try XCTUnwrap(LocalFolderContentsLoader.load(
            at: folder,
            activeURL: nil,
            sortFieldRawValue: ExcalidrawFileSortField.name.rawValue
        ))

        XCTAssertEqual(snapshot.files.map(\.lastPathComponent), [
            "alpha.excalidraw.svg",
            "Zulu.excalidraw",
        ])
        XCTAssertEqual(snapshot.metadata.count, 2)
    }
}
