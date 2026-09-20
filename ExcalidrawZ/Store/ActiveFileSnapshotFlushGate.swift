//
//  ActiveFileSnapshotFlushGate.swift
//  ExcalidrawZ
//
//  Coalesces overlapping active-file boundary saves for the same document.
//

import Foundation

@MainActor
final class ActiveFileSnapshotFlushGate {
    private struct InFlightFlush {
        let id: UUID
        let fileID: String
        let task: Task<Bool, Never>
    }

    private let onCoalescedFlush: @MainActor @Sendable (String) async -> Void
    private var inFlightFlush: InFlightFlush?

    init(
        onCoalescedFlush: @escaping @MainActor @Sendable (String) async -> Void = { _ in }
    ) {
        self.onCoalescedFlush = onCoalescedFlush
    }

    func run(
        fileID: String,
        operation: @escaping @MainActor @Sendable () async -> Bool
    ) async -> Bool {
        if let inFlightFlush, inFlightFlush.fileID == fileID {
            await onCoalescedFlush(fileID)
            return await inFlightFlush.task.value
        }

        while let previousFlush = inFlightFlush {
            _ = await previousFlush.task.value
            if inFlightFlush?.id == previousFlush.id {
                inFlightFlush = nil
            }
        }

        let id = UUID()
        let task = Task { @MainActor in
            let succeeded = await operation()
            // Clear before publishing completion so a later boundary cannot
            // reuse a snapshot taken before a new edit.
            if self.inFlightFlush?.id == id { self.inFlightFlush = nil }
            return succeeded
        }
        inFlightFlush = InFlightFlush(id: id, fileID: fileID, task: task)

        let succeeded = await task.value
        if inFlightFlush?.id == id {
            inFlightFlush = nil
        }
        return succeeded
    }
}
