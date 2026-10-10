---
name: excalidraw-network
description: Create, inspect, and refine detailed editable network deployment diagrams in ExcalidrawDesktop. Use for network topology, cabling, port maps, IP/VLAN plans, WAN, VPN, firewall HA, virtualization, storage paths, and infrastructure diagrams with models, addresses, and both cable endpoints.
---

Use the connected ExcalidrawDesktop MCP and the companion `excalidraw-design` visual rules. Keep the app open; discover capabilities, explicit document handles, permissions, and the current revision before editing. This skill works with each user's own connection and drawings.

## Information that must survive

Every displayed device instance needs a visible **hostname, exact model, and IP with prefix**. Repeat those fields when a device reappears on another sheet. Distinguish management addresses, WAN addresses, HA/shared VIPs, storage addresses, and VPN-assigned addresses. For an unmanaged device, say `IP: none (unmanaged)`; for unknown real values, say `TBD (unverified)` instead of inventing facts.

Every physical cable needs a unique cable ID and a visible label containing **SRC device/port and DST device/port**. Also show negotiated/design speed, cable medium, VLAN/access/trunk intent, and relevant PoE or bond/path information. Retain complete endpoint data in `customData.network_connection`; a CSV schedule supplements the drawing but never replaces its on-canvas port labels. Retain device metadata in `customData.network_device` on each component root.

Logical links use named interfaces, port groups, SSIDs, tunnel names, or protocol endpoints. Draw them dashed and identify their transport. An IPsec line between sites is a tunnel, not a physical Ethernet cable through the Internet. Wi-Fi and VM vNIC links are logical. Use `Cnn` for physical cables and `Lnn` for logical links.

For a fictional scenario, explicitly mark invented allocations. For a real deployment, preserve evidence and unknowns; do not quietly fabricate ports, models, speeds, optics, addresses, or redundancy. Verify model-specific ports and supported media using current manufacturer documentation. Explain project aliases such as `NIC1/P1` or `LAN5`, including the adapter/physical-port mapping. Read [references/network-data.md](references/network-data.md) when preparing the inventory.

## Technical composition

Give each physical port at most one cable. Verify copper/fiber/DAC types and speed compatibility at both ends. Do not use a model's 25G SFP28 port as a 100G QSFP28 port. Identify LACP member cables individually; show the peer link, keepalive, and domain for a dual-chassis bond. HA firewall designs need both members' WAN/inside links and explicit heartbeat cables. Document shared VIPs separately from unique management IPs. iSCSI MPIO paths use distinct subnets/interfaces; do not describe them as an ordinary LACP storage bond.

For vSphere, identify standard versus distributed virtual switches. LACP requires a distributed switch. A standard vSwitch with active/standby teaming uses independent physical trunks without a switch port-channel; label each uplink's role. Keep VM/data teaming separate from iSCSI MPIO and verify the selected policy against the platform's current documentation.

Include the deployment's sites, management, client/voice/Wi-Fi/IoT networks, DMZ, compute, storage, backup, WAN handoffs, VPN, VLAN gateways and policy intent when present. Show host/VM placement separately from physical cable detail. Record omitted upstream carrier infrastructure, representative endpoints, assumptions, and remaining failure points. Do not claim a representative endpoint drawing is a full fleet BOM.

## Deployment documentation depth

Treat a detailed network diagram as an operations document. Read [references/deployment-documentation.md](references/deployment-documentation.md) before building a detailed deployment or learning from a user-supplied example. Extract useful conventions, not customer identities, credentials, proprietary logos or outdated security configurations, into shared skills and examples.

Keep the hierarchy visible: **hostname → role/model → management IP → interface/operational facts**. Add physical room/rack/U or mounting location, asset ID and MAC when supplied. Show a management URL when useful, without credentials. Keep operational notes beside their owning equipment. Use `TBD (unverified)` for unknown real facts and `none (unmanaged)` for devices without an IP; do not silently omit or invent them.

Document each relevant interface's name, address/prefix, assignment mode (static, DHCP, reservation), purpose and VLAN. Explain **U = untagged/native, T = tagged** on every sheet using that notation. Record endpoint-specific U/T profiles beside both cable ports, including management/native, tagged SSID VLANs, voice VLAN and PoE origin. An address on a VLAN interface is distinct from the chassis's management address. Put a complete physical port schedule in a detail frame; an anonymous shared bus must not substitute for cable identity.

For Wi-Fi, show AP location/MAC/management and each SSID's VLAN, radio band, authentication method and isolation intent. For WANs, show provider, circuit reference, demarcation, service download/upload, local link speed, interface addressing mode and upstream gateway. Service bandwidth is not the Ethernet port's negotiated speed. Do not put passwords, keys or account secrets in the diagram.

When published services exist, show an exact **NAT/service table** with firewall/ingress, allowed source, public address/protocol/port, translated device/address/port and purpose/state. Keep it beside the edge context or cross-reference its named detail frame. Preserve a supplied rule as evidence of the source; do not adopt a legacy rule as a recommended configuration. Identify the VM's host/port group separately from physical cabling.

Add document ID, revision, date, author, proposed/as-built status, classification and sheet numbering. Date-stamped source evidence and confidence belong in the inventory; an old diagram is a historical snapshot. A model with `?`, an unlabeled port or a floating server icon is an unresolved fact, not proof of its attachment. Detail frames must stay cross-referenced to the topology and generated from the same facts.

Split a dense network into coherent frames: perimeter/core, access/DMZ, compute/storage, branch, recovery, logical overlay, virtual services, addressing. Use consistent device aliases, cable IDs and cross-sheet references. Do not duplicate a cable on two sheets; reference its ID instead.

## Draw and verify

1. Read the existing scene, selection and revision. Read **every page**, checking that all pages have the same revision and that the merged count matches `total`. Preserve human changes and existing custom data.
2. Build an inventory with explicit devices, ports, connections, networks, and sheets. Include `documentation`, `circuits`, `nat_rules` and device `details` when available; the helper derives operational tables from those facts. The portable fictional [assets/aurora-network.json](assets/aurora-network.json) is a complete example, not a template for real customer facts. Use [scripts/network_document.py](scripts/network_document.py) to validate and compile it or a derived inventory. `compile` emits a whole-document replacement; use it only for a new drawing or an explicitly authorized redesign, never as a shortcut for a selected-content revision.
3. Measure text with the editor; use **Excalifont (`fontFamily: 5`)** throughout unless overridden. Draw recognizable editable equipment groups, with model/IP captions beside the icon. Bind each connector to its root; keep the full group together. Arrange the component as one object, never individual icon strokes.
4. Route each cable in a distinct lane with separate attachment positions. Avoid other devices and captions, shared collinear segments, ambiguous junctions, and clipped frame edges. Crossings are not electrical junctions. The compiler reports `route_findings` and `label_findings`; resolve these before applying. These geometric checks do not replace image inspection.
5. Create a checkpoint before a major change. Dry-run the coherent batch, then apply with current `expected_revision` and a unique `request_id`. Retry that ID only with identical arguments; reread on a revision conflict. A failed save requires `document_command save`, not replaying the edit.
6. Read the complete resulting scene. Audit visible device fields, **both ports and endpoint VLAN modes**, operational tables, document control, metadata, bindings and fonts. Run `analyze_diagram`, then `render_diagram` for **every changed frame** and dense regions. Inspect the actual images and refine. A clean analyzer alone does not prove a readable network drawing. Trace at least one complete path from ISP through firewall/switch to a service or endpoint; verify its interface IP, U/T profile, gateway and policy agree across sheets.
7. Save and verify persistence. Export the editable `.excalidraw` scene, bounded per-frame images, a readable presentation document, inventory JSON and cable CSV. Avoid a gigantic full-canvas bitmap for many sheets. Describe tested behavior and any remaining unknowns accurately.

From this skill's directory:

```sh
python3 scripts/network_document.py validate assets/aurora-network.json
python3 scripts/network_document.py compile assets/aurora-network.json --output /tmp/network-operations.json
python3 scripts/network_document.py audit assets/aurora-network.json --scene /tmp/complete-scene.json
python3 scripts/network_document.py cables assets/aurora-network.json --output /tmp/cables.csv
```

The helper uses Python's standard library and the included sibling visual skill. It never reads credentials or calls a server. For partial edits use MCP operations on existing IDs, then inspect and audit the affected content; do not replace the entire document.
