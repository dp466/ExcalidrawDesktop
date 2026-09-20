#!/usr/bin/env python3
"""Exercise source contamination checks in an isolated temporary checkout."""
import subprocess
import sys
import tempfile
from pathlib import Path

verifier = Path(__file__).with_name('verify_patch.py').resolve()
with tempfile.TemporaryDirectory(prefix='excalidraw-patch-test-') as directory:
    root = Path(directory)
    repo = root / 'source'
    repo.mkdir()

    def git(*args):
        return subprocess.check_output(['git', *args], cwd=repo, stderr=subprocess.PIPE)

    git('init')
    (repo / 'source.txt').write_text('base\n')
    git('add', '.')
    git('-c', 'user.name=Fixture', '-c', 'user.email=fixture@example.invalid',
        '-c', 'commit.gpgsign=false', 'commit', '-m', 'Fixture')
    (repo / 'source.txt').write_text('recorded change\n')
    patch = root / 'expected.patch'
    patch.write_bytes(git('diff', '--binary', 'HEAD'))

    def verify(expected_success):
        result = subprocess.run([sys.executable, str(verifier), str(repo), str(patch)],
                                capture_output=True)
        assert (result.returncode == 0) == expected_success, result.stderr.decode()

    verify(True)
    (repo / 'source.txt').write_text('recorded change\nextra change\n')
    verify(False)
    (repo / 'source.txt').write_text('recorded change\n')
    (repo / 'unrecorded.txt').write_text('unrecorded source\n')
    verify(False)
    untracked = subprocess.run(['git', 'diff', '--no-index', '--binary',
                                '/dev/null', 'unrecorded.txt'], cwd=repo,
                               capture_output=True)
    assert untracked.returncode == 1
    patch.write_bytes(patch.read_bytes() + untracked.stdout)
    verify(True)
print('Exact patch verification: recorded, changed, and untracked source checks passed')
