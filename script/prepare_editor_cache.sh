#!/bin/bash
# Maintains the pinned editor source and its dependency tree outside iCloud.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
source "$ROOT/script/toolchain.sh"

REV=b4c2a73a62e00b488d897ef5adba5eca7d34b7dc
EDITOR_CACHE_ROOT="${EDITOR_CACHE_ROOT:-${TMPDIR:-/private/tmp}/excalidraw-editor-source}"
YARN_CACHE_FOLDER="${YARN_CACHE_FOLDER:-${TMPDIR:-/private/tmp}/excalidraw-yarn-cache}"
[[ "$EDITOR_CACHE_ROOT" = /* && "$YARN_CACHE_FOLDER" = /* ]] || {
  echo 'EDITOR_CACHE_ROOT and YARN_CACHE_FOLDER must be absolute paths.' >&2
  exit 2
}

if [[ ! -d "$EDITOR_CACHE_ROOT/.git" ]]; then
  [[ ! -e "$EDITOR_CACHE_ROOT" ]] || {
    echo "Editor cache exists but is not a Git checkout: $EDITOR_CACHE_ROOT" >&2
    exit 2
  }
  mkdir -p "$(dirname "$EDITOR_CACHE_ROOT")"
  git clone --branch ExcalidrawZ-core --single-branch https://github.com/chocoford/excalidraw.git "$EDITOR_CACHE_ROOT"
  git -C "$EDITOR_CACHE_ROOT" checkout --detach "$REV"
fi

[[ "$(git -C "$EDITOR_CACHE_ROOT" rev-parse HEAD)" == "$REV" ]] || {
  echo 'Unexpected editor revision; refusing to overwrite the editor cache.' >&2
  exit 1
}

PATCH="$ROOT/patches/editor.patch"
if git -C "$EDITOR_CACHE_ROOT" apply --check "$PATCH" 2>/dev/null; then
  git -C "$EDITOR_CACHE_ROOT" apply "$PATCH"
elif ! git -C "$EDITOR_CACHE_ROOT" apply --reverse --check "$PATCH" 2>/dev/null; then
  echo 'Editor patch differs from the cache. Preserve edits and reconcile patches/editor.patch.' >&2
  exit 1
fi
python3 "$ROOT/script/verify_patch.py" "$EDITOR_CACHE_ROOT" "$PATCH"

cd "$EDITOR_CACHE_ROOT"
"$NODE" "$YARN_JS" install --frozen-lockfile --ignore-scripts --cache-folder "$YARN_CACHE_FOLDER"
