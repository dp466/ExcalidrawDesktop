#!/usr/bin/env python3
"""Build a deterministic, portable skills ZIP for app users; no local credentials."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import zipfile

ROOT = Path(__file__).resolve().parent.parent
PLUGIN = ROOT / 'plugins/excalidraw-design'
WRAPPER = 'excalidraw-diagram-plugin'


def package_files():
    manifest = json.loads((PLUGIN / 'plugin.json').read_text())
    for compatibility in ('.codex-plugin/plugin.json', '.claude-plugin/plugin.json'):
        other = json.loads((PLUGIN / compatibility).read_text())
        if (other['name'], other['version']) != (manifest['name'], manifest['version']):
            raise ValueError('Plugin manifests disagree')
    interface = manifest.get('extensions', {}).get('com.openai', {}).get('interface', {})
    if len(interface.get('shortDescription', '')) > 30:
        raise ValueError('Plugin listing subtitle must be at most 30 characters')
    files = {}
    for path in sorted(PLUGIN.rglob('*')):
        parts = path.relative_to(PLUGIN).parts
        if '__pycache__' in parts or path.name.startswith('.') and len(parts) > 1:
            continue
        if path.is_symlink():
            raise ValueError(f'Plugin files must be portable, not symlinks: {path.name}')
        if not path.is_file():
            continue
        if path.suffix not in ('.json', '.yaml', '.md', '.py', '.svg', '.excalidrawlib') and path.name != 'LICENSE':
            raise ValueError(f'Unexpected plugin artifact: {path.name}')
        data = path.read_bytes()
        text = data.decode('utf-8')
        if '/Users/' in text or re.search(r'Bearer\s+[A-Za-z0-9_-]{24,}', text):
            raise ValueError(f'Machine-specific path or credential in {path.name}')
        files['plugins/excalidraw-design/' + path.relative_to(PLUGIN).as_posix()] = data
    required = ['skills/excalidraw-design/SKILL.md', 'skills/excalidraw-network/SKILL.md',
                'skills/excalidraw-electrical/SKILL.md',
                'skills/excalidraw-electrical/assets/fictional-wiring.json',
                'skills/excalidraw-electrical/scripts/wiring_document.py',
                'skills/excalidraw-electrical/scripts/equipment_elements.py',
                'skills/excalidraw-network/assets/aurora-network.json',
                'skills/excalidraw-design/scripts/icon_elements.py',
                'skills/excalidraw-network/scripts/network_document.py']
    if any('plugins/excalidraw-design/'+name not in files for name in required):
        raise ValueError('All three diagram skills and their examples/helpers must be bundled')
    files['.agents/plugins/marketplace.json'] = (ROOT / '.agents/plugins/marketplace.json').read_bytes()
    files['.claude-plugin/marketplace.json'] = (json.dumps({
        'name': 'excalidraw-desktop', 'owner': manifest['author'],
        'plugins': [{'name': manifest['name'], 'source': './plugins/excalidraw-design',
                     'description': manifest['description']}]
    }, indent=2)+'\n').encode()
    files['README.md'] = files['plugins/excalidraw-design/README.md']
    hashes = {name: hashlib.sha256(data).hexdigest() for name, data in sorted(files.items())}
    files['package-manifest.json'] = (json.dumps({'name': manifest['name'], 'version': manifest['version'],
                                                'files_sha256': hashes}, indent=2)+'\n').encode()
    return files, manifest


def build(output, package_format='marketplace'):
    files, manifest = package_files()
    if package_format not in ('marketplace', 'plugin'):
        raise ValueError('Unknown package format')
    wrapper = WRAPPER
    if package_format == 'plugin':
        prefix = 'plugins/excalidraw-design/'
        files = {name[len(prefix):]: data for name,data in files.items() if name.startswith(prefix)}
        files['package-manifest.json'] = (json.dumps({'name':manifest['name'],'version':manifest['version'],
            'files_sha256':{name:hashlib.sha256(data).hexdigest() for name,data in sorted(files.items())}},indent=2)+'\n').encode()
        wrapper = manifest['name']
    output.parent.mkdir(parents=True, exist_ok=True)
    temporary = output.with_suffix('.zip.tmp')
    with zipfile.ZipFile(temporary, 'w', compression=zipfile.ZIP_DEFLATED, compresslevel=9) as archive:
        for name, data in sorted(files.items()):
            info = zipfile.ZipInfo(wrapper+'/'+name, date_time=(2026, 1, 1, 0, 0, 0))
            info.compress_type = zipfile.ZIP_DEFLATED
            info.external_attr = 0o100644 << 16
            archive.writestr(info, data)
    temporary.replace(output)
    return {'version': manifest['version'], 'format': package_format, 'files': len(files), 'bytes': output.stat().st_size,
            'sha256': hashlib.sha256(output.read_bytes()).hexdigest()}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--format', choices=('marketplace','plugin'), default='marketplace')
    args = parser.parse_args()
    print(json.dumps(build(args.output,args.format)))
