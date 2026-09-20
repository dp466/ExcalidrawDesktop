#!/usr/bin/env python3
"""Install the local fork without replacing a running or unrelated application."""
import os
import plistlib
from pathlib import Path
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
SOURCE = ROOT / "build/Release/ExcalidrawZ.app"
DESTINATION = Path(os.environ.get("EXCALIDRAW_INSTALL_DIR", "/Applications")) / "ExcalidrawDesktop.app"
BUNDLE_ID = "local.dparadis.ExcalidrawDesktop"


def bundle_id(app):
    with (app / "Contents/Info.plist").open("rb") as stream:
        return plistlib.load(stream)["CFBundleIdentifier"]


def main():
    if bundle_id(SOURCE) != BUNDLE_ID:
        raise SystemExit("Refusing to install an unexpected source bundle.")
    if DESTINATION.is_symlink():
        raise SystemExit("Refusing to replace a symbolic-link application.")
    if DESTINATION.exists() and bundle_id(DESTINATION) != BUNDLE_ID:
        raise SystemExit("Refusing to replace an unrelated application.")
    executable = str(DESTINATION / "Contents/MacOS/ExcalidrawZ")
    commands = subprocess.check_output(["/bin/ps", "-axo", "command="], text=True)
    if any(line == executable or line.startswith(executable + " ") for line in commands.splitlines()):
        raise SystemExit("Quit ExcalidrawDesktop so pending saves finish, then run script/install_release.py again.")

    DESTINATION.parent.mkdir(parents=True, exist_ok=True)
    staging = Path(tempfile.mkdtemp(prefix=".ExcalidrawDesktop-install-", dir=DESTINATION.parent))
    candidate = staging / "candidate.app"
    backup = staging / "previous.app"
    try:
        subprocess.run(["/usr/bin/ditto", str(SOURCE), str(candidate)], check=True)
        if bundle_id(candidate) != BUNDLE_ID:
            raise RuntimeError("Copied bundle failed identity verification.")
        # ditto preserves old bundle timestamps; advertise changed contents to macOS.
        # Do this before replacing the existing app so a failure leaves it intact.
        os.utime(candidate, None)
        if DESTINATION.exists():
            DESTINATION.rename(backup)
        try:
            candidate.rename(DESTINATION)
        except BaseException:
            if backup.exists():
                backup.rename(DESTINATION)
            raise
        shutil.rmtree(staging)
    except BaseException:
        # Preserve the previous app if rollback itself failed.
        if not backup.exists():
            shutil.rmtree(staging, ignore_errors=True)
        raise
    print(f"Installed app: {DESTINATION}")


if __name__ == "__main__":
    main()
