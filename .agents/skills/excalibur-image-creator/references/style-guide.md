# Visual style and retained preferences

This guide captures the user's product-image workflow, not a universal
Excalidraw specification. It is self-contained so the source chats need not stay
open. The drawing should be recognizable technical clip art: neither a glossy
product rendering nor an oversimplified circuit symbol.

## Which reference to inspect

The files below are selected drawings from the conversation. They are appearance
references, not proof of the real hardware's wiring or certified construction.
Use the new source photo or verified manufacturer documentation for structure.

- `../assets/style-references/power-in-style.png`: open enclosure, silver bars,
  dark outlined terminals, a red insulating collar, and restrained hatch fills.
  Follow its line/shape treatment rather than its exact component geometry.
- `../assets/style-references/distributor-inside-style.jpg`: a denser open-device
  illustration that retains the PCB, real-looking terminal positions and the
  enclosure. The white JPEG background is a preview artifact, not the desired
  output background. Do not reproduce it in a final transparent PNG.
- `../assets/style-references/rack-panel-style.png`: long, flat front elevation,
  twelve individually visible bays, clear labels and no invented product logo.
- `../assets/style-references/rack-panel-rating-edit.png`: an example of selective
  breaker-label and blank-position edits. Its blank inserts are illustrative;
  their precise real-world appearance was not verified in the original exchange.

## Drawing recipe

Use dark outlines, slight hand-drawn irregularity, and flat bounded fills. A
roughness similar to a tidy Excalidraw sketch is appropriate; avoid heavy jitter
or a loose pencil painting. At a 1000-pixel working width, main contours around
2–4 pixels are a useful starting point, not a mandatory scale.

Keep the actual product's principal colors: blue housing when blue in the
source, red switch bodies when red, charcoal enclosures, silver/light-gray
conductors and green circuit boards when present. Do not force every device into
the same brand palette. Muted diagonal hatching may distinguish surfaces, but
should not obscure text or wiring points.

Represent fasteners with a few concentric circles/hexagons rather than shiny
realistic threads. Use simple repeated lines for heatsink ribs. Simplify PCB
microcomponents into small rectangles and a few traces; retain the board's
location, connectors and structural role. A visually dense board does not need
invented chip markings, serial numbers or printed specifications.

Treat depth as an outline problem, not a lighting problem. Front-facing boxes
show the front only. Top-down bars show the top faces and studs. Tall sensors
are upright; use a simple flange representation that remains understandable
without exaggerated foreshortening or metallic glare.

No dramatic shadows, texture noise, beveled 3D edges, light blooms, gradients,
white background rectangles or checkerboard pixels. A black viewport around an
image is not evidence of transparency; inspect the alpha channel.

## Open equipment and connection access

For a cover-off drawing, use an actual open-device photo when available. Remove
the lid; do not fabricate a transparent cover or a blue border over terminals.
Do not include loose removed covers or end caps floating beside the product
unless requested. Keep necessary insulation, mounting structure and the
silhouette recognizable.

For the Lynx Distributor example, the supplied open photo shows four repeated
branch positions, a PCB across the middle, an upper silver rail, and lower
terminal/entry structure. Count from that source. Do not create a fifth branch,
a row of glass fuses, or a different two-rail layout because an earlier generated
picture happened to show one. Dark cable-entry guards are not automatically
fuses. The appearance reference must not override the photo.

For the Power In / fuse-holder workflow, leave fuses absent when requested so
the user can place fuse graphics later. Preserve separated mounting studs and
open placement areas. Never draw a conductive link across an empty fuse space.

This is artwork for a diagram. Do not silently size cables/fuses, choose
protection ratings, certify compatibility, or claim that a generated drawing is
an installation plan. Engineering questions require a separate verified task.

## Product labels versus annotations

Keep the source's recognizable brand and major model labels. Preserve visible
polarity and connector labels where they matter for diagram placement. The
instruction “no annotations” normally bans added explanatory labels and arrows,
not the product's own printed text. An explicit “no text” request removes text.

Do not invent tiny label copy, QR codes, certifications, pin labels, ratings or
model numbers. Simplify unreadable microprinting instead of drawing convincing
but false characters. Apply user-supplied replacements verbatim, including units.
Do not move a logo from a previous product onto the current product.

## Revisions should not drift

Changing a cable direction, one rating or cover state should not alter the
product's width, number of terminals or style. Lock unrelated details and use a
local edit where supported. When a prior render contains an error, correct the
error from the photo; do not preserve the error simply for visual continuity.

For a device with an integral lead, keep that lead unless told otherwise.
External red/black example power cables must not be added to a bare Orion
converter. On a request to remove those added cables, expose the actual three
bottom terminals rather than cutting them away with the cables.

## Deliverables and continuity

Default to a single cropped transparent PNG for each requested component.
Keep small consistent padding, include all studs/wire tips requested, and avoid
leaving a wide rack strip tiny in the center of a square canvas. Do not provide
multiple unwanted alternatives or all failed generation attempts.

The user can upload another product photo in a new chat and invoke this skill.
Only the general style/workflow is retained here. To edit a particular older
asset after archiving the chats, the user must provide that asset or make an
accessible copy available; do not assume access to all past images.
