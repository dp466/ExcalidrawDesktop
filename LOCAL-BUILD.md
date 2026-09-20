# ExcalidrawDesktop local fork

This macOS fork restores the embedded Excalidraw editor's own drawing toolbar, shape properties, main menu, library, help, and keyboard handling. Native folder navigation and document export remain available. At a 900 × 700 desktop editor size, it retains desktop controls; genuine mobile layouts still use the compact interface.

The pinned editor is the ExcalidrawZ-compatible revision below. This is not an upgrade to the latest excalidraw.com release, so features introduced after that revision are outside this patch.

## Rebuild and run

Requirements: Apple Silicon Mac, Xcode 27 command-line tools, Node.js 24, network access for initial dependency installation. Yarn 1.22.22 is fetched with a verified archive SHA-256. Set `NODE` if Node is not on PATH or in the bundled Codex runtime location.

```sh
./script/build_and_run.sh --verify
```

This command builds, installs, and launches. Use `./script/build_release.sh` to build and install without launching. Close a running fork normally before using the Run action, so pending saves finish. The Codex Run action uses `script/build_and_run.sh`. `--debug`, `--logs`, and `--telemetry` are also available.

Each release build creates a fresh native source snapshot in `/private/tmp` from `git archive HEAD`, then overlays tracked worktree changes and nonignored untracked files. Xcode reads that snapshot, not the iCloud Drive checkout. The pinned editor source and its `node_modules` cache are also maintained under `/private/tmp`, verified against `patches/editor.patch`, then snapshotted before Vite builds directly into the native snapshot's `Resources/excalidraw-latest`; ignored working-tree output is never copied. The completed app is copied to `build/Release/ExcalidrawZ.app`, displayed as **ExcalidrawDesktop**. By default, Xcode derived data, package checkouts, the editor source cache, and the Yarn cache live under `/private/tmp`; set `DERIVED`, `PACKAGES`, `EDITOR_CACHE_ROOT`, or `YARN_CACHE_FOLDER` to use another outside-iCloud location. Those caches are disposable and may need their packages resolved again after cleanup. This is a local development build without Developer ID signing or notarization.

The bundle identifier is `local.dparadis.ExcalidrawDesktop`; database files live in Application Support/ExcalidrawDesktop. iCloud database sync and the upstream automatic updater are disabled for this fork. Linked files remain ordinary files at the paths you choose, including folders synced by iCloud Drive. Editing a linked file changes that actual file.

## Source pairing

- Native base: `6b73ab1dbf8ed1560fa2bc8c2b844796cb336b48`.
- Embedded editor base: `b4c2a73a62e00b488d897ef5adba5eca7d34b7dc`, upstream `chocoford/excalidraw`, ExcalidrawZ-core.
- Editor modifications are distributed in `patches/editor.patch`; `script/prepare_editor_cache.sh` reconstructs and verifies the pinned editor checkout outside iCloud Drive.
- Native dependencies use the checked-in `Package.resolved`. Three explicit SwiftUI State initializers needed by Xcode 27 are patched at the pinned ChocofordKit revision by `patches/chocofordkit-xcode27.patch`.
- `build/release-manifest.json` and the app's `Contents/Resources/LocalBuildManifest.json` are generated from the staged native snapshot. They record both revisions, patch hashes, native source hashes, dependency lock, tool versions, and all bundled editor asset hashes, so each manifest describes the exact staged source paired with the bundled editor. These identify the source and assets; they do not promise byte-identical Xcode binaries.

## Local features and performance changes

Presentation and optimized MCP use the local feature policy independently of cloud AI. MCP remains opt-in through Settings → MCP. Local MCP calls retain file/edit lock checks. Built-in descriptions and input schemas replace unpublished upstream resource files. Cloud AI is disabled, and its chat controls and web AI components are hidden. Online collaboration is not enabled in the embedded editor.

The editor is served on loopback port 8497. Automatic camera notifications are disabled; direct camera queries still read the current state, and the compatibility tracking API remains available for callers that explicitly enable it. Unused element-change tracking, a no-op document mutation observer, per-message logging, and ordinary console forwarding are removed. Folder enumeration and metadata sorting run on a private Core Data queue with debounced refreshes and stale-result rejection. Focus changes refresh one folder level rather than recursively walking the entire tree.

Switching documents awaits a full current-scene save to the captured old target, including when the editor's throttled dirty notification has not arrived. Concurrent switches share the pending save; persistence failure keeps the old document open for retry. Normal switching no longer waits for a viewport PNG preview.

## Validation

After building and closing the app, run `./script/test_local.sh` for the focused editor and native suites. It stages native test sources outside iCloud too. `./script/test_stage_native_snapshot.sh` verifies dirty, deleted, untracked, and ignored-file handling with a tiny disposable Git fixture. Tests create disposable scenes and temporary files.

Validation evidence and measured limits are recorded in `VALIDATION.md`. Do not infer that every intermittent pause on every real-world drawing is eliminated from bounded fixture measurements.

## Installed test application

Every successful `script/build_release.sh` build installs the fork at
`/Applications/ExcalidrawDesktop.app`. `script/build_and_run.sh` launches that
installed copy. The upstream ExcalidrawZ app is not replaced.

Quit the installed copy before building so pending saves can finish. If it is
still running, installation refuses to replace it; the completed build remains
in `build/Release/ExcalidrawZ.app`. After quitting, run
`python3 script/install_release.py` to install without rebuilding.
Use `EXCALIDRAW_INSTALL_DIR` to override the destination directory when needed.
