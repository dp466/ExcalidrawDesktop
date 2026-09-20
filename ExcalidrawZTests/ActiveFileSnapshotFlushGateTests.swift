import Testing
@testable import ExcalidrawZ

private actor AsyncLatch {
    private var isOpen = false
    private var waiters: [CheckedContinuation<Void, Never>] = []

    func wait() async {
        guard !isOpen else { return }
        await withCheckedContinuation { continuation in
            waiters.append(continuation)
        }
    }

    func open() {
        guard !isOpen else { return }
        isOpen = true
        let waiters = waiters
        self.waiters.removeAll()
        waiters.forEach { $0.resume() }
    }
}

@MainActor
struct ActiveFileSnapshotFlushGateTests {
    @Test
    func overlappingFlushesForSameFileShareOneOperation() async {
        let operationStarted = AsyncLatch()
        let coalesced = AsyncLatch()
        let releaseOperation = AsyncLatch()
        let gate = ActiveFileSnapshotFlushGate(onCoalescedFlush: { _ in
            await coalesced.open()
        })
        var operationCount = 0

        let first = Task { @MainActor in
            await gate.run(fileID: "file-a") {
                operationCount += 1
                await operationStarted.open()
                await releaseOperation.wait()
                return true
            }
        }
        await operationStarted.wait()

        let second = Task { @MainActor in
            await gate.run(fileID: "file-a") {
                operationCount += 1
                return true
            }
        }
        await coalesced.wait()

        #expect(operationCount == 1)
        await releaseOperation.open()
        #expect(await first.value)
        #expect(await second.value)
        #expect(operationCount == 1)
    }

    @Test
    func completedSaveDoesNotSatisfyALaterBoundary() async {
        let gate = ActiveFileSnapshotFlushGate()
        var count = 0
        #expect(await gate.run(fileID: "file-a") { count += 1; return true })
        #expect(await gate.run(fileID: "file-a") { count += 1; return true })
        #expect(count == 2)
    }

    @Test
    func sharedFailureReachesEveryWaitingSwitch() async {
        let operationStarted = AsyncLatch()
        let coalesced = AsyncLatch()
        let releaseOperation = AsyncLatch()
        let gate = ActiveFileSnapshotFlushGate(onCoalescedFlush: { _ in
            await coalesced.open()
        })
        var operationCount = 0

        let first = Task { @MainActor in
            await gate.run(fileID: "file-a") {
                operationCount += 1
                await operationStarted.open()
                await releaseOperation.wait()
                return false
            }
        }
        await operationStarted.wait()

        let second = Task { @MainActor in
            await gate.run(fileID: "file-a") {
                operationCount += 1
                return true
            }
        }
        await coalesced.wait()

        await releaseOperation.open()
        #expect(await first.value == false)
        #expect(await second.value == false)
        #expect(operationCount == 1)
    }
}
