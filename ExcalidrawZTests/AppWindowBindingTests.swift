#if os(macOS)
import XCTest
import SwiftUI
import AppKit
@testable import ExcalidrawZ

@MainActor
final class AppWindowBindingTests: XCTestCase {
    func testWhatsNewViewRendersDesktopBranding() async throws {
        let host = NSHostingView(rootView: WhatsNewView(showContinue: false))
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 720, height: 780),
            styleMask: [.titled], backing: .buffered, defer: false
        )
        window.isReleasedWhenClosed = false
        defer { window.close() }
        window.contentView = host
        window.orderBack(nil)
        try await Task.sleep(nanoseconds: 300_000_000)
        host.layoutSubtreeIfNeeded()
        let image = try XCTUnwrap(host.bitmapImageRepForCachingDisplay(in: host.bounds))
        host.cacheDisplay(in: host.bounds, to: image)
        let png = try XCTUnwrap(image.representation(using: .png, properties: [:]))
        XCTAssertGreaterThan(png.count, 1_000)
        try png.write(to: URL(fileURLWithPath: "/private/tmp/excalidraw-branding-131-whatsnew.png"))
    }

    func testHostingWindowIsResolvedWithoutOSVersionAllowlist() async throws {
        var observed: NSWindow?
        let binding = Binding<NSWindow?>(get: { observed }, set: { observed = $0 })
        let host = NSHostingView(rootView: Text("Import routing fixture").bindAppWindow(binding))
        let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 400, height: 200), styleMask: [.titled], backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        defer { window.close() }
        window.contentView = host
        window.orderFront(nil)
        for _ in 0..<100 {
            if observed === window { break }
            try await Task.sleep(nanoseconds: 10_000_000)
        }
        XCTAssertTrue(observed === window, "Import must have its hosting window on the current macOS version")
        let second = NSWindow(contentRect: window.frame, styleMask: [.titled], backing: .buffered, defer: false)
        second.isReleasedWhenClosed = false
        defer { second.close() }
        window.contentView = nil
        second.contentView = host
        for _ in 0..<100 {
            if observed === second { break }
            try await Task.sleep(nanoseconds: 10_000_000)
        }
        XCTAssertTrue(observed === second, "Routing must follow the actual host, never a stale window")
    }
}
#endif
