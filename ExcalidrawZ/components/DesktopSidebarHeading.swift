#if os(macOS)
import SwiftUI

struct DesktopSidebarHeading: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.searchExcalidrawAction) private var searchDrawings
    @EnvironmentObject private var fileState: FileState

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 6) {
                Image("ExcalidrawLogoMark")
                    .resizable().scaledToFit().frame(width: 20, height: 20)
                    .foregroundStyle(NavigationShellTheme.primary(for: colorScheme))
                Image("ExcalidrawWordmark")
                    .resizable().scaledToFit().frame(width: 130, height: 18)
                Text("Desktop").font(.system(size: 10)).foregroundStyle(.secondary)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Excalidraw Desktop")
            .padding(.horizontal, 16)
            .frame(height: 52)
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(alignment: .bottom) {
                Rectangle().fill(NavigationShellTheme.border(for: colorScheme)).frame(height: 1)
            }
            VStack(spacing: 9) {
                Button {
                    NotificationCenter.default.post(name: .shouldHandleNewDraw, object: fileState)
                } label: {
                    Label("New drawing", systemImage: "plus")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .buttonStyle(NavigationShellButtonStyle(accent: true, bordered: true))
                .disabled(!fileState.canCreateDesktopDrawing)
                Button { searchDrawings() } label: {
                    HStack(spacing: 8) {
                        Image(systemName: "magnifyingglass")
                        Text("Find a drawing…")
                        Spacer(minLength: 0)
                        Text("⇧ ⌘ F").font(.system(size: 10))
                    }
                    .foregroundStyle(.secondary)
                }
                .buttonStyle(NavigationShellButtonStyle(bordered: true))
            }
            .padding(.horizontal, 12)
            .padding(.top, 14)
            .padding(.bottom, 6)
        }
    }
}

/// Shares the existing Home snapshot; opening the sidebar must not start another
/// recursive folder scan or thumbnail generation pass.
final class DesktopRecentDrawingsSnapshot: ObservableObject {
    @Published var files: [FileState.ActiveFile] = []

    func recordVisit(_ file: FileState.ActiveFile) {
        files = [file] + files.filter { $0.id != file.id }.prefix(19)
    }
}

private struct DesktopRecentDrawingsKey: EnvironmentKey {
    static let defaultValue: DesktopRecentDrawingsSnapshot? = nil
}

extension EnvironmentValues {
    var desktopRecentDrawings: DesktopRecentDrawingsSnapshot? {
        get { self[DesktopRecentDrawingsKey.self] }
        set { self[DesktopRecentDrawingsKey.self] = newValue }
    }
}

struct DesktopRecentDrawings: View {
    @EnvironmentObject private var fileState: FileState
    @Environment(\.desktopRecentDrawings) private var snapshot
    @State private var isExpanded = false

    var body: some View {
        VStack(spacing: 0) {
            Button { isExpanded.toggle() } label: {
                HStack {
                    Image(systemName: "clock").frame(width: 30, alignment: .leading)
                    Text("Recent drawings")
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                        .font(.system(size: 9))
                }
            }
            .buttonStyle(.excalidrawSidebarRow(isSelected: false, isMultiSelected: false))
            .accessibilityValue(isExpanded ? "Expanded" : "Collapsed")
            if isExpanded {
                if let snapshot {
                    DesktopRecentDrawingRows(snapshot: snapshot)
                }
            }
        }
    }
}

private struct DesktopRecentDrawingRows: View {
    @EnvironmentObject private var fileState: FileState
    @ObservedObject var snapshot: DesktopRecentDrawingsSnapshot

    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(snapshot.files.prefix(8))) { file in
                Button { fileState.setActiveFile(file) } label: {
                    Label(file.name ?? "Untitled", systemImage: "doc")
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .buttonStyle(.excalidrawSidebarRow(
                    isSelected: fileState.currentActiveFile == file,
                    isMultiSelected: false
                ))
                .help(file.name ?? "Untitled")
            }
            if snapshot.files.isEmpty {
                Text("No recent drawings").font(.caption).foregroundStyle(.secondary).padding(8)
            }
        }
        .padding(.leading, 16)
    }
}
#endif
