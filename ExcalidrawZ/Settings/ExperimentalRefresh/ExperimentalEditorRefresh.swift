import Foundation
import WebKit

/// Restart-scoped so changing Settings never reconstructs a live editor or interrupts a save.
enum ExperimentalEditorRefresh {
    static let defaultsKey = "ExperimentalHighRefreshRate"
    static func isRequested(in defaults: UserDefaults = .standard) -> Bool {
        defaults.bool(forKey: defaultsKey) // Missing value deliberately means off.
    }
    static let requestedAtLaunch = isRequested()

    static let isAvailable: Bool = {
#if os(macOS) && !APP_STORE
        return EXRefreshPreferenceAvailable()
#else
        return false
#endif
    }()

    /// Never touch private preferences when off. On failure, discard this configuration.
    static func configure(_ configuration: WKWebViewConfiguration, enabled: Bool) -> Bool {
#if os(macOS) && !APP_STORE
        guard enabled else { return false }
        return EXSetPreferNear60FPS(configuration.preferences, false)
#else
        return false
#endif
    }
}
