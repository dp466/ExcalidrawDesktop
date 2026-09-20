#!/usr/bin/env python3
"""Record source identities and exact bundled assets for a local Release."""
import hashlib
import json
import os
import subprocess
import sys
from pathlib import Path

root = Path(__file__).resolve().parent.parent
app = Path(sys.argv[1]).resolve()
git_root = Path(os.environ.get('NATIVE_GIT_ROOT', str(root))).resolve()
editor_root = Path(os.environ.get('EDITOR_GIT_ROOT', str(root / 'editor'))).resolve()
def git(*args):
    return subprocess.check_output(['git', '-C', str(git_root), *args]).decode().strip()
def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()
paths = git('ls-files', '--cached', '--others', '--exclude-standard').splitlines()
sources = {p: sha(root / p) for p in sorted(set(paths))
           if (root / p).is_file() and not p.startswith('editor/')}
assets_dir = app / 'Contents/Resources/excalidraw-latest'
assets = {str(p.relative_to(assets_dir)): sha(p)
          for p in sorted(assets_dir.rglob('*')) if p.is_file()}
manifest = {
    'native_base_revision': git('rev-parse', 'HEAD'),
    'native_source_files_sha256': sources,
    'editor_base_revision': subprocess.check_output(
        ['git', '-C', str(editor_root), 'rev-parse', 'HEAD']).decode().strip(),
    'editor_patch_sha256': sha(root / 'patches/editor.patch'),
    'swift_package_lock_sha256': sha(root / 'ExcalidrawZ.xcodeproj/project.xcworkspace/xcshareddata/swiftpm/Package.resolved'),
    'dependency_patch_sha256': sha(root / 'patches/chocofordkit-xcode27.patch'),
    'xcode': subprocess.check_output(['xcodebuild', '-version']).decode().strip(),
    'node': subprocess.check_output([os.environ['NODE'], '--version']).decode().strip(),
    'yarn': subprocess.check_output([os.environ['NODE'], os.environ['YARN_JS'], '--version']).decode().strip(),
    'configuration': 'Release', 'architecture': 'arm64',
    'signing': 'local build; not notarized',
    'bundled_editor_assets_sha256': assets,
}
output = json.dumps(manifest, indent=2) + '\n'
(root / 'build').mkdir(exist_ok=True)
(root / 'build/release-manifest.json').write_text(output)
(app / 'Contents/Resources/LocalBuildManifest.json').write_text(output)
print('Recorded native/editor revisions and', len(assets), 'bundled asset checksums.')
