#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MODE="${1:-run}"
APP="${EXCALIDRAW_INSTALL_DIR:-/Applications}/ExcalidrawDesktop.app"
# Address only this fork, not another installed ExcalidrawZ process.
if pgrep -f "$APP/Contents/MacOS/ExcalidrawZ" >/dev/null; then
  echo 'Close the running ExcalidrawDesktop window before rebuilding so pending saves can finish.' >&2
  exit 1
fi
"$ROOT/script/build_release.sh"
case "$MODE" in
  --debug) lldb -- "$APP/Contents/MacOS/ExcalidrawZ" ;;
  run|--verify|--logs|--telemetry)
    open -n "$APP"
    if [[ "$MODE" == --verify ]]; then
      sleep 2
      pgrep -f "$APP/Contents/MacOS/ExcalidrawZ" >/dev/null
    elif [[ "$MODE" == --logs || "$MODE" == --telemetry ]]; then
      /usr/bin/log stream --level info --predicate 'process == "ExcalidrawZ"'
    fi ;;
  *) echo 'Usage: build_and_run.sh [--verify|--debug|--logs|--telemetry]' >&2; exit 2 ;;
esac
