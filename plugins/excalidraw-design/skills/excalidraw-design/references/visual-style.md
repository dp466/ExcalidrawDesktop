# Hand-drawn infrastructure style

## Typography and palette

Use the editor's bundled Excalifont, family 5. Default title 40–48 px, site heading 28–32 px, equipment caption 20–23 px, and address/detail 16–18 px. Keep captions to one or two short lines. Measure with the editor after fonts load; wrap or widen if needed. Scale the composition before making labels smaller than 16 px. Do not substitute Helvetica or a bitmap of text.

Charcoal `#343d4b` for equipment outlines and primary captions; gray `#657080` for secondary detail. Use pale blue `#dbeafe` for network/cloud, teal `#ccfbf1` for switching/storage, lavender `#ede9fe` for workloads, peach `#ffedd5` for security. Colors are defaults, not a requirement to color every object. White canvas; unfilled or very light site boundaries. Default stroke 1.6–2 px, roughness around 1; smaller icon details can use lower roughness.

## Composition

Build a readable hierarchy: title, site headings, illustrated equipment, then captions. Keep large physical/site groups apart. Use one primary topology view rather than a grid of large filled panels. Put detailed VLAN/policy information in a separate frame only if it would overwhelm the view. Leave roughly 50–90 px between small component groups and 140–220 px between larger branches; size by actual measured labels, not just the symbol.

Network lines are paths between illustrated objects, not walls around blocks. Use blue for WAN/VPN, charcoal or slate for LAN, and teal dashed paths for backup/replication. Label line styles as well as colors. Route through empty space; take the long way around a caption when needed. Use plain connections for physical Ethernet and directional arrowheads for meaningful application/replication flow. Redundant links can be parallel or dashed, with a legend explaining them. Avoid needless arrowheads on every cable.

Keep technical facts true even in fictional diagrams: full CIDR notation, explicit HA behavior, consistent VLAN gateways, isolated guest/IoT/backup networks, and clear scope of aggregated endpoint icons. Use documentation-range public IPs in fictional examples.

## Reference direction and provenance

Visual inspiration: [Eric Sloof's Excalidraw VMware architecture icons](https://www.ntpro.nl/blog/archives/3718-Excalidraw-VMware-architecture-icons.html), and the [official Excalidraw library directory](https://libraries.excalidraw.com/). These show recognizable equipment and service symbols with handwriting. The bundled equipment drawings are original native Excalidraw elements made for this plugin; no vendor icons or third-party library artwork are copied. Excalifont is supplied by the installed editor, not redistributed by the plugin.

The Aurora fictional network test is the current demonstration, not a universally approved template. Treat further user feedback as a refinement of these defaults.
