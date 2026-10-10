# Complete diagram commands

The native catalog in `ExcalidrawMCPFullToolCatalog.swift` is the public input
schema. The pinned editor's `diagramCommandSchema.json`, retained in
`patches/editor.patch`, describes the editor operations. `get_capabilities`
returns that manifest, actual element types, available presets, and limits.
`read_me` contains essential usage instructions even on clients that do not
support MCP resources or prompts. Setup is in [MCP.md](MCP.md).

## Create, inspect, refine

1. Call `document_command` with `action: "create"`, a name, and a new request ID.
   Use a discovered `group_id` or `local_folder_id` to choose a destination.
2. Keep its `document_id` and revision. Use the `window_id` from app context
   when the same document is mounted in more than one window.
3. Create a measured graph with the returned revision:

```json
{
  "document_id": "<created-document-id>",
  "expected_revision": "<returned-revision>",
  "request_id": "architecture-create-1",
  "preset": "technical_clean",
  "direction": "RIGHT",
  "nodes": [
    {"id": "client", "text": "Codex / Claude Code"},
    {"id": "commands", "text": "Local diagram commands"},
    {"id": "canvas", "text": "Editable Excalidraw scene"}
  ],
  "edges": [
    {"from": "client", "to": "commands", "label": "MCP"},
    {"from": "commands", "to": "canvas", "label": "Atomic edits"}
  ]
}
```

4. Call `analyze_diagram`, then `render_diagram`, and inspect the returned image.
   Findings identify affected element IDs and suggested corrections. Layout is
   deterministic geometry; judging visual composition still requires looking
   at the preview. Presets also include `presentation` and `sketch`.
5. Use `apply_operations` to refine selected IDs. `dry_run: true` prepares and
   validates without changing the scene. A real batch commits once and produces
   one undo step. For example:

```json
{
  "document_id": "<document-id>",
  "expected_revision": "<latest-revision>",
  "request_id": "architecture-refine-1",
  "operations": [
    {"type": "update", "patches": [
      {"id": "canvas", "updates": {"backgroundColor": "#e9edf7"}}
    ]},
    {"type": "select", "ids": ["canvas"]}
  ]
}
```

6. Save with `document_command` action `save`; export with `export_diagram`.
   `kind: "file"` creates editable Excalidraw; `kind: "image"` supports PNG/SVG
   and optional editable metadata; `kind: "pdf"` creates a presentation artifact.

## Operation coverage

`apply_operations` supports create, update, delete, duplicate, move, resize,
rotate (radians), flip, group, ungroup, align, distribute, order, lock, link,
select, frame membership, bound connections, style, presets, canonical scene
import/replacement, Mermaid, formulas and function plots. Read the exposed tool
schema for exact required fields. Raw canonical elements preserve IDs and
extension fields; duplication remaps dependent IDs, groups, labels and bindings.

For formula insertion use `{"type":"math","mode":"formula","latex":"E=mc^2"}`.
For plots use `{"type":"math","mode":"function","expression":"sin(x)"}`,
with optional domains, axis labels, colors and dimensions. Rendering happens
before the transaction reaches the scene. Pre-rendered SVG math is also accepted.
`import_assets` accepts embedded raster/SVG data URLs and PDFs; PDF pages become
individual PNG elements, bounded to 32 pages and 2048 pixels per page.

`layout_diagram` respects locked elements and `pinned_ids`. Changing a subset
with dependent containers is rejected when it would alter objects outside the
requested scope. `read_diagram` supports ID/type/text/frame/selection filters,
pagination and optional embedded assets. Large scenes should be read in pages.
Render scopes are full, viewport, selection, frame and explicit region.

For the user's preferred handwritten equipment style, the optional
[Excalidraw Design plugin](../plugins/excalidraw-design/README.md) adds Excalifont,
editable network illustrations, measured captions, and composition guidance.
It uses this command service and the existing client connection. Keep component
groups intact when arranging illustrations; graph layout of individual strokes
will separate an icon's parts.

## Recovery and persistence

Every real edit needs `expected_revision` and `request_id`. A stale revision or
invalid batch leaves the canvas unchanged. Pre-checkpoints remain available even
if later preparation fails. Human gestures and document loading are checked
again immediately before committing. A pending gesture must finish first.

Request IDs belong to an authenticated client. An identical retry returns its
recorded result; different arguments produce `request_id_conflict`. Receipts
persist across app restarts. If the process dies before recording an outcome,
`request_outcome_unknown` prevents automatic replay: inspect before submitting a
new request. Receipts are retained locally; do not remove the ledger while a
client may retry an old request.

Canvas change and persistence are separate results. If persistence fails,
retry save, not the edit. Undo/redo use `history`; `checkpoint_command` can list,
create, read, diff and restore document checkpoints. Restore checks the current
revision and commits as one undoable scene replacement. Checkpoint IDs are
validated against their document before any content is exposed.

## Validation contract

`script/test_local.sh` runs the editor typecheck/helper tests and native suites,
including actual bundled-editor integration tests. Acceptance also requires
Codex and Claude Code each completing creation, revision, rendered inspection,
undo/checkpoint restore, save/reopen and editable/PNG/SVG/PDF export. Protocol
tests alone do not establish this client acceptance. Test scenes must include
long multilingual labels, cycles, nested frames, image assets and custom data.
