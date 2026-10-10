---
name: excalidraw-design
description: Create and refine editable Excalidraw diagrams using Excalifont, hand-drawn equipment illustrations, light color accents, and spacious layouts. Use for ExcalidrawDesktop diagram requests and revisions to this visual style.
---

Use the existing ExcalidrawDesktop MCP connection for live editing. This plugin supplies a visual language and reusable components; the app provides diagram commands and persistence. Read the exposed tool schemas before preparing a batch.

## Visual direction

This plugin's default visual language uses Excalidraw's original handwritten typography and recognizable illustrated objects. Use **Excalifont (`fontFamily: 5`) for headings, captions, addresses, and connector labels**. Explicit user font or design overrides take precedence.

For network topology and deployment work, also apply the included `excalidraw-network` skill: every device instance needs its model and IP, and every cable needs both endpoint ports.

For electrical, Victron, solar/battery and generator wiring, also apply `excalidraw-electrical`: recognizable equipment, visible terminal anchors, distinct conductor domains and wire IDs. Preserve supplied hardware illustrations and terminal detail; generic network topology rules do not determine electrical connectivity.

For network drawings, draw routers as circular routing symbols, firewalls as brick walls, switches as shallow chassis with ports, servers as racks, storage as cylinders, clients as laptops, wireless as access points, and Internet/cloud services as clouds. Put short captions below or beside the equipment. A rectangle is useful for a physical chassis or a site boundary; avoid making every node a filled text box. For other diagram subjects, choose similarly meaningful shapes and illustrations.

Use white space, charcoal outlines, gentle sketch roughness, and a few pale blue, teal, lavender, or peach accents with consistent meanings. Favor a readable flow and light dashed site/trust boundaries. Keep address tables and long policy notes in a separate detail frame when they crowd the drawing. Read [references/visual-style.md](references/visual-style.md) for concrete typography, spacing, and connector rules.

## Reusable equipment

Use [scripts/icon_elements.py](scripts/icon_elements.py) to generate original editable component skeletons. Example:

```sh
python3 scripts/icon_elements.py router --id hq-router --x 400 --y 240 --label "HQ router" --detail "10.40.0.1"
```

Insert its elements with `apply_operations` → `create` (normal skeleton conversion, not `raw: true`). The editor loads fonts and measures captions. Preserve each component's `groupIds`; its root ID is a connector anchor. Move/duplicate the entire group, including captions. The cloud/storage anchors are transparent shapes inside their visible illustrations; do not draw a visible box around them. Read the script's `--help` for the available components. [assets/network-equipment.excalidrawlib](assets/network-equipment.excalidrawlib) contains the same components as a native reusable library.

Library insertion regenerates IDs. Use its returned created-ID mapping to resolve the component root and its group before binding connectors or moving it.

## Editing and review

Use explicit document IDs and current revisions. Save a checkpoint before a substantial redesign; apply a coherent edit as one atomic batch. On a revision conflict, reread and recompute. Do not use a save failure as a reason to repeat an edit.

For an icon composition, place components deliberately or lay out an abstract graph first and replace nodes with illustrated groups. Applying graph layout directly to individual icon strokes will destroy the illustration. Bind connectors to component roots and choose attachment sides/waypoints that keep lines away from captions. Render the overview and dense regions, inspect the native images, refine, then save and export. Analyzer results do not establish aesthetic quality; look at the actual drawing.

A good result has recognizable equipment, consistent handwriting, readable captions at useful zoom, visible routing, and enough space between sites. Preserve intentional overlaps inside grouped illustrations without marking unrelated collisions as intentional.

Apply these defaults consistently while honoring explicit user design and typography choices. Online inspiration and asset provenance are in [references/visual-style.md](references/visual-style.md).
