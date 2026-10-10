#!/usr/bin/env python3
"""Validate a network inventory and compile editable, port-labelled sheets.

No server calls or credentials: feed the generated operations to the app MCP.
"""
import argparse
import csv
import io
import ipaddress
import json
import math
import re
from pathlib import Path
import sys
from urllib.parse import urlparse

STYLE = Path(__file__).resolve().parents[2] / "excalidraw-design" / "scripts"
sys.path.insert(0, str(STYLE))
from icon_elements import component, wrap_caption, INK, KINDS

COLORS = {"physical": "#657080", "wan": "#3b78ad", "ha": "#8b77b5",
          "storage": "#2c8e88", "logical": "#9b6f3b"}

UNKNOWN_IPS = {"TBD (unverified)", "none (unmanaged)"}


def vlan_text(config):
    if not config:
        return ""
    if config.get("mode") == "routed":
        return "L3"
    parts = []
    if config.get("untagged") is not None:
        parts.append("U"+str(config["untagged"]))
    if config.get("tagged"):
        parts.append("T"+",".join(str(v) for v in config["tagged"]))
    return " ".join(parts) or "TBD"


def operational_rows(spec, kind, site=None):
    """Derive visible schedules from the same structured facts as the topology."""
    devices = {d["id"]: d for d in spec["devices"]}
    chosen = [d for d in devices.values() if site is None or d["site"] == site]
    rows = []
    if kind == "interfaces":
        headers = ["Device / interface", "Address / assignment", "VLAN / purpose"]
        for d in chosen:
            for i in d.get("details", {}).get("interfaces", []):
                rows.append((d["id"]+"/"+i["name"], [d["alias"]+" / "+i["name"],
                             i.get("address", "TBD (unverified)")+"\n"+i.get("address_mode", "unverified"),
                             vlan_text(i.get("vlan"))+"\n"+i["role"]]))
    elif kind == "wireless":
        headers = ["AP / SSID", "VLAN / band", "Authentication / isolation"]
        for d in chosen:
            for w in d.get("details", {}).get("wireless", []):
                rows.append((d["id"]+"/"+w["ssid"], [d["alias"]+" / "+w["ssid"],
                             str(w["vlan"])+" / "+w["band"], w["authentication"]+"\n"+w["isolation"]]))
    elif kind == "circuits":
        headers = ["Circuit / provider", "Service / down-up", "WAN / gateway", "Demarcation / reference"]
        for c in spec.get("circuits", []):
            if site is not None and c["site"] != site:
                continue
            rows.append((c["id"], [c["id"]+" / "+c["provider"], c["service"]+f"\n{c['download_mbps']:g} / {c['upload_mbps']:g} Mbps",
                                  c["address"]+"\nGW "+c["gateway"], c["demarcation"]+"\n"+c["reference"]]))
    elif kind == "nat":
        headers = ["Rule / firewall", "Ingress / source", "Public service", "Translated destination", "Purpose / state"]
        for n in spec.get("nat_rules", []):
            d = devices[n["firewall"]]
            if site is not None and d["site"] != site:
                continue
            rows.append((n["id"], [n["id"]+" / "+d["alias"], n["ingress"]+"\n"+", ".join(n["source_cidrs"]),
                                  f"{n['public_address']}\n{n['protocol']}/{n['public_port']}",
                                  devices[n["target_device"]]["alias"]+f" / {n['target_address']}\n{n['protocol']}/{n['target_port']}",
                                  n["purpose"]+"\n"+n["state"]]))
    elif kind == "ports":
        headers = ["Cable", "Source / VLAN", "Destination / VLAN", "Medium / PoE"]
        for c in spec["connections"]:
            if c["kind"] != "physical" or site is not None and devices[c["source"]["device"]]["site"] != site:
                continue
            cells = [c["id"]]
            for end in ("source", "destination"):
                e = c[end]
                cells.append(devices[e["device"]]["alias"]+" / "+e["port"]+"\n"+vlan_text(e.get("vlan")))
            cells.append(speed_name(c["speed_mbps"])+" / "+c["medium"]+"\n"+c.get("power", "No PoE"))
            rows.append((c["id"], cells))
    else:
        raise ValueError("Unknown operational table: "+kind)
    return headers, rows


def validate_details(spec, devices):
    errors = []
    def vlan(config, context):
        if not config:
            return
        values = ([config["untagged"]] if config.get("untagged") is not None else [])+config.get("tagged", [])
        if any(isinstance(v, bool) or not isinstance(v, int) or not 1 <= v <= 4094 for v in values):
            errors.append(context+": invalid VLAN ID")
        if len(values) != len(set(values)) or config.get("mode") == "routed" and values:
            errors.append(context+": inconsistent tagged/untagged VLANs")
    for d in devices.values():
        details = d.get("details", {})
        if details.get("mac") and not re.fullmatch(r"(?:[0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}", details["mac"]):
            errors.append(d["id"]+": invalid MAC address")
        if details.get("management_url"):
            url = urlparse(details["management_url"])
            if url.scheme not in ("http", "https") or not url.hostname or url.username or url.password:
                errors.append(d["id"]+": invalid or credential-bearing management URL")
        names = set()
        for i in details.get("interfaces", []):
            name = i.get("name")
            if not name or name in names or not i.get("role"):
                errors.append(d["id"]+": missing/repeated interface name or purpose")
            names.add(name)
            if name not in d.get("ports", {}) and i.get("parent_port") not in d.get("ports", {}):
                errors.append(d["id"]+": interface needs a known physical/logical port or parent")
            vlan(i.get("vlan"), d["id"]+"/"+str(name))
            address = i.get("address")
            if address and address not in UNKNOWN_IPS and address != "none (L2 only)":
                try:
                    ipaddress.ip_interface(address)
                except ValueError:
                    errors.append(d["id"]+": invalid interface address")
        for w in details.get("wireless", []):
            if not all(w.get(k) for k in ("ssid", "authentication", "band", "isolation")):
                errors.append(d["id"]+": incomplete SSID documentation")
            vlan({"untagged":w.get("vlan")}, d["id"]+"/SSID")
            if w.get("vlan") is None:
                errors.append(d["id"]+": missing SSID VLAN")
    for c in spec["connections"]:
        for end in ("source", "destination"):
            vlan(c[end].get("vlan"), c["id"]+"/"+end)
        a,b = c["source"].get("vlan",{}),c["destination"].get("vlan",{})
        if a and b and a.get("untagged") != b.get("untagged") and not c.get("vlan_translation"):
            errors.append(c["id"]+": endpoint native VLAN mismatch requires explicit translation")
    for c in spec.get("circuits", []):
        if not all(c.get(k) for k in ("id","site","provider","service","address","gateway","demarcation","reference")):
            errors.append(str(c.get("id"))+": incomplete circuit documentation")
        if c.get("device") not in devices or c.get("port") not in devices.get(c.get("device"), {}).get("ports", {}):
            errors.append(str(c.get("id"))+": unknown circuit termination")
        try:
            address = ipaddress.ip_interface(c["address"])
            if ipaddress.ip_address(c["gateway"]) not in address.network:
                errors.append(c["id"]+": circuit gateway outside prefix")
            if any(isinstance(c[k],bool) or not isinstance(c[k],(int,float)) or c[k] <= 0 for k in ("download_mbps","upload_mbps")):
                errors.append(c["id"]+": invalid service bandwidth")
        except (ValueError, KeyError):
            errors.append(str(c.get("id"))+": invalid circuit addressing")
    for n in spec.get("nat_rules", []):
        if not all(n.get(k) for k in ("id","ingress","source_cidrs","purpose","state")):
            errors.append(str(n.get("id"))+": incomplete NAT documentation")
        if n.get("firewall") not in devices or n.get("target_device") not in devices:
            errors.append(str(n.get("id"))+": unknown NAT device")
        try:
            for key in ("public_address", "target_address"):
                ipaddress.ip_address(n[key])
            for cidr in n["source_cidrs"]:
                ipaddress.ip_network(cidr, strict=True)
            if n["protocol"] not in ("TCP","UDP") or any(isinstance(n[k],bool) or not isinstance(n[k],int) or not 1 <= n[k] <= 65535 for k in ("public_port","target_port")):
                errors.append(n["id"]+": invalid NAT protocol or port")
        except (ValueError, KeyError):
            errors.append(str(n.get("id"))+": invalid NAT service/address")
    document = spec.get("documentation")
    if document and not all(str(document.get(k, "")).strip() for k in ("id", "revision", "date", "author", "status", "classification")):
        errors.append("Document control requires ID, revision, date, author, status and classification")
    return errors


def validate(spec):
    errors = []
    devices = {}
    addresses = {}
    for device in spec.get("devices", []):
        identifier = device.get("id")
        if not identifier or identifier in devices:
            errors.append(f"Duplicate or missing device ID: {identifier}")
        devices[identifier] = device
        for field in ("hostname", "model", "management_ip", "site", "kind", "alias"):
            if not str(device.get(field, "")).strip():
                errors.append(f"{identifier}: missing {field}")
        if device.get("kind") not in KINDS:
            errors.append(f"{identifier}: unknown equipment illustration {device.get('kind')}")
        try:
            if device.get("management_ip") in UNKNOWN_IPS:
                continue_address = True
            else:
                continue_address = False
                address = ipaddress.ip_interface(device["management_ip"])
            if not continue_address and str(address.ip) in addresses:
                errors.append(f"Duplicate management IP {address.ip}: {identifier}, {addresses[str(address.ip)]}")
            if not continue_address:
                addresses[str(address.ip)] = identifier
        except (ValueError, KeyError):
            errors.append(f"{identifier}: invalid management IP")
        if not isinstance(device.get("ports"), dict) or not device.get("ports"):
            errors.append(f"{identifier}: an explicit port inventory is required")
    connections = {}
    occupied = {}
    for cable in spec.get("connections", []):
        identifier = cable.get("id")
        if not identifier or identifier in connections:
            errors.append(f"Duplicate or missing connection ID: {identifier}")
        connections[identifier] = cable
        kind = cable.get("kind")
        if kind not in ("physical", "logical"):
            errors.append(f"{identifier}: kind must be physical or logical")
        if not cable.get("medium") or not cable.get("purpose"):
            errors.append(f"{identifier}: medium and purpose are required")
        if kind == "physical" and (isinstance(cable.get("speed_mbps"), bool) or
                                   not isinstance(cable.get("speed_mbps"), (int, float)) or
                                   cable["speed_mbps"] <= 0):
            errors.append(f"{identifier}: a physical cable needs an explicit speed")
        endpoints = []
        for end in ("source", "destination"):
            endpoint = cable.get(end, {})
            device = devices.get(endpoint.get("device"))
            port_name = endpoint.get("port")
            if not device:
                errors.append(f"{identifier}: unknown {end} device {endpoint.get('device')}")
                continue
            port = device.get("ports", {}).get(port_name)
            if not port:
                errors.append(f"{identifier}: {device['hostname']} has no port {port_name}")
                continue
            key = (device["id"], port_name)
            endpoints.append(key)
            if kind == "physical":
                if port.get("kind", "physical") != "physical":
                    errors.append(f"{identifier}: a physical cable cannot terminate on logical port {port_name}")
                if key in occupied:
                    errors.append(f"{identifier}: physical port {device['hostname']}/{port_name} already used by {occupied[key]}")
                occupied[key] = identifier
                if cable.get("speed_mbps") not in port.get("speeds_mbps", []):
                    errors.append(f"{identifier}: {device['hostname']}/{port_name} does not support {cable.get('speed_mbps')} Mbps")
                if cable.get("medium") not in port.get("media", []):
                    errors.append(f"{identifier}: incompatible medium on {device['hostname']}/{port_name}")
            elif port.get("kind") != "logical":
                errors.append(f"{identifier}: logical links need named logical interfaces, not an invented physical cable")
        if len(endpoints) == 2 and endpoints[0] == endpoints[1]:
            errors.append(f"{identifier}: a cable cannot connect a port to itself")
    placed = set()
    shown = set()
    frame_ids = set()
    for sheet in spec.get("sheets", []):
        if not sheet.get("id") or sheet["id"] in frame_ids:
            errors.append(f"Duplicate or missing sheet ID: {sheet.get('id')}")
        frame_ids.add(sheet.get("id"))
        instances = set()
        for node in sheet.get("nodes", []):
            identifier = node.get("device")
            if identifier not in devices or identifier in instances:
                errors.append(f"{sheet.get('id')}: unknown or repeated device {identifier}")
            instances.add(identifier)
            placed.add(identifier)
        for drawing in sheet.get("connections", []):
            identifier = drawing.get("connection")
            cable = connections.get(identifier)
            if not cable:
                errors.append(f"{sheet.get('id')}: unknown connection {identifier}")
                continue
            if identifier in shown:
                errors.append(f"{identifier}: physical/logical connection is drawn more than once; use a reference note instead")
            shown.add(identifier)
            for end in ("source", "destination"):
                if cable[end]["device"] not in instances:
                    errors.append(f"{identifier}: {end} device is absent from its sheet")
    errors.extend(f"Device has no diagram instance: {identifier}" for identifier in devices.keys() - placed)
    errors.extend(f"Connection has no diagram: {identifier}" for identifier in connections.keys() - shown)
    for network in spec.get("networks", []):
        try:
            prefix = ipaddress.ip_network(network["prefix"], strict=True)
            if network.get("gateway") and ipaddress.ip_address(network["gateway"]) not in prefix:
                errors.append(f"{network['prefix']}: gateway is outside its subnet")
        except (ValueError, KeyError):
            errors.append(f"Invalid network entry: {network.get('prefix')}")
    errors.extend(validate_details(spec, devices))
    return {"ok": not errors, "errors": errors, "devices": len(devices),
            "physical_cables": sum(c.get("kind") == "physical" for c in connections.values()),
            "logical_links": sum(c.get("kind") == "logical" for c in connections.values()),
            "sheets": len(frame_ids)}


def overlap(a, b, gutter=0):
    return a[0] < b[0]+b[2]+gutter and a[0]+a[2]+gutter > b[0] and a[1] < b[1]+b[3]+gutter and a[1]+a[3]+gutter > b[1]


def segment_crosses_rect(a, b, rect):
    if a[0] == b[0]:
        return rect[0] < a[0] < rect[0]+rect[2] and max(a[1], b[1]) > rect[1] and min(a[1], b[1]) < rect[1]+rect[3]
    if a[1] == b[1]:
        return rect[1] < a[1] < rect[1]+rect[3] and max(a[0], b[0]) > rect[0] and min(a[0], b[0]) < rect[0]+rect[2]
    return False


def speed_name(speed):
    return f"{speed/1000:g}G" if speed >= 1000 else f"{speed:g}M"


def shared_segment_length(a, b, c, d):
    """Length of an accidental shared orthogonal route, excluding point crossings."""
    if a[0] == b[0] == c[0] == d[0]:
        axis = 1
    elif a[1] == b[1] == c[1] == d[1]:
        axis = 0
    else:
        return 0
    return max(0, min(max(a[axis], b[axis]), max(c[axis], d[axis])) -
               max(min(a[axis], b[axis]), min(c[axis], d[axis])))


def route_audit(cables, nodes, sheet):
    """Reject merged cables, foreign equipment crossings and clipped routes."""
    findings = []
    for cable in cables:
        for identifier, node in nodes.items():
            if identifier not in cable["endpoints"] and any(
                    segment_crosses_rect(a, b, node["bbox"])
                    for a, b in zip(cable["points"], cable["points"][1:])):
                findings.append({"sheet": sheet["id"], "connection": cable["connection_id"],
                                 "issue": "route_crosses_device", "device": identifier})
        if any(x < 20 or x > sheet["width"]-20 or y < 225 or y > sheet["height"]-120
               for x, y in cable["points"]):
            findings.append({"sheet": sheet["id"], "connection": cable["connection_id"],
                             "issue": "route_outside_drawing_area"})
    for index, cable in enumerate(cables):
        for other in cables[index+1:]:
            shared = max((shared_segment_length(a, b, c, d)
                          for a, b in zip(cable["points"], cable["points"][1:])
                          for c, d in zip(other["points"], other["points"][1:])), default=0)
            if shared > 20:
                findings.append({"sheet": sheet["id"], "connection": cable["connection_id"],
                                 "issue": "shared_cable_route", "other": other["connection_id"],
                                 "length": round(shared, 2)})
    return findings


class Compiler:
    def __init__(self, spec):
        self.spec = spec
        self.devices = {d["id"]: d for d in spec["devices"]}
        self.connections = {c["id"]: c for c in spec["connections"]}
        self.elements = []
        self.label_findings = []
        self.route_findings = []
        self.current_frame = None
        self.offset = (0, 0)

    def text(self, identifier, x, y, value, size, width, group=None, color=INK, data=None):
        value = wrap_caption(str(value), size, width-8)
        element = {"id": identifier, "type": "text", "x": x+self.offset[0], "y": y+self.offset[1],
                   "width": width, "text": value, "fontFamily": 5, "fontSize": size,
                   "autoResize": False, "strokeColor": color, "frameId": self.current_frame,
                   "groupIds": [group] if group else [], "customData": data or {}}
        self.elements.append(element)
        return (x, y, width, max(1, value.count("\n")+1)*size*1.25)

    def node(self, sheet, position):
        device = self.devices[position["device"]]
        identifier = sheet["id"]+"-"+device["id"]
        x, y = position["x"], position["y"]
        scale = position.get("scale", 2.2)
        parts = component(device["kind"], identifier, x+self.offset[0], y+self.offset[1], scale=scale)
        group = identifier+"-group"
        for part in parts:
            part["frameId"] = self.current_frame
        root = next(p for p in parts if p["id"] == identifier)
        root["customData"]["network_device"] = {k: device[k] for k in ("id", "hostname", "alias", "model", "management_ip", "site")}
        if device.get("details"):
            root["customData"]["network_device"]["details"] = device["details"]
        self.elements.extend(parts)
        tx, ty, width = x+350, y+12, position.get("caption_width", 630)
        boxes = [self.text(identifier+"-hostname", tx, ty, device["hostname"], 40, width, group,
                           data={"network_device_id": device["id"], "field": "hostname"})]
        ty += boxes[-1][3]+12
        for field, value, size in (("model", device["model"], 29),
                                   ("management_ip", "IP "+device["management_ip"], 29),
                                   ("role", device.get("role", ""), 25),
                                   ("address_notes", device.get("address_notes", ""), 25)):
            if value:
                boxes.append(self.text(identifier+"-"+field, tx, ty, value, size, width, group,
                                       color="#657080" if field in ("role", "address_notes") else INK,
                                       data={"network_device_id": device["id"], "field": field}))
                ty += boxes[-1][3]+6
        if position.get("detail_level") == "deployment":
            for field, label in (("location","Location"),("mac","MAC"),("management_url","Manage")):
                value = device.get("details", {}).get(field)
                if value:
                    boxes.append(self.text(identifier+"-"+field, tx, ty, label+": "+value, 25, width, group,
                                           data={"network_device_id":device["id"], "field":field}))
                    ty += boxes[-1][3]+6
        bbox = (x-15, y-15, 350+width+30, max(280, ty-y)+30)
        return {"root": root, "bbox": bbox, "alias": device["alias"], "id": identifier, "x": x, "y": y}

    def attachment(self, node, side, ratio):
        root = node["root"]
        fixed = {"left": (0, ratio), "right": (1, ratio), "top": (ratio, 0), "bottom": (ratio, 1)}[side]
        return (root["x"]-self.offset[0]+root["width"]*fixed[0],
                root["y"]-self.offset[1]+root["height"]*fixed[1]), list(fixed)

    def cable(self, sheet, drawing, nodes, index):
        cable = self.connections[drawing["connection"]]
        source, destination = nodes[cable["source"]["device"]], nodes[cable["destination"]["device"]]
        same_row = abs(source["y"]-destination["y"]) < 100
        ss = drawing.get("source_side", "top" if same_row else "bottom")
        ds = drawing.get("destination_side", "top")
        start, sf = self.attachment(source, ss, drawing.get("source_ratio", .5))
        end, df = self.attachment(destination, ds, drawing.get("destination_ratio", .5))
        via = drawing.get("via")
        if drawing.get("route") == "side-bypass":
            via = [(drawing["channel"], start[1]), (drawing["channel"], end[1])]
        if via is None:
            if same_row:
                track = min(source["y"], destination["y"])-120-drawing.get("route_rank", 0)*115
            else:
                upper, lower = sorted((source, destination), key=lambda n: n["y"])
                low = upper["bbox"][1]+upper["bbox"][3]+80
                high = lower["bbox"][1]-80
                track = low+(high-low)*(drawing.get("route_rank", 0)+1)/(drawing.get("route_count", 1)+1)
            via = [(start[0], track), (end[0], track)]
        points = [start, *[tuple(p) for p in via], end]
        orthogonal = [points[0]]
        for point in points[1:]:
            previous = orthogonal[-1]
            if point[0] != previous[0] and point[1] != previous[1]:
                orthogonal.append((point[0], previous[1]))
            orthogonal.append(point)
        points = orthogonal
        # Remove zero-length steps without removing deliberate parallel lanes.
        points = [p for i, p in enumerate(points) if i == 0 or p != points[i-1]]
        identifier = sheet["id"]+"-"+cable["id"]
        style = cable.get("style", "logical" if cable["kind"] == "logical" else "physical")
        arrow = {"id": identifier, "type": "arrow", "x": start[0]+self.offset[0], "y": start[1]+self.offset[1],
                 "width": max(p[0] for p in points)-min(p[0] for p in points),
                 "height": max(p[1] for p in points)-min(p[1] for p in points),
                 "points": [[p[0]-start[0], p[1]-start[1]] for p in points],
                 "strokeColor": COLORS[style], "strokeWidth": 2.4, "roughness": .5,
                 "strokeStyle": "dashed" if style in ("logical", "ha") else "solid",
                 "startArrowhead": None, "endArrowhead": "arrow" if cable["kind"] == "logical" else None,
                 "elbowed": False, "frameId": self.current_frame, "groupIds": [identifier+"-group"],
                 "startBinding": {"elementId": source["id"], "fixedPoint": sf, "mode": "orbit"},
                 "endBinding": {"elementId": destination["id"], "fixedPoint": df, "mode": "orbit"},
                 "customData": {"network_connection": cable}}
        for node in (source, destination):
            node["root"].setdefault("boundElements", []).append({"id": identifier, "type": "arrow"})
        self.elements.append(arrow)
        vlan = cable.get("vlan_label", "")
        transport = (speed_name(cable["speed_mbps"])+" · " if cable["kind"] == "physical" else "")+cable["medium"]
        if vlan:
            transport += " · "+vlan
        def endpoint(end, node):
            value = node['alias']+"/"+cable[end]['port']
            mode = vlan_text(cable[end].get('vlan'))
            return value+(" · "+mode if mode else "")
        if cable.get("power"):
            transport += " · "+cable["power"]
        value = (f"{cable['id']}  SRC {endpoint('source',source)}\n"
                 f"DST {endpoint('destination',destination)}\n{transport}")
        value = wrap_caption(value, 25, drawing.get("label_width", 480)-8)
        return {"id": identifier, "points": points, "drawing": drawing, "text": value,
                "width": drawing.get("label_width", 480), "height": (value.count("\n")+1)*25*1.25,
                "color": COLORS[style], "connection_id": cable["id"],
                "endpoints": {cable["source"]["device"], cable["destination"]["device"]}}

    def labels(self, sheet, cables, nodes):
        occupied = [n["bbox"] for n in nodes.values()]+[(60, 30, sheet["width"]-120, 190)]
        for cable in sorted(cables, key=lambda c: (0 if c["drawing"].get("label_at") else 1, -c["width"]*c["height"])):
            width, height = cable["width"], cable["height"]
            candidates = []
            if cable["drawing"].get("label_at"):
                x, y = cable["drawing"]["label_at"]
                candidates.append((x, y, None))
            else:
                for a, b in zip(cable["points"], cable["points"][1:]):
                    length = math.dist(a, b)
                    if length < 80:
                        continue
                    for t in (.5, .25, .75, .1, .9):
                        px, py = a[0]+(b[0]-a[0])*t, a[1]+(b[1]-a[1])*t
                        if a[1] == b[1]:
                            for dy in (22, -height-22, 70, -height-70, 160, -height-160):
                                candidates.append((px-width/2, py+dy, (px, py)))
                        else:
                            for dx in (22, -width-22, 70, -width-70, 160, -width-160):
                                candidates.append((px+dx, py-height/2, (px, py)))
            best = None
            for rank, (x, y, point) in enumerate(candidates):
                rect = (x-12, y-8, width+24, height+16)
                if x < 50 or y < 230 or x+width > sheet["width"]-50 or y+height > sheet["height"]-150:
                    continue
                collisions = sum(overlap(rect, other, 10) for other in occupied)
                crossings = sum(segment_crosses_rect(a, b, rect)
                                for other in cables if other["id"] != cable["id"]
                                for a, b in zip(other["points"], other["points"][1:]))
                score = collisions*100000+crossings*2000+rank
                if best is None or score < best[0]:
                    best = (score, rect, x, y, collisions, crossings, point)
            if best is None:
                raise ValueError(f"No label placement inside {sheet['id']} for {cable['connection_id']}")
            _, rect, x, y, collisions, crossings, point = best
            if collisions or crossings:
                self.label_findings.append({"sheet": sheet["id"], "connection": cable["connection_id"],
                                            "collisions": collisions, "other_route_crossings": crossings})
            group = cable["id"]+"-group"
            # A borderless white mask keeps lettering legible where its own route
            # passes behind it. Grouping expresses only this intended composition.
            self.elements.append({"id": cable["id"]+"-label-mask", "type": "rectangle",
                                  "x": rect[0]+self.offset[0], "y": rect[1]+self.offset[1],
                                  "width": rect[2], "height": rect[3], "strokeColor": "transparent",
                                  "backgroundColor": "#ffffff", "fillStyle": "solid", "strokeWidth": 0,
                                  "roughness": 0, "frameId": self.current_frame, "groupIds": [group],
                                  "customData": {"network_connection_id": cable["connection_id"], "role": "label_mask"}})
            self.text(cable["id"]+"-ports", x, y, cable["text"], 25, cable["width"], group,
                      data={"network_connection_id": cable["connection_id"], "role": "port_label"})
            occupied.append(rect)

    def compile(self):
        validation = validate(self.spec)
        if not validation["ok"]:
            raise ValueError("\n".join(validation["errors"]))
        y = 0
        for sheet_index, sheet in enumerate(self.spec["sheets"]):
            self.offset = (0, y)
            self.current_frame = sheet["id"]
            self.elements.append({"id": sheet["id"], "type": "frame", "x": 0, "y": y,
                                  "width": sheet["width"], "height": sheet["height"],
                                  "name": f"{sheet_index+1:02} / {sheet['title']}"})
            self.text(sheet["id"]+"-title", 70, 40, sheet["title"], 58, sheet["width"]-140)
            self.text(sheet["id"]+"-subtitle", 74, 128, sheet.get("subtitle", ""), 29, sheet["width"]-148, color="#657080")
            nodes = {n["device"]: self.node(sheet, n) for n in sheet["nodes"]}
            drawings = [dict(drawing) for drawing in sheet["connections"]]
            attachments = {}
            route_bands = {}
            for drawing in drawings:
                cable = self.connections[drawing["connection"]]
                source, destination = nodes[cable["source"]["device"]], nodes[cable["destination"]["device"]]
                same_row = abs(source["y"]-destination["y"]) < 100
                for end, default in (("source", "top" if same_row else "bottom"), ("destination", "top")):
                    side = drawing.setdefault(end+"_side", default)
                    attachments.setdefault((cable[end]["device"], side), []).append((drawing, end))
                band = (same_row, round(min(source["y"], destination["y"])/200), round(max(source["y"], destination["y"])/200))
                route_bands.setdefault(band, []).append(drawing)
            for slots in attachments.values():
                for index, (drawing, end) in enumerate(sorted(slots, key=lambda p: p[0]["connection"])):
                    drawing.setdefault(end+"_ratio", .12+.76*(index+1)/(len(slots)+1))
            for band in route_bands.values():
                for index, drawing in enumerate(sorted(band, key=lambda d: d["connection"])):
                    drawing["route_rank"], drawing["route_count"] = index, len(band)
            cables = [self.cable(sheet, drawing, nodes, i) for i, drawing in enumerate(drawings)]
            self.route_findings.extend(route_audit(cables, nodes, sheet))
            self.labels(sheet, cables, nodes)
            for section_index, section in enumerate(sheet.get("sections", [])):
                self.text(sheet["id"]+f"-section-{section_index}", section["x"], section["y"],
                          section["text"], section.get("font_size", 29), section["width"], color=section.get("color", INK))
            for table_index, table in enumerate(sheet.get("tables", [])):
                row_y = table["y"]
                for row_index, row in enumerate([table["headers"], *table["rows"]]):
                    column_x, height = table["x"], 0
                    for column_index, (value, width) in enumerate(zip(row, table["widths"])):
                        box = self.text(sheet["id"]+f"-table-{table_index}-{row_index}-{column_index}",
                                        column_x+10, row_y, value, 29 if row_index == 0 else 27, width-30,
                                        color=INK if row_index == 0 else "#657080")
                        height = max(height, box[3])
                        column_x += width
                    row_y += height+32
            for table_index, table in enumerate(sheet.get("operational_tables", [])):
                kind = table["kind"]
                headers, rows = operational_rows(self.spec, kind, table.get("site"))
                self.text(sheet["id"]+f"-ops-{table_index}-title", table["x"], table["y"], table["title"], 52, sum(table["widths"]))
                row_y = table["y"]+95
                for row_index, (key, row) in enumerate([("header",headers),*rows]):
                    column_x, height = table["x"], 0
                    for column_index, (value,width) in enumerate(zip(row,table["widths"])):
                        box = self.text(sheet["id"]+f"-ops-{table_index}-{row_index}-{column_index}",column_x+10,row_y,value,48,width-30,
                                        color=INK if row_index==0 else "#657080",data={"network_documentation":{"kind":kind,"key":key,"column":column_index,"value":value}})
                        height=max(height,box[3]);column_x+=width
                    row_y += height+32
                    self.elements.append({"id":sheet["id"]+f"-ops-{table_index}-{row_index}-rule","type":"line",
                                          "x":table["x"],"y":row_y-17+self.offset[1],"width":sum(table["widths"]),"height":0,
                                          "points":[[0,0],[sum(table["widths"]),0]],"strokeColor":"#d9dde5","strokeWidth":1,"roughness":0,
                                          "frameId":sheet["id"],"customData":{"documentation_separator":True}})
                if row_y > sheet["height"]-160:
                    self.label_findings.append({"sheet":sheet["id"],"table":kind,"issue":"documentation_table_clipped"})
            self.text(sheet["id"]+"-footer", 70, sheet["height"]-95,
                      sheet.get("footer", "Fictional deployment · SRC and DST identify each endpoint · full inventory and cable schedule accompany this drawing"),
                      25, sheet["width"]-140, color="#657080")
            document = self.spec.get("documentation")
            if document:
                control = f"{document['id']} · Rev {document['revision']} · {document['date']} · {document['author']} · {document['status']} · {document['classification']} · {sheet_index+1:02}/{len(self.spec['sheets']):02}"
                self.text(sheet["id"]+"-document-control",70,sheet["height"]-48,control,21,sheet["width"]-140,
                          data={"document_control":document})
            y += sheet["height"]+220
        return {"operations": [{"type": "replace_scene", "elements": [], "files": {},
                                 "app_state": {"viewBackgroundColor": "#ffffff",
                                               "frameRendering": {"enabled": True, "clip": True, "name": True, "outline": False}}},
                                {"type": "create", "elements": self.elements}],
                "report": {**validation, "elements": len(self.elements), "label_findings": self.label_findings,
                           "route_findings": self.route_findings}}


def merge_scene_pages(pages):
    """Fail on changing revisions or missing/duplicate elements during pagination."""
    if not pages:
        raise ValueError("No scene pages")
    revisions = {page.get("revision") for page in pages}
    if len(revisions) != 1 or None in revisions:
        raise ValueError("The scene changed while reading pages; read it again")
    result = dict(pages[0])
    result["elements"] = [element for page in pages for element in page["elements"]]
    ids = [element["id"] for element in result["elements"]]
    if len(ids) != len(set(ids)) or len(ids) != result["total"]:
        raise ValueError("Scene pagination has missing or repeated elements")
    result["next_offset"] = None
    return result


def audit(spec, scene):
    elements = [e for e in scene.get("elements", []) if not e.get("isDeleted")]
    by_id = {e["id"]: e for e in elements}
    errors = []
    for sheet in spec["sheets"]:
        for node in sheet["nodes"]:
            device = next(d for d in spec["devices"] if d["id"] == node["device"])
            identifier = sheet["id"]+"-"+device["id"]
            root = by_id.get(identifier, {})
            data = root.get("customData", {}).get("network_device", {})
            for field in ("model", "management_ip", "hostname"):
                text = by_id.get(identifier+"-"+field, {}).get("text", "")
                if data.get(field) != device[field] or device[field].replace(" ", "") not in text.replace("\n", "").replace(" ", ""):
                    errors.append(f"{identifier}: visible {field} or retained metadata does not match")
            if device.get("details") and data.get("details") != device["details"]:
                errors.append(identifier+": operational device metadata changed or disappeared")
            if node.get("detail_level") == "deployment":
                for field in ("location","mac","management_url"):
                    value = device.get("details", {}).get(field)
                    label = by_id.get(identifier+"-"+field, {}).get("text", "").replace("\n", "").replace(" ", "")
                    if value and value.replace(" ", "") not in label:
                        errors.append(identifier+": visible operational field is missing: "+field)
        for drawing in sheet["connections"]:
            cable = next(c for c in spec["connections"] if c["id"] == drawing["connection"])
            identifier = sheet["id"]+"-"+cable["id"]
            arrow = by_id.get(identifier, {})
            if arrow.get("customData", {}).get("network_connection") != cable:
                errors.append(f"{identifier}: connection metadata changed or disappeared")
            for end, binding in (("source", "startBinding"), ("destination", "endBinding")):
                target = sheet["id"]+"-"+cable[end]["device"]
                if (arrow.get(binding) or {}).get("elementId") != target:
                    errors.append(f"{identifier}: {end} binding is missing or incorrect")
                device = next(d for d in spec["devices"] if d["id"] == cable[end]["device"])
                label = by_id.get(identifier+"-ports", {}).get("text", "").replace("\n", "").replace(" ", "")
                expected = device["alias"]+"/"+cable[end]["port"]
                if expected.replace(" ", "") not in label:
                    errors.append(f"{identifier}: {end} port is not visible in its cable label")
                mode = vlan_text(cable[end].get("vlan"))
                if mode and mode.replace(" ", "") not in label:
                    errors.append(f"{identifier}: {end} VLAN mode is not visible")
        for table_index, table in enumerate(sheet.get("operational_tables", [])):
            headers, rows = operational_rows(spec,table["kind"],table.get("site"))
            for row_index,(key,row) in enumerate([("header",headers),*rows]):
                for column_index,value in enumerate(row):
                    cell = by_id.get(sheet["id"]+f"-ops-{table_index}-{row_index}-{column_index}",{})
                    wanted = {"kind":table["kind"],"key":key,"column":column_index,"value":value}
                    text = cell.get("text", "").replace("\n", "").replace(" ", "")
                    if cell.get("customData",{}).get("network_documentation") != wanted or value.replace("\n", "").replace(" ", "") not in text:
                        errors.append(f"{sheet['id']}: {table['kind']} documentation field changed or disappeared: {key}/{column_index}")
        if spec.get("documentation"):
            control = by_id.get(sheet["id"]+"-document-control",{})
            document=spec["documentation"]
            if control.get("customData",{}).get("document_control") != document or any(str(value) not in control.get("text", "") for key,value in document.items() if key in ("id","revision","date","author","status","classification")):
                errors.append(sheet["id"]+": document control changed or disappeared")
    if any(e.get("fontFamily") != 5 for e in elements if e["type"] == "text"):
        errors.append("Diagram text must use Excalifont unless the user explicitly changes the typography")
    return {"ok": not errors, "errors": errors, "elements": len(elements),
            "device_instances": sum("network_device" in e.get("customData", {}) for e in elements),
            "labelled_connections": sum(e.get("customData", {}).get("role") == "port_label" for e in elements),
            "revision": scene.get("revision")}


def cable_csv(spec):
    devices = {d["id"]: d for d in spec["devices"]}
    out = io.StringIO()
    writer = csv.writer(out)
    writer.writerow(["ID", "Kind", "Source device", "Source port", "Destination device", "Destination port", "Medium", "Speed Mbps", "VLANs / mode", "Purpose", "Source U/T", "Destination U/T", "Power"])
    for cable in spec["connections"]:
        writer.writerow([cable["id"], cable["kind"], devices[cable["source"]["device"]]["hostname"], cable["source"]["port"],
                         devices[cable["destination"]["device"]]["hostname"], cable["destination"]["port"],
                         cable["medium"], cable.get("speed_mbps", "N/A"), cable.get("vlan_label", ""), cable["purpose"],vlan_text(cable['source'].get('vlan')),vlan_text(cable['destination'].get('vlan')),cable.get('power','')])
    return out.getvalue()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=("validate", "compile", "audit", "cables"))
    parser.add_argument("spec", type=Path)
    parser.add_argument("--scene", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    spec = json.loads(args.spec.read_text())
    if args.command == "compile":
        result = Compiler(spec).compile()
    elif args.command == "audit":
        if not args.scene:
            parser.error("audit requires --scene with a read_diagram result or editable scene")
        result = audit(spec, json.loads(args.scene.read_text()))
    elif args.command == "cables":
        result = cable_csv(spec)
    else:
        result = validate(spec)
    output = result if isinstance(result, str) else json.dumps(result, indent=2, ensure_ascii=False)+"\n"
    if args.output:
        args.output.write_text(output)
        print(json.dumps(result.get("report", result) if isinstance(result, dict) else {"written": str(args.output)}, ensure_ascii=False))
    else:
        print(output, end="")
    if isinstance(result, dict) and result.get("ok") is False:
        raise SystemExit(1)


if __name__ == "__main__":
    main()
