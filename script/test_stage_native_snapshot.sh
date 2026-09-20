#!/bin/bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
FIXTURE="$(mktemp -d "${TMPDIR:-/private/tmp}/excalidraw-snapshot-fixture.XXXXXX")"
SNAPSHOT="$(mktemp -d "${TMPDIR:-/private/tmp}/excalidraw-snapshot-output.XXXXXX")"
FAILED_SNAPSHOT="$(mktemp -d "${TMPDIR:-/private/tmp}/excalidraw-snapshot-failure.XXXXXX")"
rmdir "$SNAPSHOT"
rmdir "$FAILED_SNAPSHOT"

cleanup() {
  rm -rf "$FIXTURE" "$SNAPSHOT" "$FAILED_SNAPSHOT"
}
trap cleanup EXIT

printf 'baseline\n' > "$FIXTURE/tracked.txt"
printf 'remove me\n' > "$FIXTURE/removed.txt"
printf 'ignored\n' > "$FIXTURE/.gitignore"
printf 'not included\n' > "$FIXTURE/ignored-output.txt"

git -C "$FIXTURE" init -q
git -C "$FIXTURE" config user.email snapshot-test@example.invalid
git -C "$FIXTURE" config user.name 'Snapshot Test'
git -C "$FIXTURE" add tracked.txt removed.txt .gitignore
git -C "$FIXTURE" commit -qm baseline

printf 'dirty tracked content\n' > "$FIXTURE/tracked.txt"
rm "$FIXTURE/removed.txt"
printf 'untracked content\n' > "$FIXTURE/untracked.txt"

SOURCE_ROOT="$FIXTURE" "$ROOT/script/stage_native_snapshot.sh" "$SNAPSHOT" >/dev/null

[[ "$(<"$SNAPSHOT/tracked.txt")" == 'dirty tracked content' ]]
[[ ! -e "$SNAPSHOT/removed.txt" ]]
[[ "$(<"$SNAPSHOT/untracked.txt")" == 'untracked content' ]]
[[ ! -e "$SNAPSHOT/ignored-output.txt" ]]

# A failed source enumeration must abort the stage and remove the partial tree.
mkdir -p "$FIXTURE/bin"
REAL_GIT="$(command -v git)"
printf '%s\n' '#!/bin/bash' \
  'for argument in "$@"; do' \
  '  if [[ "$argument" == diff ]]; then exit 73; fi' \
  'done' \
  "exec \"$REAL_GIT\" \"\$@\"" > "$FIXTURE/bin/git"
chmod +x "$FIXTURE/bin/git"
if PATH="$FIXTURE/bin:$PATH" SOURCE_ROOT="$FIXTURE" "$ROOT/script/stage_native_snapshot.sh" "$FAILED_SNAPSHOT" >/dev/null 2>&1; then
  echo 'Snapshot unexpectedly succeeded after Git diff failure.' >&2
  exit 1
fi
[[ ! -e "$FAILED_SNAPSHOT" ]]
printf 'stage_native_snapshot fixture passed\n'
