#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
source "$ROOT/script/toolchain.sh"
export NODE YARN_JS
RELEASE_OUTPUT_ROOT="${RELEASE_OUTPUT_ROOT:-$HOME/Library/Caches/ExcalidrawDesktop/release}"
[[ "$RELEASE_OUTPUT_ROOT" = /* && "$RELEASE_OUTPUT_ROOT" != "$ROOT" && "$RELEASE_OUTPUT_ROOT" != "$ROOT/"* ]] || { echo 'RELEASE_OUTPUT_ROOT must be an absolute path outside the source checkout.' >&2; exit 2; }
export RELEASE_OUTPUT_ROOT
DERIVED="${DERIVED:-${TMPDIR:-/private/tmp}/excalidraw-derived-data}"
PACKAGES="${PACKAGES:-${TMPDIR:-/private/tmp}/excalidraw-source-packages}"
EDITOR_CACHE_ROOT="${EDITOR_CACHE_ROOT:-${TMPDIR:-/private/tmp}/excalidraw-editor-source}"
SOURCE_ROOT="$("$ROOT/script/stage_native_snapshot.sh")"
cleanup() { rm -rf "$SOURCE_ROOT"; }
trap cleanup EXIT

python3 "$SOURCE_ROOT/script/test_diagram_plugin.py"
NATIVE_SOURCE_ROOT="$SOURCE_ROOT" EDITOR_CACHE_ROOT="$EDITOR_CACHE_ROOT" "$ROOT/script/build_editor.sh"
xcodebuild -resolvePackageDependencies -project "$SOURCE_ROOT/ExcalidrawZ.xcodeproj" -scheme ExcalidrawZ \
  -clonedSourcePackagesDirPath "$PACKAGES" -onlyUsePackageVersionsFromResolvedFile
DEPENDENCY="$PACKAGES/checkouts/ChocofordKit"
[[ "$(git -C "$DEPENDENCY" rev-parse HEAD)" == 239706fbf2b6407ad9d3e755edd9185bcff368e9 ]] || { echo 'Unexpected ChocofordKit revision' >&2; exit 1; }
if git -C "$DEPENDENCY" apply --check "$SOURCE_ROOT/patches/chocofordkit-xcode27.patch" 2>/dev/null; then
  chmod u+w "$DEPENDENCY/Sources/UI/Components/Input/Buttons/FileExporterButton.swift" \
    "$DEPENDENCY/Sources/UI/Components/Input/Buttons/FileImporterButton.swift" \
    "$DEPENDENCY/Sources/UI/Components/Input/Buttons/Styles/OutlinedButtonStyle.swift"
  git -C "$DEPENDENCY" apply "$SOURCE_ROOT/patches/chocofordkit-xcode27.patch"
else
  git -C "$DEPENDENCY" apply --reverse --check "$SOURCE_ROOT/patches/chocofordkit-xcode27.patch"
fi
python3 "$SOURCE_ROOT/script/verify_patch.py" "$DEPENDENCY" "$SOURCE_ROOT/patches/chocofordkit-xcode27.patch"
xcodebuild -project "$SOURCE_ROOT/ExcalidrawZ.xcodeproj" -scheme ExcalidrawZ -configuration Release \
  -destination 'platform=macOS,arch=arm64' -derivedDataPath "$DERIVED" \
  -clonedSourcePackagesDirPath "$PACKAGES" -disableAutomaticPackageResolution \
  -skipPackagePluginValidation CODE_SIGNING_ALLOWED=NO ONLY_ACTIVE_ARCH=YES build
STAGED_APP="$DERIVED/Build/Products/Release/ExcalidrawZ.app"
ditto "$SOURCE_ROOT/ExcalidrawZ/Resources/Licenses" "$STAGED_APP/Contents/Resources/Licenses"
python3 "$SOURCE_ROOT/script/package_diagram_plugin.py" \
  --output "$STAGED_APP/Contents/Resources/ExcalidrawDiagramPlugin.zip"
NATIVE_GIT_ROOT="$ROOT" EDITOR_GIT_ROOT="$EDITOR_CACHE_ROOT" \
  python3 "$SOURCE_ROOT/script/build_manifest.py" "$STAGED_APP"
mkdir -p "$RELEASE_OUTPUT_ROOT/Release"
rm -rf "$RELEASE_OUTPUT_ROOT/Release/ExcalidrawZ.app"
ditto "$STAGED_APP" "$RELEASE_OUTPUT_ROOT/Release/ExcalidrawZ.app"
ditto "$SOURCE_ROOT/build/release-manifest.json" "$RELEASE_OUTPUT_ROOT/release-manifest.json"
echo "Release app: $RELEASE_OUTPUT_ROOT/Release/ExcalidrawZ.app"
python3 "$ROOT/script/install_release.py"
