# Illustrated electrical visual grammar

These rules retain useful conventions from an author-supplied equipment wiring drawing. They describe this plugin's default style, not a universal electrical drafting standard. Explicit user preferences win.

## What to preserve

- Equipment should be recognizable before reading its caption: blue controller/inverter housings with mounting ears and terminal strips; batteries with separate polarity studs and communication sockets; solar panels with cell grids; busbars with distinct studs; fuse bodies and rotary disconnects with visible contact positions; generators with a frame, panel and wheels.
- Favor straight-on, diagram-ready views with a transparent background. A useful open-cover view shows the actual terminals. Keep similar products at compatible illustration scale; detail sheets can enlarge a terminal area deliberately.
- Illustrations carry hardware identity; editable strokes carry wiring; editable handwritten captions carry model, function and engineering facts. Avoid a single flattened picture of the whole diagram.
- Repeat battery instances in orderly rows and show their separate positive, return and communication paths. Repeat drawings of the same equipment as references using the same device tag, not as additional BOM instances.
- Retain close parallel red/blue DC pairs, generous turning space, visible polarity marks, visible protection and notes beside the owning device. Keep configuration notes readable without covering hardware.

## Default tokens, in sheet coordinates

Use a starting sheet of roughly 1800 × 1200 editor units for dense details; expand or split when labels need it. These numbers are starting values, not fixed rules.

| Token | Starting value | Purpose |
|---|---|---|
| Page background | white / `#ffffff` | Stable print preview |
| Main ink | `#343d4b` | Hardware outlines and authored text |
| DC positive / return | `#e03131` / `#1971c2` | Drawing convention; always label `+` / `−` and domain |
| Communications | `#9c36b5`, dashed | Add protocol and both endpoints |
| Protective earth | `#2f9e44`, solid | Label `PE`; never silently alias to DC return |
| AC conductors | charcoal with explicit `L`, `N`, `PE` | Detail sheet shows each core |
| Dry contacts / sensors | gray / teal | Separate from power and label function |
| Title / section / body / terminals | 36 / 28 / 20–24 / 18–20 | Excalifont, consistent sheet scale |
| Equipment / wire / detail stroke | 2 / 2.5–3 / 1–1.5 | Quiet detail, traceable conductors |
| Roughness | 0.5–1 housing; 0–0.3 wire | Hand-drawn equipment; precise wiring |
| Pair / parallel lane gap | 10–16 / 20–28 | Distinguish conductors and separate circuits |
| Caption / device / frame clearance | 16–24 / 48–80 / at least 36 | Prevent crowding and clipping |

Scale the whole sheet deliberately if exporting to print. The smallest essential label should remain roughly 9–10 pt or larger in its intended exported page. Evaluate the actual output; editor `fontSize` alone does not establish printed readability. Label anchors must not land on the wire itself.

## Layout hierarchy

Keep a complete, detailed master with visible point-to-point paths as the primary sheet. Supporting frames enlarge parts of the master; an overview may summarize it as an optional secondary view. A request for compactness is a request to reduce wasted space, not to remove equipment internals, terminals, labels or conductors.

Place PV above its controller, battery rows below their protection, DC distribution near its loads, and AC equipment along a separate corridor. Place GX centrally where this shortens control routes. Move each illustration, its terminal overlays, captions and internal wiring as an intact assembly. Preserve image aspect ratios. Route long interconnections through shared orthogonal corridors with distinct lanes and label clearance. Keep the source's reference anchors explicitly unverified when actual physical terminals are unknown.

Preserve the complete connectivity inventory, including cable segments drawn as plain lines and unbound source references. Avoid arbitrary global relayout of a supplied illustrated scene. Compare the compact master against the original, inspect terminal-dense regions, and verify source/destination IDs before considering the composition finished.

Use short visible tags at every device. Show **tag → exact model → voltage/function → terminal detail**. Put long notes, torque tables, cable schedules and settings on a named companion sheet. If all details shrink below usefulness, split the page rather than hiding them in metadata.

Physical conductors end at small terminal anchors with polarity/terminal captions. Terminals can overlay a hardware image intentionally and stay in its group. Group note backgrounds with their text. Overlap inside a solar cell grid, fuse drawing, equipment overlay or tank sensor illustration is normally intentional; overlap between an unrelated label and a cable is not.

## Review at three scales

1. Overview: equipment roles and sources are understandable without zooming into microtext.
2. Sheet: model captions, protection values, wire identities and cross-references are readable.
3. Terminal detail: every core can be traced from named source terminal to named destination terminal, with junctions and crossings unambiguous.

Do not imitate accidental inconsistencies: repeated bank labels, unfinished words, tiny annotations, unlabeled ground paths, or arrowheads on every cable. Preserve useful density and equipment character while improving document control and traceability.
