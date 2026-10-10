#!/usr/bin/env python3
"""Check documentation consistency and scene traceability; no design certification."""
import argparse
import csv
import json
import math
from pathlib import Path
import sys

KINDS = {'dc_positive', 'dc_negative', 'ac_line', 'ac_neutral',
         'protective_earth', 'communication', 'dry_contact', 'sensor'}
COLORS = {'dc_positive': '#e03131', 'dc_negative': '#1971c2',
          'ac_line': '#343d4b', 'ac_neutral': '#657080',
          'protective_earth': '#2f9e44', 'communication': '#9c36b5',
          'dry_contact': '#868e96', 'sensor': '#2c8e88'}


def endpoint_text(end):
    return end['device'] + '/' + end['terminal']


def wire_label(wire):
    return (wire['id'] + '  ' + endpoint_text(wire['source']) + ' → ' +
            endpoint_text(wire['destination']) + '\n' + wire['domain'] + ' / ' +
            wire['kind'] + ' / ' + wire['gauge'])


def validate(spec):
    errors, unknowns = [], []
    devices, identifiers = {}, set()
    if not spec.get('devices') or not isinstance(spec.get('wires'), list):
        return {'ok': False, 'errors': ['Need devices and a wires list'], 'unknowns': []}
    for d in spec['devices']:
        identifier = d.get('id')
        if not isinstance(identifier, str) or not identifier or identifier in identifiers:
            errors.append('Missing or repeated device ID'); continue
        identifiers.add(identifier); devices[identifier] = d
        if not all(isinstance(d.get(k), str) and d[k] for k in ('model', 'kind', 'evidence')):
            errors.append(identifier + ': model, illustration kind and evidence required')
        if not isinstance(d.get('terminals'), dict) or not d['terminals']:
            errors.append(identifier + ': explicit terminals required'); continue
        for name, t in d['terminals'].items():
            context = identifier + '/' + name
            if t.get('kind') not in KINDS or not t.get('domain'):
                errors.append(context + ': conductor kind/domain required')
            if any(isinstance(t.get(k), bool) or not isinstance(t.get(k), (int, float))
                   or not math.isfinite(t[k]) for k in ('x', 'y')):
                errors.append(context + ': finite drawing coordinates required')
            if t.get('kind') == 'communication' and not t.get('protocol'):
                errors.append(context + ': explicit communication protocol required')
    net_types = {}
    for w in spec['wires']:
        identifier = w.get('id')
        if not isinstance(identifier, str) or not identifier or identifier in identifiers:
            errors.append('Missing or repeated wire ID'); continue
        identifiers.add(identifier)
        if w.get('kind') not in KINDS:
            errors.append(identifier + ': unsupported conductor kind')
        for k in ('domain', 'net', 'gauge', 'cable', 'core', 'evidence'):
            if not isinstance(w.get(k), str) or not w[k].strip():
                errors.append(identifier + ': explicit ' + k + ' required')
            elif 'TBD' in w[k] or 'unverified' in w[k]:
                unknowns.append(identifier + ': ' + k + ' = ' + w[k])
        key = w.get('net')
        signature = (w.get('kind'), w.get('domain'), w.get('protocol'), w.get('bus'))
        if key in net_types and net_types[key] != signature:
            errors.append(identifier + ': common net mixes conductor classes/domains/protocols')
        net_types[key] = signature
        found = []
        for end in ('source', 'destination'):
            e = w.get(end, {})
            if not isinstance(e, dict):
                errors.append(identifier + ': malformed ' + end); continue
            terminal = devices.get(e.get('device'), {}).get('terminals', {}).get(e.get('terminal'))
            if terminal is None:
                errors.append(identifier + ': unknown ' + end + ' terminal'); continue
            found.append(terminal)
            if terminal.get('kind') != w.get('kind') or terminal.get('domain') != w.get('domain'):
                errors.append(identifier + ': endpoint conductor kind/domain mismatch')
            if w.get('kind') == 'communication':
                if not w.get('protocol') or w['protocol'] != terminal.get('protocol'):
                    errors.append(identifier + ': protocol mismatch')
                if terminal.get('bus') != w.get('bus'):
                    errors.append(identifier + ': communication bus mismatch')
        if w.get('source') == w.get('destination'):
            errors.append(identifier + ': wire cannot connect a terminal to itself')
    return {'ok': not errors, 'errors': errors, 'unknowns': unknowns,
            'devices': len(devices), 'wires': len(spec['wires']),
            'scope': 'Documentation consistency only; no internal-circuit, sizing or completeness proof'}


def merge_pages(value):
    pages = value if isinstance(value, list) else [value]
    if not pages or any(p.get('revision') != pages[0].get('revision') for p in pages):
        raise ValueError('Scene revision changed between pages')
    elements = [e for p in pages for e in p.get('elements', []) if not e.get('isDeleted')]
    if len({e['id'] for e in elements}) != len(elements):
        raise ValueError('Scene pages repeat element IDs')
    totals = [p['total'] for p in pages if 'total' in p]
    if totals and (len(set(totals)) != 1 or len(elements) != totals[0]):
        raise ValueError('Scene pages are incomplete or have inconsistent totals')
    return elements


def audit(spec, scene):
    report = validate(spec)
    errors = list(report['errors'])
    if errors:
        return report
    elements = merge_pages(scene)
    index = {e['id']: e for e in elements}
    for d in spec['devices']:
        root = index.get(d['id'], {})
        if root.get('customData', {}).get('electrical_device') != d:
            errors.append(d['id'] + ': missing/changed device metadata')
        caption = ' '.join(index.get(d['id'] + '-caption', {}).get('text', '').split())
        if d['id'] not in caption or ' '.join(d['model'].split()) not in caption:
            errors.append(d['id'] + ': device tag/model not visible')
        for name, terminal in d['terminals'].items():
            identifier = d['id'] + '-terminal-' + name
            anchor = index.get(identifier, {})
            expected = {'device': d['id'], 'terminal': name, **terminal}
            if anchor.get('customData', {}).get('electrical_terminal') != expected:
                errors.append(identifier + ': terminal metadata missing/changed')
            label = index.get(identifier + '-label', {}).get('text', '')
            if label != name:
                errors.append(identifier + ': terminal name not visible')
    for w in spec['wires']:
        e = index.get(w['id'], {})
        if e.get('customData', {}).get('electrical_wire') != w:
            errors.append(w['id'] + ': wire metadata missing/changed')
        if e.get('type') != 'arrow' or e.get('startArrowhead') is not None or e.get('endArrowhead') is not None:
            errors.append(w['id'] + ': conductor must be a bound connector without flow arrowheads')
        for end, binding in (('source', 'startBinding'), ('destination', 'endBinding')):
            expected = w[end]['device'] + '-terminal-' + w[end]['terminal']
            if (e.get(binding) or {}).get('elementId') != expected:
                errors.append(w['id'] + ': exact ' + end + ' terminal binding missing')
        visible = ' '.join(index.get(w['id'] + '-label', {}).get('text', '').split())
        if visible != ' '.join(wire_label(w).split()):
            errors.append(w['id'] + ': visible wire ID/endpoints/domain/gauge missing')
    if any(e.get('fontFamily') != 5 for e in elements if e['type'] == 'text'):
        errors.append('Authored text is not consistently Excalifont')
    return {**report, 'ok': not errors, 'errors': errors, 'elements': len(elements)}


def schedule(spec, output):
    report = validate(spec)
    if not report['ok']:
        raise ValueError('; '.join(report['errors']))
    with output.open('w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(['Wire', 'Source terminal', 'Destination terminal', 'Class', 'Domain',
                         'Net', 'Cable', 'Core', 'Gauge', 'Evidence'])
        for w in spec['wires']:
            writer.writerow([w['id'], endpoint_text(w['source']), endpoint_text(w['destination']),
                             w['kind'], w['domain'], w['net'], w['cable'], w['core'], w['gauge'], w['evidence']])
    return report


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('action', choices=('validate', 'audit', 'schedule'))
    p.add_argument('inventory', type=Path)
    p.add_argument('--scene', type=Path)
    p.add_argument('--output', type=Path)
    args = p.parse_args(); spec = json.loads(args.inventory.read_text())
    if args.action == 'audit':
        if not args.scene: p.error('audit requires --scene')
        report = audit(spec, json.loads(args.scene.read_text()))
    elif args.action == 'schedule':
        if not args.output: p.error('schedule requires --output')
        report = schedule(spec, args.output)
    else:
        report = validate(spec)
    print(json.dumps(report, ensure_ascii=False, indent=2))
    if not report['ok']: sys.exit(1)


if __name__ == '__main__': main()
