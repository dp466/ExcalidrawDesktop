# Invocation examples and regression checks

In a host with a skill selector, select Excalibur Image Creator and attach the
product photo. Host-dependent mention syntax is described in the package README.
These are examples, not default product specifications.

## A. New component

Request: “Make me one for this.” + product photo, within this workflow.

Expected: one isolated, flat, directly front-facing Excalidraw-style PNG. Retain
recognizable product colors, geometry and visible terminals. No invented cables,
callouts, other equipment or unrelated branding.

## B. Cover-off distributor

Request: “Lynx Distributor, inside like the PowerIN. No fuses; I'll draw them.”
+ real open-product photo.

Expected: interior rather than the closed cover. Preserve the source's four
branch locations and board. Leave fuse mounting space open. No blue cover
concealing connections, added branch, glass fuse, or fabricated conductive link.

## C. Exact rack-panel edits

Request: “Starting left to right: 1=5A, 2=5A, 3–6=blank, 7=5A, 8=10A,
9=5A, 10=10A, 11=10A, 12=blank.”

Required global order:

| Position | Bank / local position | Appearance |
|---|---|---|
| 1 | A1 | 5A breaker |
| 2 | A2 | 5A breaker |
| 3 | A3 | Blank |
| 4 | A4 | Blank |
| 5 | A5 | Blank |
| 6 | A6 | Blank |
| 7 | B1 | 5A breaker |
| 8 | B2 | 10A breaker |
| 9 | B3 | 5A breaker |
| 10 | B4 | 10A breaker |
| 11 | B5 | 10A breaker |
| 12 | B6 | Blank |

Expected: twelve positions, seven actual breakers, five blank positions, two
banks of six. Blank positions have no switch/ON/OFF/rating printing. Keep rack
ears, handles, title and bank labels unchanged. This map is an example of a
user-directed drawing change, not an electrical recommendation or default.

When the request also says “search online; I couldn't find the blank,” research
the exact panel/accessory before representing the blank as manufacturer-correct.
If the model cannot be identified, ask for it or label the uncertainty outside
the image. The packaged drawing of blanks is not independent verification.

## D. Six-stud busbar

Request: “Top view, without the protection on top.” + a photo showing six studs.

Expected: six individually counted studs, exposed rail and base, top-down only.
No five-stud substitution, rotated oblique view, removed base, or floating cover.

## E. Tall sensor and cable direction

Request: “Make this straight, cable going up.” + sensor photo.

Expected: vertical rod with the flange at the top, retained float and bottom
stop, and its existing lead routed upward. Preserve visible lead count/colors.
No new lead, invented plug or arbitrary change to its attachment point.

## F. Converter with no added power wiring

Request: “Make me one of this Orion.” + bare converter photo.

Expected: source-matching blue body, black end caps and three visible bottom
terminals. Do not add red/black power cables. Major readable labels remain.

Follow-up: “Remove the cables.”

Expected: remove previously added external wiring while preserving the original
studs, enclosure, layout and factory hardware. Do not turn the whole picture
into a photorealistic rendering or add a glow while making this edit.

## G. Missing target

Request: “Redo the approved picture” with no accessible image in the current
context or files.

Expected: request the target image. Do not pretend to remember its pixels or
invoke an edit on an opaque old image ID.

## H. A true editable artifact

Request: “Make it an editable Excalidraw file, not just a PNG.”

Expected: create a genuine native shape-based file when supported, or explain
the capability limitation. Do not rename a PNG or embed one bitmap and call its
components editable. The normal image-only workflow does not promise this.

## I. Scope boundary

Request: “What fuse rating should I use for this battery bank?”

Expected: this skill does not select a rating. Treat it as a separate electrical
analysis question requiring appropriate specifications and verification.

## J. No stale defaults

Request: “This time, keep the cables and use a side view.”

Expected: honor those explicit changes for this asset rather than forcing the
usual front-facing/no-added-cables defaults. Preserve the remaining style rules.
