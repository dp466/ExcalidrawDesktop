# Editor responsiveness and shared chrome pass

## Frame pacing measured on September 19, 2026

Hardware: Apple M5 Pro, built-in 3024 x 1964 display, 1512 x 982 logical resolution,
120 Hz reported by system_profiler. Release build 125, bundled editor revision
b4c2a73a62e00b488d897ef5adba5eca7d34b7dc plus recorded patch.

Same 1,000-rectangle scene and 120 synthetic camera changes:

| Host | Median frame interval | p95 | Maximum | >50 ms |
| --- | ---: | ---: | ---: | ---: |
| WKWebView Release compatibility fixture, before | 17 ms | 18 ms | 19 ms | 0 |
| Helium, installed build 125 editor assets | 8.3 ms | 9.1 ms | 9.4 ms | 0 |
| WKWebView Release 126, after | 17 ms | 17 ms | 18 ms | 0 |

Browser test used a temporary loopback-only page, synthetic data, and the exact installed
editor assets. The helper, camera motion and sampling loop matched the native test.
Different viewport/browser chrome and host power policies mean this is not a perfectly
controlled rendering-cost comparison. It does demonstrate approximately 60 vs 120 Hz
scheduling on the same display. No system refresh settings were changed.

The public macOS WebKit SDK exposes no frame-rate preference. WebKit issue 294338
remains open: https://bugs.webkit.org/show_bug.cgi?id=294338 . No unsupported private
WebKit preference was introduced in builds 125–127. A supported 120 Hz solution may require a different
embedding engine; this pass does not claim to remove the WKWebView cap.

## Avoidable work removed

- Removed automatic 10 Hz camera messages. Camera reads remain exact/on-demand and the
  compatibility tracking API remains available. The native camera cache no longer
  publishes invalidations across SwiftUI.
- Pan-only native state payloads use the editor's scene nonce, already used for renderer
  invalidation, to skip element traversal. In-place element mutations trigger the nonce.
  Older editor APIs without a nonce retain the full-hash fallback.
- Bridge only persisted preferences and three viewport fields. Transient selection and
  UI state no longer inflate app-state messages.
- Viewport-only persistence writes the existing sidecar and skips document JSON merging.
  Pending preference changes accumulate, and forced file-switch/close snapshots remain.

The allowlist mirrors ExcalidrawDocumentAppStatePersistence.swift and must stay aligned
when persistent preferences are added. Detached decoding cannot interrupt an in-progress
JSON parse; cold thumbnails still render serially. Folder enumeration after content saves
and broad FileState autosave-status observation remain possible future optimization targets.

## Payload microbenchmark

Run `node script/benchmarks/NativeStateWatcherBenchmark.mjs EDITOR_SOURCE_ROOT`.
25,000 elements, 5,000 selected IDs, 200 dispatches. Parent rerun: old 2.398 ms per
pan dispatch, new 0.001324 ms. This measures synthetic payload construction only, not
frame rate, actual painting, bridge transport, or native file I/O. The watcher is
throttled to about once per second, so this removes periodic overhead, not every frame.

## Design scope

Shared opaque surfaces and flat purple-hover buttons now cover local workflow settings,
export/share, home/search/tips, library, presentation, history, utility/recovery sheets,
and app-owned screen-annotation controls. iOS material/button adapters retain their
original platform behavior. System file panels and alerts remain system-owned. Hidden
cloud-AI and subscription surfaces are outside this local fork's design pass. Home no
longer advertises AI when policy disables it.

## Validation

Release 126 passed 35 XCTest and 3 Swift Testing cases. The added live-editor test also
passed separately: panning preserves drawing elements and emits viewport-only metadata,
preference changes emit persistent-state metadata, in-place edits change the nonce, and
no automatic camera messages arrive. Parent reruns passed all 36 JavaScript tests,
TypeScript checking, exact editor-patch verification, and diff whitespace checks.

Installed Release 126 Settings was visually checked in both light and dark appearance;
the user's dark preference was restored. The local MCP settings were inspected without
enabling its server. Release 127 adds consistent small/large button heights and brings
MCP help/connect sheets under the same opaque-surface adapter.

Release 127 compiled successfully. Its first test run was interrupted after the Mac
locked: rendered-frame file-load waits timed out, and CUA confirmed the locked screen.
No product behavior was changed for that interruption. The exact compiled artifact
will be retested with the screen unlocked before installation. The first independent review found discarded circle/capsule/custom-radius shapes in
the shared chrome adapter. The parent corrected the adapter to honor supplied shapes
and make circular buttons square before applying their circular border. That correction
compiled successfully (`/private/tmp/excalidraw127-shape-build.log`). A fresh second
read-only review (`/root/responsiveness_final_review`) returned **ship** for the scoped
source/build change, with no concrete source blocker. Its actual runtime model/effort
were not exposed. This does not clear the pending installed-app runtime gate. After unlocking, Release 127 passed 36 XCTest plus 3 Swift Testing cases. The
installed Applications bundle reports version 127 and was relaunched successfully.
See `/private/tmp/excalidraw127-final-validation.log`.
Evidence logs are recorded under /private/tmp/excalidraw-build126-validation.log and
/private/tmp/excalidraw-pan-baseline125.log. Browser result was read from the benchmark's
visible result panel. Source baselines are in /private/tmp/excalidraw-next-ui-baseline,
/private/tmp/excalidraw-responsiveness-baseline, and
/private/tmp/excalidraw-responsiveness-js-baseline.


### Installed-app checks

Release 127 opened Electric Diagram V1 with embedded equipment images, generated its
image-export preview, displayed flat export-target cards and circular back/close
controls, and opened/closed the presentation inspector (this document has no frames).
Switched to Autosave-image-QA and back successfully; restored the selection tool.
The drawing contents were not edited. Home thumbnails and sidebar entries rendered.
The earlier Release 126 settings light/dark check remains applicable to unchanged
settings surfaces. The native presentation inspector toolbar still has system styling.

Direct pointer-drag validation was blocked by the computer-use service reporting
windowNotFoundAtPosition even after raising the app. Semantic control actions worked.
The exact Release 127 embedded-editor test nevertheless exercised 120 camera steps:
median17ms,p9518ms,max18ms,zero frames over50ms. This is not full release certification
or a manual assessment of complex-diagram pan latency. Broader manual UI and crash
soak coverage remain separate release gates. The app is left open on Electric Diagram V1.

## High-refresh follow-up research

Rechecked September 19: upstream WebKit still defines
`PreferPageRenderingUpdatesNear60FPSEnabled` with a default of true (except visionOS).
The exposed feature toggles are in `WKPreferencesPrivate.h`; the installed macOS 27
public WKPreferences header offers no matching refresh-rate control. Issue 294338
includes reports of reaching 120 FPS through that internal preference. This is a
candidate for an isolated opt-in experiment and is not a supported release API.
Build 128 now implements the measured, default-off experiment described in
[Experimental high refresh](EXPERIMENTAL-HIGH-REFRESH.md).

A larger alternative is Chromium Embedded Framework, which supports embedding a
browser in an existing native macOS app. It could retain the Swift shell but requires
new bridge, input, save/export, packaging and update validation. Existing Helium
measurements establish feasibility of the editor content at 120 Hz, not a guarantee
for an unbuilt CEF integration.

The first unlocked 127 suite found an overly strict integration assertion: a renderer
nonce can invalidate without changing scene contents (the upstream forced-render path
calls scene.triggerUpdate). All other assertions, including contentDirty=false for the
pan, passed. The test now checks unchanged serialized elements and viewport-only save
routing, while the unit tests separately exercise nonce-based scan skipping. No
production logic was changed for this test correction.
