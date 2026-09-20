# Experimental high refresh rate

Direct-distribution macOS builds expose Settings > General > Editor performance >
High refresh rate (experimental). A missing `ExperimentalHighRefreshRate` preference
means off. The process snapshots the choice before creating the interactive editor;
changing it in Settings requires a normal quit and relaunch. No editor reload or
save interruption occurs at toggle time. Existing autosave/termination guards apply.

Interactive document/collaboration canvases and screen annotation use this policy.
Hidden thumbnail and AI-proposal editors explicitly request normal rendering.
Printing and other utility WebViews are unchanged.

## Implementation and distribution boundary

The Objective-C bridge discovers WebKit's
`PreferPageRenderingUpdatesNear60FPSEnabled` feature and sets it to false for opted-in
editors. It checks method signatures, feature identity, and readback, and catches
Objective-C exceptions. If configuration fails, callers discard it and construct
normal preferences. Off mode does not call the preference setter.

This is unsupported WebKit SPI and can stop working after an OS update. Higher frame
rates can consume more power; the feature does not guarantee 120 FPS for every drawing,
display, or power mode. No sustained power/thermal measurement has been performed.

`APP_STORE` excludes the Swift setting and invocation. Both App Store target
configurations also define `APP_STORE=1` for Objective-C, leaving no private preference
or selector in that bridge object. iOS compiles the same no-op implementation. A
runtime off switch alone is not sufficient for App Store distribution: Apple's
[guideline 2.5.1](https://developer.apple.com/app-store/review/guidelines/#software-requirements)
requires public APIs. This is not a claim that the entire fork is ready for App Store
submission or that a notarized distribution has been validated.

## Evidence, September 19, 2026

Mac: Apple M5 Pro, built-in display reported at 120 Hz.
Standalone WKWebView animation probe, 180 measured frames per phase after warm-up:

| Mode | Median | p95 | Max | Frames over 50 ms |
| --- | ---: | ---: | ---: | ---: |
| Off | 17 ms | 17 ms | 18 ms | 0 |
| On | 8 ms | 9 ms | 9 ms | 0 |
| Off again | 17 ms | 17 ms | 18 ms | 0 |

The same shipping Objective-C bridge separately reported available=1, enable=1,
disable=1. Its App Store-compiled object contained no private key/selector strings.
Probe evidence: `/private/tmp/excalidraw-refresh-probe.json` and
`/private/tmp/excalidraw-refresh-bridge-check`.

Release build 128, real ExcalidrawCore with 1,000 rectangles and 180 camera changes:

| Mode | Median | p95 | Max | Frames over 50 ms |
| --- | ---: | ---: | ---: | ---: |
| Off | 17 ms | 18 ms | 25 ms | 0 |
| On | 8 ms | 10 ms | 12 ms | 0 |
| Off again | 17 ms | 18 ms | 22 ms | 0 |

These are animation callback intervals under synthetic camera motion, not a measurement
of display scanout or end-to-end pointer latency. Scene count and snapshot availability
were checked in every phase. The normal document-readiness gate is used to load the
fixture. An earlier fixture bypassed that gate and timed out; no production loading
behavior was changed to resolve the test setup.

Release validation passed 38 XCTest plus 3 Swift Testing cases, covering autosave,
recovery, navigation/save boundaries, image export and standard-file reopening.
Evidence: `/private/tmp/excalidraw128-unlocked-validation.log`. The first installation
wrapper omitted the manifest toolchain environment after tests passed; installation
was resumed without rebuilding or rerunning unchanged tests.

Installed `/Applications/ExcalidrawDesktop.app` reports build 128. In the actual UI,
the setting initially showed off; enabling it displayed the restart reminder. A normal
quit/relaunch preserved on and removed the reminder. Electric Diagram V1 opened with
its embedded equipment images and autosave status present. No drawing contents were
edited. Disabling displayed the reminder again; another normal quit/relaunch preserved
off and removed it. Settings is left open with the switch off.

Fresh read-only Astra Advisor review `/root/experimental_refresh_final_review` returned
**ship**, no blocking findings. Requested GPT-5.6 Terra/high; actual runtime model and
effort were unobservable. The earlier integration audit requested GPT-5.6 Sol/high,
with actual runtime model/effort likewise unobservable. Per-agent usage/cost counters
were unavailable. The parent inspected the scoped patch and reran the full native
suite before review. Full App Store archive, notarization, thermal soak, and manual
end-to-end pointer-latency measurements remain outside this validation.
