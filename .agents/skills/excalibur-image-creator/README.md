# Excalibur Image Creator

Version 1.0.0 · Prepared 2026-09-17

A reusable skill for converting product photos into the flat, hand-drawn,
diagram-ready equipment PNGs developed in the source conversation. Includes
four appearance references, editing examples and an optional PNG quality check.
The package is ready to import; creating this ZIP does not install it in an
account or archive any chats.

## Install in ChatGPT

Open **Plugins → Skills → Create → Upload from your computer**, and upload the
skill package. Follow the import/scan/install prompts. The Skills page may also
be available directly from the desktop sidebar. The interface and availability
depend on the host/account. OpenAI's documented upload route is cited below [1].

Then start a new chat, type **@**, select **Excalibur Image Creator**, attach a
product photo, and write:

> Make me one for my diagram.

Other examples:

> Directly front-facing. Remove the external cables.

> Show the inside using the open-product photo. Leave the fuses out.

> Top view, six studs, no protective cover.

The documented ChatGPT skill selector uses `@`; Codex CLI/IDE uses `$` or
`/skills` [2]. A typed name is not a substitute for importing or selecting the
skill when the host has not loaded it.

## Local Codex installation

As an alternative to the app import, extract the ZIP so that this file exists:

```text
~/.agents/skills/excalibur-image-creator/SKILL.md
```

Keep the **entire folder**, including `agents`, `assets`, `references`, and
`scripts`. `~/.agents/skills` is the documented user-level skill location [2].
Repository-scoped use can instead place the folder inside `.agents/skills/` at
the repository root. Do not overwrite a different existing skill without review.

In Codex CLI/IDE, invoke:

```text
$excalibur-image-creator Make a diagram-ready image from the attached photo.
```

Codex normally detects changes automatically; restart it if the skill does not
appear [2]. The actual host must provide image generation/editing for the normal
PNG workflow. This package contains instructions and references, not a new
image model, account entitlement, paid service, or API key.

## Package contents

```text
excalibur-image-creator/
  SKILL.md
  agents/openai.yaml
  assets/style-references/
    power-in-style.png
    distributor-inside-style.jpg
    rack-panel-style.png
    rack-panel-rating-edit.png
  references/
    style-guide.md
    examples.md
    acceptance-tests.json
  scripts/check_png.py
  README.md
  VALIDATION.md
```

The core file defines the workflow and defaults. Appearance metadata uses the
name **Excalibur Image Creator**. The bundled drawings are style references, not
verified engineering diagrams. No original font files, account credentials,
private profile information, or entire chat transcripts are included.

## Output defaults

Flat front-facing 2D; recognizable product structure; restrained hatching; real
transparent PNG; exact terminal and slot counts; no added external cables,
annotations, false logos or photographic glow. Explicit per-image requests
can override the defaults. Empty fuse positions stay empty when requested.

The main deliverable is a PNG for placing into an Excalidraw diagram. A
shape-editable `.excalidraw` file is a different deliverable and is generated
only when explicitly requested and supported.

## Optional PNG check

The included helper reads a local PNG and prints a JSON quality report. It does
not modify images, access the network, call a paid service, or install anything.
It requires Python 3 and Pillow in the execution environment.

```bash
python3 scripts/check_png.py path/to/output.png
```

Exit code 0 means the basic file/transparency checks passed; 1 means the file
could not be processed; 2 means a required PNG/transparency check failed. Warnings
about padding or edge contact still require review. It does not certify the
appearance, text, terminal count or electrical correctness.

## Before archiving the source chats

Keep this package and confirm that the imported skill appears in your selector.
The instructions and appearance references do not need the source chat. A new
component still needs its own photo. To edit a specific old image, keep that
image separately or upload it again; this ZIP is not a complete image archive.

## Sources for installation and packaging

Verified 2026-09-17; product UI and availability can change.

[1] OpenAI Help Center, “Skills in ChatGPT”:
`https://help.openai.com/en/articles/20001066-skills-in-chatgpt`

[2] OpenAI / ChatGPT Learn, “Build skills”:
`https://learn.chatgpt.com/docs/build-skills`

[3] OpenAI Developers, “Build skills — Plugins”:
`https://developers.openai.com/plugins/build/skills`

Drawing defaults are distilled from the user's instructions and visible
examples in the source conversation, not from these installation documents.
