import SwiftUI

private struct FlatFileMenuKey: EnvironmentKey {
    static let defaultValue = false
}
extension EnvironmentValues {
    var flatFileMenu: Bool {
        get { self[FlatFileMenuKey.self] }
        set { self[FlatFileMenuKey.self] = newValue }
    }
}

private struct DismissFlatFileMenuKey: EnvironmentKey {
    static let defaultValue: () -> Void = {}
}
extension EnvironmentValues {
    var dismissFlatFileMenu: () -> Void {
        get { self[DismissFlatFileMenuKey.self] }
        set { self[DismissFlatFileMenuKey.self] = newValue }
    }
}

/// Dismiss at the semantic action boundary too: accessibility can invoke a
/// Button's action directly without passing through its primitive style.
struct FileActionButton<Label: View>: View {
    @Environment(\.dismissFlatFileMenu) private var dismiss
    var role: ButtonRole? = nil
    var action: () -> Void
    @ViewBuilder var label: () -> Label

    var body: some View {
        Button(role: role) {
            dismiss()
            action()
        } label: { label() }
    }
}

/// Existing menu action implementations are reused in both native and flat menus.
struct FileActionSubmenu<Content: View, Label: View>: View {
    @Environment(\.flatFileMenu) private var isFlat
    @State private var isExpanded = false
    @ViewBuilder var content: () -> Content
    @ViewBuilder var label: () -> Label

    var body: some View {
#if os(macOS)
        if isFlat {
            VStack(alignment: .leading, spacing: 2) {
                Button { isExpanded.toggle() } label: {
                    HStack {
                        label()
                        Spacer(minLength: 6)
                        Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                            .font(.system(size: 10))
                            .accessibilityHidden(true)
                    }
                }
                .buttonStyle(FlatFileMenuActionStyle(dismiss: {}))
                .accessibilityValue(isExpanded ? "Expanded" : "Collapsed")
                if isExpanded {
                    VStack(alignment: .leading, spacing: 2) { content() }
                        .padding(.leading, 12)
                }
            }
        } else {
            Menu(content: content, label: label)
        }
#else
        Menu(content: content, label: label)
#endif
    }
}

#if os(macOS)
private struct FlatFileMenuFocusKey: EnvironmentKey {
    static let defaultValue: FocusState<UUID?>.Binding? = nil
}
struct DrawingMenuAnchorKey: PreferenceKey {
    static let defaultValue: Anchor<CGRect>? = nil
    static func reduce(value: inout Anchor<CGRect>?, nextValue: () -> Anchor<CGRect>?) { value = nextValue() ?? value }
}
private struct FlatFileMenuHeightKey: PreferenceKey {
    static let defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) { value = max(value, nextValue()) }
}
private struct FlatFileMenuRowsKey: PreferenceKey {
    static let defaultValue: [UUID] = []
    static func reduce(value: inout [UUID], nextValue: () -> [UUID]) { value += nextValue() }
}
extension EnvironmentValues {
    fileprivate var flatFileMenuFocus: FocusState<UUID?>.Binding? {
        get { self[FlatFileMenuFocusKey.self] }
        set { self[FlatFileMenuFocusKey.self] = newValue }
    }
}

/// Providers remain mounted when closed so rename/confirmation sheets survive
/// dismissal. File mutations continue through their existing handlers.
struct DesktopDrawingMenu: View {
    @EnvironmentObject private var fileState: FileState
    @Binding var isPresented: Bool

    var body: some View {
        if let file = fileState.currentActiveFile {
            switch file {
            case .file(let storedFile):
                FileMenuProvider(file: storedFile, fileState: fileState) { triggers in
                    DesktopDrawingMenuSurface(isPresented: $isPresented) {
                        FileMenuItems(file: storedFile, fileState: fileState,
                                      onToggleRename: triggers.onToggleRename,
                                      onTogglePermanentlyDelete: triggers.onTogglePermanentlyDelete)
                    }
                }
            case .localFile(let url):
                LocalFileMenuProvider(file: url) { triggers in
                    DesktopDrawingMenuSurface(isPresented: $isPresented) {
                        LocalFileRowMenuItems(file: url, onToggleRename: triggers.onToggleRename)
                    }
                }
            case .temporaryFile(let url):
                DesktopDrawingMenuSurface(isPresented: $isPresented) {
                    TemporaryFileMenuItems(file: url)
                }
            case .collaborationFile(let room):
                CollaborationFileMenuProvider(file: room) { triggers in
                    DesktopDrawingMenuSurface(isPresented: $isPresented) {
                        CollaborationFileMenuItems(file: room, onArchiveFile: triggers.onArchiveFile,
                                                   onDelete: triggers.onToggleDelete)
                    }
                }
            case .cloudStorageFile(let reference):
                Color.clear.frame(width: 0, height: 0)
                    .modifier(CloudStorageFileActionsModifier(reference: reference,
                                                             presentation: .flatMenu($isPresented)))
            }
        }
    }
}

struct DesktopDrawingMenuSurface<Content: View>: View {
    @Environment(\.colorScheme) private var colorScheme
    @Binding var isPresented: Bool
    @ViewBuilder var content: () -> Content
    @FocusState private var focusedRow: UUID?
    @State private var rows: [UUID] = []
    @State private var contentHeight: CGFloat = 220

    var body: some View {
        ZStack(alignment: .topLeading) {
            // The action providers attach sheets to this surface. Keep a real
            // presentation host even after the visible menu is dismissed.
            Color.clear.frame(width: 1, height: 1)
                .allowsHitTesting(false).accessibilityHidden(true)
            if isPresented {
            ScrollView {
                VStack(alignment: .leading, spacing: 2) { content() }
                    .padding(6)
                    .background(GeometryReader { geometry in
                        Color.clear.preference(key: FlatFileMenuHeightKey.self, value: geometry.size.height)
                    })
                    .buttonStyle(FlatFileMenuActionStyle(dismiss: { isPresented = false }))
                    .labelStyle(.titleAndIcon)
                    .environment(\.flatFileMenu, true)
                    .environment(\.dismissFlatFileMenu, { isPresented = false })
                    .environment(\.flatFileMenuFocus, $focusedRow)
                    .onPreferenceChange(FlatFileMenuRowsKey.self) { ids in
                        rows = ids
                        if focusedRow == nil || !ids.contains(focusedRow!) { focusedRow = ids.first }
                    }
            }
            .frame(width: 260, height: min(contentHeight, 360), alignment: .top)
            .onPreferenceChange(FlatFileMenuHeightKey.self) { contentHeight = $0 }
            .background(NavigationShellTheme.surface(for: colorScheme), in: RoundedRectangle(cornerRadius: 8))
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(NavigationShellTheme.border(for: colorScheme), lineWidth: 1)
                    .allowsHitTesting(false)
            }
            .onMoveCommand { direction in
                guard !rows.isEmpty, direction == .up || direction == .down else { return }
                let index = rows.firstIndex(of: focusedRow ?? rows[0]) ?? 0
                focusedRow = rows[(index + (direction == .down ? 1 : rows.count - 1)) % rows.count]
            }
        }
        }
    }
}

private struct FlatFileMenuActionStyle: PrimitiveButtonStyle {
    let dismiss: () -> Void
    func makeBody(configuration: Configuration) -> some View {
        FlatFileMenuAction(dismiss: dismiss, configuration: configuration)
    }
}

private struct FlatFileMenuAction: View {
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.colorScheme) private var colorScheme
    @State private var isHovered = false
    let dismiss: () -> Void
    @Environment(\.flatFileMenuFocus) private var focusedRow
    @State private var id = UUID()
    let configuration: PrimitiveButtonStyleConfiguration

    private func activate() {
        guard isEnabled else { return }
        dismiss()
        configuration.trigger()
    }

    var body: some View {
        SwiftUI.Group {
            if let focusedRow {
                button.focusable().focused(focusedRow, equals: id)
                    .modifier(FlatFileMenuKeyboardActivation(
                        isFocused: focusedRow.wrappedValue == id, action: activate
                    ))
            } else { button }
        }
        .preference(key: FlatFileMenuRowsKey.self, value: isEnabled ? [id] : [])
    }

    private var button: some View {
        configuration.label
            .font(.system(size: 13, weight: .medium))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 10)
            .frame(height: 32)
            .foregroundStyle(configuration.role == .destructive ? Color.red
                             : (isHovered ? NavigationShellTheme.primary(for: colorScheme) : Color.primary))
            .background {
                RoundedRectangle(cornerRadius: 6)
                    .fill(isHovered || focusedRow?.wrappedValue == id
                          ? NavigationShellTheme.hover(for: colorScheme) : .clear)
            }
            .opacity(isEnabled ? 1 : 0.4)
            .contentShape(Rectangle())
            .onHover { isHovered = $0 }
            .onTapGesture(perform: activate)
            .accessibilityRepresentation {
                Button(role: configuration.role, action: activate) { configuration.label }
                    .disabled(!isEnabled)
            }
    }
}
private struct FlatFileMenuKeyboardActivation: ViewModifier {
    let isFocused: Bool
    let action: () -> Void

    @ViewBuilder func body(content: Content) -> some View {
        if #available(macOS 14.0, *) {
            content
                .onKeyPress(.return) {
                    guard isFocused else { return .ignored }
                    action()
                    return .handled
                }
                .onKeyPress(.space) {
                    guard isFocused else { return .ignored }
                    action()
                    return .handled
                }
        } else {
            content.background {
                if isFocused {
                    Button("Activate menu item", action: action)
                        .keyboardShortcut(.return, modifiers: [])
                        .hidden().frame(width: 0, height: 0)
                    Button("Activate menu item", action: action)
                        .keyboardShortcut(.space, modifiers: [])
                        .hidden().frame(width: 0, height: 0)
                }
            }
        }
    }
}

#endif
