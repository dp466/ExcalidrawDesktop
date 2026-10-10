# ExcalidrawDesktop

<img src="ExcalidrawZ/Assets.xcassets/AppIcon.appiconset/AppIcon-128.0x128.0@2x.png" width="96" alt="ExcalidrawDesktop icon">

ExcalidrawDesktop is a macOS-focused local fork of [ExcalidrawZ](https://github.com/chocoford/ExcalidrawZ). It combines a native SwiftUI document shell with a pinned, locally bundled [Excalidraw](https://github.com/excalidraw/excalidraw) editor. The fork is built for local drawing workflows, predictable persistence, and direct access to Excalidraw's desktop controls.

This repository is an independent fork. It is not an official Excalidraw or ExcalidrawZ release.

## What this fork changes

- Restores the embedded editor's drawing toolbar, shape properties, main menu, library, help, and keyboard behavior at desktop window sizes.
- Keeps local folders, linked files, import, export, history, presentation, and native navigation around the canvas.
- Adds coalesced autosave, awaited save boundaries for document switches and quit, and current/previous recovery copies for ordinary local documents.
- Enables presentation and opt-in local MCP independently from cloud AI. Cloud AI and subscription-driven AI surfaces are disabled in this build.
- Uses an opaque Excalidraw-inspired macOS interface with purple interaction accents across the app-owned navigation and utility surfaces.
- Moves preview preparation, large-file parsing, folder enumeration, and other avoidable work away from the main interface thread where practical.
- Offers a default-off experimental high-refresh option for direct-distribution macOS builds. It requires a normal restart and uses unsupported WebKit SPI.

The complete implementation summary is in [docs/FORK-CHANGES.md](docs/FORK-CHANGES.md). Current unreleased changes are listed in [CHANGELOG.md](CHANGELOG.md), and the deterministic icon source and attribution are documented in [docs/BRANDING.md](docs/BRANDING.md).

## Build and install

Source is available on GitHub. A public downloadable binary is pending dependency
licensing review; see [distribution status and installer instructions](docs/DISTRIBUTION.md).

Requirements: an Apple Silicon Mac, Xcode 27 command-line tools, Node.js 24, and network access for the first dependency download.

```sh
./script/build_and_run.sh --verify
```

Use `./script/build_release.sh` to build and install without launching. A successful release build installs `ExcalidrawDesktop.app` in `/Applications` and keeps the completed build product under `~/Library/Caches/ExcalidrawDesktop/release/Release`. Quit the installed app normally before rebuilding so pending saves can finish.

See [LOCAL-BUILD.md](LOCAL-BUILD.md) for source pairing, reproducible staging, cache controls, testing, and reinstall instructions. See [VALIDATION.md](VALIDATION.md) for the validation record and [AUTOSAVE.md](AUTOSAVE.md) for persistence and recovery details.

## Important boundaries

- This is a local development build without Developer ID signing or notarization.
- The fork has not been validated as App Store-ready. The experimental high-refresh bridge is excluded from `APP_STORE` builds.
- The editor is pinned to a known ExcalidrawZ-compatible revision; this repository does not track every feature on excalidraw.com.
- iCloud database sync, the upstream automatic updater, online collaboration, and cloud AI are disabled for this local fork. Files placed in an iCloud Drive folder remain ordinary linked files managed by macOS.
- Recovery reduces the amount of work at risk, but a crash or power loss can still lose changes since the last completed save.
- Performance measurements use bounded fixtures and do not guarantee a particular frame rate or latency for every drawing.

## Attribution and license

ExcalidrawDesktop is derived from [ExcalidrawZ](https://github.com/chocoford/ExcalidrawZ) and embeds a pinned fork of [Excalidraw](https://github.com/excalidraw/excalidraw). The repository remains under the [MIT License](LICENSE), with its original ExcalidrawZ copyright notice preserved. Additional third-party notices, including the Excalidraw logo attribution, are kept in `ExcalidrawZ/Resources/Licenses`.
