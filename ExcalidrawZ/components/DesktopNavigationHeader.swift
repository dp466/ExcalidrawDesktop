#if os(macOS)
import SwiftUI
import AppKit
import ChocofordUI

/// Fixed-height chrome extending into the titlebar. It never contributes NSToolbar
/// preferences, so opening documents cannot resize the titlebar or split columns.
struct DesktopNavigationHeader<Actions: View, DocumentMenu: View>: View {
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var fileState: FileState
    @EnvironmentObject private var layoutState: LayoutState
    @Binding var isMenuPresented: Bool
    @FocusState private var isMenuButtonFocused: Bool
    @ViewBuilder var actions: () -> Actions
    @ViewBuilder var documentMenu: () -> DocumentMenu

    private var groupTitle: String {
        switch fileState.currentActiveGroup {
        case .group(let group): return group.name ?? "Files"
        case .localFolder(let folder): return folder.url?.lastPathComponent ?? "Local files"
        case .cloudStorageFolder: return "Linked files"
        case .temporary: return "Temporary files"
        case .collaboration: return "Collaboration"
        case nil: return "Home"
        }
    }

    var body: some View {
        HStack(spacing: 6) {
            if !layoutState.isSidebarPresented {
                // Leave the standard window controls accessible when this column
                // starts at the window's leading edge.
                Color.clear.frame(width: 80)
            }
            Button { layoutState.isSidebarPresented.toggle() } label: {
                Label("Toggle sidebar", systemImage: "sidebar.left")
            }
            .help("Toggle sidebar")
            Button { isMenuPresented.toggle() } label: {
                Label("App menu", systemImage: "line.3.horizontal")
            }
            .help("App menu")
            .focusable()
            .focused($isMenuButtonFocused)
            .modifier(DesktopMenuKeyboardActivation(isFocused: isMenuButtonFocused) {
                isMenuPresented.toggle()
            })
            .accessibilityValue(isMenuPresented ? "Expanded" : "Collapsed")
            Rectangle().fill(NavigationShellTheme.border(for: colorScheme))
                .frame(width: 1, height: 20).padding(.horizontal, 4)
            if fileState.currentActiveFile != nil || fileState.currentActiveGroup != nil {
                NavigationBackButton().help("Back to files")
            }
            Text(fileState.currentActiveFile?.name ?? groupTitle)
                .font(.system(size: 14, weight: .semibold))
                .lineLimit(1)
                .truncationMode(.middle)
                .frame(minWidth: 40, maxWidth: .infinity, alignment: .leading)
                .layoutPriority(-1)
                .background(DesktopHeaderDragRegion())
            if fileState.currentActiveFile != nil {
                if case .collaborationFile = fileState.currentActiveFile {
                    CollaborationMembersPopoverButton()
                }
                documentMenu()
                DesktopAutosaveStatus()
                    .frame(maxWidth: 150)
                Button { layoutState.toggleInspector(.presentation) } label: {
                    Label("Present", systemImage: "play")
                }
                .help("Present drawing frames")
                .disabled(fileState.activeCollaborationFileIsLoading)
            }
            actions()
                .fixedSize(horizontal: true, vertical: false)
        }
        .onChange(of: isMenuPresented) { visible in
            if !visible { isMenuButtonFocused = true }
        }
        .labelStyle(.iconOnly)
        .buttonStyle(NavigationShellButtonStyle())
        .padding(.horizontal, 10)
        .frame(height: 52)
        .background(NavigationShellTheme.surface(for: colorScheme))
        .background(DesktopHeaderDragRegion())
        .overlay(alignment: .bottom) {
            Rectangle().fill(NavigationShellTheme.border(for: colorScheme)).frame(height: 1)
        }
    }
}

/// A background-only drag target; buttons above it retain their own hit testing.
/// AppKit keeps dragging available on macOS 13 and 14 as well as newer systems.
private struct DesktopHeaderDragRegion: NSViewRepresentable {
    final class DragView: NSView {
        override func mouseDown(with event: NSEvent) {
            window?.performDrag(with: event)
        }
        override func acceptsFirstMouse(for event: NSEvent?) -> Bool { true }
    }
    func makeNSView(context: Context) -> DragView { DragView() }
    func updateNSView(_ view: DragView, context: Context) {}
}

struct DesktopAutosaveStatus: View {
    @EnvironmentObject private var fileState: FileState

    private var matchesFile: Bool { fileState.autosaveFileID == fileState.currentActiveFile?.id }
    private var text: String {
        guard matchesFile else { return "Autosave on" }
        switch fileState.autosaveStatus {
        case .idle: return "Autosave on"
        case .saving: return "Saving…"
        case .saved: return "Saved"
        case .savedWithRecoveryWarning: return "Recovery unavailable"
        case .failed: return "Save failed — retrying"
        }
    }
    private var help: String {
        guard matchesFile else { return "Saves after a short pause, or about every five seconds while drawing." }
        switch fileState.autosaveStatus {
        case .saved(let date): return "Last saved: \(date.formatted(date: .omitted, time: .standard))"
        case .savedWithRecoveryWarning(let date, let message):
            return "Project saved at \(date.formatted(date: .omitted, time: .standard)). Extra recovery copy failed: \(message)"
        case .failed(let message): return message
        default: return "Saves run in the background. Large drawings or slow storage can take longer."
        }
    }
    private var warning: Bool {
        guard matchesFile else { return false }
        switch fileState.autosaveStatus {
        case .failed, .savedWithRecoveryWarning: return true
        default: return false
        }
    }
    var body: some View {
        Label(text, systemImage: warning ? "exclamationmark.triangle" : "checkmark")
            .labelStyle(.titleAndIcon)
            .font(.system(size: 11))
            .foregroundStyle(warning ? Color.orange : Color.secondary)
            .lineLimit(1)
            .help(help)
            .accessibilityLabel(text + ". " + help)
            .padding(.horizontal, 6)
    }
}
#endif
