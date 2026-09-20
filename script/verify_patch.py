#!/usr/bin/env python3
"""Reject reused checkouts with source changes outside the recorded patch."""
import subprocess
import sys
from pathlib import Path

checkout = Path(sys.argv[1]).resolve()
expected = Path(sys.argv[2]).read_bytes()
actual = subprocess.check_output(['git', 'diff', '--binary', 'HEAD'], cwd=checkout)
paths = subprocess.check_output(
    ['git', 'ls-files', '--others', '--exclude-standard', '-z'], cwd=checkout
).decode().split('\0')
for name in sorted(filter(None, paths)):
    result = subprocess.run(['git', 'diff', '--no-index', '--binary', '/dev/null', name],
                            cwd=checkout, stdout=subprocess.PIPE)
    if result.returncode != 1:
        raise SystemExit('Cannot verify untracked source: ' + name)
    actual += result.stdout
if actual != expected:
    raise SystemExit('Unrecorded source changes in ' + str(checkout) +
                     '; preserve them and update the patch before building.')
print('Verified exact patch for ' + checkout.name)
