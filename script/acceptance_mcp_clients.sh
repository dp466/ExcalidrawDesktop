#!/bin/bash
set -euo pipefail
source "$(dirname "$0")/toolchain.sh"
# Build the editor/native snapshot first (test_local.sh or the local build
# workflow). This opt-in suite stays alive for separate real CLI invocations.
SOURCE_ROOT="${NATIVE_SOURCE_ROOT:-$ROOT}"
DERIVED="${DERIVED:-${TMPDIR:-/private/tmp}/excalidraw-test-derived-data}"
PACKAGES="${PACKAGES:-${TMPDIR:-/private/tmp}/excalidraw-test-source-packages}"
EXCALIDRAW_MCP_REAL_CLIENT_TEST=1 TEST_RUNNER_EXCALIDRAW_MCP_REAL_CLIENT_TEST=1 \
xcodebuild -project "$SOURCE_ROOT/ExcalidrawZ.xcodeproj" -scheme ExcalidrawZ -configuration Release \
  -destination 'platform=macOS,arch=arm64' \
  -derivedDataPath "$DERIVED" -clonedSourcePackagesDirPath "$PACKAGES" \
  -disableAutomaticPackageResolution -skipPackagePluginValidation \
  CODE_SIGNING_ALLOWED=NO ONLY_ACTIVE_ARCH=YES ENABLE_TESTABILITY=YES \
  -only-testing:ExcalidrawZTests/MCPRealClientAcceptanceTests/testRealClientsAcceptanceHarness test
