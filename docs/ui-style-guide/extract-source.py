#!/usr/bin/env python3
"""Rebuild the lexical style index from tracked source plus dirty working files."""
from pathlib import Path
import re, json, subprocess, hashlib, collections
ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent
EXTENSIONS = {'.swift', '.m', '.h', '.tsx', '.ts', '.js', '.scss', '.css', '.html'}
PATTERN = re.compile(r'\.(?:font|fontWeight|foregroundStyle|foregroundColor|background|padding|frame|opacity|shadow|cornerRadius|clipShape|strokeBorder|stroke|tint|buttonStyle|editorChrome\w+|modernButtonStyle|animation|transition|scaleEffect|blur|offset|lineLimit|lineSpacing|tracking|kerning|truncationMode|contentShape|accessibility\w+|focusable|focused|help|hoverCursor|keyboardShortcut|onHover|aspectRatio|presentation\w+|controlSize|listStyle|formStyle|scroll\w+|safeAreaInset|overlay|imageScale)\b|(?:HStack|VStack|LazyVGrid|GridItem|RoundedRectangle|Circle|Capsule|LinearGradient|AngularGradient)\(|(?:static\s+let|private\s+let|var)\s+\w*(?:Width|Height|Size|Spacing|Padding|Radius|Duration)\b|(?:--[\w-]+|font-[\w-]+|line-height|color|background[\w-]*|padding[\w-]*|margin[\w-]*|gap|row-gap|column-gap|border[\w-]*|box-shadow|width|height|min-width|max-width|min-height|max-height|opacity|transition|animation|outline[\w-]*|z-index|cursor)\s*:')
def git(base, *args):
 return subprocess.check_output(['git','-C',str(base),*args])
records=[]; excluded=[]; statuses={}
for base, folders in [(ROOT,['ExcalidrawZ','QuickLookPreviewExtension']), (ROOT/'editor',['packages','excalidraw-app'])]:
 statuses[str(base.relative_to(ROOT))]=git(base,'status','--short').decode()
 dirty=set(git(base,'diff','--name-only','HEAD','-z').decode().split('\0'))
 names=git(base,'ls-files','-z','--',*folders).decode().split('\0')
 for name in sorted(set(names)):
  if not name:continue
  p=base/name
  if p.suffix not in EXTENSIONS and not (p.name=='Contents.json' and '.colorset' in name):continue
  if '/Resources/MathRendering/' in name or '__snapshots__' in name:
   excluded.append(str(p.relative_to(ROOT)));continue
  data=p.read_bytes() if name in dirty else git(base,'show','HEAD:'+name)
  s=data.decode(errors='replace'); ls=s.splitlines()
  entries=[{'line':n,'text':l.strip()[:500]} for n,l in enumerate(ls,1) if len(l)<3000 and PATTERN.search(l) and not l.lstrip().startswith(('//','*'))]
  records.append({'path':str(p.relative_to(ROOT)),'lines':len(ls),'sha256':hashlib.sha256(data).hexdigest(),'working_tree_override':name in dirty,'test':bool(re.search(r'(^|/)(tests?|__tests__)/|\.(test|spec)\.',name)),'declarations':entries})
meta={'date':'2026-09-20','main_commit':git(ROOT,'rev-parse','HEAD').decode().strip(),'editor_commit':git(ROOT/'editor','rev-parse','HEAD').decode().strip(),'method':'Lexical scan of tracked authored source, using HEAD blobs for clean files and working-tree content for modified files. Includes inactive platform/build branches, tests and previews. Matches are evidence pointers, not proof of runtime reachability or complete multiline expressions. Vendor math bundles, snapshots, dependency checkouts, generated build output, untracked files and editor examples are excluded.','file_count':len(records),'files_with_matches':sum(bool(r['declarations']) for r in records),'declaration_count':sum(len(r['declarations']) for r in records),'excluded_files':excluded,'working_tree_status':statuses}
(OUT/'source-inventory.json').write_text(json.dumps({'metadata':meta,'files':records},indent=2)+'\n')
md=['# UI source coverage and declaration index','',meta['method'],'',f"Scanned {meta['file_count']} files; {meta['files_with_matches']} contain lexical UI matches; {meta['declaration_count']} matching lines.",'','Companion to STYLE-GUIDE.md. The guide interprets active desktop conventions; this appendix preserves exact source locations. No-match files are recorded in source-inventory.json.','']
for r in records:
 if not r['declarations']:continue
 md += [f"## {r['path']}",'',f"{r['lines']} lines. {'Test source; not runtime UI.' if r['test'] else 'Check platform/build reachability at the call site.'}",'','```text']+[f"{d['line']}: {d['text']}" for d in r['declarations']]+['```','']
(OUT/'SOURCE-INDEX.md').write_text('\n'.join(md))
print(json.dumps({k:v for k,v in meta.items() if k not in ['excluded_files','working_tree_status']},indent=2))
print('Native Swift:',sum(r['path'].endswith('.swift') for r in records))
print('CSS/SCSS:',sum(r['path'].endswith(('.css','.scss')) for r in records))
