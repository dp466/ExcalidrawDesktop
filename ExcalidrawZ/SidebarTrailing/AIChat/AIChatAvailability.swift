//
//  AIChatAvailability.swift
//  ExcalidrawZ
//

import Foundation

// Build-flavor and user-preference gates for AI chat surfaces.

enum AIChatAvailability {
    static var isAvailable: Bool {
        ExcalidrawFeaturePolicy.allowsCloudAIServices
    }

    static var isUserEnabled: Bool {
        UserDefaults.standard.object(forKey: AIChatPreferences.isAIEnabledDefaultsKey) as? Bool ?? false
    }

    static var canUseAI: Bool {
        isAvailable && isUserEnabled
    }
}
