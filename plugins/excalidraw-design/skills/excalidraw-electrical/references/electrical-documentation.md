# Electrical facts and traceability

## Inventory before drawing

For every device record tag, role, manufacturer/model/SKU, AC variant where applicable, hardware/firmware revision when relevant, nominal voltage and operating range, explicit terminals, mounting/location, evidence and confidence. Treat painted nameplates as evidence to transcribe and verify, not editable metadata already supplied by the image. Generic illustrations are not pinouts.

For every wire record ID, net/domain, source device and terminal, destination device and terminal, function/conductor class, gauge, cable ID/core, route/length when known, insulation/environment and evidence. Record termination/lug/torque only when supplied or verified. A terminal can accept multiple conductors only when its design and termination instructions permit it; network's one-cable-per-port rule is not an electrical busbar rule.

Protection needs a device tag, fuse/breaker class, current rating, voltage rating, interrupt/breaking rating and placement. A fuse's amperage alone does not demonstrate suitable protection. A wire gauge alone does not establish ampacity or acceptable voltage drop. Cable length, loading, installation method, conductor material, thermal/bundling conditions and applicable design requirements must be known before selecting values.

## Conductor classes and nets

- `dc_positive`, `dc_negative`: keep each voltage domain explicit (`DC48`, `DC12`, `PV1`). DC return and chassis/PE are separate until a verified bond is drawn.
- `ac_line`, `ac_neutral`, `protective_earth`: name phase(s), neutral and PE individually; show AC-in versus AC-out-1/out-2. A physical AC cord is not a single conductor in a wiring detail.
- `communication`: record protocol, port, bus identifier, speed/profile, pinout/cable type and termination as applicable. Shared RJ45 shape does not establish interoperability.
- `dry_contact`: record COM/NO/NC, contact state and the external control interface. A dry contact does not supply voltage by itself.
- `sensor`: record resistive, voltage, current-loop or other actual signal type, excitation/return and receiving channel. Verify the sensor matches the GX input; do not infer this from two wires.

Connect identical conductor classes within compatible domains. A fuse/disconnect is an explicit device with separate input/output terminals and a verified internal path; do not replace its continuity with a junction dot. A converter has separate input/output domains; its isolation/common-return properties require evidence. A crossing has no electrical continuity. A shared bus/junction has a visible node and declared net ID. Cross-sheet references show the same net/wire tag at both ends.

## Documentation checks by subsystem

| Subsystem | Required evidence and checks |
|---|---|
| Battery bank | Individual tags, series/parallel arrangement, actual chemistry/voltage/capacity, bank membership, current limits, allowed parallel count, BMS wiring/addressing, protection and disconnects; compare path resistance if equal sharing is claimed |
| PV | Module model, Voc/Isc/Vmp/Imp and temperature coefficient, series/parallel arrangement, cold-condition string voltage, controller input limits, PV-rated protection/isolator and connector compatibility |
| DC distribution | Separate supply/return paths, bus voltage/polarity, rated bus/branch devices, load states and peak current, DC-DC conversion and isolation; explicitly map loads to output numbers |
| AC | Exact supply/inverter voltage/frequency/phase variant, AC-in/out distinction, conductor cores, P/R/inlet/outlet identity, transfer path, grounding/bonding states and protective devices; identify unshown output loads |
| Control/communication | GX model generation, actual ports/protocols, battery profile/cable, termination, data vs power, relay function/feedback and start/stop conditions |
| Document control | Drawing ID/title, revision/date/author, proposed/as-built/review status, sheet numbers, legend, assumptions, source dates, outstanding verification items |

Distinguish normal, transmit/startup and simultaneous peak loads. Compute `P = V × I` using a stated voltage; do not mix nominal 12 V watts with a 13.2 V current statement without explaining the convention. Energy/runtime estimates additionally need usable capacity, efficiency, duty cycle and temperature; do not infer capacity from a model number.

## Portable JSON and scene metadata

The included fixture demonstrates the helper format:

```json
{
  "id": "W001", "kind": "dc_positive", "domain": "DC48",
  "source": {"device": "BAT-01", "terminal": "+"},
  "destination": {"device": "FUSE-01", "terminal": "IN"},
  "net": "BANK1+", "gauge": "TBD (unverified)",
  "cable": "CBL01", "core": "+", "evidence": "concept only"
}
```

Device `terminals` map names to `kind`, `domain`, optional `protocol`/`bus`, and relative `x`,`y` used only for drawing. The helper's validation checks direct endpoint compatibility, declared protocol/bus agreement, unique identifiers and required documentation. It deliberately does **not** infer internal device connectivity, size components, simulate circuits or establish completeness of a design.

Put the device inventory on the root's `customData.electrical_device`, terminal identity on each anchor's `customData.electrical_terminal`, and the full wire record on its connector's `customData.electrical_wire`. The audit checks exact terminal bindings and visible wire endpoint labels, captions and Excalifont. Read every page at the same revision before auditing; do not count a truncated MCP result as the whole drawing.

Maintain a wire schedule and a separate verification table generated from the same facts. Neither replaces visible core/terminal labels. Export editable elements and embedded permitted assets. Never ship a user's original project scene, embedded product pictures or customer facts in the shared skill by default.
