//
//  LocalFolderProvider.swift
//  ExcalidrawZ
//
//  Created by Chocoford on 12/22/25.
//

import SwiftUI
import CoreData

import ChocofordUI

struct LocalFoldersProvider<Content: View>: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.alertToast) private var alertToast
    @Environment(\.scenePhase) private var scenePhase

    @EnvironmentObject private var fileState: FileState

    var content: (FetchedResults<LocalFolder>) -> Content
    init(
        @ViewBuilder content: @escaping (FetchedResults<LocalFolder>) -> Content
    ) {
        self.content = content
    }

    @FetchRequest(
        sortDescriptors: [
            SortDescriptor(\.rank, order: .forward),
            SortDescriptor(\.importedAt, order: .forward),
        ],
        predicate: NSPredicate(format: "parent == nil")
    )
    var folders: FetchedResults<LocalFolder>

    @EnvironmentObject private var localFolderState: LocalFolderState

#if canImport(AppKit)
    typealias PlatformWindow = NSWindow
#elseif canImport(UIKit)
    typealias PlatformWindow = UIWindow
#endif

    @State private var window: PlatformWindow?
    @State private var folderUrlBeforeResignKey: URL?
    @State private var refreshGeneration = 0
    @State private var refreshTask: Task<Void, Never>?

    
    var body: some View {
        content(folders)
            .bindAppWindow($window)
    #if os(macOS)
            .onReceive(
                NotificationCenter.default.publisher(for: NSWindow.didBecomeKeyNotification)
            ) { notification in
                if let window = notification.object as? NSWindow,
                   window == self.window {
                    scheduleFoldersRefresh()
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: NSWindow.didResignKeyNotification)) { notification in
                if let window = notification.object as? NSWindow,
                   window == self.window {
                    if case .localFolder(let localFolder) = fileState.currentActiveGroup {
                        self.folderUrlBeforeResignKey = localFolder.url
                    }
                }
            }
#elseif os(iOS)
            .watch(value: scenePhase) { newValue in
                if newValue == .active {
                    scheduleFoldersRefresh()
                }
            }
#endif
            .onDisappear {
                refreshTask?.cancel()
            }
    }

    private func scheduleFoldersRefresh() {
        refreshGeneration &+= 1
        let generation = refreshGeneration
        let folderIDs = folders.map(\.objectID)
        let previousURL = folderUrlBeforeResignKey

        refreshTask?.cancel()
        refreshTask = Task { @MainActor in
            do {
                try await Task.sleep(nanoseconds: 100_000_000)
                let rebasedURL = try await Self.refreshFoldersContent(
                    folderIDs: folderIDs,
                    previousURL: previousURL
                )
                try Task.checkCancellation()
                guard generation == refreshGeneration else { return }
                folderUrlBeforeResignKey = rebasedURL
                try redirectToCurrentFolder()
                folderUrlBeforeResignKey = nil
            } catch is CancellationError {
                return
            } catch {
                guard generation == refreshGeneration else { return }
                alertToast(error)
            }
        }
    }

    private static func refreshFoldersContent(
        folderIDs: [NSManagedObjectID],
        previousURL: URL?
    ) async throws -> URL? {
        let context = PersistenceController.shared.newTaskContext()
        return try await context.perform {
            var rebasedURL = previousURL
            for folderID in folderIDs {
                try Task.checkCancellation()
                guard let folder = try context.existingObject(with: folderID) as? LocalFolder else {
                    continue
                }
                if let change = try folder.refreshResolvedLocation(context: context),
                   let currentURL = rebasedURL {
                    rebasedURL = currentURL.rebased(
                        from: change.oldURL,
                        to: change.newURL
                    ) ?? currentURL
                }
                // Refresh one level per root on activation. Expanded rows load
                // their own immediate children, so a focus event does not need
                // to walk an arbitrarily deep directory tree.
                try folder.refreshChildren(context: context, recursively: false)
            }
            return rebasedURL
        }
    }

    private func redirectToCurrentFolder() throws {
        guard fileState.currentActiveGroup == nil, let folderUrlBeforeResignKey else { return }
        let context = viewContext
        let fetchRequest = NSFetchRequest<LocalFolder>(entityName: "LocalFolder")
        let allFolders = try context.fetch(fetchRequest)

        if let folder = allFolders.first(where: {$0.url == folderUrlBeforeResignKey}) {
            fileState.currentActiveGroup = .localFolder(folder)
        }
    }
}

// MARK: - Notification Names
extension Notification.Name {
    static let iCloudFileStatusDidChange = Notification.Name("iCloudFileStatusDidChange")
    static let iCloudFileDidStartDownloading = Notification.Name("iCloudFileDidStartDownloading")
    static let iCloudFileDidFinishDownloading = Notification.Name("iCloudFileDidFinishDownloading")
}
