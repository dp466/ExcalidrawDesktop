import SwiftUI
import ChocofordUI

/// App-wide automation status alongside the existing document sync indicator.
struct MCPActivityIndicator: View {
    @ObservedObject private var controller = ExcalidrawZMCPServerController.shared

    var body: some View {
#if os(macOS)
        if controller.isEnabled {
            Button {} label: {
                HStack(spacing: 6) {
                    if controller.activeRequests > 0 || controller.state == .starting || controller.state == .stopping {
                        ProgressView().controlSize(.small)
                    } else {
                        Image(systemName: isFailed ? "exclamationmark.circle" : "point.3.connected.trianglepath.dotted")
                            .font(.system(size: 14, weight: .medium))
                    }
                    Text(headline)
                        .font(.caption.weight(.medium))
                        .lineLimit(1)
                }
                .frame(height: 24)
                .padding(.horizontal, 7)
            }
            .editorChromeButtonStyle(style: .glass, size: .large, shape: .capsule)
            .foregroundStyle(isFailed ? Color.orange : Color.secondary)
            .allowsHitTesting(false)
            .help(detail)
            .accessibilityLabel(detail)
            .animation(.easeInOut(duration: 0.2), value: controller.state)
        }
#endif
    }

    private var isFailed: Bool {
        if case .failed = controller.state { return true }
        return false
    }
    private var headline: String {
        if controller.activeRequests > 0 { return controller.activeRequests == 1 ? "MCP active" : "MCP · \(controller.activeRequests) active" }
        switch controller.state {
            case .off: return "MCP off"
            case .starting: return "MCP starting"
            case .running: return "MCP ready"
            case .stopping: return "MCP stopping"
            case .failed: return "MCP error"
        }
    }
    private var detail: String {
        if controller.activeRequests > 0 {
            return "MCP: \(controller.activeRequests) active command(s) in ExcalidrawDesktop. \(controller.activeTool ?? "Diagram command")"
        }
        if case .failed(let message) = controller.state { return "MCP connection failed: \(message)" }
        return headline
    }
}
