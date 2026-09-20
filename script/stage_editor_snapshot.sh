#!/bin/bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
EDITOR_CACHE_ROOT="${EDITOR_CACHE_ROOT:-${TMPDIR:-/private/tmp}/excalidraw-editor-source}"
[[ -d "$EDITOR_CACHE_ROOT/.git" ]] || {
  echo "Pinned editor cache is unavailable: $EDITOR_CACHE_ROOT" >&2
  exit 2
}
SOURCE_ROOT="$EDITOR_CACHE_ROOT" "$ROOT/script/stage_native_snapshot.sh" "$@"
