#!/bin/bash
# Creates a source snapshot that Xcode can read without iCloud Drive coordination.
#
# The baseline deliberately comes from Git, rather than a recursive copy of the
# checkout: ignored generated assets are excluded.  Changes a developer has not
# committed yet are then overlaid so a release still represents their worktree.
set -euo pipefail

SCRIPT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ROOT="${SOURCE_ROOT:-$SCRIPT_ROOT}"
[[ "$ROOT" = /* ]] || { echo 'SOURCE_ROOT must be an absolute path.' >&2; exit 2; }
ROOT="$(cd "$ROOT" && pwd)"
DESTINATION="${1:-}"

if [[ -z "$DESTINATION" ]]; then
  DESTINATION="$(mktemp -d "${TMPDIR:-/private/tmp}/excalidraw-native-source.XXXXXX")"
else
  [[ "$DESTINATION" = /* ]] || { echo 'Snapshot destination must be an absolute path.' >&2; exit 2; }
  [[ ! -e "$DESTINATION" ]] || { echo "Snapshot destination already exists: $DESTINATION" >&2; exit 2; }
  mkdir -p "$DESTINATION"
fi

cleanup_on_failure() {
  if [[ "${SNAPSHOT_COMPLETE:-false}" != true && -d "$DESTINATION" ]]; then
    rm -rf "$DESTINATION"
  fi
}
trap cleanup_on_failure EXIT

copy_path() {
  local path="$1"
  [[ -n "$path" && "$path" != /* && "$path" != '..' && "$path" != ../* && "$path" != */.. && "$path" != */../* ]] || {
    echo "Refusing unsafe repository path: $path" >&2
    exit 2
  }

  local source="$ROOT/$path"
  local target="$DESTINATION/$path"
  if [[ -e "$source" || -L "$source" ]]; then
    mkdir -p "$(dirname "$target")"
    rm -rf "$target"
    cp -pP "$source" "$target"
  else
    rm -rf "$target"
  fi
}

git -C "$ROOT" rev-parse --is-inside-work-tree >/dev/null
git -C "$ROOT" archive --format=tar HEAD | tar -x -C "$DESTINATION"

# Materialize lists first so a Git failure cannot silently omit source changes.
git -C "$ROOT" diff --name-only -z HEAD > "$DESTINATION/.snapshot-tracked"
git -C "$ROOT" ls-files --others --exclude-standard -z > "$DESTINATION/.snapshot-untracked"

# Include staged, unstaged, added, renamed, and deleted tracked files.
while IFS= read -r -d '' path; do
  copy_path "$path"
done < "$DESTINATION/.snapshot-tracked"

# Include intentional nonignored worktree additions, but never editor builds,
# DerivedData, or other ignored output.
while IFS= read -r -d '' path; do
  copy_path "$path"
done < "$DESTINATION/.snapshot-untracked"
rm "$DESTINATION/.snapshot-tracked" "$DESTINATION/.snapshot-untracked"

SNAPSHOT_COMPLETE=true
trap - EXIT
printf '%s\n' "$DESTINATION"
