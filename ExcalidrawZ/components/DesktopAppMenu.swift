#if os(macOS)
import SwiftUI
import ChocofordUI

/// A persistent menu host keeps file-picker presentation alive after the menu closes.
struct DesktopAppMenu: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.searchExcalidrawAction) private var searchDrawings
    @EnvironmentObject private var fileState: FileState
    @EnvironmentObject private var layoutState: LayoutState
    @EnvironmentObject private var appPreference: AppPreference
    @EnvironmentObject private var lockedContentState: LockedContentStateStore
    @Binding var isPresented: Bool
    @State private var isLinkFolderPresented = false
    @FocusState private var focusedItem: String?

    var body: some View {
        SwiftUI.Group {
            if isPresented { menuContent }
        }
        .modifier(ImportLocalFolderModifier(isPresented: $isLinkFolderPresented))
        .onChange(of: isPresented) { visible in
            focusedItem = visible ? enabledItems.first : nil
        }
    }

    private var menuContent: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("DRAWING").font(.system(size: 10, weight: .semibold))
                .foregroundStyle(.secondary).padding(8)
            row("New drawing", icon: "plus", shortcut: "⌘ N") {
                NotificationCenter.default.post(name: .shouldHandleNewDraw, object: fileState)
            }
            .disabled(!fileState.canCreateDesktopDrawing)

            row("Open / import…", icon: "square.and.arrow.down") { importFiles() }
            row("Export drawing…", icon: "square.and.arrow.up", shortcut: "⇧ ⌘ S") {
                NotificationCenter.default.post(name: .toggleShare, object: nil)
            }
            .disabled(fileState.currentActiveFile == nil || fileState.currentActiveFileIsInTrash ||
                      fileState.activeCollaborationFileIsLoading || lockedContentState.activeFileLockState == .locked)
            Divider().padding(.vertical, 4)
            row("Find a drawing…", icon: "magnifyingglass", shortcut: "⇧ ⌘ F") { searchDrawings() }
            row("Link a local folder…", icon: "link") { isLinkFolderPresented = true }
            row("Find in drawing", icon: "text.magnifyingglass", shortcut: "⌘ F") { layoutState.toggleInspector(.search) }
                .disabled(fileState.currentActiveFile == nil)
            row("File history", icon: "clock.arrow.circlepath") { layoutState.toggleInspector(.history) }
                .disabled(fileState.currentActiveFile == nil)
            row("Shape library", icon: "book") { layoutState.toggleInspector(.library) }
            row("Canvas preferences", icon: "slider.horizontal.3") { layoutState.toggleInspector(.preference) }
                .disabled(fileState.currentActiveFile == nil)
            if AIChatAvailability.isAvailable {
                row("AI Chat", icon: "sparkles") { layoutState.toggleInspector(.aiChat) }
                    .disabled(fileState.currentActiveFile == nil)
            }
            row("Collaboration rooms", icon: "person.3") {
                fileState.setActiveFile(nil)
                fileState.setActiveGroupIfNeeded(.collaboration)
            }
            Divider().padding(.vertical, 4)
            row(colorScheme == .dark ? "Switch to light theme" : "Switch to dark theme", icon: "circle.lefthalf.filled") {
                let appearance: AppPreference.Appearance = colorScheme == .dark ? .light : .dark
                appPreference.appearance = appearance
                appPreference.excalidrawAppearance = appearance
            }
            if #available(macOS 14.0, *) {
                DesktopSettingsMenuRow(isPresented: $isPresented, focusedItem: $focusedItem) {
                    menuLabel("Settings…", icon: "gearshape", shortcut: "⌘ ,")
                }
            } else {
                SettingsViewButton()
            }
        }
        .buttonStyle(NavigationShellButtonStyle())
        .onAppear { focusedItem = enabledItems.first }
        .onMoveCommand { direction in
            guard direction == .up || direction == .down, !enabledItems.isEmpty else { return }
            let items = enabledItems
            let index = items.firstIndex(of: focusedItem ?? "") ?? 0
            focusedItem = items[(index + (direction == .down ? 1 : items.count - 1)) % items.count]
        }
        .padding(6)
        .frame(width: 266)
        .background(NavigationShellTheme.surface(for: colorScheme), in: RoundedRectangle(cornerRadius: 8))
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(NavigationShellTheme.border(for: colorScheme), lineWidth: 1)
        }
        .shadow(color: .black.opacity(0.12), radius: 12, y: 5)

    }

    private var enabledItems: [String] {
        var items: [String] = []
        if fileState.canCreateDesktopDrawing { items.append("New drawing") }
        items.append("Open / import…")
        if fileState.currentActiveFile != nil && !fileState.currentActiveFileIsInTrash &&
            !fileState.activeCollaborationFileIsLoading && lockedContentState.activeFileLockState != .locked {
            items.append("Export drawing…")
        }
        items += ["Find a drawing…", "Link a local folder…"]
        if fileState.currentActiveFile != nil { items += ["Find in drawing", "File history"] }
        items.append("Shape library")
        if fileState.currentActiveFile != nil { items.append("Canvas preferences") }
        if AIChatAvailability.isAvailable && fileState.currentActiveFile != nil { items.append("AI Chat") }
        items += ["Collaboration rooms", colorScheme == .dark ? "Switch to light theme" : "Switch to dark theme", "Settings…"]
        return items
    }

    private func row(_ title: String, icon: String, shortcut: String? = nil, action: @escaping () -> Void) -> some View {
        Button {
            isPresented = false
            action()
        } label: {
            menuLabel(title, icon: icon, shortcut: shortcut)
        }
        .focusable()
        .focused($focusedItem, equals: title)
        .modifier(DesktopMenuKeyboardActivation(isFocused: focusedItem == title) {
            isPresented = false
            action()
        })
    }

    private func menuLabel(_ title: String, icon: String, shortcut: String?) -> some View {
        HStack(spacing: 10) {
            Image(systemName: icon).frame(width: 17)
            Text(title)
            Spacer(minLength: 6)
            if let shortcut { Text(shortcut).font(.system(size: 11)).foregroundStyle(.secondary) }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func importFiles() {
        // Route to the document window captured before the modal panel becomes key.
        guard let target = NSApp.keyWindow ?? NSApp.mainWindow else { return }
        let panel = ExcalidrawOpenPanel.importPanel
        if panel.runModal() == .OK {
            NotificationCenter.default.post(name: .shouldHandleImport, object: panel.urls,
                                            userInfo: ["targetWindowNumber": target.windowNumber])
        }
    }
}

/// Explicit activation also works when macOS keyboard navigation is disabled.
struct DesktopMenuKeyboardActivation: ViewModifier {
    let isFocused: Bool
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .keyboardShortcut(isFocused ? KeyboardShortcut(.return, modifiers: []) : nil)
            .background {
                if isFocused {
                    Button("Activate focused menu item", action: action)
                        .keyboardShortcut(.space, modifiers: [])
                        .hidden().frame(width: 0, height: 0)
                }
            }
    }
}

@available(macOS 14.0, *)
private struct DesktopSettingsMenuRow<Label: View>: View {
    @Environment(\.openSettings) private var openSettings
    @Binding var isPresented: Bool
    var focusedItem: FocusState<String?>.Binding
    @ViewBuilder var label: () -> Label

    private func activate() {
        isPresented = false
        openSettings()
    }

    var body: some View {
        Button(action: activate, label: label)
            .focusable()
            .focused(focusedItem, equals: "Settings…")
            .modifier(DesktopMenuKeyboardActivation(isFocused: focusedItem.wrappedValue == "Settings…", action: activate))
    }
}

extension FileState {
    @MainActor var canCreateDesktopDrawing: Bool {
        if isInCollaborationSpace || currentActiveGroup == .temporary { return false }
        if case .group(let group) = currentActiveGroup, group.groupType == .trash { return false }
        if case .cloudStorageFolder(let folder) = currentActiveGroup {
            return CloudStorageDocumentStore.shared.capabilities(for: folder).contains(.createChildren)
        }
        return true
    }
}
#endif
