#!/bin/bash
# Shared toolchain lookup; NODE and YARN_JS can point at other installations.
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
if [[ -z "${NODE:-}" ]]; then
  for candidate in "$(command -v node || true)" "$HOME/.cache/codex-runtimes/codex-primary-runtime/dependencies/node/bin/node"; do
    if [[ -x "$candidate" && "$("$candidate" --version)" == v24.* ]]; then
      NODE="$candidate"
      break
    fi
  done
fi
[[ -n "${NODE:-}" && -x "$NODE" ]] || { echo 'Set NODE to a Node.js 24 executable.' >&2; exit 1; }
[[ "$("$NODE" --version)" == v24.* ]] || { echo 'This pinned editor build requires Node.js 24; set NODE accordingly.' >&2; exit 1; }
export PATH="$(dirname "$NODE"):$PATH"
YARN_JS="${YARN_JS:-/private/tmp/excalidraw-yarn/package/bin/yarn.js}"
if [[ ! -f "$YARN_JS" ]]; then
  mkdir -p /private/tmp/excalidraw-yarn
  curl -fL https://registry.npmjs.org/yarn/-/yarn-1.22.22.tgz -o /private/tmp/excalidraw-yarn.tgz
  echo 'c17d3797fb9a9115bf375e31bfd30058cac6bc9c3b8807a3d8cb2094794b51ca  /private/tmp/excalidraw-yarn.tgz' | shasum -a 256 -c -
  tar -xzf /private/tmp/excalidraw-yarn.tgz -C /private/tmp/excalidraw-yarn
fi
