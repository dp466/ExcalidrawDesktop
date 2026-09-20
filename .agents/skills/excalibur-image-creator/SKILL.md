---
name: excalibur-image-creator
description: >-
  Turn supplied product photos into isolated, diagram-ready, Excalidraw-style 2D
  equipment illustrations. Use for Excalibur Image Creator, Excalidraw/skalidra
  product redraws, or follow-up edits such as make one for this, straight-on,
  top view, show the inside, remove cables/covers, or change breaker ratings
  when an equipment-image workflow is established. Preserve component counts,
  terminals, product identity, and requested labels. Default to one transparent
  PNG without added wiring or annotations. Not for electrical design,
  photorealistic renders, or unrelated image requests.
---

# Excalibur Image Creator

Create reusable equipment images that look at home in an Excalidraw wiring
layout. This package contains the workflow and visual references; it does not
require the original conversation or personal memory.

## Start here

1. Read `references/style-guide.md` and visually inspect the most relevant
   bundled style reference. The PNG/JPEG references illustrate drawing style,
   not certified product geometry or electrical specifications.
2. Use the current uploaded product photo as the structural reference. Use the
   latest explicitly preferred drawing as the style reference when available.
   Do not treat the newest generated image as approved merely because it exists.
3. Apply the current request first, then explicit preferences in this workflow,
   then the defaults below. Do not ask the user to restate these defaults.
4. A specific-image edit requires an actual accessible target. When the target is
   missing, ask for the image or a usable file, rather than inventing its contents.
   An opaque image ID or an assertion that an image exists is not sufficient.

## Default output contract

- **One isolated product per PNG**, with real alpha transparency and a modest,
  consistent transparent margin. No opaque background, checkerboard baked into
  pixels, glow, vignette, cast shadow, floor, frame, or surrounding scene.
- **Flat 2D, directly front-facing**, with the main axis straight. No isometric
  projection, three-quarter view, visible side-wall depth, or photographic
  perspective. An explicit top-view request overrides this default.
- **Excalidraw-inspired drawing**, not a photograph with an outline filter:
  simple rectangles, circles, polygons and lines; dark, slightly hand-drawn
  contours; source-appropriate flat colors; restrained diagonal hatching.
- Retain enough recognizable casing, brand color, major controls and visible
  connection points to distinguish the actual product. Do not reduce it to an
  anonymous rectangle or an abstract electrical symbol.
- Preserve visible manufacturer/model text and connection labels where legible
  and relevant. **No added annotations**, captions, arrows, legends, leaders,
  specification tables, marketing copy, ratings, or logos.
- **Do not add external cables.** Preserve integral leads or factory jumpers
  shown in the source unless the user asks to remove them. Follow explicit cable
  routing requests, such as an attached sensor lead exiting upward.
- Preserve requested terminal/port counts, left-to-right order, polarity labels,
  colors, and component spacing. Geometry must not be mirrored for convenience.
- Aim for roughly 1600–2400 pixels on the long side when the tool supports it;
  prioritize crisp, usable detail over arbitrary upscaling. Adapt canvas shape
  to tall sensors, square devices, and wide rack panels; keep the whole asset.

## Workflow

### 1. Establish the transformation

Privately form a compact specification before rendering:

- Target photo and any last approved image.
- Orientation: front, top, vertical/straight, or another explicitly requested view.
- Cover state: closed, open, removed, or a specifically requested cutaway.
- Parts to preserve, remove, expose, or reposition.
- Count and order of terminals, ports, switches, fuses, holes and repeated bays.
- Exact text edits and rating-to-position mapping, if any.
- Cable state/direction and requested deliverables.

For a small edit, lock all unaffected details: framing, product proportions,
colors, component counts, typography, and existing labels. Change only the
requested feature. A label edit is not a reason to redesign the entire product.

### 2. Resolve facts only when necessary

Do not research a supplied photo merely to redraw its visible appearance.
Search when the user asks to search/verify, requests hidden structure not shown
in the sources, or needs the appearance of a missing accessory or blank insert.
Prefer the exact manufacturer's product photos, drawings and manuals; use the
model and hardware revision where known. Cite consequential researched facts.

Never turn a plausible guess into an official product detail. When the exact
blank plate, internal terminals or accessory cannot be verified, state the
uncertainty briefly and use a clearly generic representation only when that is
acceptable to the task. Ask for another photo if the uncertainty affects the
connection layout. Keep sources and caveats outside the image, consistent with
the host's image-response rules.

Do not infer a product brand from earlier devices in the conversation. In
particular, a rack panel must not acquire a Victron logo because the preceding
component was Victron.

### 3. Render using the available image tool

Use the host's actual image-generation/editing capability for these requests.
Follow its current schema and higher-priority instructions; do not copy tool
names, image IDs or deprecated parameters from old transcripts. Never print
tool arguments or generation prompts as a substitute for creating the image.

Make these requirements explicit to the image tool, using the mechanism the
host supports:

> Redraw the supplied product, not another device, in the bundled flat,
> hand-drawn technical illustration style. Use an orthographic [requested view].
> Preserve [verified visible structure, count and order]. Make only [requested
> modifications]. Use flat source colors, dark clean contours and restrained
> hatching. Keep [relevant exact visible labels]. Omit [specified parts]. No
> added wiring, callouts, perspective, photorealistic texture, glow or background.
> Produce one isolated PNG with true transparency and an uncropped silhouette.

Use the original photo for product structure and a selected style anchor for
visual treatment. Do not carry geometry errors from earlier generated pictures
into a new version. If no image capability is actually available, explain that
limitation instead of claiming a render or silently substituting a different
output type.

### 4. Inspect before delivering

When the host permits access to generated output, visually compare it against
the specification and inspect the file. Check:

1. Requested view is genuinely flat, with no accidental side/top depth.
2. Every repeated element is counted individually, not assumed from symmetry.
3. Ratings and positions match the exact user mapping; text is not invented.
4. Terminals remain visible and in the correct places; no fabricated bridges,
   missing connections, substituted connector types, or new cables appear.
5. Cover/fuse/cable changes are complete without deleting unrelated structure.
6. Brand and model belong to this source, not a previous product.
7. Styling matches the anchors without metallic gradients, photographic textures,
   dramatic lighting, or loss of important product detail.
8. PNG transparency, margins, resolution and silhouette are usable in a diagram.

Use `scripts/check_png.py <image.png>` for a read-only alpha/margin check when
Python and Pillow are available. It cannot verify electrical correctness or
recognize a glow; visual inspection is still necessary. Do not remove every
white or black pixel to fake transparency: that can erase labels and equipment.

Prefer one generation followed, if necessary, by one targeted correction. Do
not repeatedly regenerate the full device to solve a small local error. If a
critical detail remains unresolved, explain it or request the needed source
rather than claiming precision. Never claim checks that could not be performed.

### 5. Deliver the asset, not an explanation of the asset

Follow the host's image-display and attachment rules. Keep normal image responses
image-focused, with no unsolicited commentary. When the image tool requires an
empty response after generation, comply. When file delivery is supported, use
only an existing verified file path; never fabricate a link or claim a PNG is
transparent without checking it when checking is possible.

PNG is the default. Do not promise editable Excalidraw objects, SVG, or CAD files
merely because the image has that visual style. Only create those formats when
requested. A real `.excalidraw` file must contain native editable shapes, not a
single embedded bitmap; a real vector SVG must not be a wrapper around a PNG.

## Meaning of common requests

| Request | Required action |
|---|---|
| “Make me one for this.” | Apply this skill to the latest usable product photo, keeping the established style. |
| “Directly in front / no 3D.” | Reconstruct the front elevation without side/top faces or perspective shading. |
| “Top view of the busbar, without protection.” | Show its exposed rail and the exact number of studs from directly above; omit the cover entirely, not as a separate object. |
| “Inside, like the PowerIN.” | Use the open-product photo; remove the large front lid and expose actual busbars, terminal studs and board layout. Do not deliver the closed blue cover. |
| “No fuse; I will draw it.” | Leave the fuse's mounting points and space available; do not substitute a wire, metal bridge, or different fuse. |
| “Remove the cables.” | Remove the drawn external wiring and lugs that belong to it, retaining the equipment's own terminal studs/connectors. Distinguish integral factory wiring; follow explicit requests to remove it as well. |
| “Straight, with the cable going up.” | Make the device's main axis vertical and route its existing lead upward, without changing its attachment point or inventing another cable. |
| “Blank position.” | Show an unpopulated bay or blank cover appropriate to the verified product, not a switched-off breaker or a breaker with erased rating only. |
| “Change these amperages.” | Apply the exact position map; preserve the casing, all slot positions, and every unaffected label. |

## Supporting material

- `references/style-guide.md`: visual anchors, product-specific handling and
  common failure modes.
- `references/examples.md`: invocation examples and regression cases.
- `references/acceptance-tests.json`: structured cases for later skill evaluation.
- `assets/style-references/`: packaged appearance references, not engineering
  drawings or a complete archive of every image from the original conversation.
- `scripts/check_png.py`: optional read-only PNG quality checker.
