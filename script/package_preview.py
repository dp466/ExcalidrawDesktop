#!/usr/bin/env python3
"""Prepare a local preview DMG; this does not authorize public redistribution."""
import argparse
import hashlib
import json
import plistlib
import shutil
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--app', type=Path, required=True)
parser.add_argument('--editor', type=Path, required=True)
parser.add_argument('--packages', type=Path, required=True, help='Swift checkouts directory')
parser.add_argument('--swifty-dmg', type=Path, required=True)
parser.add_argument('--output', type=Path, required=True, help='New, empty output directory')
args = parser.parse_args()
original_manifest = json.loads((args.app / 'Contents/Resources/LocalBuildManifest.json').read_text())
editor_revision = subprocess.check_output(
    ['git', '-C', str(args.editor), 'rev-parse', 'HEAD'], text=True).strip()
if editor_revision != original_manifest['editor_base_revision']:
    raise SystemExit('Notice-source editor revision does not match the built editor')
subprocess.run(['python3', str(ROOT / 'script/verify_patch.py'), str(args.editor),
                str(ROOT / 'patches/editor.patch')], check=True)
for name, expected in original_manifest['native_source_files_sha256'].items():
    if name.startswith(('ExcalidrawZ/', 'ExcalidrawZTests/', 'ExcalidrawZ.xcodeproj/')):
        source = ROOT / name
        if not source.is_file() or hashlib.sha256(source.read_bytes()).hexdigest() != expected:
            raise SystemExit(f'Built source does not match checkout: {name}')
for name, expected in original_manifest['bundled_editor_assets_sha256'].items():
    asset = args.app / 'Contents/Resources/excalidraw-latest' / name
    if not asset.is_file() or hashlib.sha256(asset.read_bytes()).hexdigest() != expected:
        raise SystemExit(f'Bundled editor integrity mismatch: {name}')
out = args.output.resolve()
out.mkdir(parents=True, exist_ok=False)
app = out / 'ExcalidrawDesktop.app'
subprocess.run(['ditto', str(args.app.resolve()), str(app)], check=True)
# Xcode can leave the test bundle inside its host app after a validation run.
for test_bundle in app.rglob('*.xctest'):
    shutil.rmtree(test_bundle)
notices = app / 'Contents/Resources/Licenses'
notices.mkdir(exist_ok=True)
shutil.copy2(ROOT / 'LICENSE', notices / 'ExcalidrawZ-MIT.txt')
shutil.copy2(args.editor / 'LICENSE', notices / 'Excalidraw-MIT.txt')

def notice_files(root):
    return sorted(p for p in root.rglob('*') if p.is_file()
                  and not any(s.startswith('.') for s in p.relative_to(root).parts)
                  and p.name.lower().startswith(('license', 'licence', 'copying', 'notice')))

missing = []
parts = ['Third-party source notices. Includes build-time dependencies.\n']
for package in sorted(args.packages.iterdir()):
    if not package.is_dir():
        continue
    files = notice_files(package)
    if not files:
        missing.append(package.name)
    for path in files:
        parts.append(f'\n\n===== {package.name}/{path.relative_to(package)} =====\n')
        parts.append(path.read_text(errors='replace'))
for path in notice_files(args.editor / 'node_modules'):
    parts.append(f'\n\n===== npm/{path.relative_to(args.editor / "node_modules")} =====\n')
    parts.append(path.read_text(errors='replace'))
for path in sorted((args.editor / 'packages/excalidraw/fonts').glob('*/index.ts')):
    parts.append(f'\n\n===== Font metadata: {path.parent.name} =====\n')
    parts.append(path.read_text())
(notices / 'ThirdPartyNotices.txt').write_text(''.join(parts))
(notices / 'REVIEW-REQUIRED.txt').write_text(
    'This is a locally prepared preview, not cleared for public distribution.\n'
    'No notice found in these pinned Swift checkouts: ' + ', '.join(missing) + '\n'
    'Resolve licensing and complete dependency review before publishing.\n')

# Seal nested code from the inside out. This provides integrity, not Developer ID trust.
for path in sorted(app.rglob('*')):
    if path.is_file() and not path.is_symlink():
        with path.open('rb') as stream:
            magic = stream.read(4)
        if magic in (b'\xcf\xfa\xed\xfe', b'\xce\xfa\xed\xfe', b'\xca\xfe\xba\xbe'):
            subprocess.run(['codesign', '--force', '--sign', '-', '--timestamp=none', str(path)], check=True)
bundles = [p for p in app.rglob('*') if p.is_dir() and not p.is_symlink()
           and p.suffix in ('.framework', '.app', '.xpc', '.appex')]
for path in sorted(bundles, key=lambda p: len(p.parts), reverse=True) + [app]:
    subprocess.run(['codesign', '--force', '--sign', '-', '--timestamp=none', str(path)], check=True)
subprocess.run(['codesign', '--verify', '--deep', '--strict', str(app)], check=True)
info = plistlib.loads((app / 'Contents/Info.plist').read_bytes())
name = f'ExcalidrawDesktop-{info["CFBundleShortVersionString"]}-{info["CFBundleVersion"]}-arm64-preview.dmg'
dmg = out / name
subprocess.run([str(args.swifty_dmg.resolve()), str(app), '--output', str(dmg),
                '--nobackground', '--skipcodesign', '--verbose'], check=True)
subprocess.run(['hdiutil', 'verify', str(dmg)], check=True)
digest = hashlib.sha256(dmg.read_bytes()).hexdigest()
(out / 'SHA256SUMS.txt').write_text(f'{digest}  {name}\n')
report = {'artifact': name, 'sha256': digest, 'version': info['CFBundleShortVersionString'],
          'build': info['CFBundleVersion'], 'architecture': 'arm64',
          'minimum_macos_declared': info['LSMinimumSystemVersion'],
          'signing': 'ad hoc; no Developer ID; not notarized',
          'distribution_status': 'draft; licensing review required',
          'swift_checkouts_without_notices': missing,
          'notice_editor_revision': editor_revision,
          'packaging_sources_sha256': {name: hashlib.sha256((ROOT / name).read_bytes()).hexdigest()
              for name in ('script/package_preview.py', 'patches/swiftydmg-cli.patch',
                           'patches/swiftydmg-hdiutil-status.patch')},
          'packaging_checkout_commit': subprocess.check_output(['git', '-C', str(ROOT), 'rev-parse', 'HEAD'], text=True).strip(),
          'native_sources_match_build_manifest': True,
          'original_build_manifest_sha256': hashlib.sha256((app / 'Contents/Resources/LocalBuildManifest.json').read_bytes()).hexdigest()}
(out / 'package-manifest.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps(report, indent=2))
