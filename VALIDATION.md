# Fork validation

The supported validation target is an Apple Silicon Mac running macOS 27 with Xcode
27, using the local Release configuration. This record separates automated checks
from installed-app observations. It is not a notarization, App Store, or all-platform
release certification.

## Build 129: icon and fork documentation

- The original Excalidraw vector mark is used for the new flat purple/charcoal icon.
  Icon Composer, legacy icon sizes, and the in-app branding image share that source.
- The README was rewritten from scratch for this fork; the upstream changelog was
  replaced with a fork changelog. Attribution and license notices remain.
- TypeScript checking and all **36 embedded-editor JavaScript tests** passed.
- Patch reconstruction and native snapshot staging fixtures passed. The editor and
  dependency checkouts match their recorded patches exactly.
- Relative documentation links resolve. No long verbatim lines from the original
  README remain. A credential-pattern check found no matches in changed text files.
- Release build succeeded. The first native run passed 40 of 41 checks but exposed a
  fixture startup race in image loading: the test used the JS API before the media
  store was ready. The fixture now waits through the same native readiness gate as
  the app; it no longer treats helper existence alone as readiness.
- The corrected rerun passed all **41 native checks** (38 XCTest and 3 Swift Testing).
  Build 129 was installed in Applications and relaunched. macOS NSWorkspace resolves
  the new purple Excalidraw mark on its charcoal icon background; Home loaded normally.
  No user drawing contents were edited during this validation.
- Local evidence: `excalidraw129-validation.log` retains the initial failure;
  `excalidraw129-final-validation.log` records the passing rerun and installation;
  `excalidraw129-editor-tests.log` records the JavaScript/type checks. These logs live
  under `/private/tmp` on the validation Mac and are not repository dependencies.
- Whitespace checks pass for source and documentation. Patch files retain their
  original context whitespace to preserve exact reconstruction; both patches passed
  the exact-source verification instead.

## Existing automated coverage

The focused native suite contains **38 XCTest cases and 3 Swift Testing cases**.
It covers autosave scheduling, persistence acknowledgement and retry, recovery-copy
replacement and retention, concurrent save boundaries, window binding/reparenting,
local feature policy, file opening, preview preparation, and embedded-editor behavior.

The real bundled editor is exercised for unsignalled edits at forced-save boundaries,
immediate scene changes, large argument transport, embedded images, standard
`.excalidraw` reopening, PNG/SVG export, and native PDF generation. Tests use disposable
scenes and temporary files rather than editing user documents.

Build 128 passed the complete native suite. Its high-refresh test used 1,000 rectangles
with off/on/off phases, recording median frame intervals of 17/8/17 ms. These are
animation callback intervals under synthetic camera motion, not display scanout or
end-to-end pointer latency. See [experimental high refresh](docs/EXPERIMENTAL-HIGH-REFRESH.md).

## Installed-app observations from the preceding builds

- Native import opened a standard drawing with its frame and web toolbar after the
  hosting-window observer and modal routing fixes.
- Rapid navigation, Home/Back, search, and sidebar transitions were exercised after
  replacing the affected split-view/toolbar composition.
- Image-bearing drawings reopened, export previews rendered, and document switching
  succeeded in the installed Applications copy.
- App-owned flat surfaces were checked in light and dark appearance. System file
  panels and alerts retain system styling.
- The experimental refresh switch was checked off → on → off through normal app
  restarts; persistence and restart reminders behaved as intended. The user reported
  a substantial smoothness improvement with the option enabled.

Detailed bounded observations and earlier measurements are recorded in
[AUTOSAVE.md](AUTOSAVE.md), [responsiveness](docs/EDITOR-RESPONSIVENESS.md), and
[preview/surface validation](docs/FLAT-SURFACES-VALIDATION.md).

## Remaining release limits

Developer ID signing, notarization, a full App Store archive, Intel and iOS builds,
sustained thermal/power testing, long-running crash soak, and every external storage
provider are outside this validation. Unsupported WebKit high-refresh behavior can
change with macOS updates and is compiled out of App Store builds. Autosave and
recovery do not guarantee preservation of edits made after the last completed save.

## Repeat the checks

Quit the installed app normally, then run:

```sh
./script/test_local.sh
./script/test_stage_native_snapshot.sh
```

`test_local.sh` rebuilds the pinned editor and stages the native test sources outside
the working tree. Keep the Mac unlocked so visible WebKit fixtures can render frames.

Fresh read-only review of the build-129 commit scope returned **ship**, with no
blocking findings. The review covered icon generation, fork documentation, license
retention, the readiness-fixture correction, and staged-file hygiene. This acceptance
does not expand the distribution or runtime coverage limits above.
