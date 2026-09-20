//
//  ExcalidrawDocumentContentSnapshotScheduler.swift
//  ExcalidrawZ
//
//  Tracks content-dirty revisions and schedules full canvas snapshot commits.
//

import Foundation

final class ExcalidrawDocumentContentSnapshotScheduler: @unchecked Sendable {
    struct CommitState {
        let generation: UInt64
        let expectedFileID: String?
        let expectedRevision: Int?
    }

    private let lock = NSLock()
    private let onScheduledCommit: @Sendable () async -> Void

    private var commitTask: Task<Void, Never>?
    private var isCommitInFlight = false
    private var waitingFlushCount = 0
    private var isFlushInFlight = false
    private var latestStateRevision: Int?
    private var pendingRevision: Int?
    private var pendingFileID: String?
    private var hasPendingWithoutRevision = false
    private var generation: UInt64 = 0
    private var firstDirtyAt: TimeInterval?
    private var latestDirtyAt: TimeInterval?
    private var lastCommitFinishedAt: TimeInterval?
    private var lastCommitStartedAt: TimeInterval?
    private var scheduledDeadline: TimeInterval?
    private var retryNotBefore: TimeInterval?
    private let now: @Sendable () -> TimeInterval
    private let idleDelay: TimeInterval
    private let maximumWait: TimeInterval
    private let minimumRest: TimeInterval

    init(
        idleDelay: TimeInterval = 1,
        maximumWait: TimeInterval = 5,
        minimumRest: TimeInterval = 1,
        now: @escaping @Sendable () -> TimeInterval = { ProcessInfo.processInfo.systemUptime },
        onScheduledCommit: @escaping @Sendable () async -> Void
    ) {
        self.idleDelay = idleDelay
        self.maximumWait = maximumWait
        self.minimumRest = minimumRest
        self.now = now
        self.onScheduledCommit = onScheduledCommit
    }

    func reset() {
        lock.lock()
        commitTask?.cancel()
        commitTask = nil
        generation &+= 1
        // An old write must finish before a new document starts another one.
        latestStateRevision = nil
        pendingRevision = nil
        pendingFileID = nil
        hasPendingWithoutRevision = false
        firstDirtyAt = nil
        latestDirtyAt = nil
        scheduledDeadline = nil
        retryNotBefore = nil
        lock.unlock()
    }

    func recordLatestRevision(_ revision: Int?) {
        guard let revision else { return }
        lock.lock()
        latestStateRevision = max(latestStateRevision ?? revision, revision)
        lock.unlock()
    }

    func markClean(_ revision: Int?) {
        lock.lock()
        // Web cleanliness is not an acknowledgment that native storage succeeded.
        // Retain retries until markCommitted or an explicit document reset.
        guard pendingRevision == nil, !hasPendingWithoutRevision else {
            lock.unlock()
            return
        }
        if let revision {
            if let latestStateRevision, revision < latestStateRevision {
                lock.unlock()
                return
            }
            latestStateRevision = revision
        }
        pendingRevision = nil
        pendingFileID = nil
        hasPendingWithoutRevision = false
        firstDirtyAt = nil
        latestDirtyAt = nil
        scheduledDeadline = nil
        commitTask?.cancel()
        commitTask = nil
        lock.unlock()
    }

    func recordPendingContentDirtyMetadata(
        _ metadata: ExcalidrawCore.StateChangedMetadata,
        currentFileID: String?
    ) {
        let expectedFileID = metadata.currentFileId ?? currentFileID
        let expectedRevision = metadata.revision

        lock.lock()
        if let expectedRevision, let pendingRevision, expectedRevision < pendingRevision {
            lock.unlock()
            return
        }
        let timestamp = now()
        if firstDirtyAt == nil { firstDirtyAt = timestamp }
        latestDirtyAt = timestamp
        pendingFileID = expectedFileID
        if let expectedRevision {
            latestStateRevision = max(latestStateRevision ?? expectedRevision, expectedRevision)
            pendingRevision = expectedRevision
            hasPendingWithoutRevision = false
        } else {
            if let latestStateRevision {
                pendingRevision = max(pendingRevision ?? latestStateRevision, latestStateRevision)
            } else {
                hasPendingWithoutRevision = true
            }
        }

        scheduleCommitIfNeededLocked()
        lock.unlock()
    }

    func hasPendingDirtySnapshot() -> Bool {
        lock.lock()
        let hasPending = pendingRevision != nil || hasPendingWithoutRevision
        lock.unlock()
        return hasPending
    }

    func takeScheduledCommitState() -> CommitState? {
        lock.lock()
        let shouldCommit = pendingRevision != nil || hasPendingWithoutRevision
        guard !Task.isCancelled, !isCommitInFlight, !isFlushInFlight, waitingFlushCount == 0 else {
            lock.unlock()
            return nil
        }
        guard shouldCommit else {
            commitTask = nil
            lock.unlock()
            return nil
        }

        let state = CommitState(
            generation: generation,
            expectedFileID: pendingFileID,
            expectedRevision: pendingRevision
        )
        commitTask = nil
        isCommitInFlight = true
        scheduledDeadline = nil
        lastCommitStartedAt = now()
        lock.unlock()
        return state
    }

    func completeScheduledCommit() {
        lock.lock()
        isCommitInFlight = false
        lastCommitFinishedAt = now()
        let hasPendingChanges = pendingRevision != nil || hasPendingWithoutRevision
        if hasPendingChanges {
            // Failures retain dirty state and retry without spinning. This also
            // gives rendering time between expensive snapshots of large scenes.
            retryNotBefore = now() + minimumRest
            scheduleCommitIfNeededLocked()
        }
        lock.unlock()
    }

    func takeFlushState() -> CommitState? {
        lock.lock()
        let shouldFlush = pendingRevision != nil || hasPendingWithoutRevision
        guard shouldFlush else {
            lock.unlock()
            return nil
        }

        let state = CommitState(
            generation: generation,
            expectedFileID: pendingFileID,
            expectedRevision: pendingRevision
        )
        commitTask?.cancel()
        commitTask = nil
        lock.unlock()
        return state
    }

    /// Reserve the scheduler before waiting, so no timed snapshot can start
    /// between an in-flight write finishing and the boundary snapshot starting.
    func beginExclusiveFlush() async -> Bool {
        reserveFlush()
        while !tryBeginReservedFlush() {
            do { try await Task.sleep(nanoseconds: 10_000_000) }
            catch { cancelFlushReservation(); return false }
        }
        return true
    }

    private func reserveFlush() {
        lock.lock()
        waitingFlushCount += 1
        commitTask?.cancel()
        commitTask = nil
        scheduledDeadline = nil
        lock.unlock()
    }

    private func tryBeginReservedFlush() -> Bool {
        lock.lock()
        defer { lock.unlock() }
        guard !isCommitInFlight, !isFlushInFlight else { return false }
        waitingFlushCount -= 1
        isFlushInFlight = true
        return true
    }

    private func cancelFlushReservation() {
        lock.lock()
        waitingFlushCount -= 1
        scheduleCommitIfNeededLocked()
        lock.unlock()
    }

    func endExclusiveFlush() {
        lock.lock()
        isFlushInFlight = false
        scheduleCommitIfNeededLocked()
        lock.unlock()
    }

    func waitForCommitToFinish() async {
        while true {
            guard !commitIsInFlight() else {
                if Task.isCancelled { return }
                try? await Task.sleep(nanoseconds: 50_000_000)
                continue
            }
            return
        }
    }

    func markCommitted(
        snapshotRevision: Int?,
        fallbackRevision: Int?,
        generation expectedGeneration: UInt64? = nil
    ) {
        lock.lock()
        if let expectedGeneration, expectedGeneration != generation {
            lock.unlock()
            return
        }
        let committedRevision = snapshotRevision ?? fallbackRevision
        if let committedRevision,
           let pendingRevision,
           committedRevision < pendingRevision {
            lock.unlock()
            return
        }

        pendingRevision = nil
        pendingFileID = nil
        hasPendingWithoutRevision = false
        firstDirtyAt = nil
        latestDirtyAt = nil
        retryNotBefore = nil
        scheduledDeadline = nil
        commitTask?.cancel()
        commitTask = nil
        if let committedRevision {
            latestStateRevision = max(latestStateRevision ?? committedRevision, committedRevision)
        }
        lock.unlock()
    }

    private func scheduleCommitIfNeededLocked() {
        guard !isCommitInFlight, !isFlushInFlight, waitingFlushCount == 0, let firstDirtyAt, let latestDirtyAt else { return }
        let timestamp = now()
        var deadline = min(latestDirtyAt + idleDelay, firstDirtyAt + maximumWait)
        if let lastCommitStartedAt {
            deadline = max(deadline, lastCommitStartedAt + maximumWait)
        }
        if let lastCommitFinishedAt {
            deadline = max(deadline, lastCommitFinishedAt + minimumRest)
        }
        if let retryNotBefore { deadline = max(deadline, retryNotBefore) }
        // Once the hard deadline is armed, further edits never move it out.
        guard scheduledDeadline != deadline || commitTask == nil else { return }
        commitTask?.cancel()
        scheduledDeadline = deadline
        commitTask = makeCommitTask(delay: UInt64(max(0, deadline - timestamp) * 1_000_000_000))
    }

    private func makeCommitTask(delay: UInt64) -> Task<Void, Never> {
        Task { [onScheduledCommit] in
            do {
                if delay > 0 {
                    try await Task.sleep(nanoseconds: delay)
                }
                try Task.checkCancellation()
                await onScheduledCommit()
            } catch {
                return
            }
        }
    }

    private func commitIsInFlight() -> Bool {
        lock.lock()
        let isInFlight = isCommitInFlight
        lock.unlock()
        return isInFlight
    }
}
