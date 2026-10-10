# Excalidraw diagram plugin

A portable plugin by **Dilan Paradis** for ExcalidrawDesktop users. Version 0.4.1 includes three skills:

- **excalidraw-design**: Excalifont, original editable equipment illustrations, restrained colors and render/inspect/refine rules.
- **excalidraw-network**: deployment documentation with every device model and IP, both ports and U/T VLAN profiles on cables, locations/MACs, interface assignments, SSID security, WAN circuit details, NAT translations, port schedules and document revision control.
- **excalidraw-electrical**: illustrated Victron/solar/battery/AC/DC diagrams with visible terminals, conductor domains, wire IDs/schedules, protection and control detail, bounded sheets and verified manufacturer evidence. Unknown installation values remain explicit.

The plugin uses your separately configured local app MCP. No credential, personal drawing, extra server or font binary is included. Python 3 is needed only for the optional inventory/compiler scripts.

## Install the downloaded package in Codex

In ExcalidrawDesktop, open Settings → MCP and choose **Export diagram plugin…**. Unzip the exported archive into a permanent folder. In Terminal, change into the extracted `excalidraw-diagram-plugin` folder, then run:

```sh
codex plugin marketplace add "$PWD"
codex plugin add excalidraw-design@excalidraw-desktop-local
```

Keep the extracted folder for future updates. Start a new Codex chat. Ask:

> Use $excalidraw-network to create a fictional network deployment. Show every device model and IP and both cable ports, with Excalifont and illustrated equipment.

For general diagrams, invoke `$excalidraw-design`. Implicit selection is enabled. Explicit user preferences always take precedence over the defaults.

For electrical diagrams, ask:

> Use $excalidraw-electrical to create an illustrated Victron diagram with Excalifont, terminal-level wires, battery/protection detail and a wire schedule. Keep unverified ratings and settings explicit.

Create your own Codex credential in the app's **Client access** section and copy its private configuration using the app's Codex connection guide. Keep ExcalidrawDesktop open with MCP enabled in Complete mode. The skill cannot supply or grant that access. `codex mcp list` checks the connection; `codex plugin list` checks plugin installation. Keep credentials private and revoke them in the app when no longer needed.

## Install from the source repository

From the repository root, the same two Codex commands above install `plugins/excalidraw-design`. Develop the source, not the installed cache; increment all manifests together and rerun `codex plugin add` after changing the package.

## Claude Code

Claude Code uses the compatible manifest and the same skills. From the extracted package or repository root:

```sh
claude --plugin-dir "$PWD/plugins/excalidraw-design"
```

Invoke `excalidraw-design:excalidraw-network`, `excalidraw-design:excalidraw-electrical` or `excalidraw-design:excalidraw-design`. Configure a separate Claude Code credential with the app's connection guide. A valid Claude login is needed. Compatibility validation and Codex acceptance do not establish independent Claude acceptance.

## Included resources

`skills/excalidraw-design/assets/network-equipment.excalidrawlib` contains original reusable equipment. Its generator also supplies printer and handheld scanner illustrations. Components retain editable strokes, groups and bindable roots.

`skills/excalidraw-network/assets/aurora-network.json` is a fictional ten-sheet deployment with a complete displayed-device inventory, enriched branch topology, interface/SSID/port schedules and WAN/NAT documentation. The helper validates physical ports, supported speeds/media, addresses, native/tagged VLANs and complete coverage; compiles editable elements; checks routes and label placement; audits visible operational facts and metadata; and emits a cable CSV. It makes no network calls and reads no credentials. See that skill's `references/network-data.md` and `references/deployment-documentation.md` for format, assumptions and sources. The packaged example contains invented local-administered MACs, locations, circuit references and policies; no supplied customer drawing is distributed.

## Distribution and extensions

The app's release build bundles this exact package; the export button writes a shareable ZIP. Maintainers can also run `python3 script/package_diagram_plugin.py --output /tmp/ExcalidrawDiagramPlugin.zip` and attach it to an app release. The archive includes a relative local marketplace and checksums, so installation needs neither the maintainer's checkout nor their configuration.

For a standalone Agent Plugins package, run `python3 script/package_diagram_plugin.py --format plugin --output /tmp/ExcalidrawDesign-plugin.zip`. It contains the single `excalidraw-design/` directory with the portable root manifest, skills, assets, checksums and compatibility manifests. The marketplace ZIP is the direct Codex CLI installation package; the standalone ZIP is the reusable plugin source for hosts accepting Agent Plugins packages. Neither archive grants local MCP access or installs a remote service. Account/Workspace sharing requires the host's supported save/share workflow; a downloaded local plugin still needs each user's Mac app and credential.

When using the standalone archive with Claude Code, change into the extracted `excalidraw-design` directory and run `claude --plugin-dir "$PWD"`. For Codex CLI, use the marketplace archive and the installation commands above. Share the ZIP together with the app's connection requirements; recipients configure their own access.

`skills/excalidraw-electrical` adds the illustrated electrical workflow, a generalized style reference, subsystem documentation rules, current primary-manual links, original editable generic equipment and `assets/fictional-wiring.json`. Its standard-library helpers validate documentation endpoints/domains/protocols, generate a wire CSV and audit visible labels, metadata and exact terminal bindings. The fixture contains disconnected fictional documentation examples; it is not a complete installation. Helpers do not calculate ampacity, coordinate protection, certify electrical safety or verify manufacturer pinouts. User drawings and embedded product pictures are excluded from distribution.

Add future subject skills as sibling directories under `skills/`, each with `SKILL.md`, resources and optional `agents/openai.yaml`. Share the visual skill; keep subject rules separate.

This package is a local/repository plugin. Public directory publication is a separate submission/review process. See [OpenAI packaging documentation](https://developers.openai.com/plugins/build/plugins). Package and original illustrations use the included MIT license; asset provenance is in `NOTICE.md`.
