#!/bin/bash
set -euo pipefail
source "$(dirname "$0")/toolchain.sh"
REV=b4c2a73a62e00b488d897ef5adba5eca7d34b7dc
if [[ ! -d "$ROOT/editor/.git" ]]; then
  git clone --branch ExcalidrawZ-core --single-branch https://github.com/chocoford/excalidraw.git "$ROOT/editor"
  git -C "$ROOT/editor" checkout --detach "$REV"
fi
[[ "$(git -C "$ROOT/editor" rev-parse HEAD)" == "$REV" ]] || { echo 'Unexpected editor revision; refusing to overwrite it.' >&2; exit 1; }
PATCH="$ROOT/patches/editor.patch"
if git -C "$ROOT/editor" apply --check "$PATCH" 2>/dev/null; then
  git -C "$ROOT/editor" apply "$PATCH"
elif ! git -C "$ROOT/editor" apply --reverse --check "$PATCH" 2>/dev/null; then
  echo 'Editor patch differs from checkout. Preserve edits and reconcile patches/editor.patch.' >&2
  exit 1
fi
python3 "$ROOT/script/verify_patch.py" "$ROOT/editor" "$PATCH"
cd "$ROOT/editor"
"$NODE" "$YARN_JS" install --frozen-lockfile --ignore-scripts --cache-folder /private/tmp/excalidraw-yarn-cache
