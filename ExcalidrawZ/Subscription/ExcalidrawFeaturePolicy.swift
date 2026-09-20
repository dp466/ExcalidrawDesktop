//
//  ExcalidrawFeaturePolicy.swift
//  ExcalidrawZ
//

/// Build-flavor policy for features that are intentionally local to the
/// independently distributed macOS app.
///
/// Keep this separate from subscription state: presentation and MCP run on the
/// user's Mac, while AI chat uses the hosted LLM service. The local macOS build
/// therefore includes the local features without enabling cloud AI or requiring
/// a subscription entitlement.
enum ExcalidrawFeaturePolicy {
    static var isLocalMacOSFork: Bool {
#if os(macOS) && !APP_STORE
        true
#else
        false
#endif
    }

    static var allowsCloudAIServices: Bool {
        guard !isLocalMacOSFork else { return false }
#if APP_STORE || DEBUG
        return true
#else
        return false
#endif
    }

    static func allowsPresentation(subscriptionAllows: Bool) -> Bool {
        isLocalMacOSFork || subscriptionAllows
    }

    static func allowsOptimizedMCP(
        serverAvailable: Bool,
        subscriptionAllows: Bool
    ) -> Bool {
        serverAvailable && (isLocalMacOSFork || subscriptionAllows)
    }
}
