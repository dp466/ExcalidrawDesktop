import Foundation
import ImageIO

/// App-owned assets for image-based library components. Standard Excalidraw
/// libraries contain only element records; Full MCP accepts/exports a `files`
/// extension so image components remain portable and do not depend on the
/// lifetime of the original drawing's MediaItem records.
struct MCPLibraryAssetStore {
    static let shared = MCPLibraryAssetStore()
    let directory: URL
    static let maximumAssetBytes = 16 * 1_024 * 1_024
    static let maximumLibraryBytes = 64 * 1_024 * 1_024

    init(directory: URL? = nil) {
        self.directory = directory ?? FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(Bundle.main.bundleIdentifier ?? "local.dparadis.ExcalidrawDesktop", isDirectory: true)
            .appendingPathComponent("MCP/LibraryAssets", isDirectory: true)
    }

    static func validate(_ files: [String: MCPJSONValue]) throws {
        var decodedTotal = 0
        for (id, raw) in files {
            guard !id.isEmpty, id.utf8.count <= 256, let resource = raw.objectValue,
                  resource["id"]?.stringValue == id,
                  let mimeType = resource["mimeType"]?.stringValue, mimeType.hasPrefix("image/"),
                  let dataURL = resource["dataURL"]?.stringValue,
                  dataURL.utf8.count <= maximumAssetBytes * 4 / 3 + 1_024,
                  dataURL.hasPrefix("data:" + mimeType + ";base64,"),
                  let separator = dataURL.firstIndex(of: ","),
                  let decoded = Data(base64Encoded: String(dataURL[dataURL.index(after: separator)...])),
                  !decoded.isEmpty, decoded.count <= maximumAssetBytes else {
                throw MCPDocumentCommandError.invalid("Library asset \(id) requires matching id, image mimeType and a nonempty base64 data URL (maximum 16 MiB decoded).")
            }
            decodedTotal += decoded.count
            guard decodedTotal <= maximumLibraryBytes else { throw MCPDocumentCommandError.invalid("A library's image assets are limited to 64 MiB decoded.") }
            if mimeType == "image/svg+xml" {
                let parser = XMLParser(data: decoded)
                let delegate = MCPLibrarySVGValidationDelegate()
                parser.shouldResolveExternalEntities = false
                parser.delegate = delegate
                guard parser.parse(), delegate.rootIsSVG else { throw MCPDocumentCommandError.invalid("Library asset \(id) is not a valid SVG image.") }
            } else {
                guard let source = CGImageSourceCreateWithData(decoded as CFData, nil), CGImageSourceGetCount(source) > 0 else {
                    throw MCPDocumentCommandError.invalid("Library asset \(id) is not a decodable raster image.")
                }
            }
        }
        guard try MCPJSONValue.object(files).mcpJSONData().count <= maximumLibraryBytes * 4 / 3 + 65_536 else { throw MCPDocumentCommandError.invalid("The library asset envelope is too large.") }
    }

    func load(libraryID: UUID) throws -> [String: MCPJSONValue] {
        let url = fileURL(libraryID)
        guard FileManager.default.fileExists(atPath: url.path) else { return [:] }
        let values = try url.resourceValues(forKeys: [.fileSizeKey, .isSymbolicLinkKey])
        guard values.isSymbolicLink != true, (values.fileSize ?? 0) <= Self.maximumLibraryBytes * 4 / 3 + 65_536,
              let files = try MCPJSONValue.parse(from: Data(contentsOf: url)).objectValue else {
            throw MCPDocumentCommandError.invalid("The saved library asset envelope is invalid or too large.")
        }
        try Self.validate(files)
        return files
    }

    /// Writes the full merged envelope before publishing its element records.
    /// Returns the previous data so a failed Core Data save can restore it.
    @discardableResult
    func save(_ files: [String: MCPJSONValue], libraryID: UUID) throws -> Data? {
        try Self.validate(files)
        let previous = try backup(libraryID: libraryID)
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true, attributes: [.posixPermissions: 0o700])
        let url = fileURL(libraryID)
        try MCPJSONValue.object(files).mcpJSONData().write(to: url, options: .atomic)
        try FileManager.default.setAttributes([.posixPermissions: 0o600], ofItemAtPath: url.path)
        return previous
    }

    func backup(libraryID: UUID) throws -> Data? {
        let url = fileURL(libraryID)
        guard FileManager.default.fileExists(atPath: url.path) else { return nil }
        _ = try load(libraryID: libraryID)
        return try Data(contentsOf: url)
    }

    func restore(_ data: Data?, libraryID: UUID) throws {
        let url = fileURL(libraryID)
        if let data { try data.write(to: url, options: .atomic) }
        else if FileManager.default.fileExists(atPath: url.path) { try FileManager.default.removeItem(at: url) }
    }

    func remove(libraryID: UUID) throws { try restore(nil, libraryID: libraryID) }

    private func fileURL(_ id: UUID) -> URL { directory.appendingPathComponent(id.uuidString).appendingPathExtension("json") }
}

private final class MCPLibrarySVGValidationDelegate: NSObject, XMLParserDelegate {
    private var sawRoot = false
    private(set) var rootIsSVG = false
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String: String]) {
        guard !sawRoot else { return }
        sawRoot = true
        rootIsSVG = elementName == "svg" || elementName.hasSuffix(":svg")
    }
}
