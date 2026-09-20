import XCTest
@testable import ExcalidrawZ

final class AutosaveSchedulerTests: XCTestCase {
    private final class Probe: @unchecked Sendable {
        let lock = NSLock()
        var scheduler: ExcalidrawDocumentContentSnapshotScheduler!
        private var count = 0
        func next() -> Int { lock.lock(); defer { lock.unlock() }; count += 1; return count }
        var attempts: Int { lock.lock(); defer { lock.unlock() }; return count }
    }

    private func metadata(_ revision: Int, file: String = "a") -> ExcalidrawCore.StateChangedMetadata {
        var value = ExcalidrawCore.StateChangedMetadata()
        value.revision = revision
        value.contentDirty = true
        value.currentFileId = file
        return value
    }

    func testStateChangeMetadataRoutesViewportAndPersistentAppStateSeparately() {
        var viewport = ExcalidrawCore.StateChangedMetadata()
        viewport.appStateDirty = true
        viewport.persistentAppStateDirty = false
        viewport.viewportDirty = true
        XCTAssertTrue(viewport.hasAnyDirtyChanges)
        XCTAssertTrue(viewport.shouldPersistViewport)
        XCTAssertFalse(viewport.shouldPersistAppStateFields)
        XCTAssertFalse(viewport.shouldPullContentSnapshot)

        var preferences = ExcalidrawCore.StateChangedMetadata()
        preferences.appStateDirty = true
        preferences.persistentAppStateDirty = true
        preferences.viewportDirty = false
        XCTAssertTrue(preferences.shouldPersistAppStateFields)
        XCTAssertFalse(preferences.shouldPersistViewport)
        XCTAssertFalse(preferences.shouldPullContentSnapshot)
    }

    func testLegacyAppStateMetadataPreservesBothPersistencePaths() {
        var legacy = ExcalidrawCore.StateChangedMetadata()
        legacy.appStateDirty = true
        XCTAssertTrue(legacy.shouldPersistAppStateFields)
        XCTAssertTrue(legacy.shouldPersistViewport)
        XCTAssertFalse(legacy.shouldPullContentSnapshot)

        var content = ExcalidrawCore.StateChangedMetadata()
        content.contentDirty = true
        XCTAssertTrue(content.shouldPullContentSnapshot)
        XCTAssertFalse(content.shouldPersistAppStateFields)
        XCTAssertFalse(content.shouldPersistViewport)
    }

    func testContinuousChangesDoNotStarveAutosaveAndIdleDoesNotWrite() async throws {
        let saved = expectation(description: "Saved during continuous edits")
        saved.assertForOverFulfill = false
        let probe = Probe()
        probe.scheduler = ExcalidrawDocumentContentSnapshotScheduler(idleDelay: 0.08, maximumWait: 0.15, minimumRest: 0.01) {
            guard let state = probe.scheduler.takeScheduledCommitState() else { return }
            _ = probe.next()
            probe.scheduler.markCommitted(snapshotRevision: state.expectedRevision, fallbackRevision: nil, generation: state.generation)
            probe.scheduler.completeScheduledCommit()
            saved.fulfill()
        }
        for revision in 1...30 {
            probe.scheduler.recordPendingContentDirtyMetadata(metadata(revision), currentFileID: "a")
            try await Task.sleep(nanoseconds: 10_000_000)
        }
        await fulfillment(of: [saved], timeout: 1)
        XCTAssertGreaterThanOrEqual(probe.attempts, 1)
        XCTAssertLessThan(probe.attempts, 5, "Snapshots must be coalesced, not one per change")
        try await Task.sleep(nanoseconds: 300_000_000)
        let afterSettling = probe.attempts
        try await Task.sleep(nanoseconds: 200_000_000)
        XCTAssertEqual(probe.attempts, afterSettling, "Idle scenes must not poll or write")
        probe.scheduler.reset()
    }

    func testFailedSaveRetriesWithoutAnotherEdit() async {
        let retried = expectation(description: "Retry succeeded")
        let probe = Probe()
        probe.scheduler = ExcalidrawDocumentContentSnapshotScheduler(idleDelay: 0.01, maximumWait: 0.04, minimumRest: 0.01) {
            guard let state = probe.scheduler.takeScheduledCommitState() else { return }
            let attempt = probe.next()
            if attempt == 2 {
                probe.scheduler.markCommitted(snapshotRevision: state.expectedRevision, fallbackRevision: nil, generation: state.generation)
                retried.fulfill()
            }
            probe.scheduler.completeScheduledCommit()
        }
        probe.scheduler.recordPendingContentDirtyMetadata(metadata(1), currentFileID: "a")
        await fulfillment(of: [retried], timeout: 2)
        XCTAssertFalse(probe.scheduler.hasPendingDirtySnapshot())
        probe.scheduler.reset()
    }

    func testOldCompletionCannotClearNewDocumentOrOverlapItsWrite() {
        let scheduler = ExcalidrawDocumentContentSnapshotScheduler(idleDelay: 60, maximumWait: 60) {}
        scheduler.recordPendingContentDirtyMetadata(metadata(20), currentFileID: "a")
        let old = scheduler.takeScheduledCommitState()!
        scheduler.reset()
        scheduler.recordPendingContentDirtyMetadata(metadata(1, file: "b"), currentFileID: "b")
        XCTAssertNil(scheduler.takeScheduledCommitState(), "The old write is still in flight")
        scheduler.markCommitted(snapshotRevision: 20, fallbackRevision: nil, generation: old.generation)
        XCTAssertTrue(scheduler.hasPendingDirtySnapshot())
        scheduler.completeScheduledCommit()
        let next = scheduler.takeScheduledCommitState()!
        XCTAssertEqual(next.expectedFileID, "b")
        XCTAssertEqual(next.expectedRevision, 1)
        scheduler.markCommitted(snapshotRevision: 1, fallbackRevision: nil, generation: next.generation)
        scheduler.completeScheduledCommit()
        scheduler.reset()
    }

    func testEditDuringSaveRemainsDirtyButCameraMetadataDoesNotRepeatContentSave() {
        let scheduler = ExcalidrawDocumentContentSnapshotScheduler(idleDelay: 60, maximumWait: 60) {}
        scheduler.recordPendingContentDirtyMetadata(metadata(1), currentFileID: "a")
        let state = scheduler.takeScheduledCommitState()!
        scheduler.recordPendingContentDirtyMetadata(metadata(2), currentFileID: "a")
        scheduler.markCommitted(snapshotRevision: 1, fallbackRevision: nil, generation: state.generation)
        XCTAssertTrue(scheduler.hasPendingDirtySnapshot())
        scheduler.recordLatestRevision(200) // camera/selection only
        scheduler.markCommitted(snapshotRevision: 2, fallbackRevision: nil, generation: state.generation)
        XCTAssertFalse(scheduler.hasPendingDirtySnapshot())
        scheduler.completeScheduledCommit()
        scheduler.reset()
    }
    func testBoundaryReservesSchedulerUntilItsSnapshotIsPersisted() async throws {
        let scheduler = ExcalidrawDocumentContentSnapshotScheduler(idleDelay: 60, maximumWait: 60) {}
        scheduler.recordPendingContentDirtyMetadata(metadata(1), currentFileID: "a")
        let old = try XCTUnwrap(scheduler.takeScheduledCommitState())
        let acquired = expectation(description: "Boundary waits for earlier autosave")
        let boundary = Task {
            guard await scheduler.beginExclusiveFlush() else { XCTFail("Cancelled"); return }
            XCTAssertNil(scheduler.takeScheduledCommitState(), "No timed save during boundary")
            acquired.fulfill()
            scheduler.markCommitted(snapshotRevision: 2, fallbackRevision: nil, generation: old.generation)
            scheduler.endExclusiveFlush()
        }
        try await Task.sleep(nanoseconds: 30_000_000)
        scheduler.recordPendingContentDirtyMetadata(metadata(2), currentFileID: "a")
        scheduler.markCommitted(snapshotRevision: 1, fallbackRevision: nil, generation: old.generation)
        scheduler.completeScheduledCommit()
        await fulfillment(of: [acquired], timeout: 1)
        await boundary.value
        XCTAssertFalse(scheduler.hasPendingDirtySnapshot())
        scheduler.reset()
    }

    func testWebCleanMetadataCannotEraseFailedNativeSave() throws {
        let scheduler = ExcalidrawDocumentContentSnapshotScheduler(idleDelay: 60, maximumWait: 60) {}
        scheduler.recordPendingContentDirtyMetadata(metadata(1), currentFileID: "a")
        _ = try XCTUnwrap(scheduler.takeScheduledCommitState())
        scheduler.completeScheduledCommit() // Disk write failed: no markCommitted.
        scheduler.markClean(2)
        XCTAssertTrue(scheduler.hasPendingDirtySnapshot(), "Web clean is not disk success")
        scheduler.reset()
    }

}
