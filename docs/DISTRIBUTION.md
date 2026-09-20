# Distribution

## Current status

The native source and documentation are published in the independent
[dp466/ExcalidrawDesktop fork](https://github.com/dp466/ExcalidrawDesktop).
Build 129 is an Apple Silicon development preview. Its bundle declares macOS 13.0
as the minimum; runtime testing to date was on the development Mac, not a full
matrix of older macOS versions. There is no Intel build.

Public binary distribution is pending dependency licensing review. The built
executable includes LLMKit and LLMCore even with cloud AI disabled. At the time of
inspection, their pinned checkouts and public repositories provided no licence.
Obtain redistribution permission or remove/replace them before publishing a DMG.
The pinned FSEventsWrapper checkout also lacks a licence file; its current upstream
repository now publishes MIT terms, which needs reconciliation with the pinned code.

## Copyright and branding

ExcalidrawZ, Excalidraw, and the official Excalidraw logo repository publish MIT
licences. Preserve their copyright and permission notices in distributed copies.
Individual dependencies and fonts have their own terms. The main repository's MIT
licence does not replace those terms.

MIT copyright permission is not a blanket trademark clearance. This fork must not
be represented as an official or endorsed Excalidraw product. A distinct product
name/icon or written brand permission would reduce uncertainty around public branding.

Sources:

- https://github.com/chocoford/ExcalidrawZ/blob/main/LICENSE
- https://github.com/excalidraw/excalidraw/blob/master/LICENSE
- https://github.com/excalidraw/excalidraw-logo/blob/master/LICENSE
- https://github.com/chocoford/LLMKit
- https://github.com/chocoford/LLMCore
- https://github.com/Frizlab/FSEventsWrapper

## Create a preview installer

[SwiftyDMG](https://github.com/chocoford/SwiftyDMG) produces a drag-to-Applications
disk image, not an Apple Installer `.pkg`. The packaging tool was built from
`844cf6291cb1102b08df5992fa0e4355b62eb964`; use its committed `Package.resolved`
and apply this repository's `patches/swiftydmg-cli.patch` before running
`swift build -c release`. The patch replaces the CLI's competing 40-second spinner
task with a direct awaited packaging operation, so progress animation cannot end
the command before a larger image has finished. It does not change AppDMG's image
format or layout.

After `swift package resolve`, apply `patches/swiftydmg-hdiutil-status.patch` to
SwiftyDMG's `.build/checkouts/hdiutil` checkout, then build. This changes error
detection to check the process exit status. macOS 27 emits a deprecation warning
on stderr even when image creation succeeds; the upstream wrapper incorrectly
treats any stderr output as failure. Nonzero exit codes still fail packaging.

```sh
python3 script/package_preview.py \
  --app /Applications/ExcalidrawDesktop.app \
  --editor /path/to/prepared-editor \
  --packages /path/to/SourcePackages/checkouts \
  --swifty-dmg /path/to/SwiftyDMG/.build/release/swifty-dmg \
  --output /private/tmp/excalidraw-preview
```

Use a new output directory. The script copies the app, collects available licence
texts and font metadata, reports missing Swift notices, seals nested code with ad-hoc
signatures, removes any Xcode test bundle, builds and verifies a DMG, and records a
SHA-256 checksum. It does not modify the installed app or establish that
distribution is legally cleared.

Before publishing, inspect the mounted DMG, confirm the Applications shortcut and
new icon, verify the copied app's signature, and launch the packaged app. Keep the
original build manifest alongside the packaging manifest. Packaging does not rerun
the application tests and cannot substitute for them.

## Signing and first launch

No Developer ID identity was available on the packaging Mac. Ad-hoc signatures
provide integrity checks but do not identify a trusted developer; this preview is
not notarized. A DMG does not remove that limitation.

For a future approved preview, download the DMG, open it, and drag the app to
Applications. On first launch macOS may require approval in System Settings →
Privacy & Security → Open Anyway. Follow
[Apple's instructions](https://support.apple.com/en-us/102445) only for a download
you trust. Do not globally disable Gatekeeper. For normal public distribution,
configure Developer ID signing and notarization first.

## Build 129 packaging validation

- SwiftyDMG with the two recorded compatibility patches built successfully.
- All recorded native app/project source hashes and bundled editor asset hashes
  matched the tested app's build manifest before packaging.
- The resulting 65 MB image passed `hdiutil verify` and SHA-256 verification.
- The mounted image contained `ExcalidrawDesktop.app` and an Applications shortcut.
- The mounted app passed `codesign --verify --deep --strict` and contained no test bundle.
- The executable launched directly from the mounted image and rendered Home.
  It was quit normally and the installed Applications copy was relaunched.
- This was a local, non-quarantined launch check. Downloaded-file Gatekeeper approval
  and other Macs/macOS versions remain untested. These checks do not clear the
  dependency licensing issues above.

The draft asset is `ExcalidrawDesktop-2.4.4-129-arm64-preview.dmg`; use the
accompanying `SHA256SUMS.txt` for the exact image checksum. Commit packaging changes
before generating the final image, so `package-manifest.json` references the
reproducible packaging commit. The manifest also records the packaging source hashes.
The notice-source editor must match the original build's pinned revision and exact patch.
