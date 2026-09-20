import SwiftUI
#if os(macOS)
import AppKit

/// Observes the actual hosting window without an OS-version allowlist.
struct AppWindowBinding: NSViewRepresentable {
    @Binding var window: NSWindow?

    final class ObserverView: NSView {
        var onWindowChange: ((NSWindow?) -> Void)?
        override func viewDidMoveToWindow() {
            super.viewDidMoveToWindow()
            publishWindow()
        }
        func publishWindow() {
            // SwiftUI must not be mutated during representable updates.
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.onWindowChange?(self.window)
            }
        }
        override func hitTest(_ point: NSPoint) -> NSView? { nil }
    }

    func makeNSView(context: Context) -> ObserverView { ObserverView() }
    func updateNSView(_ view: ObserverView, context: Context) {
        view.onWindowChange = { observedWindow in
            if window !== observedWindow { window = observedWindow }
        }
        view.publishWindow()
    }
}

extension View {
    func bindAppWindow(_ window: Binding<NSWindow?>) -> some View {
        background(AppWindowBinding(window: window).frame(width: 0, height: 0))
    }
}
#else
import ChocofordUI
extension View {
    func bindAppWindow(_ window: Binding<UIWindow?>) -> some View {
        bindWindow(window)
    }
}
#endif
