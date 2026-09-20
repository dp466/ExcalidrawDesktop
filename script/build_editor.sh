#!/bin/bash
set -euo pipefail
source "$(dirname "$0")/toolchain.sh"
NATIVE_SOURCE_ROOT="${NATIVE_SOURCE_ROOT:-}"
[[ -n "$NATIVE_SOURCE_ROOT" ]] || {
  echo 'Run build_release.sh; build_editor.sh requires its staged NATIVE_SOURCE_ROOT.' >&2
  exit 2
}
EDITOR_DESTINATION="${EDITOR_DESTINATION:-$NATIVE_SOURCE_ROOT/ExcalidrawZ/Resources/excalidraw-latest}"
EXPECTED_DESTINATION="$NATIVE_SOURCE_ROOT/ExcalidrawZ/Resources/excalidraw-latest"
[[ "$EDITOR_DESTINATION" == "$EXPECTED_DESTINATION" ]] || {
  echo "EDITOR_DESTINATION must be $EXPECTED_DESTINATION" >&2
  exit 2
}
[[ -d "$NATIVE_SOURCE_ROOT/ExcalidrawZ/Resources" ]] || {
  echo "Native source root is incomplete: $NATIVE_SOURCE_ROOT" >&2
  exit 2
}
EDITOR_CACHE_ROOT="${EDITOR_CACHE_ROOT:-${TMPDIR:-/private/tmp}/excalidraw-editor-source}"
EDITOR_CACHE_ROOT="$EDITOR_CACHE_ROOT" "$ROOT/script/prepare_editor_cache.sh"
EDITOR_SOURCE_ROOT="$(EDITOR_CACHE_ROOT="$EDITOR_CACHE_ROOT" "$ROOT/script/stage_editor_snapshot.sh")"

# Build into a unique sibling first.  This keeps a failed build from leaving a
# half-written editor in the staged app bundle and never reads iCloud output.
EDITOR_STAGING="$(mktemp -d "$(dirname "$EDITOR_DESTINATION")/.editor-stage.XXXXXX")"
cleanup() { rm -rf "$EDITOR_STAGING" "$EDITOR_SOURCE_ROOT"; }
trap cleanup EXIT
ln -s "$EDITOR_CACHE_ROOT/node_modules" "$EDITOR_SOURCE_ROOT/node_modules"
cd "$EDITOR_SOURCE_ROOT/excalidraw-app"
VITE_APP_ENABLE_TRACKING=false VITE_APP_DISABLE_SENTRY=true VITE_APP_ENABLE_ESLINT=false \
  "$NODE" ../node_modules/vite/bin/vite.js build --outDir "$EDITOR_STAGING"
rm -rf "$EDITOR_DESTINATION"
mv "$EDITOR_STAGING" "$EDITOR_DESTINATION"
rm -rf "$EDITOR_SOURCE_ROOT"
trap - EXIT
