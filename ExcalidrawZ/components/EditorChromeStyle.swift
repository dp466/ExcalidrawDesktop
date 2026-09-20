import SwiftUI
import ChocofordUI

/// One opaque palette for app-owned chrome; iOS retains its platform materials.
func editorChromeSurface(material: Material = .regular) -> AnyShapeStyle {
#if os(macOS)
    AnyShapeStyle(Color("EditorChromeSurface"))
#else
    AnyShapeStyle(material)
#endif
}

extension View {
    @ViewBuilder
    func editorChromeButtonStyle(
        style: ModernButtonStyleModifier.Style? = nil,
        size: ModernButtonStyleModifier.Size? = nil,
        shape: ModernButtonStyleModifier.BorderShape? = nil
    ) -> some View {
#if os(macOS)
        switch style {
        case .glass, .bordered:
            buttonStyle(editorChromeFlatButtonStyle(size: size, shape: shape))
        case .glassProminent, .borderedProminent:
            buttonStyle(editorChromeFlatButtonStyle(accent: true, size: size, shape: shape))
        default:
            modernButtonStyle(style: style, size: size, shape: shape)
        }
#else
        modernButtonStyle(style: style, size: size, shape: shape)
#endif
    }

    @available(macOS 26.0, iOS 26.0, *)
    @ViewBuilder
    func editorChromeGlassEffect<S: Shape>(_ glass: Glass = .regular, in shape: S) -> some View {
#if os(macOS)
        modifier(EditorChromeSurfaceModifier(shape: shape))
#else
        glassEffect(glass, in: shape)
#endif
    }
}

private struct EditorChromeSurfaceModifier<S: Shape>: ViewModifier {
    let shape: S
    @Environment(\.colorScheme) private var colorScheme

    func body(content: Content) -> some View {
        content
            .background(NavigationShellTheme.surface(for: colorScheme), in: shape)
            .overlay {
                shape
                    .stroke(NavigationShellTheme.border(for: colorScheme), lineWidth: 1)
                    .allowsHitTesting(false)
            }
    }
}

private func editorChromeControlHeight(_ size: ModernButtonStyleModifier.Size?) -> CGFloat {
    switch size {
    case .small: 24
    case .large: 36
    case .extraLarge: 40
    default: 32
    }
}

private func editorChromeFlatButtonStyle(
    accent: Bool = false,
    size: ModernButtonStyleModifier.Size?,
    shape: ModernButtonStyleModifier.BorderShape?
) -> NavigationShellButtonStyle {
    let height = editorChromeControlHeight(size)
    let radius: CGFloat
    let circular: Bool
    switch shape {
    case .circle, .modernCircle:
        radius = height / 2
        circular = true
    case .capsule, .modern:
        radius = height / 2
        circular = false
    case .roundedRectangle(let requestedRadius):
        radius = requestedRadius ?? 6
        circular = false
    case nil:
        radius = 6
        circular = false
    }
    return NavigationShellButtonStyle(accent: accent, bordered: true, height: height,
                                      cornerRadius: radius, circular: circular)
}
