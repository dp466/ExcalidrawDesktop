# Portable diagram skills

The source package is `plugins/excalidraw-design`, by Dilan Paradis. Shared visual rules, detailed network rules and illustrated electrical rules are separate skills in that package. The source marketplace is `.agents/plugins/marketplace.json`. Existing clients keep their separately configured local MCP credentials; distributing the skills does not grant diagram access.

Build a shareable archive:

```sh
python3 script/test_diagram_plugin.py
python3 script/package_diagram_plugin.py --output /tmp/ExcalidrawDiagramPlugin.zip
python3 script/package_diagram_plugin.py --format plugin --output /tmp/ExcalidrawDesign-plugin.zip
```

Release builds package it into app resources before recording the build manifest. App users choose Settings → MCP → Export diagram plugin…, unzip to a permanent folder, and follow the contained README. Its marketplace paths are relative to the extracted root. No original checkout, username, absolute resource paths, font binary, client credential or hosted service is required.

Use `$excalidraw-network` for port-labelled infrastructure diagrams, `$excalidraw-electrical` for illustrated wiring and `$excalidraw-design` for general illustrated diagrams. Version manifests at root, `.codex-plugin` and `.claude-plugin` must agree. The packager checks this, excludes Python caches, rejects symlinks, rejects machine paths and bearer credentials, and records file hashes. Packaging is deterministic.

Add future subject skills under the same `skills/` directory without changing the app export code. Each needs a focused SKILL.md, implicit invocation metadata where appropriate, domain references, reusable resources and real diagram acceptance. Electrical rules distinguish terminals, wire numbers, junctions, protective earth and voltage domains; generic network port rules must not substitute for those conventions.

Manufacturer interface references and fictional alias assumptions live with the network skill. The inventory helper creates a complete redesigned scene; a partial live revision uses MCP operations against the existing IDs. Fonts, icons, frames, groups, metadata and bindings remain editable. Always inspect every changed frame before delivering.

## Version 0.3.0: operational documentation

The network skill now teaches device identity, interface address assignment, physical locations/MACs, endpoint-specific U/T VLAN profiles, SSID authentication/isolation, WAN circuit/demarcation/service rates, NAT source/translation tables and document control. It learns general conventions from a supplied drawing while keeping customer facts and the original PDF outside the distributed package. Excalifont remains the default.

The fictional Aurora inventory adds branch operations and WAN/NAT sheets to its existing eight views. Tables and topology labels derive from the same inventory, and the audit checks visible facts as well as metadata. Unknown and unmanaged IPs remain explicit. The helper rejects invalid VLAN profiles, embedded management credentials, bad circuit gateways and invalid NAT ports.

The portable root manifest follows Agent Plugins 1.0; compatibility manifests retain the existing Codex/Claude identity. A contained original SVG provides listing artwork. The standard archive has one `excalidraw-design/` root, while the marketplace archive provides the relative catalog for direct Codex CLI installation. Both contain authored skills, original editable illustrations, fictional examples and checksums. Neither contains client credentials, customer source files, installed dependencies or a remote server. Account sharing and public submission remain separate host workflows.

Nested JSON arrays in `customData` require the app's recursive metadata decoder. The native persistence regression test covers interface objects, numeric VLAN arrays, heterogeneous extension values and reopen behavior. This prevents a diagram that looks correct in the editor from failing to save its operational facts.

## Version 0.4.0: illustrated electrical documentation

Corrected author/developer metadata to **Dilan Paradis** in standard and compatibility manifests. Generated marketplace ownership now comes from the source manifest rather than a duplicated hard-coded name. Existing plugin identity, network/default prompt ordering and local MCP credentials are preserved.

The electrical skill learns equipment/terminal detail, paired DC wiring and local notes from an author-supplied drawing. It adds bounded sheets, wire/net identities, distinct DC/AC/PE/communication/contact semantics, exact terminal bindings, primary documentation and explicit unresolved design inputs. It includes original generic equipment and a disconnected fictional documentation sampler. The shared package contains no original user scene or manufacturer raster artwork. Validation checks document consistency, not installation sizing or approval.
