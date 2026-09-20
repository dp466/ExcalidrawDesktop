# Flat browser surfaces and preview preparation

Scope: macOS folder cards, file-browser empty state and buttons, close-saving status,
loading/error overlay, and document actions menu. The shared opaque Excalidraw palette
is used; editor drawing controls and existing save/confirmation handlers are retained.
iOS presentation stays unchanged.

## Performance changes

- Parse ordinary local/stored/temporary documents away from the main actor.
- Prepare preview JSON away from the main actor.
- Reuse unchanged scene bytes instead of decoding and re-encoding the complete image
  resource map. Still rewrite when media hydration or an independently supplied scene
  changes that map.
- Use a coordinated background read for standard linked `.excalidraw` previews;
  preserve security-scoped access, stable IDs, and PNG/SVG-specific decoding.
- Keep serialized WebKit rendering, cache generations, and cancellation checks.

## Reproducible measurement

`script/benchmarks/PreviewPreparationBenchmark.swift` is a standalone Foundation
microbenchmark of the old JSON rewrite versus detached rewrite versus byte reuse.
Compile with `xcrun swiftc -parse-as-library` and run the resulting binary.
It uses a synthetic 17.0 MiB scene (50,000 elements and an 8 MiB embedded payload).
Parent rerun: median old preparation 101.6 ms, main-actor heartbeat delay 97.9 ms;
detached rewrite 98.1 ms, heartbeat 0.0 ms; byte reuse 0.0 ms at printed 0.1 ms
resolution, heartbeat 0.0 ms. Five samples per path. This does not measure total
file-open time, WebKit rendering, image decoding, or iCloud downloads.

The opening regression fixture is 5.6 MB / 5,000 rectangles. Build 118 measured
about 28 ms parsing both synchronously and asynchronously: the benefit is UI-thread
availability, not a claimed reduction in parsing wall time.

## Large-file transport correction

The old native bridge expanded document bytes into a decimal JavaScript array literal.
The observed 39.4 MB document became 171.3 million source characters; failed runtime
loads took roughly 39 and 44 seconds and WebContent reached 3.3 GB under memory
pressure. The native bridge now sends UTF-8 JSON as a named argument to the existing
serialized-file loader, with explicit file/request IDs and unchanged completion
acknowledgements. Non-UTF-8 input retains the prior byte-decoding behavior through a
base64 argument, without embedding payload data into executable source. Summary JSON
is parsed only for failure logging.

The helper completion/identity test, Unicode transport test in actual WebKit, and
existing save/switch/image/export checks cover this boundary. Runtime opening evidence is recorded below; no post-fix memory measurement is claimed.

## Validation

Build 120 compiled and passed 33 XCTest cases plus 3 Swift Testing cases after the
Mac was unlocked. The earlier locked-desktop run could not receive a rendered-frame
acknowledgement; it was stopped and is not counted as passing evidence. The fixture
makes its window key and activates the test app for visible WebKit rendering.
Parent reran the editor helper suite (30 passing tests), typecheck, patch verification,
and diff checks. The installed version was verified as 120.

Installed app checks on September 19: Electric Diagram V1 fully rendered with its
images and no error/loading panel at the first screenshot, 1.779 seconds after the
click including accessibility inspection and screenshot overhead. This is one observed
open, not a benchmark guarantee or a measured memory comparison. Leaving the document
showed the flat Saving status and completed successfully. Folder cards and icons were
purple with opaque surfaces; the empty folder had no fake glass placeholders. The
flat local menu had correct ordinary/destructive colors and compact positioning.

Rename/cancel exposed an accessibility action that bypassed primitive button styling.
Actions now dismiss at the semantic button boundary, and the presentation host remains
mounted so sheets survive menu dismissal. Installed build 123 verified Rename opens
immediately, Cancel leaves the menu closed, Copy Link closes it, and Up/Down move focus.
Build 124 passed the same 36 native tests and is installed in Applications. In the
installed build, Return opened Rename, Cancel preserved the name and left the menu
closed, Space expanded Move to, and Escape closed it and restored trigger focus.
A second installed-app check on build 124 fully rendered Electric Diagram V1 at the
first screenshot in 1.712 seconds (including inspection overhead), then returned to
the folder without an error. Both folder previews were visible on the first check.
Flat folder cards and the local-file actions menu were inspected again in build 124.
Fresh review found destructive-role styling was not preserved for cloud/collaboration
Delete actions. Build 125 preserves `configuration.role` in the custom row color
and accessibility button. Build 125 passed all 36 native tests and was installed and
relaunched. The final QA smoke check verified red Delete, Return opening Rename,
Cancel preserving the name/closing the menu, and returning to the flat folder browser.
Cloud/collaboration destructive actions were not exercised against connected accounts;
their shared role handling was inspected in source. Fresh independent review returned
`ship`, with no findings, for this scoped patch.

Cold thumbnail rendering remains serial and memory-cached only. Complete app release
readiness is outside this scoped validation.

Evidence: `/private/tmp/excalidraw-build120-unlocked-validation.log`,
`/private/tmp/excalidraw-build120-editor-tests.log`,
`/private/tmp/excalidraw-build120-typecheck.log`,
`/private/tmp/excalidraw-build123-validation.log`, and
`/private/tmp/excalidraw-build124-validation.log`, and
`/private/tmp/excalidraw-build125-validation.log`.
