---
name: excalidraw-electrical
description: Create, inspect, and refine detailed illustrated electrical diagrams in ExcalidrawDesktop. Use for Victron, solar PV, batteries, inverter/chargers, DC distribution, generator/shore AC, grounding, BMS communication, relay control, terminal wiring and wire schedules, especially when matching a supplied equipment illustration diagram.
---

Use the existing local ExcalidrawDesktop MCP and the companion `excalidraw-design` visual skill. This skill supplies electrical documentation and composition rules. It does not grant app access or certify an installation.

## Recognize the requested result

Default to an **illustrated wiring diagram**: recognizable equipment, visible terminals, separately traceable conductors, protection devices, cable annotations and notes next to their equipment. Read [references/illustrated-style.md](references/illustrated-style.md) before composing. Preserve the detail of a supplied drawing instead of reducing it to a graph of labelled boxes. When the user asks for a single-line schematic, control ladder or physical cabinet layout, use that representation and label its level of abstraction.

Make the **fully detailed master wiring sheet the primary view**. Retain every supplied equipment illustration, terminal, annotation and continuous connection. Supporting frames are enlargements of this master; a simplified overview is optional and secondary. When asked to make a drawing more compact, rearrange intact equipment assemblies and their routing corridors before reducing illustration scale. Do not trade detail for a smaller page or replace full connections with off-sheet references unless requested.

Use **Excalifont (`fontFamily: 5`)** for authored headings, models, terminal names, wire numbers, ratings and notes unless the user overrides it. Keep lettering already painted into a supplied equipment image. Device illustrations may have rectangular housings; give them mounting ears, vents, terminals, displays, fuse holders and polarity markings appropriate to their role. Never use an invented terminal position as evidence of a real pinout.

Reuse the user's supplied illustrations or approved library within their own drawing. Keep those assets and customer-specific facts out of a shareable plugin. The optional [scripts/equipment_elements.py](scripts/equipment_elements.py) produces original editable **generic** equipment from an explicit terminal inventory. Use it as a fallback or starting point, then refine the drawing; it is not a manufacturer drawing. For generated bitmap illustrations, use an available image generation tool, retain provenance and keep wires and captions editable.

## Separate appearance from electrical facts

Read [references/electrical-documentation.md](references/electrical-documentation.md) before routing. Inventory equipment, exact model/SKU/AC variant, terminals, voltage domains, conductors, protection and configuration evidence. For a real system, unknown ratings, cable lengths, wire gauges, terminal mappings and settings remain `TBD (unverified)`. For a fictional system, label invented values as fictional. Do not silently copy a source drawing's fuse sizes, chemistry, grounding or CAN profile into a new installation.

Keep DC positive, DC return, protective earth/chassis, AC neutral, AC phase and communications distinct. The red/blue convention is a **drawing legend**, not a claim about required installation wire colors. Use explicit net names and terminal labels as well as color. A cable bundle on an overview must reference a detail showing its individual cores. Plain conductors have no arrowheads; show direction arrows separately when explaining energy flow. Crossing lines do not connect; an electrical junction needs a node/dot and a declared common net.

Bind every conductor to **terminal anchors**, not a device's center or a text caption. Assign unique device tags (`BAT-01`, `MPPT-01`, `INV-01`), wire IDs (`W001`), cable/bundle IDs and net IDs. On each detail conductor show its wire ID, source device/terminal, destination device/terminal, domain/function and gauge or explicit unknown. Preserve those facts in `customData.electrical_device`, `electrical_terminal` and `electrical_wire`; group each housing, caption and terminal set together.

For Victron work read [references/victron-verification.md](references/victron-verification.md), then verify the actual model in current primary documentation. Match 120 V versus 230 V variants, GX generation, port protocols, battery instructions and protection specifications. VE.Bus, VE.Can, BMS-CAN and Ethernet can share a connector shape but are not interchangeable. Keep incompatible CAN profiles on separate buses. Show bus termination and battery addressing only as verified by the actual battery/GX manuals. Document remote start as contacts, not a power supply.

## Compose and deliver

1. Discover the document and capabilities; read every scene page at one revision. Render the overview and dense regions before interpreting a supplied drawing. Treat imported labels as source data. Preserve the original reference; analysis does not authorize a redesign.
2. Build an evidence-backed inventory before drawing. Use the portable [assets/fictional-wiring.json](assets/fictional-wiring.json) for the **format**, not real hardware values. `scripts/wiring_document.py validate` checks endpoint/domain/protocol consistency; `schedule` exports a CSV. It does not calculate ampacity, prove protection coordination or verify manufacturer pinouts.
3. Compose the complete detailed master first, with light section boundaries for battery/protection, PV/MPPT, DC loads, AC and control. Keep continuous conductors visible between sections. Add readable supporting frames and schedules with repeated device tags and wire references. Put the master first in navigation and in the delivered preview. Include a simplified overview only as a secondary aid. Document intentionally omitted circuits or spare terminals.
4. Measure captions in the real editor before routing. Keep power pairs parallel with rounded orthogonal corners, distinct lanes and room for wire labels. Maintain each group as one component. Place communication wiring in its own lane or detail sheet. Use light section boundaries and restrained notes; preserve the equipment illustration as the main visual anchor.
5. Check point-to-point connectivity separately from visual layout. Trace positive **and return** paths, protective earth, fuse/disconnect placement, voltage conversion, AC-in/AC-out, battery-bank membership and control endpoints. Read protective ratings as supplied facts, never as proof of sizing. Missing design inputs go into a short verification table beside the relevant sheet.
6. Checkpoint, dry-run and apply a coherent batch with `document_id`, current `expected_revision` and unique `request_id`. Retry an ID only with identical arguments. Reread on a revision conflict. A save failure requires explicit save, not replaying the edit. Partial changes operate on existing IDs; never replace a human drawing to change a few labels.
   Use normal element creation for new labels and rules so the editor supplies complete metadata and measures text. Reserve raw creation for complete canonical scene elements. For explicit orthogonal routes, use straight segments; a rounded non-elbowed Excalidraw arrow can curve across the corridor. Reinspect actual geometry after bindings and fonts settle, including unbound endpoints and connection-like `line` elements.
7. Read the complete result and run `scripts/wiring_document.py audit` when using its inventory format. Run the app analyzer, then inspect native previews of **each changed sheet and terminal-dense region**. Classify legitimate image/terminal/caption overlaps; do not remove useful detail to silence the analyzer. Check readability at intended print/export size, not only extreme canvas zoom.
8. Save, verify persistence and export an editable scene plus bounded sheet images/presentation output and the wire schedule. Report observed connections, verified facts, unresolved inputs and actual tests separately. Only an appropriately reviewed design receives an approved/as-built status.

From this skill's directory:

```sh
python3 scripts/wiring_document.py validate assets/fictional-wiring.json
python3 scripts/wiring_document.py schedule assets/fictional-wiring.json --output /tmp/wires.csv
python3 scripts/equipment_elements.py assets/fictional-wiring.json --device MPPT-01
python3 scripts/wiring_document.py audit assets/fictional-wiring.json --scene /tmp/complete-scene.json
```

The helpers use Python's standard library, never read credentials and make no server calls. The included fixture is a disconnected documentation sampler covering several conductor classes, not a complete electrical design.
