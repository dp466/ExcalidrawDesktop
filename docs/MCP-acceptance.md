# Complete diagram MCP validation

Validated on 2026-10-01 on Apple Silicon macOS. The implementation is installed
at `/Applications/ExcalidrawDesktop.app`. The full acceptance contract remains
pending **Claude Code's independent workflow** because its OAuth session expired
and could not refresh. Run `claude auth login`, then rerun that workflow before
calling both-client acceptance complete.

## Automated checks

| Check | Result |
| --- | --- |
| Native regression runner | 63 XCTest tests and 26 Swift Testing tests passed |
| Editor helper and production React file-load tests | 62 tests in 11 files passed |
| Editor TypeScript | Passed |
| Canonical pinned source plus `patches/editor.patch` | Exact patch verification passed |
| Patch verifier regression | Passed |
| Reproducible Release build | Passed; installed executable matches staged Release |
| Installed editor assets | All 469 recorded asset checksums match |
| MCP Inspector 2.9.0 | Legacy and modern initialize/discover, strict tool listing, and capability calls passed |

Tests cover atomic validation and conflicts, cancellation during preparation,
one-step undo/redo, durable retry receipts, save/export through the actual native
command service, raw scene and asset preservation, scoped layout, containers,
labels, library remapping, approved-path boundaries, credential revocation,
transport errors and disconnect cancellation. The isolated native export test
exercises editable Excalidraw, PNG, SVG, and PDF. These tests run through
`script/test_local.sh`; the live client endpoint requires the separate opt-in
`script/acceptance_mcp_clients.sh`.

The actual embedded-editor benchmark measured **196 ms** for measured layout of
100 nodes and **17 ms** for replacement plus paginated inspection of a
1,000-element mixed scene in the final native gate. These are local test timings,
not a latency guarantee for larger or asset-heavy documents.

## Real client results

Codex CLI **0.159.0** completed the live native workflow in an isolated approved
linked folder: create a diagram, inspect and refine its preview, change content
in a batch, undo/redo, create and restore a checkpoint, save, switch documents,
reopen, and export all four formats. Its persisted final scene contains 29
elements, ten arrows bound at both ends, multilingual text, frames, and one SVG
asset. A second Codex run reopened the saved scene without editing it and verified
the final exporter. All four outputs represent the same reopened revision.

The initial exporter used macOS item-replacement directories, which were not
readable from client processes. The final exporter uses the app's temporary
`ExcalidrawDesktop-MCP-Exports` directory (mode 700, files mode 600). An independent
process successfully read and copied each output, parsed the scene and SVG,
validated PNG dimensions, and checked the PDF. The editable scene retained the
asset and all ten bound arrows.

Retained synthetic fixtures:

- [Editable scene](mcp-examples/codex-acceptance.excalidraw)
- [PNG preview](mcp-examples/codex-acceptance.png)
- [Editable SVG](mcp-examples/codex-acceptance.svg)
- [PDF](mcp-examples/codex-acceptance.pdf)

Claude Code **2.1.277** was launched with its own temporary MCP configuration and
credential. Its model sign-in failed before the diagram workflow started. This
is an uncompleted acceptance gate, not a successful Claude integration test.
The isolated harness used temporary client configuration and credentials. The
subsequent user-requested local Codex setup below changed only its dedicated
ExcalidrawDesktop connection and installed the design plugin.

Inspector and Codex also exercised the live endpoint using separate credentials.
A protocol regression now checks concurrent legacy versions using a shared
credential, so one initialization cannot overwrite another process's revision.

## Visual and installed-app checks

Network, architecture, workflow, and presentation fixtures exercise long labels,
multilingual text, cycles, assets, and nested frames. Their mechanical overlap
and clipping checks pass. The retained Codex preview is readable and has no
analyzer findings, but its long feedback routes remain visually dense. A clean
analysis result does **not** establish ideal composition: agents must inspect
the rendered image and refine routing, spacing, and hierarchy.

The installed app was quit normally, updated, and relaunched. Its actual Settings
→ MCP page shows Complete mode, separate client credentials, and connection
status. MCP is now enabled for the user-requested local Codex setup, and the
navigation header visibly reports `MCP ready`. Connect using [MCP.md](MCP.md);
command examples and recovery semantics are in [diagram-commands.md](diagram-commands.md).

## Earlier handwritten overview acceptance

The user's persistent local Codex configuration connects to the loopback server
with its own revocable credential. A real Codex CLI session used the installed
[Excalidraw Design plugin](../plugins/excalidraw-design/README.md) to inspect
native frame previews, refine captions and routes, undo a batch, save/reopen,
and export editable Excalidraw, PNG, SVG, and PDF. The plugin's final installed
version is `0.1.2`; all ten repository package files match its installed cache.
Its twelve original editable equipment components are also imported into the
app library.

The fictional AURORA deployment contains 450 elements, 31 device groups, 39
connectors bound at both ends, and 137 text elements using Excalifont
(`fontFamily: 5`). The overview separates headquarters, a distribution site,
and disaster-recovery cloud; addressing and deployment notes occupy a second
frame. Both native frame images were visually inspected, and the final analyzer
reports no findings. The rejected initial box layout remains in the iterations
directory.

The real client exposed two editor regressions: same-ID scene replacement could
leave an older element version in the undo snapshot, and skeleton creation could
overwrite measured wrapped text with the original input. Both fixes are retained
in `patches/editor.patch` and have regression tests. Installed-app MCP checks
verified that replacement advances element versions, two successive undo steps
restore each complete scene, and width-constrained text retains wrapping and
measured height. The original 450-element scene was restored after every test.
An app restart retained all device groups, bindings, and Excalifont text.
Native presentation start, subsequent status, navigation to the addressing
frame, stop, and restart also passed. Both slide identities were verified in
the installed UI; the finished drawing remains open in the editable canvas.

All 469 installed editor assets match their build-manifest checksums, and the
installed manifest matches the current editor patch. The updated test-owned
Codex credential was verified; its superseded credential returns HTTP 401.
Other credentials were left unchanged.

Retained evidence and artifacts:

- [Native topology preview](../outputs/network-deployment/topology-frame-preview.png)
- [Native addressing preview](../outputs/network-deployment/addressing-frame-preview.png)
- [Editable diagram](../outputs/network-deployment/aurora-network-deployment.excalidraw)
- [PDF](../outputs/network-deployment/aurora-network-deployment.pdf)
- [Real Codex style acceptance, including the initial undo failure](../outputs/network-deployment/codex-style-acceptance.json)
- [Installed fixes and persistence verification](../outputs/network-deployment/installed-style-fix-verification.json)
- [Final export and revision verification](../outputs/network-deployment/final-artifacts-verification.json)
- [Installed presentation verification](../outputs/network-deployment/presentation-verification.json)

Claude Code's authentication status was rechecked on 2026-10-01 and reports
`loggedIn: false`. Its plugin and marketplace manifests validate, but its
independent live diagram workflow remains uncompleted.

## Repeating the pending acceptance

Build the native/editor snapshot, then start `script/acceptance_mcp_clients.sh`
using its snapshot, DerivedData, and package-cache paths. Wait for
`/private/tmp/full-mcp-validation/ready.json`; consume the private client
configuration without printing tokens. After human Claude sign-in, use that
client's own temporary configuration to perform the entire create → revise →
render → undo/checkpoint restore → save/reopen → four-format export workflow.
Check the saved scene and exported artifacts, then write the harness's `finished`
flag. Keep failed or skipped gates explicit in this record.

## Detailed network plugin (2026-10-01)

The live Aurora fictional drawing was expanded into eight editable frames: perimeter/core, access/DMZ, compute/storage, branch, recovery, VPN/replication, virtual services and addressing. It has 41 unique inventoried devices (53 instances), 58 physical cables, 10 logical links and 1,152 elements. Every device instance retains visible hostname/model/IP and metadata; every connection retains source/destination bindings and both port labels. All diagram text uses Excalifont family5.

The new `excalidraw-network` skill is packaged beside the common `excalidraw-design` skill, using portable sibling resources and no embedded credentials or server configuration. Version 0.2.1 is installed in the user's persistent Codex configuration. The shareable ZIP compiles its complete fixture from an unrelated directory. Both Claude compatibility manifests validate. Independent Claude client acceptance remains pending a valid local Claude login.

`script/test_diagram_plugin.py` contains 20 behavioral checks: inventory coverage, duplicate physical port/address rejection, supported speed/media, logical endpoints, gateway membership, visible ports/bindings/metadata/fonts, revision-safe pagination, route conflicts, standard-vSwitch uplink semantics and package relocation/integrity. It is included in `script/test_local.sh`. The compiler catches collinear shared routes, unrelated equipment crossings, clipped routes and label collisions; these supplement native analysis and image inspection.

Installed-editor inspection of all eight native frame images found no clipped fields or merged cable lanes in the current fixture. Undo returned to the previous874-element scene; redo restored all1,152 elements. A temporary title edit followed by checkpoint restoration returned the verified title and full audited network. Save and editable Excalidraw/SVG exports succeeded. An eight-page PDF is composed from bounded native frame renders; it is a raster presentation companion, with editable source and inventory/cable schedule supplied separately. See `outputs/network-deployment/detailed` for revision-stamped evidence and artifacts.

`script/build_release.sh` bundles a deterministic `ExcalidrawDiagramPlugin.zip`; the build manifest records its hash. Settings → MCP exports that package through a save panel. Public directory submission and electrical diagram skills are separate future work.

A real Codex CLI session loaded both installed version 0.2.0 skills, read all 1,152 elements in five pages, audited every device/cable and inspected native access, compute and perimeter previews. A dry run followed by a title-only edit and undo restored the exact title and left the other 1,151 elements unchanged. All 136 reciprocal connector bindings and custom data survived; explicit save and editable export passed. Evidence is [codex-network-acceptance.json](../outputs/network-deployment/detailed/codex-network-acceptance.json). This test preceded the small version 0.2.1 technical correction below; it is not labelled as a test of the later fixture.

Final technical review corrected C35–C38 from LACP to independent active/standby trunks for the fixture's standard vSwitch0. Port labels and the compute footer show the policy. The change touched 13 elements, retained both endpoint bindings and left every other element identical. The saved corrected scene passed the full audit after another installed-app restart. See [vswitch-correction.json](../outputs/network-deployment/detailed/vswitch-correction.json).

The installed app's plugin export was tested through its actual save panel. Its version 0.2.1 ZIP matches the packaged source byte for byte; SHA-256 is `b46d9d40a51839a00e744239d2f85aedcbcd534848a3ebdcb3327cb5f56e4ca9`. All 18 plugin source files match the installed Codex cache. Native presentation was configured with all eight frame IDs, showed pages 1/8 and 8/8, and stopped back to the editable canvas. Final revision-stamped exports, inventory, cable schedule and bounded native images are in [the detailed delivery folder](../outputs/network-deployment/detailed/README.md).
