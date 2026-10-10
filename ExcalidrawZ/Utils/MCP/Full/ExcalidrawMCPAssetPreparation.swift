import Foundation
import PDFKit
#if os(macOS)
import AppKit
#else
import UIKit
#endif

/// Prepares expensive assets without touching the live scene. The editor still
/// checks the captured revision after every preparation has finished.
enum ExcalidrawMCPAssetPreparation {
    @MainActor
    static func prepare(_ payload: [String: MCPJSONValue]) async throws -> [String: MCPJSONValue] {
        var prepared = payload
        if let operations = payload["operations"]?.arrayValue {
            var result: [MCPJSONValue] = []
            for operation in operations {
                try Task.checkCancellation()
                guard var fields = operation.objectValue else { throw MCPJSONRPCError.invalidParams("Each operation must be an object.") }
                if fields["type"] == .string("math"), fields["svg"] == nil, fields["svgBase64"] == nil, fields["dataURL"] == nil {
                    let input = try InsertMathToolInput.decodeLeniently(from: String(decoding: try operation.mcpJSONData(), as: UTF8.self))
                    let rendered: MathRenderedSVG
                    switch input.resolvedMode {
                    case .formula:
                        rendered = try await MathRenderService.shared.renderLatex(try input.resolvedLatex, foregroundColor: input.resolvedFormulaColor)
                    case .function:
                        rendered = try await MathRenderService.shared.render(.functionPlot(try input.functionPlotRequest))
                    }
                    fields["svg"] = .string(rendered.svg)
                    fields["latex"] = .string(rendered.source)
                    fields["renderer"] = .string(rendered.renderer)
                    if fields["width"] == nil, let width = rendered.width { fields["width"] = .number(width) }
                    if fields["height"] == nil, let height = rendered.height { fields["height"] = .number(height) }
                }
                result.append(.object(fields))
            }
            prepared["operations"] = .array(result)
        }
        if let assets = payload["assets"]?.arrayValue {
            let worker = Task.detached(priority: .userInitiated) { try expandPDFs(assets) }
            prepared["assets"] = .array(try await withTaskCancellationHandler {
                try await worker.value
            } onCancel: { worker.cancel() })
        }
        try Task.checkCancellation()
        return prepared
    }

    static func expandPDFs(_ assets: [MCPJSONValue]) throws -> [MCPJSONValue] {
        var result: [MCPJSONValue] = []
        for asset in assets {
            try Task.checkCancellation()
            guard let url = asset["data_url"]?.stringValue else { throw MCPJSONRPCError.invalidParams("Asset data_url is required.") }
            guard asset["mime_type"] == .string("application/pdf") || url.hasPrefix("data:application/pdf;") else {
                result.append(asset); continue
            }
            guard let comma = url.firstIndex(of: ","), url[..<comma].hasSuffix(";base64"),
                  let data = Data(base64Encoded: String(url[url.index(after: comma)...])), data.count <= 16 * 1024 * 1024,
                  let pdf = PDFDocument(data: data), !pdf.isLocked, (1...32).contains(pdf.pageCount) else {
                throw MCPJSONRPCError.invalidParams("Supply an unlocked PDF data URL with at most 32 pages and 16 MiB of bytes.")
            }
            var y = asset["y"]?.numberValue ?? 0
            for index in 0..<pdf.pageCount {
                try Task.checkCancellation()
                guard let page = pdf.page(at: index) else { throw MCPJSONRPCError.invalidParams("Invalid PDF page.") }
                let bounds = page.bounds(for: .mediaBox)
                guard bounds.width > 0, bounds.height > 0 else { throw MCPJSONRPCError.invalidParams("PDF page has empty bounds.") }
                let scale = min(2, 2048 / max(bounds.width, bounds.height))
                let image = page.thumbnail(of: CGSize(width: bounds.width * scale, height: bounds.height * scale), for: .mediaBox)
                #if os(macOS)
                let png = image.tiffRepresentation.flatMap { NSBitmapImageRep(data: $0)?.representation(using: .png, properties: [:]) }
                #else
                let png = image.pngData()
                #endif
                guard let png else { throw MCPJSONRPCError.internalError("PDF page could not be rasterized.") }
                var fields = asset.objectValue ?? [:]
                if let id = fields["id"]?.stringValue { fields["id"] = .string("\(id)-page-\(index + 1)") }
                if let id = fields["file_id"]?.stringValue { fields["file_id"] = .string("\(id)-page-\(index + 1)") }
                let width = asset["width"]?.numberValue ?? Double(bounds.width)
                let height = asset["height"]?.numberValue ?? width * Double(bounds.height / bounds.width)
                fields["data_url"] = .string("data:image/png;base64," + png.base64EncodedString())
                fields["mime_type"] = .string("image/png")
                fields["width"] = .number(width); fields["height"] = .number(height); fields["y"] = .number(y)
                result.append(.object(fields)); y += height + 24
            }
        }
        return result
    }
}
