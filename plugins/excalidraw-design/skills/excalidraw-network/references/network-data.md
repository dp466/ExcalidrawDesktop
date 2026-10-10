# Network inventory and port provenance

The Aurora fixture is a fictional reference deployment with real example model families. Addresses, placements, cables, module selections, policies, tunnels and aliases are invented. It does not establish that a real purchase or switch/NIC configuration is compatible. Verify exact SKU, firmware, optics, module power/thermal restrictions and desired speed before a real design.

## Inventory format

`devices`: stable `id`, `hostname`, `alias`, `model`, `management_ip` (IP/prefix), `site`, illustration `kind`, `role`, `address_notes`, and a `ports` dictionary. A physical port specifies `kind: physical`, `speeds_mbps` and `media`; a logical endpoint specifies `kind: logical`. Record physical aliases and the installed NIC/module in notes.

`connections`: stable `id`, `kind` (`physical`/`logical`), `source` and `destination` objects containing `device` and `port`, `medium`, `purpose`, and optional `vlan_label`/style. Physical cables require `speed_mbps`. Each physical port is occupied once; logical interfaces may carry multiple flows. HA virtual addresses are notes, not duplicate device management IPs.

`sheets`: stable frame `id`, title/subtitle, width/height, device `nodes` (local x/y), and `connections` referencing inventory IDs. Optional route hints specify attachment sides/ratios, Manhattan `via` points, side-bypass channels, label width/position. Captions extend to the right of the icon: reserve their full box, not just the small icon. Tables and text sections use measured handwriting and remain directly editable.

The compiler emits skeleton elements, not canonical raw elements. Insert with normal `create` conversion so the editor supplies defaults and real text metrics. Its initial `replace_scene` is destructive to that drawing and appropriate only for a new or authorized redesigned document. It emits **no credentials, no server calls and no file-system configuration changes**.

For scenes larger than a read limit, collect all pages and use `merge_scene_pages`. It rejects changed revisions, missing IDs and repeated IDs. `audit` checks visible models, addresses, hostnames, cable ports, retained metadata, root bindings and Excalifont.

The fixture also includes optional operational facts: document control, endpoint U/T profiles, device locations/MACs/management URLs, interface/SSID mappings, circuits and NAT rules. Detail tables derive from that same inventory and remain audited/editable. The format and drawing conventions are in [deployment-documentation.md](deployment-documentation.md).

## Checked manufacturer references

- [FortiGate 100F port architecture](https://docs.fortinet.com/document/fortigate/7.0.6/hardware-acceleration/47902/fortigate-100f-and-101f-fast-path-architecture): copper WAN1/WAN2, HA1/HA2 and ports1–12; X1/X2 are 10G SFP+. Do not invent copper ports15/16 for this model.
- [FortiGate 60F port architecture](https://docs.fortinet.com/document/fortigate/7.0.0/hardware-acceleration/758378/fortigate-60f-and-61f-fast-path-architecture): gigabit copper WAN and internal interfaces.
- [Nexus 9300-FX3 data sheet](https://www.cisco.com/c/en/us/products/collateral/switches/nexus-9000-series-switches/datasheet-c78-744052.html): C93180YC-FX3 has 48 SFP28 ports and six QSFP28 ports. The example assigns 100G only to Eth1/49–54; copper module choices need explicit validation.
- [Catalyst 9200 hardware overview](https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst9200/hardware/install/b-c9200-hig/product_overview.html): C9200L-48P-4X has 48 gigabit PoE ports and four fixed 10G uplinks. Fixture shorthand Gi1/0/n and Te1/1/n refers to local physical ports.
- [CCR2004-16G-2S+](https://mikrotik.com/product/ccr2004_16g_2splus) and [CRS326-24G-2S+RM](https://mikrotik.com/product/CRS326-24G-2SplusRM): gigabit copper and 10G SFP+; public handoff addressing is fictional.
- [RS3621xs+ data sheet](https://global.download.synology.com/download/Document/Hardware/DataSheet/RackStation/21-year/RS3621xs%2B/enu/Synology_RS3621xs%2B_Data_Sheet_enu.pdf): four gigabit and two built-in 10GBASE-T ports. **LAN5/LAN6 are the project's aliases for the two 10G ports**, not a claim about labels printed on a real chassis. RS3621RPxs is a different model.
- [Dell R650 technical guide](https://i.dell.com/sites/csdocuments/product_docs/en/poweredge-r650-technical-guide.pdf): adapter configurations vary. `NIC1/P1,P2` in the fixture maps to an assumed Intel E810 dual25G SFP28; `NIC2/P1,P2` maps to an X710-T2L dual10GBASE-T. Confirm exact adapter support and populated slots for real machines.
- [UniFi U6 Pro](https://techspecs.ui.com/unifi/wifi/u6-pro): gigabit uplink and PoE. [Yealink T54W](https://www.yealink.com/en/product-tech-specs/ip-phone-t54w): gigabit Ethernet/PoE. [Axis M2035-LE data sheet](https://www.axis.com/dam/public/2b/84/38/datasheet-axis-m2035-le-bullet-camera-en-US-367672.pdf): 10/100 Ethernet/PoE, so the camera cable is labelled 100M.
- [Brother HL-L5210DN](https://www.brother-usa.com/p/laser-printers/HLL5210DN): wired gigabit Ethernet. [Zebra TC52](https://www.zebra.com/us/en/products/spec-sheets/mobile-computers/handheld/tc52-tc57.html): Wi-Fi handheld; the fixture shows a logical 5GHz Wi-Fi link.
- [vSphere link aggregation requirements](https://knowledge.broadcom.com/external/article/324555/host-requirements-for-link-aggregation-e.html): LACP requires a distributed switch. The fixture's standard `vSwitch0` instead uses independent active/standby trunks C35–C38, with no physical port-channel. iSCSI NIC2 paths remain separate MPIO interfaces.

These links support interface counts/capabilities; the exact fictional configurations and aliases remain project assumptions. The complete cable schedule and device metadata accompany the editable scene.
