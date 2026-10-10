# Aurora detailed network deployment

This fictional reference has eight sheets, 41 unique devices (53 illustrated instances), 58 physical cables and 10 logical links. Every connection shows both endpoint ports; every device shows its hostname, model and IP. All 466 text elements use Excalifont. Equipment strokes, captions, frames and bindings remain editable.

- [Editable Excalidraw scene](aurora-detailed-network.excalidraw)
- [Editable SVG export](aurora-detailed-network.svg)
- [Eight-page PDF companion](aurora-detailed-network.pdf)
- [Full device, port and connection inventory](aurora-network-inventory.json)
- [Cable and logical-link schedule](aurora-cable-schedule.csv)

The PDF uses bounded native frame images. Zoom for dense port details; use the Excalidraw file to revise elements. The model families are real examples; IPs, sites, adapter choices, aliases and deployment policies are fictional. Exact SKU/module/optic compatibility requires validation for a real project. Physical copper/fiber/DAC links are distinguished from wireless, VPN and virtual links.

## Sheets

1. [HQ perimeter and core](01-hq-perimeter.png): redundant ISPs, WAN handoff switches, firewall HA and vPC core.
2. [HQ access and DMZ](02-hq-access.png): access uplinks, endpoint devices, PoE, DMZ and VLANs.
3. [HQ compute and storage](03-hq-compute.png): fabric pairs, active/standby standard-vSwitch trunks, separate iSCSI MPIO paths and backup bond.
4. [Québec distribution site](04-branch.png): branch firewall, access, voice, Wi-Fi, printer and handheld scanner.
5. [Private recovery site](05-dr.png): recovery services, vault and stated remaining single points of failure.
6. [VPN and replication](06-overlay.png): logical tunnel endpoints, routes and replication flows.
7. [Virtual services](07-services.png): domain controllers, ERP, SIEM and VM port-group endpoints.
8. [Addressing and deployment notes](08-addressing.png): VLANs, subnets, gateways, assumptions and checks.

## Verification

- `semantic-audit.json` and `native-analysis.json`: final saved scene, labels, fonts and bindings.
- `detailed-verification.json`: final revision, checkpoint, persistence and editable export hashes.
- `codex-network-acceptance.json`: real Codex 0.2.0 plugin read/render/edit/undo/save/export test, before the later uplink correction.
- `vswitch-correction.json`: version 0.2.1 correction with unchanged unrelated elements and preserved bindings.
- `recovery-verification.json`: undo/redo and checkpoint restoration of the detailed scene.
- `presentation-verification.json`: eight-page configuration and native first/last-page playback.
- `plugin-portability.json`: relocated package installation/compilation.

The portable plugin is built from `plugins/excalidraw-design` and exported in the installed app at Settings → MCP → Export diagram plugin…. Its shared visual skill and network skill use each client's separately configured local MCP. Codex is configured and tested on this Mac. Claude manifests validate; a live Claude test remains pending sign-in.
