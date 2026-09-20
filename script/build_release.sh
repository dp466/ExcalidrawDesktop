#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
source "$ROOT/script/toolchain.sh"
export NODE YARN_JS
DERIVED="${DERIVED:-${TMPDIR:-/private/tmp}/excalidraw-derived-data}"
PACKAGES="${PACKAGES:-${TMPDIR:-/private/tmp}/excalidraw-source-packages}"
EDITOR_CACHE_ROOT="${EDITOR_CACHE_ROOT:-${TMPDIR:-/private/tmp}/excalidraw-editor-source}"
SOURCE_ROOT="$("$ROOT/script/stage_native_snapshot.sh")"
cleanup() { rm -rf "$SOURCE_ROOT"; }
trap cleanup EXIT

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
NATIVE_GIT_ROOT="$ROOT" EDITOR_GIT_ROOT="$EDITOR_CACHE_ROOT" \
  python3 "$SOURCE_ROOT/script/build_manifest.py" "$STAGED_APP"
mkdir -p "$ROOT/build/Release"
rm -rf "$ROOT/build/Release/ExcalidrawZ.app"
ditto "$STAGED_APP" "$ROOT/build/Release/ExcalidrawZ.app"
ditto "$SOURCE_ROOT/build/release-manifest.json" "$ROOT/build/release-manifest.json"
echo "Release app: $ROOT/build/Release/ExcalidrawZ.app"
python3 "$ROOT/script/install_release.py"
