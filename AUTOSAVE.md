# Autosave implementation and validation

Status: implemented; Release build and 22 selected native tests passed on September 18, 2026. Independent review accepted the autosave and navigation patches. Live saving and restored text are verified after correcting the loading overlay; rapid Back/Search navigation exposed a separate native layout crash, under investigation. This is a validation candidate, not a completed release.

## Saving behavior

The normal editor coalesces changes: a save becomes eligible after one second without edits, with a five-second maximum scheduling delay during continuous editing. Save starts are spaced at least five seconds apart, and expensive saves receive at least one second of rest after completion. Slow snapshots or storage can extend these times. Clean documents do not poll or write; camera movement and selection do not trigger full content saves.

One content save runs at a time. Disk work runs at utility priority away from the main actor; WebKit still has to produce a scene snapshot, so this does not guarantee zero rendering impact on huge diagrams. Edits arriving during a save remain pending. Failed saves retain dirty state and retry. The toolbar reports saving, last successful save, or failure. A failed extra recovery copy is reported separately after a successful primary save and does not trigger idle primary-save retries. Switching files and closing keep the existing awaited snapshot boundary.

The normal editor now waits for actual persistence before acknowledging a snapshot. App-state-only changes use a fresh full snapshot rather than asynchronously writing older captured elements over newer content.

## Recovery

Ordinary local and temporary files get current and previous complete `.excalidraw` recovery copies, including embedded image data. Settings > General > Autosave > Open Recovery Copies opens their folder. Open a current copy after a crash; use the previous copy if needed, and save recovered work under the desired name.

Recovery files live under Application Support/ExcalidrawDesktop/AutosaveRecovery (inside the application container when sandboxed). Document folders are hashed identifiers. The store retains up to 20 documents or approximately 1 GB, but never prunes the active document's copies, so a very large active document can exceed the size limit. Invalid snapshots cannot replace a valid recovery copy. Atomic file replacement keeps a complete visible current copy throughout replacement.

Managed library documents continue to use repository saving, history, and encryption. They do not create plaintext copies in this extra recovery folder. Cloud documents use their existing local cache path; a completed local save does not imply completed remote synchronization.

A crash can still lose changes since the last completed save. Atomic replacement protects against partial application writes; it is not a guarantee against disk failure or sudden power loss.

## Validation evidence

- Eleven standalone Swift tests pass: coalescing under continuous edits, no idle writes, retries, document generations, exclusive boundary saves, edits during saving, recovery replacement, invalid input, image-data preservation, and retention.
- All twelve modified/new Swift files pass syntax parsing; this does not establish typechecking or linkage. Source/test/script hashes match the isolated validation checkout.
- Optimized recovery-only benchmark: five saves of an 8,497,909-byte synthetic JSON document (10,000 records and an 8 MB embedded string) took 22–31 ms per save. This excludes WebKit snapshot creation, canonical-file saving, and rendering, and is not a live frame-time result.
- Release native validation passed: 19 XCTest cases and 3 Swift Testing cases, covering persistence, scheduler, recovery, bundled editor compatibility, switch/quit boundaries, and window binding. Log: `/private/tmp/excalidraw-autosave-native-tests-r5.log`.
- The supplied September 18 crash report (PID 1809, 08:38:11) matches XCTest host startup: two test stores used `/dev/null`, causing Core Data error 134081. Test hosts now use two distinct in-memory store URLs and skip normal application startup services; a regression verifies both stores are in-memory. This report does not diagnose heavy-diagram crashes.
- Initial independent review returned `fix-first`. Corrections reserve the scheduler for boundary saves, preserve native retry state when clean web metadata arrives, and separate recovery-only warnings from primary save failures. Regression tests pass; fresh scoped acceptance review returned `ship` with no findings.
- Live managed-library drawing `Autosave QA - 2026-09-18` showed Saved; its actual disk JSON contains the full typed text. Reopening initially timed out because the native loading overlay hid WebKit while JavaScript awaited a rendered frame. Keeping WebKit renderable beneath the cover restored opening, including the exact saved text and repeated Search opening. The three bundled-editor tests were rerun successfully (`/private/tmp/excalidraw-loading-native-tests.log`).
- Rapid Escape/Back/Search then exposed a separate AppKit constraint loop (09:00:32 crash report). The crash reproduced after each isolated experiment: constant root-owned toolbar visibility, unmounting the inactive editor, moving autosave status outside the toolbar, and queuing Search until the final save and close animation finish. Those unsuccessful experiments were reverted. Retained changes are the tested autosave implementation, test-host isolation, approved section-1 navigation styling, and the independently reproduced file-loading opacity correction. Rapid Escape/Back/Search remains a release blocker; automated success does not clear it.
- Live heavy-diagram frame-time measurement and crash/reopen acceptance: pending.

Passing automated tests do not clear the live loading, heavy-project, or broader Import/release gates.
