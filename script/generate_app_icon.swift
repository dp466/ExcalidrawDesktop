#!/usr/bin/env swift
// Render the upstream vector mark into the fork's flat desktop icon assets.
// Run from the repository root: swift script/generate_app_icon.swift
import AppKit

let root = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let source = root.appendingPathComponent("ExcalidrawZ/Assets.xcassets/ExcalidrawLogoMark.imageset/ExcalidrawLogoMark.svg")
let mark = try String(contentsOf: source, encoding: .utf8)
let start = mark.range(of: "<path")!.lowerBound
let end = mark.range(of: "</svg>")!.lowerBound
let paths = String(mark[start..<end]).replacingOccurrences(of: "#000000", with: "#a8a5ff")
func svg(legacy: Bool) -> String {
    let background = legacy
        ? "<rect x=\"64\" y=\"64\" width=\"896\" height=\"896\" rx=\"200\" fill=\"#232329\"/>"
        : "<rect width=\"1024\" height=\"1024\" fill=\"#232329\"/>"
    return "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"1024\" height=\"1024\" viewBox=\"0 0 1024 1024\">\(background)<g transform=\"translate(202 202) scale(15.5)\">\(paths)</g></svg>\n"
}
let composer = root.appendingPathComponent("ExcalidrawZ/ExcalidrawZ Icon 26.icon")
try svg(legacy: false).write(to: composer.appendingPathComponent("Assets/ExcalidrawDesktop.svg"), atomically: true, encoding: .utf8)
func png(_ size: Int, _ relativePath: String, legacy: Bool = true) throws {
    let icon = NSImage(data: Data(svg(legacy: legacy).utf8))!
    let rep = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: size, pixelsHigh: size, bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0)!
    NSGraphicsContext.saveGraphicsState()
    NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: rep)
    NSGraphicsContext.current?.imageInterpolation = .high
    icon.draw(in: NSRect(x: 0, y: 0, width: size, height: size))
    NSGraphicsContext.restoreGraphicsState()
    try rep.representation(using: .png, properties: [:])!.write(to: root.appendingPathComponent(relativePath))
}
let catalog = "ExcalidrawZ/Assets.xcassets/AppIcon.appiconset/"
for points in [16, 32, 128, 256, 512] {
    for scale in [1, 2] {
        try png(points * scale, "\(catalog)AppIcon-\(points).0x\(points).0@\(scale)x.png")
    }
}
try png(1024, catalog + "ExcaliDrawZ ios logo.png", legacy: false)
try png(256, "ExcalidrawZ/Assets.xcassets/AppIcon-macOS.imageset/ExcalidrawZ Icon 26-iOS-Default-83.5x83.5@3x.png")
print("Updated vector Icon Composer asset and raster app icons.")
