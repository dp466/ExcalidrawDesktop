//
//  NavigationShellTheme.swift
//  ExcalidrawZ
//
//  The navigation shell deliberately uses the editor's solid theme colors.
//  Shared by app-owned navigation, settings, library, and export surfaces.
//

import SwiftUI

enum NavigationShellTheme {
    static func primary(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark ? Color(red: 168 / 255, green: 165 / 255, blue: 1) : Color(red: 105 / 255, green: 101 / 255, blue: 219 / 255)
    }

    static func surface(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark ? Color(red: 35 / 255, green: 35 / 255, blue: 41 / 255) : .white
    }

    static func selection(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark ? Color(red: 79 / 255, green: 77 / 255, blue: 111 / 255) : Color(red: 227 / 255, green: 226 / 255, blue: 254 / 255)
    }

    static func border(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark ? Color(red: 54 / 255, green: 54 / 255, blue: 63 / 255) : Color(red: 235 / 255, green: 235 / 255, blue: 235 / 255)
    }

    static func hover(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark ? Color(red: 55 / 255, green: 51 / 255, blue: 79 / 255) : Color(red: 239 / 255, green: 237 / 255, blue: 255 / 255)
    }
}

/// App-owned controls use an opaque surface rather than the platform's glass bezel.
struct NavigationShellButtonStyle: ButtonStyle {
    var accent = false
    var bordered = false
    var height: CGFloat = 32
    var cornerRadius: CGFloat = 6
    var circular = false

    func makeBody(configuration: Configuration) -> some View {
        NavigationShellButtonBody(configuration: configuration, accent: accent, bordered: bordered, height: height, cornerRadius: cornerRadius, circular: circular)
    }
}

private struct NavigationShellButtonBody: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.isEnabled) private var isEnabled
    @State private var isHovered = false
    let configuration: ButtonStyleConfiguration
    let accent: Bool
    let bordered: Bool
    let height: CGFloat
    let cornerRadius: CGFloat
    let circular: Bool

    var body: some View {
        configuration.label
            .font(.system(size: 13, weight: .medium))
            .padding(.horizontal, circular ? 0 : 10)
            .frame(width: circular ? height : nil, height: height)
            .foregroundStyle(configuration.role == .destructive ? Color.red :
                             (accent || (isEnabled && isHovered) ? NavigationShellTheme.primary(for: colorScheme) : Color.primary))
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(accent ? NavigationShellTheme.selection(for: colorScheme) :
                            (isEnabled && (isHovered || configuration.isPressed) ? NavigationShellTheme.hover(for: colorScheme) : .clear))
            }
            .overlay {
                if bordered {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .strokeBorder(NavigationShellTheme.border(for: colorScheme), lineWidth: 1)
                }
            }
            .opacity(isEnabled ? (configuration.isPressed ? 0.7 : 1) : 0.4)
            .contentShape(RoundedRectangle(cornerRadius: cornerRadius))
            .onHover { isHovered = $0 }
    }
}
