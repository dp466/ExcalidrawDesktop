# Quiet Lavender — reusable application style guideline

Start with [the visual guide](style-guide.html) or [the editable Markdown guide](STYLE-GUIDE.md). The visual guide is self-contained and can be opened directly in a browser; it does not need the application or a server to display the guide and interactive specimens.

The 26-section guide describes the current ExcalidrawDesktop desktop style, its embedded editor, secondary and conditional surfaces, exact color/spacing/type/state values, and a proposed consistent family standard. It explicitly distinguishes current source behavior from recommendations.

To apply it elsewhere, give the new project `STYLE-GUIDE.md`, `tokens.json`, and optionally `quiet-lavender.css`. Section 25 contains a copyable implementation brief. The CSS is a small reference subset, not a replacement for an existing application's whole stylesheet or a production SwiftUI library.

`SOURCE-INDEX.md` and `source-inventory.json` preserve the source audit coverage. They include inactive platform branches, previews, and tests; the readable guide identifies which conventions belong to the active local desktop style. The index is lexical and not a complete runtime reachability analysis.

All files stay local. No application source was edited, no settings were restyled, and no build or installation was performed.

## Regenerating

From the repository root:

```sh
python3 docs/ui-style-guide/extract-source.py
node docs/ui-style-guide/build-guide.mjs
```

The HTML renderer uses the already-installed `marked` package in the editor checkout. Reading the generated HTML has no dependency on that package. The source extractor does not update the analysis prose or the manually curated portable tokens; changes to the source still need review.

## Verification

- Light and dark specimen renderings inspected in the Codex browser.
- Sample search-empty state, reset, and selection checked.
- All 26 section targets present; no broken internal anchors or page-level horizontal overflow at the browser's normal 1280px viewport.
- JSON structure, native palette agreement, contrast calculations, and local companion-link targets checked.
- Native dark editor/menu/preferences received a visual spot-check. Light native appearance and every secondary runtime state were not exercised.
- Opening the native Preferences inspector produced a blank/white document area that persisted after closing it. This was recorded in the guide; renderer behavior was not changed or diagnosed in this style-documentation task.

The package is a source-backed design specification, not a release-readiness or full accessibility certification.
