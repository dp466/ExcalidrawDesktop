# ExcalidrawDesktop fork changes

This document describes the behavior that distinguishes ExcalidrawDesktop from its ExcalidrawZ base. It records the current working tree rather than a published upstream release.

## Fork identity and operating model

ExcalidrawDesktop is a macOS-focused, direct-distribution local build. It uses its own bundle identifier and Application Support directory, installs alongside ExcalidrawZ, serves its bundled editor from a loopback-only server, and does not use the upstream automatic updater.

The fork retains the native document shell and pins an ExcalidrawZ-compatible editor revision. The editor source is reconstructed outside the working tree, verified against `patches/editor.patch`, and bundled with the native application. This gives the native and web halves an explicit source pairing instead of silently using whatever editor happens to be available.

iCloud database sync is disabled. Linked files remain normal files at user-selected paths, including folders that macOS syncs through iCloud Drive. The fork does not equate a successful local write with completion of any external sync provider.

The app icon is generated deterministically from the licensed Excalidraw logo mark on the fork's flat charcoal surface. See [BRANDING.md](BRANDING.md) for its source, attribution, and regeneration process.

## Desktop editor and native shell

The embedded editor exposes its regular desktop drawing toolbar, property controls, main menu, library, help, and keyboard handling at normal Mac window sizes. Compact layouts remain available for genuinely narrow viewports.

The surrounding native interface uses app-owned macOS navigation and menus instead of placing the document transition controls in a dynamically changing split-view toolbar. This avoids the AppKit constraint feedback loop reproduced during rapid document close, Back, and Search transitions. A window observer without an operating-system version allowlist tracks the real hosting window through modal teardown and reparenting, which also keeps menu-bar import routed to the intended window.

App-owned settings, navigation, export, library, history, recovery, search, and presentation surfaces use a shared opaque palette with purple hover and focus treatments. System panels and alerts keep system styling. The embedded Excalidraw controls keep their own editor styling.

## Local feature policy

Local functionality has a separate policy from cloud AI and subscription state:

- Presentation remains available.
- MCP remains available on macOS only when the user enables it in Settings.
- MCP requests retain active-file, edit-lock, and content-lock checks.
- The optimized MCP catalog ships built-in descriptions and input schemas instead of relying on unpublished upstream resource files.
- Cloud AI, AI chat surfaces, credit/subscription promotion, and web AI components are disabled.
- Online collaboration is not enabled in the embedded editor.

MCP is a local service, but enabling it still grants a compatible local client access to the tools exposed by the app. Its switch remains off until the user chooses to enable it.

## Autosave and recovery

The interactive editor coalesces content changes rather than saving on every event. A save becomes eligible after a short quiet period, continuous editing has a bounded scheduling delay, only one content save runs at a time, and slow saves receive a rest interval before another begins. Edits that arrive during a save remain pending. Clean documents do not poll or write, and viewport movement or selection alone does not trigger a full content save.

Document switches and normal application termination use explicit flush boundaries. They capture the old target, suspend conflicting transitions, request a fresh full scene, await actual persistence, and release the boundary only when the result is known. Concurrent boundaries share the in-flight save. A failed boundary save keeps the current document available for retry instead of reporting a successful transition.

Ordinary local and temporary documents receive `current` and `previous` complete recovery copies with embedded image data. Writes use atomic replacement, invalid snapshots cannot replace a valid copy, and retention is bounded by document count and approximate storage size while protecting the active document. Recovery copies can be opened from Settings.

Managed library documents continue to use their repository, history, and encryption path and do not receive extra plaintext copies in the recovery directory. A crash can still lose edits made after the last completed save, and recovery is not protection against hardware failure or sudden power loss.

See [AUTOSAVE.md](../AUTOSAVE.md) for scheduling details, recovery semantics, and validation evidence.

## Document loading, import, and previews

The loading cover leaves WebKit renderable underneath it because Excalidraw needs a rendered frame to finish some scene loads. Switching no longer waits for a viewport PNG preview before opening the next document.

On macOS, import uses the actual hosting window rather than a framework helper limited to specific OS versions. Import notifications carry a target window when available, and local file handling accepts readable file URLs without requiring an unrelated security-scope state.

Preview work is split so ordinary file reads, JSON parsing, and preview preparation can happen away from the main actor. Unchanged scene bytes are reused instead of decoding and re-encoding the full image map. Large documents travel into JavaScript as structured arguments rather than expanded decimal byte-array source, avoiding a severe transient memory and parse-time multiplier. WebKit rendering itself remains serialized, with generation and cancellation checks.

Folder contents are enumerated and sorted on a private Core Data queue. Refreshes are debounced, stale results are rejected, and focus changes refresh the current level instead of recursively walking the complete tree.

## Bridge and rendering work

Automatic camera notifications were removed. Direct camera queries still return the current value, and the compatibility tracking API remains callable for clients that explicitly need it.

Viewport-only native state messages use the editor's scene nonce to avoid traversing every element when content did not change. Only persisted preferences and viewport fields cross the normal app-state bridge. Full snapshots remain mandatory at switch and close boundaries, so the optimization does not weaken persistence guarantees.

The performance measurements in the repository are bounded fixtures. They demonstrate the behavior of a particular scene and machine; they do not guarantee that every image-heavy or complex drawing will open, pan, or save within the same timing.

See [EDITOR-RESPONSIVENESS.md](EDITOR-RESPONSIVENESS.md) and [FLAT-SURFACES-VALIDATION.md](FLAT-SURFACES-VALIDATION.md) for measurements and their limits.

## Experimental high refresh rate

Direct-distribution macOS builds expose a default-off setting under General > Editor performance. The value is read before interactive WebViews are created. Changing it displays a restart reminder; a normal quit and relaunch applies the new value without reloading the active editor at toggle time.

When enabled, an Objective-C bridge attempts to disable WebKit's internal preference for rendering updates near 60 FPS. It validates the discovered feature and falls back to normal preferences if the private call fails. This is unsupported WebKit SPI, may stop working after an OS update, may use more power, and does not guarantee 120 FPS or lower end-to-end input latency.

`APP_STORE` builds exclude the Swift setting, its invocation, and the private selector strings from the bridge object. That exclusion does not establish that the rest of the application is ready for App Store submission. No notarized distribution is claimed.

See [EXPERIMENTAL-HIGH-REFRESH.md](EXPERIMENTAL-HIGH-REFRESH.md) for implementation boundaries and measured evidence.

## Reproducible build staging

Release scripts stage a fresh native snapshot from the Git revision, overlay the current tracked changes and relevant untracked source files, and build outside the iCloud Drive checkout. The editor cache is pinned, patched, verified, and snapshotted separately before its Vite output is written into the staged native resources. Ignored working-tree build output is not treated as source.

The generated release manifest records the native and editor revisions, patch hashes, native source hashes, dependency lock, tool versions, and bundled editor asset hashes. It identifies the exact staged inputs; it does not promise byte-identical Xcode binaries across machines or toolchains.

The build script installs the completed application in `/Applications/ExcalidrawDesktop.app`. Installation stops if that copy is still running, leaving the build product available for installation after a normal quit. This protects the app's save and termination boundaries.

See [LOCAL-BUILD.md](../LOCAL-BUILD.md) for commands, requirements, cache variables, validation, and reinstall instructions.

## Validation and release limits

The repository includes native and embedded-editor tests for autosave scheduling, persistence acknowledgement, recovery replacement, boundary coordination, window binding, import/opening, feature policy, preview preparation, standard-file reopening, and export. Release builds have also been exercised in the installed application.

These checks do not make the fork a notarized product, an App Store release, or a guarantee against all crashes and data loss. Intel builds, iOS distribution, sustained thermal behavior, every storage provider, and every real-world drawing size remain outside the current validation claim. Consult [VALIDATION.md](../VALIDATION.md) for the current evidence before treating a working-tree build as a release candidate.

## Attribution

The fork preserves the repository's MIT license and original ExcalidrawZ copyright notice. Excalidraw branding and embedded editor assets retain their own notices in `ExcalidrawZ/Resources/Licenses`. This documentation is an acknowledgement of the fork's upstream sources, not a transfer of their names or trademarks.
