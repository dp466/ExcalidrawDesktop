#!/usr/bin/env python3
"""Emit original native Excalidraw component skeletons, ready for MCP create."""
import argparse
import json
import math
from pathlib import Path

KINDS = ("router", "switch", "firewall", "server", "storage", "cloud", "laptop", "wifi", "warehouse", "shield", "phone", "camera", "printer", "scanner")
INK = "#343d4b"
ADVANCES = json.loads((Path(__file__).resolve().parent.parent / "assets/excalifont-metrics.json").read_text())["advances"]


def wrap_caption(text, font_size, width=202):
    """Wrap Latin captions using bundled Excalifont advances and a small gutter."""
    output=[]
    measure=lambda value: sum(ADVANCES.get(char,.65) for char in value)*font_size
    for paragraph in text.split("\n"):
        current=""
        for word in paragraph.split(" "):
            proposed=(current+" "+word).strip()
            if current and measure(proposed)>width:
                output.append(current)
                current=word
            else:
                current=proposed
        output.append(current)
    return "\n".join(output)


def component(kind, identifier, x=0, y=0, label="", detail="", scale=1, accent=None):
    if kind not in KINDS:
        raise ValueError("Unknown equipment kind: " + kind)
    label=wrap_caption(label,21)
    detail=wrap_caption(detail,16)
    result = []
    group = identifier + "-group"
    palette = {"router":"#dbeafe", "switch":"#ccfbf1", "firewall":"#ffedd5", "server":"#ede9fe", "storage":"#ccfbf1", "cloud":"#dbeafe", "laptop":"#dbeafe", "wifi":"#ccfbf1", "warehouse":"#f1f5f9", "shield":"#ccfbf1", "phone":"#ede9fe", "camera":"#ffedd5"}
    palette.update(printer="#e2e8f0", scanner="#dbeafe")
    fill = accent or palette[kind]

    def shape(element_type, name, px, py, width, height, **fields):
        e = dict(id=identifier if name == "root" else identifier + "-" + name,
                 type=element_type, x=x + px * scale, y=y + py * scale,
                 width=width * scale, height=height * scale,
                 strokeColor=INK, backgroundColor="transparent", fillStyle="solid",
                 strokeWidth=1.7 * scale, strokeStyle="solid", roughness=1,
                 opacity=100, angle=0, groupIds=[group],
                 customData={"component":kind, "componentRoot":identifier})
        e.update(fields)
        result.append(e)
        return e

    def line(name, points, **fields):
        xs, ys = zip(*points)
        left, top = min(xs), min(ys)
        fields.setdefault("roundness", None)
        e = shape("line", name, left, top, max(xs)-left, max(ys)-top,
                  points=[[(a-left)*scale, (b-top)*scale] for a,b in points],
                  **fields)
        return e

    def anchor(width=120, height=95):
        e = shape("ellipse", "root", 0, 0, width, height, opacity=0)
        e["customData"]["intentionalOverlap"] = True
        e["customData"]["role"] = "component_anchor"

    bottom = 100
    if kind == "router":
        shape("ellipse", "root", 10, 18, 100, 70, backgroundColor=fill)
        for i,(dx,dy) in enumerate(((1,0),(-1,0),(0,1),(0,-1))):
            a=(60+dx*8,53+dy*8);b=(60+dx*31,53+dy*22)
            line("route-"+str(i),[a,b],roughness=.5)
            tip=(b[0]-dx*7-dy*5,b[1]-dy*7+dx*5)
            other=(b[0]-dx*7+dy*5,b[1]-dy*7-dx*5)
            line("tip-"+str(i),[tip,b,other],roughness=.5)
        bottom=93
    elif kind == "switch":
        shape("rectangle", "root", 0, 32, 120, 46, backgroundColor=fill, roundness={"type":3})
        for i in range(7):
            shape("rectangle", "port-"+str(i), 10+i*13, 45, 8, 12, roughness=.4, strokeWidth=1.1*scale)
        shape("ellipse", "light", 106, 49, 4, 4, backgroundColor="#57a791",strokeWidth=1*scale)
        line("under",[(4,81),(116,81)],strokeColor="#657080",strokeWidth=1*scale)
        bottom=94
    elif kind == "firewall":
        shape("rectangle", "root", 4, 14, 112, 77, backgroundColor=fill,roundness={"type":3})
        for row in range(1,4):line("course-"+str(row),[(5,14+row*19),(115,14+row*19)],roughness=.7)
        for row in range(4):
            for col in range(3):
                px=24+col*34+(17 if row%2 else 0)
                if px<111:line("brick-"+str(row)+"-"+str(col),[(px,15+row*19),(px,32+row*19)],roughness=.7)
        bottom=99
    elif kind == "server":
        shape("rectangle", "root", 28, 0, 64, 102, backgroundColor=fill,roundness={"type":3})
        for i in range(4):
            shape("rectangle", "bay-"+str(i), 35, 10+i*20, 50, 15, backgroundColor="#ffffff",roughness=.6,strokeWidth=1.2*scale)
            shape("ellipse", "led-"+str(i), 75, 15+i*20, 3, 3, backgroundColor="#69af99",strokeWidth=1*scale)
            line("vent-"+str(i),[(40,17+i*20),(61,17+i*20)],roughness=.4,strokeWidth=1*scale)
        line("feet",[(23,105),(97,105)],roughness=.7)
        bottom=114
    elif kind == "storage":
        anchor()
        line("body",[(12,20),(12,78),(22,90),(60,94),(98,90),(108,78),(108,20)],backgroundColor=fill,roundness={"type":2})
        shape("ellipse", "lid", 12, 6, 96, 30, backgroundColor=fill,roughness=.8)
        for i in range(2):line("stripe-"+str(i),[(12,44+i*20),(26,51+i*20),(60,54+i*20),(94,51+i*20),(108,44+i*20)],roundness={"type":2},roughness=.6)
        bottom=104
    elif kind == "cloud":
        anchor(140,94)
        points=[(15,76),(4,61),(9,44),(25,36),(28,20),(41,10),(58,12),(72,1),(95,5),(106,20),(123,21),(137,35),(140,56),(132,73),(112,80),(32,80),(15,76)]
        line("outline",points,backgroundColor=fill,roundness={"type":2},roughness=.85)
        bottom=98
    elif kind == "laptop":
        shape("rectangle", "root", 20, 15, 82, 59, backgroundColor=fill,roundness={"type":3})
        shape("rectangle", "screen", 26, 21, 70, 46, backgroundColor="#ffffff",strokeWidth=1.2*scale,roughness=.6)
        line("keyboard",[(20,77),(3,94),(118,94),(102,77),(20,77)],backgroundColor="#e2e8f0",roughness=.8)
        line("trackpad",[(48,90),(75,90)],roughness=.5,strokeWidth=1*scale)
        bottom=106
    elif kind == "wifi":
        shape("ellipse", "root", 38, 50, 44, 34, backgroundColor=fill)
        for i in range(3):
            r=18+i*13
            points=[(60+r*math.cos(t),49+r*math.sin(t)) for t in [math.pi+v*math.pi/12 for v in range(13)]]
            line("signal-"+str(i),points,roundness={"type":2},roughness=.55)
        shape("ellipse", "led", 57, 65, 6, 5, backgroundColor="#69af99",strokeWidth=1*scale)
        bottom=101
    elif kind == "warehouse":
        anchor()
        line("building",[(6,33),(60,4),(114,33),(114,91),(6,91),(6,33)],backgroundColor=fill,roughness=.8)
        shape("rectangle", "door", 39, 47, 42, 44, backgroundColor="#ffffff",roughness=.7)
        for i in range(3):line("shutter-"+str(i),[(40,58+i*10),(80,58+i*10)],roughness=.5,strokeWidth=1*scale)
        bottom=104
    elif kind == "shield":
        anchor()
        line("shield",[(60,2),(107,20),(100,62),(83,84),(60,101),(37,84),(20,62),(13,20),(60,2)],backgroundColor=fill,roundness={"type":2},roughness=.8)
        line("check",[(35,50),(53,70),(85,35)],strokeColor="#2c8e88",strokeWidth=3*scale,roughness=.65)
        bottom=111

    elif kind == "phone":
        shape("rectangle", "root", 16, 35, 91, 56, backgroundColor=fill,roundness={"type":3})
        line("handset",[(11,42),(9,25),(18,15),(37,14),(39,31),(82,31),(85,14),(105,16),(113,26),(110,42)],backgroundColor=fill,roundness={"type":2},roughness=.7)
        shape("rectangle", "screen", 37, 42, 43, 13,backgroundColor="#ffffff",roughness=.5,strokeWidth=1*scale)
        for row in range(2):
            for col in range(3):shape("ellipse", "key-%s-%s"%(row,col),45+col*12,65+row*10,3,3,backgroundColor=INK,roughness=.4,strokeWidth=.8*scale)
        bottom=103
    elif kind == "camera":
        shape("rectangle", "root", 13, 25, 79, 43, backgroundColor=fill,roundness={"type":3})
        line("hood",[(7,20),(96,20),(91,25),(13,25)],roughness=.7)
        line("lens",[(92,31),(110,28),(110,64),(92,60)],backgroundColor="#e2e8f0",roughness=.6)
        line("mount",[(38,69),(38,87),(62,87),(62,95)],roughness=.7)
        line("wall",[(43,98),(86,98)],roughness=.7)
        bottom=107

    elif kind == "printer":
        shape("rectangle", "root", 10, 33, 100, 55, backgroundColor=fill, roundness={"type":3})
        shape("rectangle", "paper", 27, 6, 66, 36, backgroundColor="#ffffff", roughness=.6)
        for i in range(2):line("print-"+str(i), [(39,18+i*8),(80,18+i*8)], strokeWidth=1*scale, roughness=.4)
        shape("rectangle", "output", 26, 68, 68, 29, backgroundColor="#ffffff", roughness=.6)
        line("slot", [(25,62),(95,62)], roughness=.4, strokeWidth=1.2*scale)
        shape("ellipse", "led", 94, 45, 5, 5, backgroundColor="#69af99", strokeWidth=1*scale)
        bottom=108
    elif kind == "scanner":
        shape("rectangle", "root", 31, 2, 58, 102, backgroundColor=fill, roundness={"type":3})
        shape("rectangle", "screen", 38, 17, 44, 64, backgroundColor="#ffffff", roughness=.6, strokeWidth=1.2*scale)
        for i in range(7):line("barcode-"+str(i), [(44+i*5,34),(44+i*5,64)], strokeWidth=(1.5 if i%2 else 2.5)*scale, roughness=.2)
        line("reader", [(45,10),(75,10)], strokeWidth=1.5*scale, roughness=.4)
        shape("ellipse", "button", 55, 88, 9, 7, backgroundColor="#69af99", roughness=.4, strokeWidth=1*scale)
        bottom=115

    if label:
        e=shape("text", "caption", -45, bottom+10, 210, 0,
                text=label, fontFamily=5, fontSize=21*scale, textAlign="center", autoResize=False)
        e.pop("height")
    if detail:
        rows=max(1,label.count("\n")+1) if label else 0
        e=shape("text", "detail", -45, bottom+15+rows*27, 210, 0,
                text=detail, fontFamily=5, fontSize=16*scale, textAlign="center",autoResize=False,strokeColor="#657080")
        e.pop("height")
    return result


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument("kind",choices=KINDS)
    parser.add_argument("--id",required=True,help="Unique prefix and bindable root ID")
    parser.add_argument("--x",type=float,default=0)
    parser.add_argument("--y",type=float,default=0)
    parser.add_argument("--scale",type=float,default=1)
    parser.add_argument("--label",default="")
    parser.add_argument("--detail",default="")
    parser.add_argument("--accent")
    args=parser.parse_args()
    if args.scale<=0:parser.error("--scale must be positive")
    print(json.dumps(component(args.kind,args.id,args.x,args.y,args.label,args.detail,args.scale,args.accent),ensure_ascii=False,indent=2))


if __name__=="__main__":main()
