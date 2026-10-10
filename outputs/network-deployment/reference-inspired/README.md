# Aurora network deployment and operations

The current fictional example has **10 sheets, 41 distinct devices, 58 physical cables, 10 logical links and 1,343 editable elements**. Repeated equipment across views retains the same model, address and inventory identity. All text uses Excalifont. Source customer material is unchanged and is not distributed with the plugin.

The reference-inspired additions are operational facts beside equipment, explicit endpoint U/T profiles, location/MAC/management information, interface address assignment, SSID security/isolation, WAN provider/demarcation/gateway/service rates, exact NAT translations and dated document control. Separate schedules keep the main topology readable. All added allocations, MACs, locations, circuit references and policies are fictional; no network configuration was applied.

## Files

- `aurora-network-deployment.excalidraw`: complete editable native MCP export, including metadata, frames, groups and bindings.
- `aurora-network-deployment.svg`: native editable SVG export.
- `aurora-network-deployment.pdf`: ten bookmarked A2 pages made from native per-frame renders to retain handwriting; edit the accompanying Excalidraw file.
- `01-…png` through `10-…png`: native bounded previews of every sheet, captured at the export's exact revision.
- `aurora-network-inventory.json` and `aurora-cable-schedule.csv`: canonical fictional facts and both cable endpoints, including VLAN profiles and PoE.
- `verification.json`, `native-analysis.json` and `plugin-verification.json`: save/reopen, semantic/geometry, analyzer and package evidence.

The branch topology is sheet 04. Its operational schedules are sheet 09; HQ WAN/NAT is sheet 10. The other views cover perimeter/core, access/DMZ, compute/storage, recovery, VPN/replication, virtual services and addressing.

## Validation

The complete paginated scene passes inventory, visible-field, metadata, binding and font audits. Compiler route and label checks report no findings; the native analyzer reports no findings. All ten native previews were visually inspected, including long table cells and document control. The PDF's new operations pages were rendered and inspected.

Saving and restarting the installed app preserved all geometry, typography, metadata, relationships and assets. The editor normalizes the 31 new table separators' empty `boundElements` from null to an empty array on loading; every other element field is identical. This harmless normalization is recorded in the round-trip evidence.

There are **29 passing package/compiler tests and 6 passing focused native tests**. The native fix accepts recursive JSON arrays in custom data; its persistence test covers interface objects, numeric VLAN arrays and heterogeneous extension values. The installed binary matches the tested build, all 469 bundled editor asset hashes are recorded, and its embedded plugin matches the shareable marketplace ZIP.

## Share the plugin

Version **0.3.0** is installed and enabled in local Codex. The standard Agent Plugins ZIP has one `excalidraw-design/` root; the marketplace ZIP includes a relative catalog for direct Codex CLI installation. Both contain the two skills, original editable equipment, fictional inventory, original logo and checksums. They contain no customer drawing, personal credential, dependency cache or remote service.

Build either package using `script/package_diagram_plugin.py`; see `plugins/excalidraw-design/README.md` for recipient instructions. Each recipient needs a compatible current ExcalidrawDesktop build, Complete MCP enabled and their own local client credential. Start a new Codex chat after installing/updating the plugin and invoke `$excalidraw-network`.

Claude Code compatibility is packaged; live independent Claude acceptance remains unverified because that client is signed out. These are shareable local ZIPs; no account/Workspace sharing link or public-directory publication was created.

The `iterations/before-legibility` folder preserves the first draft of the new schedules. Use the numbered previews for the final version.
