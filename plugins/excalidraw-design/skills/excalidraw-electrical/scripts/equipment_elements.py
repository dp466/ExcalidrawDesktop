#!/usr/bin/env python3
"""Original editable equipment; terminal positions come from inventory, not a pinout."""
import argparse
import json
from pathlib import Path
from wiring_document import COLORS

KINDS = ('battery', 'solar', 'mppt', 'inverter', 'gx', 'busbar', 'fuse',
         'disconnect', 'dcdc', 'generator')


def component(device, x=None, y=None, scale=1):
    if device['kind'] not in KINDS or scale <= 0:
        raise ValueError('Unknown equipment kind or nonpositive scale')
    identifier, kind = device['id'], device['kind']
    x = device.get('x', 0) if x is None else x
    y = device.get('y', 0) if y is None else y
    w, h = device.get('width', 240), device.get('height', 160)
    group, result = identifier + '-group', []

    def shape(typ, name, px, py, width, height, **kwargs):
        e = {'id': identifier if name == 'root' else identifier + '-' + name,
             'type': typ, 'x': x + px*scale, 'y': y + py*scale,
             'width': width*scale, 'height': height*scale,
             'strokeColor': '#343d4b', 'backgroundColor': 'transparent',
             'fillStyle': 'solid', 'strokeWidth': 1.5*scale, 'roughness': .7,
             'groupIds': [group], 'customData': {'componentRoot': identifier, 'intentionalOverlap': True}}
        e.update(kwargs); result.append(e); return e

    def line(name, points, **kwargs):
        left, top = min(p[0] for p in points), min(p[1] for p in points)
        return shape('line', name, left, top, max(p[0] for p in points)-left,
                     max(p[1] for p in points)-top,
                     points=[[(a-left)*scale, (b-top)*scale] for a, b in points], **kwargs)

    def text(name, value, px, py, width, size=20, color='#343d4b'):
        e = shape('text', name, px, py, width, 0, text=value, fontSize=size*scale,
                  fontFamily=5, strokeColor=color, autoResize=False)
        e.pop('height'); return e

    # An invisible group root is a component identifier, never the wire attachment.
    root = shape('rectangle', 'root', 0, 0, w, h, opacity=0)
    root['customData']['electrical_device'] = device
    blue = '#1971c2'
    if kind == 'solar':
        shape('rectangle', 'panel', 8, 8, w-16, h-16, backgroundColor='#343d4b')
        for row in range(4):
            for col in range(6):
                shape('rectangle', 'cell-%s-%s' % (row, col), 17+col*(w-34)/6,
                      17+row*(h-34)/4, (w-40)/6-5, (h-40)/4-5,
                      backgroundColor='#cbd5e1', strokeWidth=.6*scale, roughness=.3)
    elif kind == 'battery':
        shape('rectangle', 'case', 0, 15, w, h-15, backgroundColor='#e2e8f0', roundness={'type': 3})
        line('handle', [(w*.32, 45), (w*.32, 32), (w*.68, 32), (w*.68, 45)], strokeWidth=4*scale)
        shape('rectangle', 'plate', w*.15, h*.4, w*.7, h*.36, backgroundColor='#f8fafc')
        text('hardware', 'Battery', w*.25, h*.49, w*.6, 24)
        for px in (10, w-20): line('rib-'+str(px), [(px, 38), (px, h-10)], strokeWidth=4*scale)
    elif kind in ('mppt', 'inverter', 'gx', 'dcdc'):
        shape('rectangle', 'case', 8, 5, w-16, h-20, backgroundColor=blue, roundness={'type': 3})
        for side in (0, w-10):
            shape('rectangle', 'ear-'+str(side), side, h*.3, 10, h*.4, backgroundColor='#657080')
            shape('ellipse', 'mount-'+str(side), side+2, h*.48, 6, 6, backgroundColor='#ffffff')
        shape('rectangle', 'stripe', 10, h*.44, w-20, 8, backgroundColor='#ffa94d', strokeWidth=0)
        text('hardware', {'mppt':'MPPT', 'inverter':'Inverter / charger', 'gx':'System controller', 'dcdc':'DC–DC'}[kind],
             22, h*.14, w-40, 22, '#ffffff')
        if kind != 'gx':
            for i in range(5): line('vent-'+str(i), [(25+i*12, h*.65), (25+i*12, h*.83)], strokeWidth=2*scale)
        shape('rectangle', 'strip', 16, h-30, w-32, 15, backgroundColor='#343d4b')
        shape('ellipse', 'status', w-35, h*.25, 7, 7, backgroundColor='#69af99')
    elif kind == 'busbar':
        shape('rectangle', 'base', 0, h*.25, w, h*.5, backgroundColor='#657080')
        shape('rectangle', 'metal', 8, h*.32, w-16, h*.34, backgroundColor='#cbd5e1')
        for i in range(4): shape('ellipse', 'stud-'+str(i), 25+i*(w-60)/3, h*.43, 14, 14, backgroundColor='#f8fafc')
    elif kind == 'fuse':
        shape('rectangle', 'lug-in', w*.35, 0, w*.3, h, backgroundColor='#cbd5e1')
        shape('rectangle', 'fuse', w*.15, h*.28, w*.7, h*.45, backgroundColor='#f8fafc')
        text('hardware', 'Fuse', w*.27, h*.39, w*.6, 22)
        for yy in (8, h-23): shape('ellipse', 'hole-'+str(yy), w*.43, yy, 15, 15, backgroundColor='#ffffff')
    elif kind == 'disconnect':
        shape('rectangle', 'plate', 12, 8, w-24, h-16, backgroundColor='#f1f5f9')
        shape('ellipse', 'rotor', w*.2, h*.15, w*.6, h*.7, backgroundColor='#e03131')
        line('handle', [(w*.5, h*.25), (w*.5, h*.7)], strokeColor='#ffffff', strokeWidth=9*scale)
        text('hardware', 'OFF / ON', w*.23, h*.79, w*.6, 18)
    else:
        line('frame', [(5, h-8), (5, 10), (w-5, 10), (w-5, h-8)], strokeWidth=5*scale)
        shape('rectangle', 'tank', 18, 18, w-36, h*.25, backgroundColor='#e03131', roundness={'type':3})
        shape('rectangle', 'engine', w*.2, h*.48, w*.48, h*.4, backgroundColor='#cbd5e1')
        shape('rectangle', 'panel', w*.1, h*.3, w*.8, h*.24, backgroundColor='#e2e8f0')
        for i in range(3): shape('ellipse', 'outlet-'+str(i), w*.25+i*35, h*.36, 14, 14, backgroundColor='#657080')
        shape('ellipse', 'wheel', w*.76, h*.75, 40, 40, backgroundColor='#657080')
    for name, terminal in device['terminals'].items():
        px, py = terminal['x'], terminal['y']
        e = shape('ellipse', 'terminal-'+name, px-5, py-5, 10, 10,
                  strokeColor=COLORS[terminal['kind']], backgroundColor='#ffffff', roughness=0)
        e['customData']['electrical_terminal'] = {'device': identifier, 'terminal': name, **terminal}
        label_width = max(100, len(name)*14)
        label_y = -35 if py <= 0 else h+10 if py >= h else py-12
        label = text('terminal-'+name+'-label', name, px+12, label_y,
                     label_width, 18, COLORS[terminal['kind']])
    text('caption', identifier+'\n'+device['model'], 0, h+64, w+80, 22)
    return result


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('inventory', type=Path)
    parser.add_argument('--device', required=True)
    args = parser.parse_args()
    spec = json.loads(args.inventory.read_text())
    device = next((d for d in spec['devices'] if d['id'] == args.device), None)
    if device is None: parser.error('Unknown device')
    print(json.dumps(component(device), ensure_ascii=False, indent=2))
