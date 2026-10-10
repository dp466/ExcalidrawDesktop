# ExcalidrawDesktop UI anatomy and reusable application style guideline

Source audit: September 20, 2026. Proposed family name: **Quiet Lavender**. This is a descriptive working name, not an existing brand or a claim of original authorship.

The app's recognizable style comes from a quiet, compact workspace: solid white or softly violet charcoal panels; lavender selection and hover; small, clearly drawn icons; restrained system typography; thin dividing lines; and rounded rectangles that soften the interface without making every element a pill. The working document receives most of the space and visual attention. The native shell deliberately echoes the embedded Excalidraw editor.

This document has two purposes: describe what the code actually implements, and turn its strongest conventions into a coherent specification for other applications. **Observed implementation**, **platform/system behavior**, and **recommended family rule** are different kinds of information. They are identified throughout. A recommendation is not a claim that every existing screen already follows it.

## 1. Scope, evidence, and how to use this package

The lexical source inventory covers **1,468 tracked source files**, including **710 Swift files and 79 CSS/SCSS files**. There are **14,249 matching UI declaration lines in 712 files**. This covers native application code, Quick Look, the editor packages, and the editor application wrapper. Matching files include tests, previews, inactive branches, and nonvisual code that happens to match a UI expression; the counts are coverage figures, not a count of production components or manually reviewed screens.

The inspection combined a repository-wide declaration scan with direct reading of the shared theme and button implementation, layout and routing code, component families, platform guards, asset color definitions, web theme variables, and editor integration. The source appendix retains file/line pointers so small exceptions remain discoverable rather than disappearing into a broad summary.

Current source snapshot:

- Native repository HEAD: `6a524e04970b9684d4a4cb5cf74f9e8f3682fdeb`.
- Embedded editor HEAD: `b4c2a73a62e00b488d897ef5adba5eca7d34b7dc`, with pre-existing modified integration files. The inventory reads those modified files from the working tree.
- Live visual corroboration: the running dark desktop editor, app menu, and native canvas-preferences inspector were viewed. The editor initially displayed an existing drawing. During inspector opening, the document area became blank/white and remained so after the inspector closed; no drawing controls or content were intentionally edited. These observations support the shell's appearance, not renderer correctness or a successful end-to-end flow audit.
- Light-mode values are verified from source; light mode was not toggled in the user's app. Other screens below are source-inspected unless explicitly identified as visually observed.

Excluded from authored design interpretation: generated build output, dependency checkout implementations, minified third-party math engines, snapshot fixtures, untracked editor files, and example integrations. System-rendered menus, forms, font metrics, native dialogs, and third-party components cannot be fully specified by application source alone. No claim is made that every runtime state, localization, platform version, or accessibility mode was exercised.

Package contents:

| File | Purpose |
| --- | --- |
| `STYLE-GUIDE.md` | Full source-backed analysis and reusable rules; primary document |
| `style-guide.html` | Readable local edition with light/dark component specimens |
| `tokens.json` | Portable semantic tokens; observed and recommended values are distinguished |
| `quiet-lavender.css` | Small reference stylesheet for the proposed family components |
| `SOURCE-INDEX.md` | Searchable declaration appendix with file names and line numbers |
| `source-inventory.json` | Coverage manifest, hashes, source status, and per-file matches |
| `extract-source.py` | Rebuilds the lexical appendix from the checkout |
| `build-guide.mjs` | Renders the HTML edition using the editor checkout's existing Markdown parser |

Use sections 2–12 to understand the visual language. Use sections 13–20 when implementing specific surfaces. Use sections 21–25 to adopt the family style consistently and check it before release. The appendix is evidence, not a replacement for these decisions.

## 2. The visual identity in plain language

### 2.1 Workspace before decoration

The dominant composition is a file navigator on the left, a narrow action header above the work area, the document in the center, and optional contextual controls on the right. Permanent chrome is quiet. Purple indicates action or state. It is not poured into every surface.

The hierarchy is primarily created by placement, spacing, font weight, and small color differences. It does not depend on large shadows, repeated cards within cards, saturated gradients, or oversized headings. In a sibling app, an audio timeline, log viewer, document, image, or dashboard should occupy the same dominant role as the drawing canvas.

### 2.2 Soft geometry with desktop density

Most core desktop controls have 6-point corners. Cards and floating containers commonly use 8. These are visibly softened rectangles, still compact enough to belong in a productive desktop workspace. The core header's 32-point buttons and 13-point labels contribute as much to the identity as the purple palette.

### 2.3 A restrained rather than monochrome accent

The primary color is a muted violet, not a vivid electric blue or neon purple. Its light-theme value is `#6965DB`; dark mode uses the lighter `#A8A5FF`. Selection is a separate opaque lavender surface, not an arbitrary translucent fill. Hover is another, subtler lavender surface.

### 2.4 Native usability with editor-like surfaces

The shell uses SwiftUI and AppKit, while the editor uses React and SCSS. The app deliberately replaces many app-owned glass treatments with solid surfaces on macOS. System file pickers, the menu bar, traffic lights, and other platform behavior remain native.

**Family rule:** preserve this combination. Make app-owned components visually consistent; retain platform behavior where users already know how it works.

### 2.5 The canvas's sketchiness is not the application typography

Hand-drawn lettering and rough shapes belong to Excalidraw document content and branding. Native navigation uses the system font; web UI uses Assistant. A sibling application can belong to this family without handwritten buttons or wobbly panel borders.

## 3. The authoritative sources and their precedence

| Source | What it controls | Interpretation |
| --- | --- | --- |
| `ExcalidrawZ/Sidebar/components/NavigationShellTheme.swift` | Five native semantic colors; flat button states | Primary reference for desktop identity |
| `ExcalidrawZ/components/EditorChromeStyle.swift` | Opaque surface and button/glass compatibility wrappers | Read the platform branch before interpreting a call site |
| `ExcalidrawZ/Assets.xcassets/EditorChromeSurface.colorset/Contents.json` | Named light/dark surface asset | Matches the shared white/charcoal surface |
| `ExcalidrawZ/Assets.xcassets/AccentColor.colorset/Contents.json` | System indigo accent fallback | Not an exact alias of the shared violet palette |
| `editor/packages/excalidraw/css/theme.scss` | Web semantic palette, sizes, shadows, dark overrides | Primary reference for embedded UI |
| `editor/packages/excalidraw/css/variables.module.scss` | Button state mixins and older supporting colors | Web interaction and compatibility detail |
| `editor/packages/excalidraw/css/styles.scss` | UI font, properties layout, inputs, main workspace | Web geometry and typography |
| `ExcalidrawZ/components/DesktopNavigationHeader.swift` | Fixed native header | Primary desktop layout reference |
| `ExcalidrawZ/Sidebar/components/SidebarRowModifier.swift` | Row padding, active appearance, multi-selection | Primary navigation row reference |
| `ExcalidrawZ/ContentView+/Detail/Components/FileHomeItemView.swift` | Flat desktop file cards | Primary content-card reference |

Precedence for reproducing the **current desktop**: active platform branch and call site, shared implementation, asset definition, then component-specific overrides. Design proposals are useful history but do not establish deployed behavior. There are proposal files in `design/`; do not copy their screen organization as if it were all implemented.

The misleading names matter: `editorChromeGlassEffect` uses an opaque surface plus border on macOS. `.glassProminent` passed through `editorChromeButtonStyle` becomes a flat accented button. A search for “glass” alone would misclassify much of the desktop UI.

## 4. Exact color system

All hex colors in this section are sRGB. Native system colors remain semantic and vary with platform/environment; they are not given invented fixed hex values.

### 4.1 Native desktop core

| Role | Light | Dark | Intended use |
| --- | --- | --- | --- |
| Primary accent | `#6965DB` | `#A8A5FF` | Active icons, hover foreground, branded actions, selection outline |
| Chrome surface | `#FFFFFF` | `#232329` | Sidebar, custom header, menus, app-owned panels |
| Selection surface | `#E3E2FE` | `#4F4D6F` | Selected navigation row; soft prominent action |
| Border/separator | `#EBEBEB` | `#36363F` | 1-point structural lines, card/control outlines |
| Hover surface | `#EFEDFF` | `#37334F` | Pointer feedback on unselected rows/buttons |
| Primary native text | `Color.primary` | `Color.primary` | Normal labels and content |
| Secondary native text | `.secondary` | `.secondary` | Hints, dates, shortcut annotations, status |
| Tertiary native text | `.tertiary` | `.tertiary` | Drag handles and low-priority details |
| Destructive native action | `Color.red` | `Color.red` | Destructive-role flat button foreground |
| Native save warning | `Color.orange` | `Color.orange` | Save/recovery problems in header |

The named `EditorChromeSurface` asset and `NavigationShellTheme.surface` are two implementations of the same surface. Other applications should define this once and generate platform assets from the common value.

The asset `AccentColor` references `systemIndigoColor`. Some controls inherit an explicit violet tint; others use `Color.accentColor` directly. Therefore not every native selected control is exactly `#6965DB` / `#A8A5FF` today. **Recommended:** make the family tint explicit at the application root and retain semantic overrides for errors or product-specific data.

### 4.2 Web editor semantic colors

These are important differences from the shell, not errors in the table above.

| Web role | Light | Dark |
| --- | --- | --- |
| Default/background | `#FFFFFF` | `#121212` |
| Island/popup | `#FFFFFF` | `#232329` |
| On-surface text/icon | `#1B1B1F` | `#E3E3E8` |
| Primary | `#6965DB` | `#A8A5FF` |
| Primary darker | `#5B57D1` | `#B2AEFF` |
| Primary darkest | `#4A47B1` | `#BEB9FF` |
| Primary light | `#E3E2FE` | `#4F4D6F` |
| Primary light darker | `#D7D5FF` | `#43415E` |
| Brand hover | `#5753D0` | `#BBB8FF` |
| Brand active | `#4440BF` | `#D0CCFF` |
| Surface high | `#F1F0FF` | `#2E2D39` |
| Surface mid | `#F6F6F9` | `hsl(240 6% 10%)` |
| Surface low | `#ECECF4` | `hsl(240 8% 15%)` |
| Surface lowest | `#FFFFFF` | `hsl(0 0% 7%)` |
| Selected tool container | `#E0DFFF` | `#403E6A` |
| On selected tool container | `#030064` | `#E0DFFF` |
| Border outline | `#767680` | `#8E8D9C` |
| Border outline variant | `#C5C5D0` | `#46464F` |
| Logo text | `#190064` | `#E2DFFF` |

Web “darker” naming is historical: the dark-theme variants become lighter. Store semantic roles rather than attempting to derive dark mode by mathematically darkening light colors.

The browser's default button hover is `surface-high`, whereas the native shell's hover is `#EFEDFF` / `#37334F`. A selected tool uses a stronger foreground than a selected navigation row. Keep those as separate tokens if exact reproduction is the goal.

### 4.3 Supporting web palette

The gray ramp is `#F5F5F5`, `#EBEBEB`, `#D6D6D6`, `#B8B8B8`, `#999999`, `#7A7A7A`, `#5C5C5C`, `#3D3D3D`, `#242424`, `#1E1E1E`, and `#121212`, named gray-10 through gray-100 with gray-85 as an extra stop.

Status palettes are separate from brand color:

| Role | Source values |
| --- | --- |
| Warning surface and steps | `#FCEECA`, `#F5C354`, `#F3AB2C`, `#EC8B14` |
| Danger base, light appearance | `#DB6965`; darker `#D65550`; darkest `#D1413C` |
| Danger light panel | background `#FFF0F0`, icon background `#FFDAD6`, text/icon `#700000` |
| Danger dark panel | background `#FBCBCC`, icon background `#672120`, text `#261919`, icon `#FBCBCC` |
| Success surface family | `#CAFCCC`, `#BAFABC`, `#A5EBA8` |
| Success text | `#268029` |
| Success contrast actions | `#65BB6A`, hover `#6BCF70`, active `#6EDF74` |
| Badge | foreground `#0B6513`, background `#D3FFD2` |

Not every status palette has a complete independent dark override. Reuse the semantic intent, verify the actual foreground/background pairing, and do not assume a token's name alone guarantees suitable contrast.

### 4.4 What should stay colored

Use violet for navigation state, active controls, primary affordances, focus, and selected outlines. Use red for destructive or error states, orange/amber for warnings, and green for explicit success when needed. File thumbnails, document images, diagrams, and charts keep their own meaningful colors.

Normal save success in the desktop header is deliberately quiet: a checkmark and secondary text, not a bright green badge that competes with the drawing. A warning gains both an icon and text. This is an especially useful family convention.

## 5. Surface, border, depth, and material rules

### 5.1 Permanent surfaces

The sidebar and custom header are opaque. They can share the same fill; a thin border and layout separation establish their boundaries. There is no permanent shell drop shadow. The dark work area can be darker than the charcoal shell, producing separation without a raised-card aesthetic.

Native file and folder cards use a solid shared surface with 1-point borders. Pointer hover changes the outline or fill. The current macOS file card explicitly avoids the iOS glass/hover-shadow branch.

### 5.2 Floating surfaces

“Flat” does not mean absolutely no shadows. There is a hierarchy:

| Surface | Source treatment |
| --- | --- |
| Custom desktop app menu | Black at 12% opacity, radius 12, y offset 5; 8-point radius; 1-point border |
| Floating native inspector | Radius-4 shadow; opaque surface; desktop corner radius 8 |
| Web island | Three layers: `0 0 1px rgba(0,0,0,.17)`, `0 0 3px rgba(0,0,0,.08)`, `0 7px 14px rgba(0,0,0,.05)` |
| Stronger web island | Same first layers; final 7px/14px shadow has 18% opacity |
| Web modal | Six-layer soft shadow; 12px corners and 1px border |
| Presentation controls | Black at 45%, radius 14, y 6; product-specific overlay |

**Family rule:** reserve elevation for something that overlays other content. Permanent panes and ordinary cards stay flat. Use the menu shadow for small overlays and the existing web island shadow for canvas islands. Keep large modal elevation rare.

### 5.3 Borders are structural, not always sufficient focus indicators

Core borders are intentionally very subtle. They can divide adjacent areas without enclosing every label. Do not use the separator color as the only focus, error, or required control-identification signal. Strong outline and focus tokens must be separate.

### 5.4 Platform adaptations

`editorChromeSurface(material:)` ignores the material argument on macOS and returns the named opaque color. On iOS it returns the supplied material. The glass compatibility wrapper similarly preserves iOS glass, but replaces it with a solid filled/stroked shape on macOS.

Older OS branches retain some different radii and shadows. A sibling app should have a coherent fallback using the same palette and geometry, even if the platform cannot render a newer material. Do not let OS version become an accidental new visual brand.

## 6. Spacing: exact dimensions and the reusable rhythm

SwiftUI measurements below are logical points; web measurements are CSS pixels or `rem`. A point in an app is not a physical display pixel, and CSS `pt` is not the unit to use when translating these measurements to the web. `rem` examples assume a conventional 16px root size; the source often leaves the browser default in control.

There is **no single enforced global spacing scale** in the native code. The web has `--space-factor: .25rem`. Native UI repeatedly uses 4, 6, 8, 10, 12, 16, and 20, with larger margins on Home and sheets. It would be inaccurate to call the entire project a strict 8-point grid.

### 6.1 Proposed family spacing tokens

| Token | Value | Use |
| --- | --- | --- |
| space-0 | 0 | Flush split columns; internal stacks whose children own spacing |
| space-1 | 2 | Tight label/subtitle stack; small row separation |
| space-2 | 4 | Micro spacing, badge insets, divider breathing room |
| space-3 | 6 | Compact row/menu inset, closely related buttons |
| space-4 | 8 | Default related-control gap, row horizontal padding, compact panel padding |
| space-5 | 10 | Icon-to-label gap, button horizontal padding, menu padding rhythm |
| space-6 | 12 | Field/card padding, sidebar inset, adjacent grouped controls |
| space-7 | 16 | Standard inspector edge inset; section spacing |
| space-8 | 20 | Comfortable folder-card inset; wider section separation |
| space-9 | 24 | Dialog body/footer padding; larger block separation |
| space-10 | 32 | Proposed large section gap; not a universal current native constant |
| space-11 | 40 | Existing roomy Home/sheet margins; use selectively |

These names are a proposed vocabulary for observed values, not names already present in the repository.

### 6.2 The compact-vs-comfortable rule

Use 6–10 points within a compact control group; 12–16 around a panel's contents; 16–24 between distinct sections. Use 30–40 only for spacious landing pages or generous sheets. If everything has 24-point padding, it will no longer feel like the current desktop shell.

A useful nesting recipe is a 16-point panel inset, 16-point section gap, 8-point label/control gap, and 10-point icon/label gap. This recipe follows recurring values but is a recommended composition, not a global existing modifier.

### 6.3 Do not blindly round away optical exceptions

The sidebar heading uses a 9-point gap between its two buttons, 14 top, and 6 bottom. Rows have 1-point outer vertical padding. A file icon's nested leading padding is `2 + (depth + 1) × 12`. These numbers align real content; they are not proof of a separate 9-point design grid.

Keep justified optical adjustments local. Avoid scattering them as new global tokens. The portable system should stay small enough that designers and developers can remember it.

## 7. Typography

### 7.1 Native UI

Core desktop navigation uses system typography. The shared flat button style explicitly applies `.system(size: 13, weight: .medium)`. The document header is 14 semibold. Status text is 11 regular. Small section labels and shortcut hints use 10–11. Many secondary screens use semantic SwiftUI styles such as `.headline`, `.caption`, `.footnote`, `.callout`, `.title2`, and `.largeTitle`.

Do not assign fixed numbers to every semantic SwiftUI style in the guide: metrics depend on platform and environment. For close reproduction, retain those semantic styles or inspect the intended deployment target.

| Role | Existing source |
| --- | --- |
| Flat button label | 13, medium |
| Header document title | 14, semibold; one line; middle truncation |
| Autosave status | 11, regular; secondary color |
| Desktop menu section label | 10, semibold; uppercase |
| Menu shortcut | 11, secondary |
| Sidebar “Desktop” suffix | 10, secondary |
| Sidebar search shortcut | 10 |
| Drawing option glyph/text | 14 in 28-point option control |
| Home title | Semantic large title |
| Card title/subtitle | Semantic sizes selected by style/size class |
| Inspector heading | Often semantic headline with secondary tint |

### 7.2 Embedded editor

The web UI font stack starts with **Assistant**, followed by system-ui, BlinkMacSystemFont, -apple-system, Segoe UI, Roboto, Helvetica, Arial, sans-serif. Assistant contributes a slightly more human feel than native system chrome. Keep the distinction intentional.

| Web role | Size / weight / line-height |
| --- | --- |
| Tool shortcut badge | .625rem, approximately 10px |
| Property section heading | .75rem, approximately 12px; weight 400 |
| Dropdown menu item | .875rem, approximately 14px; weight 400 |
| Text-field label | .875rem; weight 600; 150% |
| Text-field input | 1rem; weight 400; 150% |
| Dialog heading | 1.25rem, approximately 20px |
| Tooltip | 13px; weight 500; line-height 1.5 |
| Toast message | .75rem; line-height 1.25rem |
| Radio/segmented choice | .75rem; weight 600; line-height 100%; tracking .4px |

The application shell does not globally use Assistant. The Excalidraw wordmark is a vector asset, not regular text rendered in the UI font. Canvas fonts and the bundled Seto font are document capabilities, not universal navigation font choices.

### 7.3 Family typography rules

For native macOS apps, use the system font. For web apps, use Assistant when deliberately matching the editor, or system-ui when matching the native shell. Choose one per layer and document it. Do not mix several display fonts inside settings and navigation.

Use 13–14 for compact desktop labels, 11–12 for supporting details, and 14–16 for more readable explanatory text. Use semibold to establish hierarchy; reserve large display text for page-level entrances. Keep paragraph line-height around 1.45–1.6 in web settings/help surfaces; this is a recommended reading style, not an existing global native line-height.

Use monospaced digits for stable changing numbers such as zoom, slide counts, usage values, and timestamps where alignment matters. Use a monospaced text face for keys, source, expressions, and technical identifiers. Do not set all descriptive text in monospace.

Long file names should middle-truncate when preserving a suffix/extension helps identification. Display the full name in a tooltip or accessible label. Explanatory text and errors should wrap rather than disappear into a single line.

## 8. Geometry: sizes, corners, outlines, and icon alignment

### 8.1 Core size vocabulary

| Component | Dimensions |
| --- | --- |
| Shared native regular button | Height 32; horizontal padding 10 |
| Shared small button | Height 24 |
| Shared large button | Height 36 |
| Shared extra-large button | Height 40 |
| Circular variant | Width equals height |
| Native drawing option/swatches | Commonly 28 × 28 |
| Standard web button | 2rem, usually 32 × 32 |
| Large web toolbar button | 2.25rem, usually 36 × 36 |
| Default web icon | 1rem, usually 16 × 16 |
| Native menu icon column | Width 17 |
| Sidebar file icon box | 18 × 16 |
| Folder card icon | Height 24 |
| Native export format tile | 86 × 86 |
| Native history thumbnail | 82 × 52 |

A web media query for device widths above 1920px increases large controls to 40px and icons to 20px, with default buttons at 36px. Other selectors use viewport-width queries. Those are not interchangeable with Retina pixel density. For a new app, a deliberate density setting is more predictable than silently basing density on physical screen dimensions.

### 8.2 Corner radius vocabulary

| Radius | Current role / recommended handling |
| --- | --- |
| 4 | Some web context menus and tiny native search-case toggle |
| 6 | Core native buttons and sidebar rows; web medium radius; Quick Look clip |
| 7 | Native history preview exception |
| 8 | Desktop cards, menus, floating inspector; web large radius |
| 10 | Some segmented control shells and secondary containers |
| 12 | Web modal, older/fallback components, secondary native cards |
| 16 | Existing Home search and some preview placeholders |
| 20–24 | Some library, sync, mobile, and secondary panels; not the core desktop default |
| Half the height | Deliberate capsule control |
| Circle | Small circular actions, avatars, status markers |

**Family rule:** 6 for controls, 8 for ordinary cards/panels, 12 for larger dialogs. Retain pills for purposeful segmented, playback, or compact grouped controls. A 20–24-point radius should be an intentional exception with a reason, not the default on every macOS card.

### 8.3 Strokes

Use 1 logical point for normal native borders and 1 CSS pixel for web borders. Existing native multi-selection uses 1.5. Swatch selection uses 2. Some older/native detail borders use .5; treat those as hairline exceptions whose visibility must be checked at actual display scale.

Use stroke-inside/strokeBorder where available so hover and selection do not grow the layout. On the web, keep border width allocated in the default state or use a shadow/outline so an active border does not shift neighboring controls.

### 8.4 Icons and optical fit

Native navigation uses SF Symbols via both system names and SFSafeSymbols. Drawing tools have custom outline icons, and the toolbar-order settings row requests stroke width 1.8. Keep symbols visually comparable to a 16–20-point icon box without blindly stretching every glyph to fill it.

Use a stable icon column so menu labels line up. A folder, short chevron, and wide collaboration icon should not move the text start. For icon-only actions, retain an accessible name and a tooltip. Reserve filled icons for meaningful state or established content types, such as folders.

## 9. State system: every component needs a complete set

### 9.1 Shared native button, exact behavior

| State | Foreground | Fill | Other |
| --- | --- | --- | --- |
| Neutral | System primary | Clear | Optional 1-point border |
| Hover, enabled | Shared accent | Shared hover | No scaling in the shared style |
| Pressed, neutral | Accent only if pointer is also hovering; otherwise primary | Shared hover | Whole control opacity .7 |
| Accent/prominent | Shared accent | Shared selection | Optional border |
| Accent hovered | Shared accent | Remains shared selection | No separate hover fill in this style |
| Disabled | Existing role foreground | Existing fill | Whole control opacity .4; enabled hover is suppressed |
| Destructive | System red overrides normal/accent foreground | Normal state fill logic | Uses destructive role |

These details come from `NavigationShellButtonBody`, not an inferred design mockup. Press opacity affects the whole rendered button, so final appearance depends on the backdrop.

### 9.2 Sidebar row, exact behavior

The row becomes active when hovered, selected, or pressed. Active foreground is the shared accent; otherwise primary. Selected fill is the selection surface. Hover/press without selection uses the hover surface. Inactive fill is zero opacity. Pressed active fill uses .82 opacity. The row has 8 horizontal and 6 vertical internal padding, plus 1 vertical outer padding, a 6-point continuous corner, and a .16-second ease-in-out state transition.

Multi-selection adds a separate 1.5-point accent outline. Selection and multi-selection are not identical state variables. A generic reusable list should decide what each means and expose it accessibly.

### 9.3 Recommended state model for sibling apps

Define neutral, hover, pressed, keyboard-focused, selected, disabled, loading, invalid, and destructive states explicitly. Focus and selection are independent. A selected item can also have keyboard focus, and a button can be busy without being an error.

Keep lavender selection surfaces, but use a stronger selected-text token for readable small labels. The suggested portable selected foreground is the web editor's `#030064` in light mode and `#E0DFFF` in dark mode. This is a recommended improvement, not the current native row behavior.

Use a visible 2-point focus indicator that remains distinct from hover. Suppress decorative movement when reduced motion is requested. Prevent repeated activation during a non-repeatable operation, retain the label or reserve its width, and provide a named progress state.

Do not make disabled controls react on hover. Avoid making selection discoverable only through pointer interaction. Use labels, checkmarks, radio/toggle semantics, or selected state in accessibility APIs where appropriate.

## 10. Navigation shell and window composition

### 10.1 Main split layout

`ContentViewModern` uses `HSplitView` on macOS. The outer desktop sidebar frame is min 230, ideal 250, max 340. `SidebarView` also declares NavigationSplitView column preferences (280/280/340 on newer OS versions; 260/240/340 in an older branch); the active desktop uses HSplitView, so these should not be confused with the outer frame constraints. The detail pane has min width 480. Those minima imply approximately 710 points plus divider/chrome when both panes are present; that is a layout implication, not a verified minimum window-size setting.

The document column extends into the top safe area. A custom header owns app controls. Native toolbar background is hidden, and the stable split structure avoids making toolbar contributions change with every document transition.

The sidebar can disappear. When it does, the custom header reserves 80 points before its buttons for standard window controls. The header also provides a native AppKit drag region behind appropriate content. Copying the appearance without keeping drag behavior would produce a worse desktop app.

### 10.2 Header recipe

- Height 52.
- Horizontal inset 10.
- HStack gap 6.
- Leading sidebar toggle and app-menu trigger.
- Divider 1 wide × 20 high with 4-point horizontal padding.
- Optional Back action followed by flexible document/group title.
- Title 14 semibold, middle truncation, one line, minimum width 40, lower layout priority than actions.
- Autosave status max width 150; 11-point text; horizontal inset 6.
- Document actions and export remain compact and aligned.
- Solid shared background and bottom separator 1 point.

A sibling app should keep the same control rhythm while changing the document nouns and actions. Use a single flexible title region rather than centering a title over unequal button groups and creating collisions.

### 10.3 Sidebar recipe

The branding area is 52 high, with 16 horizontal padding. Mark is 20 × 20, wordmark 130 × 18, gap 6, and small “Desktop” suffix at 10. A bottom separator aligns the region structurally.

Below it, the two main actions have a 9-point gap, 12 horizontal inset, 14 top inset, and 6 bottom inset. “New drawing” is softly prominent; search is a bordered neutral control. Persistent navigation and the folder tree scroll below. A bottom Settings/workspace area anchors utility actions.

File nesting uses a 12-point increment plus a small initial optical offset. Keep disclosure arrows and folder/file icons in consistent columns. Do not multiply nested card outlines around tree nodes.

## 11. Menus and command surfaces

The custom app menu is 266 points wide, padded by 6, with 2 points between rows. It uses the shared flat buttons, 8-point outer corners, a 1-point border, and the small overlay shadow. Its section heading is 10 semibold uppercase with 8 padding. Dividers have 4 vertical padding. Each item has a 17-point icon column, a 10-point gap, and right-aligned 11-point secondary shortcut text.

The menu is grouped by purpose: document actions; search/navigation/context tools; appearance/settings. It preserves a stable host so opening a native file picker can outlive the menu closing. This is a behavior requirement worth carrying into other applications.

Keyboard code supports focused menu items and activation/dismissal. The menu trigger reports expanded/collapsed state and regains focus after dismissal. A sibling app should preserve that behavior rather than implement an ornamental popover containing mouse-only rows.

The embedded web dropdown differs: default 32px row height, 14px text, 8px horizontal row padding, 10px icon gap, 6px row corners, and a container gap of 1px. Web context menus are a separate older family with 4px outer corners and square rows. System context menus are another category again.

**Family rule:** use one app-owned menu recipe per platform. Do not restyle native system menus just to force the same shadow or radius. Use ellipses for actions that open a further decision or dialog; use verbs that say what will happen.

## 12. Toolbars, inputs, pickers, and other controls

### 12.1 Canvas toolbar

The visible desktop drawing tools belong to the web editor. `ExcalidrawEditorToolbarModifier` places `ExcalidrawToolbar()` in an iOS-only toolbar path. A source-wide inventory of native tool styling must not be mistaken for the desktop's visible toolbar.

The web toolbar's controls are usually 36 × 36 with 16px icons, 8px corners, a floating island surface, and small shortcut annotations at the lower right. Selected tools use the dedicated primary-container pair. Divider is 1px × 24px. The editor edge inset is normally 16px, reduced to 12px for mobile. Extra-tools dropdown has a 6px top gap and min width 190px.

For a sibling workspace, show only frequently used tools in the main toolbar, and place occasional tools in a consistent overflow surface. Retain tool names and shortcuts even when the visual label is an icon.

### 12.2 Native option and color controls

Drawing options use 28 × 28 controls, 14-point content, 6-point corners, and 8-point group spacing. Unselected fill is secondary at 10%; selected fill uses accent at 20%, with an accent 1-point outline. These are not the exact same state recipe as navigation buttons.

Native swatches use 6-point corners; selected outline is accent at 2 points, normal outline secondary at 30% and 1 point. The full-color trigger is 28 × 28. A divider between quick picks and the custom color is 28 high. Transparency is indicated with a checkerboard rather than silently treating it as white.

Dark-mode swatch rendering can invert and hue-rotate drawing colors, matching canvas behavior. Do not use that transformation for the app's entire brand palette or photographic content.

The hex input has 28 height, 8 horizontal padding, monospaced body text, 6 corners, a system control background, and secondary 30% border. Keep text input and a native color picker available; color recognition alone is not sufficient.

### 12.3 Text fields

There is no universal native text-field style. Grouped forms often inherit platform rendering; the Home search box, inspector search, and color field each have their own surrounding chrome.

The web `ExcTextField` is a comfortable dialog field: 48px high, 12px horizontal padding, 8px corners, 1px border, 16px input text. Its label is 14px semibold, with a 4px bottom gap. An optional icon is 20px at a 12px leading inset; text gets 40px leading padding when it is present.

Use compact 32-point fields for dense desktop utilities and a 40–48-point field where text entry deserves more room. That is a proposed family distinction, not an instruction to shrink every existing dialog field.

### 12.4 Toggles, segments, and sliders

Native toggles and segmented pickers retain platform behavior. Custom native segmented-picker code also exists, with OS-dependent 6/10-point indicator geometry; it is not a universal appearance contract.

Web switches are 40 × 20 with a 12px track radius and 150ms ease-out transitions. The off thumb is 10px; the on thumb is 14px. The source adds a small pressed-width change. Web radio groups use 3px shell padding, 2px gaps, 10px shell corners, 8px choice corners, and a 24px choice height plus shell/border.

The web range track is 4px high with a 16px circular thumb and 12px value labels. Native opacity control uses a native slider with a 4-point gap to caption-size endpoint labels. Preserve keyboard increments and a readable value; do not implement a purely visual track.

### 12.5 Tooltips and badges

Web tooltips are black with white text, 8px padding, 6px corners, centered 13px medium text, and 1.5 line-height. Native controls typically use `.help` and system tooltips. Reusing the family does not require manually drawing identical tooltip windows on every OS.

Small native history badges use 6 horizontal/2 vertical padding, caption2 type, a tint fill at 12%, and tint stroke at 30%/.5 points. Lock badges are tiny overlays on file icons and use symbol transitions. They are supporting indicators; critical information still needs text and accessible semantics.

## 13. Home, file browsers, thumbnails, lists, and search

### 13.1 Existing Home is more spacious than the shell

`HomeView` uses a 30-point vertical stack rhythm, a 40-point clear top spacer, a large-title heading, and 40-point outer padding. Its search box has 10 padding, max width 500, and 16-point corners. Recent cards are 200 points wide in a horizontally scrolling row with 10 spacing and 10 padding. Loading placeholders include a 200 × 120 thumbnail region and shimmer.

This is a real exception to the compact shell; the whole app is not uniformly dense. The flatness wrappers change the surface treatment without necessarily changing the older, roomier layout. The full alternate Home proposal in `design/home-proposal.html` should not be treated as current implementation.

### 13.2 File and folder cards

Desktop file cards have 8-point corners, a shared opaque surface, and a 1-point outline. Hover changes the border to the shared accent and uses a .2-second smooth animation. The macOS open gesture is a double-click; selection and context-menu behavior are separately composed. iOS uses a different single-tap/edit-mode path and 12-point corners.

Native file-card label insets are 8 in regular size class and 6 in compact. Titles and subtitles vary by card/list presentation. Preserve the code's content-dependent sizing rather than applying a made-up universal card height.

Folder cards are more generously padded: 20 horizontal, 12 vertical, icon height 24, and icon/text gap 10. The title is headline; count is footnote and secondary. Hover uses lavender fill; selected/hovered border uses accent; drop highlighting has its own selected-style fill. Availability and loading indicators occupy trailing space.

`FileHomeView` uses adaptive grids with 20-point gaps, 30-point horizontal content margins, and 30-point bottom space. Its header has 30-point section spacing, with top padding 36 without parent breadcrumbs and 15 with them. This should be classified as a browser-page layout, not reused inside a 300-point inspector.

### 13.3 Thumbnail rules

Let document content remain the most colorful part of a card. Use neutral chrome and predictable preview bounds. Fit or clip according to the document type; do not distort the content to fill a card. Show a stable loading area while the image arrives so labels do not jump vertically.

Missing files, locked files, and unavailable providers have distinct overlays/indicators. A blank thumbnail must not be the only indication that a document cannot be opened. For sibling apps, keep a title and recovery/open action available even when the preview fails.

### 13.4 Search inspector

Desktop search content uses 16 horizontal/vertical padding and a 12-point content gap. The field uses 12 horizontal and 8 vertical padding. Navigation controls use a 6-point gap. The case toggle is 22 × 18 with 4-point corners; results use 8 horizontal/6 vertical padding and 6-point corners. Query dispatch is debounced at 200ms.

Compact iOS has larger edges/gaps and a different case-toggle size. Those differences represent input-mode adaptation, not random inconsistency.

**Family rule:** search should share the application surface, typography, border, and focus tokens while retaining enough target area for its input mode. Provide loading, result count, selected result, no-results, and error states. Use different wording for “nothing exists yet” and “nothing matches your search.”

## 14. Inspectors, libraries, history, and presentation

### 14.1 Inspector shell

Docked native inspector width is min 280, ideal 350, max 400. Floating inspector width defaults to 300 and clamps to 260–440. On desktop the floating panel has 10-point top/horizontal insets, 40 bottom clearance, and 8-point corners. Its resize handle exposes a 30-point interaction zone around a visible 6 × 34 capsule; handle opacity changes from .22 to .42 while dragging.

This is a good general technique: a small visible handle can have a larger interaction region. Keep the resize cursor and width clamping. Remember the user's width and selected inspector tab where the product supports it.

`LayoutState` separates whether the inspector is open from its selected tab. Closing does not forget the tab. Clicking the already-open tab closes it; choosing a different tab switches content. This behavior contributes to a predictable family feel.

### 14.2 Canvas preferences

Desktop inspector spacing is 16 between blocks, 8 between related rows, and 16 edge padding. Compact iOS uses 20 block/horizontal spacing, 10 row gap, and 18 vertical padding. Section dividers organize groups; small switches sit opposite labels; explanatory text is caption/secondary. The inactive customization panel dims to .55.

In another app, use this for document-specific settings. Keep global settings and current-document overrides visually and verbally distinct. A dimmed value should explain why it is unavailable or inherited.

### 14.3 Library

The native library uses three columns with 8-point gaps. Items can be selected, dragged, previewed, or imported. Section headings use secondary title3 bold in one path, which is larger than the main navigation's section labels.

A library background modifier uses a 20-point radius on newer OS versions and 6 on older versions, with white or `#121212` preview fill. This differs from flat Home cards. The source draws a stroke and fill as separate children, so visible edge behavior must be checked in the renderer rather than assumed from the declared stroke alone.

The embedded library-browser sheet has min size 720 × 540, a header with 16 horizontal/10 vertical padding, 12-point horizontal spacing, and headline/caption hierarchy. Import views have additional selection/checkmark states and larger sheet layouts.

**Family recommendation:** normalize new library/gallery components to 8-point outer cards, retain 8-point grid gaps for compact galleries, and keep document previews independent of chrome theme. Preserve an explicit selected mark so the image itself does not obscure state.

### 14.4 History

History list uses an 8-point vertical gap with 10 horizontal and 8 vertical outer padding. A row has a leading 82 × 52 preview with radius 7, 10-point main gap, and 6-point internal padding. Text is headline with footnote secondary metadata, using 6 and 2-point internal text spacing.

The detail preview is 400 × 300 with 8 corners, followed by content padded 20 and title2 bold heading. Badges distinguish checkpoint sources, and errors use red text. Keep restoration as an explicit action; visual selection alone should not restore a historical document.

### 14.5 Presentation

Presentation is a specialized full-content experience: black stage/window, dark controls regardless of app theme, and a bottom capsule control strip. The controls use 12-point gaps, 8 internal padding, 24 bottom clearance, 28-high dividers, a slide counter with minimum width 72 and monospaced digits, and a title area max width 240. Buttons are circular, using the shared button adapter.

Welcome content adds a 64-point circular icon backdrop, a 30-point symbol, title2 semibold heading, and a gentle tinted gradient. The more expressive entrance and stronger presentation shadow are exceptions, not the main settings style.

For media or slideshow sibling apps, a dedicated dark viewing mode can belong to the same family. Keep its controls and typography familiar while letting the content occupy the stage.

## 15. Dialogs, export, import, security, and confirmations

### 15.1 Native export

The native export flow is not a copy of the web export modal. `ShareView` has its own route-dependent layout, preferred sheet-height handling, and format tiles. Format actions are 86 × 86, use 8-point corners on macOS, solid surfaces, 1-point borders, and hover fill. Hover animation is .1-second ease-out.

The source includes 40-point sheet padding, route-specific dimensions, and 10/14/20-point action/group spacing. One section is 460 × 300; it would be wrong to state that every export route has that size. Image export contains a 200 × 120 preview frame and 220 × 140 placeholder components with 16-point corners, as well as loading/error states and different action heights.

Use this distinction in sibling apps: format selection, preview/options, and final destination are different stages. Give the preview stable space and keep the primary action in a consistent location. Show errors beside the relevant operation rather than silently dismissing the sheet.

### 15.2 Web dialogs

The web modal has a dim backdrop using `rgba(18,18,18,.2)`, a 12px content radius, 1px border, and the modal shadow. The inner island resets its own border/shadow/radius so it does not create a second nested panel. Inner padding is 40px.

Dialog title is 20px with 12px bottom padding, a bottom border, and 24px bottom margin. Close-button icon is 24px. Dialog action buttons are 48px high, with 8px/24px padding, 8px corners, 14px semibold type, and an 8px icon/text gap. These are intentionally larger than canvas toolbar buttons.

### 15.3 Small utility sheets

Rename has a compact 300-point-wide path and 64-point action widths. Folder/group creation and locked-access sheets use native controls and semantic type rather than a single universal custom dialog class. Native sheet sizing and default button placement depend on the specific route and OS.

For a new app, standardize three categories: small single-value sheet, normal settings/action sheet, and large preview/workspace sheet. Use 24-point body padding as the default proposal, 8/12-point internal gaps, and 10-point action gaps. Preserve larger existing preview workflows when their content needs room.

### 15.4 Recovery and locked-content UI

Recovery-key input has 24-point body padding, 18-point block spacing, and a footer with 24 horizontal, 10 top, and 22 bottom padding. Standard header uses a 38-point semibold symbol and title2 semibold title; compact header uses a 20-point symbol inside a 46-point circle tinted at .16. The key uses monospaced body text; errors are red callout text.

Locked previews use lock/shield/key symbolism and intentionally avoid showing protected content. In a family app, a lock overlay is functional information, not decoration. Use a clear access action and explain what will happen. Do not use color alone to distinguish locked from unlocked content.

### 15.5 System dialogs

NSOpenPanel, NSSavePanel, macOS share destinations, native color panels, OS security prompts, and the menu bar should retain platform controls. This guide specifies the app-owned surface around them. Exact system radii, typography, and animation timings are OS-owned and are outside this codebase's design contract.

## 16. Settings and secondary application surfaces

Settings uses a split navigation structure with a custom flat sidebar on macOS. Sidebar rows reuse the shared navigation-row style inside a stack padded by 10. The settings root explicitly tints with the shared theme primary and uses the opaque surface.

`SettingsFormContainer` uses a grouped `Form` on macOS 14+, hides the scroll content background, supplies the opaque surface, and installs bordered shared buttons. Earlier versions use a padded scrollable VStack fallback. Grouped section interiors and individual system controls can still be platform-rendered; overriding the background is not a complete custom form design system.

The settings source scan includes all 40 tracked files in the settings subtree. Key surface families are:

| Surface | Style and adoption guidance |
| --- | --- |
| General | Grouped toggles, explanatory captions, layout previews, and experimental-feature notes. Layout samples have 8-point outlines, 120-point images, and selected stroke at accent .5/4 points. Treat illustrative preview borders separately from ordinary controls. |
| Drawing defaults | Reorder rows with 20-point tool icons, 10-point gaps, 18-point handle columns, shortcut capsules, and a drawing panel 260 wide. Preserve consistent controls between global defaults and document overrides. |
| Fonts | Native font-related controls and lists. Installed canvas fonts are content capability, not app-wide typography. |
| Media | Thumbnail grids, detail previews, cleanup selection, and confirmation sheets. Keep thumbnails neutral and make cleanup selection explicit. |
| Backups | Split list/detail browser, dated content, export, and locked previews. Use metadata hierarchy and preserve recoverability actions. |
| Security | Grouped controls plus locked-content/recovery flows. Favor clear explanatory text over decorative security artwork. |
| Linked storage | Provider icons and account/folder management. Provider artwork is third-party identification, not a new palette for the surrounding shell. |
| MCP / AI | Build-flavor-dependent. Local macOS identifies the settings route as MCP; cloud AI interfaces exist in source but are restricted by feature policy. |
| About | 128 × 128 app icon, title3 bold application name, build/version metadata, developer identity, and GitHub row with 20-point icon and headline/caption hierarchy. |
| Pencil / What's New | iOS-specific routes; do not treat their mobile layouts as desktop defaults. |

Use a stable left navigation column and a readable detail form in other desktop apps. Keep row labels left aligned and controls predictably aligned. Provide section-level explanatory text where it changes the user's decision. Avoid making every setting a custom promotional card.

## 17. Motion, feedback, and perceived responsiveness

There is no single global motion token set in the app. The following source values are useful anchors:

| Interaction | Source timing/behavior |
| --- | --- |
| Sidebar hover/active change | .16s ease-in-out |
| Desktop file/folder hover | .2s smooth |
| Export tile hover | .1s ease-out |
| Lock-icon change | .18s smooth or ease-in-out fallback |
| File-card lock presentation | .22s smooth |
| Search query debounce | .2s; request timing, not an animation |
| Web switch | 150ms ease-out |
| Web modal backdrop | .1s linear fade |
| Web modal content | .025s ease-out keyframe from scale .9 to 1 |
| Web toast appearance | .5s fade |
| Generic native loading ring | .8s looping animation; .5s progress change |
| Math token pressed | Scale .97 |
| Math template pressed | Scale .985 |
| Math circle pressed | Scale .94 |

Do not infer a precise duration for `.smooth`, `.default`, `.easeOut`, or spring calls without explicit parameters. Do not copy the web modal's 25ms timing as a general-purpose animation standard; it is a component-specific source value.

**Proposed family motion:** 100–160ms for hover/press/focus feedback; 180–220ms for local disclosure or modest content transitions; no playful bounce on routine navigation. Avoid scaling the whole navigation row or ordinary card. Preserve position and readable text while loading.

A style includes how stable it feels. `AnimatedPresence` accounts for neighboring spacing during collapse rather than letting the gap disappear in a separate jump. The header keeps stable geometry. Preview coordinators cache and schedule expensive work. Apply those principles in sibling apps: asynchronous previews, stable placeholders, cancel stale work, and avoid moving the primary action while the user reaches for it.

Reduced-motion handling is not globally wired through the shared theme. A targeted scan found explicit support in the WebDAV marquee and a web color-picker branch, but not a complete shared motion policy. A new family implementation should add one. Stop continuous decorative animation, retain immediate state changes, and use a simple fade or no transition for large movements.

## 18. Loading, empty, error, save, and availability states

The header is a strong model: “Autosave on,” “Saving…,” “Saved,” “Recovery unavailable,” and “Save failed — retrying” communicate distinct states. Secondary checkmark status stays visually quiet. Orange plus a warning symbol makes problems noticeable. Tooltips explain timing and the last save, and accessibility labels combine the status and detail.

Use stable status width where possible, but let full explanations appear in a tooltip or detail panel. A short status should not imply successful recovery or synchronization when only the local save succeeded.

Web toasts are compact floating surfaces: min width 220, max width `min(360px, viewport minus 32px)`, 8px corners, 1px border, 8px/12px padding, centered 12px text with 20px line-height. A 4px progress bar appears when needed. The close action receives pointer events even though the surrounding toast is not a general interaction surface.

Native sync popovers use 16 vertical padding, rows with 12-point icon/text gap, a 20-point icon column, 2-point title/detail spacing, and 16 horizontal inset. Their 24-point new-OS corner path and 12-point fallback are exceptions to the compact panel system.

For sibling apps, define the following before considering the screen finished:

- Initial empty state: what belongs here, and one primary way to add it.
- Search empty state: what query produced no matches, with a clear way to change/reset it.
- Loading: what is loading, with stable space and progress when measurable.
- Error: plain explanation plus retry/recovery action; preserve user input.
- Offline/unavailable: distinguish network/provider availability from missing content.
- Disabled: why an action is unavailable, where explanation is necessary.
- Partial success: say which part succeeded and which part needs attention.
- Saved/synchronized: separate these if they are different operations.

These are family behavior rules. The source contains multiple implementations, not a unified reusable state-view component.

## 19. Less prominent and conditional surfaces

A full source pass reveals additional styles that should not silently become defaults for your other apps.

### 19.1 Math, Mermaid, PDF, and source-entry workspaces

Math input has token buttons at radius 8, template cards at radius 12, circle controls at 30 × 30, and generated-action capsules at height 30. Token/card fills use secondary opacity rather than the shared lavender fill. Pressed states include small scaling. Its optional inspector width is 260–360, ideal 300. Code/expression inputs use monospaced typography; previews need their own neutral background and error/loading states.

A dynamic math AI background uses a rotating angular gradient with a 7-second cycle, a 1.2-point border, and blurred glow. That is not the desktop shell style. Mermaid, PDF insert/viewer, and export previews are utility workspaces with native sheet/navigation affordances. Their special preview geometry is not a global dialog size.

### 19.2 AI chat and subscription

There are 96 tracked files in the AI-chat subtree and 17 in Subscription. Their UI includes message bubbles, prompt entry, attachment controls, pending queues, tool/result cards, usage rings, plan cards, glowing generation states, and dedicated error/consent surfaces.

The local non-App-Store macOS build has `allowsCloudAIServices == false`; local presentation and MCP have separate policy. Therefore these visual sources must not be described as the default visible local app or recommended because they appear frequently in the file count.

`AIAppearancePalette` includes multicolor thinking (`purple → pink → orange → blue`) and foreground (`accent → purple → pink`) gradients; plan hues around cyan .56, indigo .64, and rose .86; and a light paywall base RGB(.965,.975,1) versus dark RGB(.035,.04,.065). Generation uses cyan/blue/violet/purple/magenta angular stops, with different light/dark saturation and opacity plus inner/mid/halo glows. The source appendix preserves exact declarations.

**Family rule:** if another application has AI, its capability does not require a second rainbow visual identity. Keep everyday AI controls within the normal palette. Add bounded activity feedback only when it clarifies an operation. Treat plan gradients and upsell art as optional marketing surfaces.

### 19.3 Cloud storage and authentication

Some UI lives under `Persistence/CloudStorage`, not just a `Views` folder. The inventory includes those files. Provider connection panels, WebDAV forms, and provider-specific icons are a distinct family of account/connection surfaces. Match the app's outer spacing and typography, but keep recognizable provider marks intact and do not assume they define your brand colors.

### 19.4 Tips, onboarding, What's New, and promotional media

These use larger artwork, before/after sliders, video, feature cards, and more generous spacing. Existing image assets can show old product UI. They are explanatory content, not evidence that those screens are current or that their dimensions should be standardized.

A generic loading ring also has a peach-to-pink gradient default, distinct from the shared lavender palette. Explicit call-site colors or native ProgressView can change actual usage. Do not import its default gradient automatically into new workspace spinners.

### 19.5 Debug and diagnostics

Debug panels and file-info views favor dense technical text, identifiers, and diagnostics. Keep these subordinate and platform-appropriate; they do not set the style of ordinary customer settings. The main content should not expose internal implementation names just because they occur in the code.

### 19.6 Quick Look and system integration

Quick Look displays a renderer or a circular progress view and clips the result with radius 6. Its host chrome is controlled by the OS. Sparkle's update UI and third-party packages similarly introduce externally implemented surfaces. The app's call-site styles can be inventoried, but exact dependency/system internals are outside this source specification.

## 20. Brand assets, product identity, and what to share across apps

The sidebar uses the upstream Excalidraw mark and wordmark as vector assets. The app icon is separate monitor-and-pencil artwork. These identities should not be confused with the reusable style system.

For your other apps, share the palette, spacing, component geometry, type hierarchy, interaction states, keyboard conventions, About-page structure, and developer attribution. Give each app its own product name and icon. An unrelated app should not inherit the Excalidraw wordmark merely to look related.

Preserve vector aspect ratios and provide light/dark tint behavior. For a suite of application icons, use a related palette and level of detail while giving each a distinct central object. This is a suggested suite convention; the repository contains one application's icon, not an existing multi-app icon system.

The source branding notes identify upstream logo provenance and a retained license notice. Keep those notices with any reused assets. The developer row currently uses `dp466` and a GitHub destination. Third-party provider logos, old promotional images, and bundled font resources remain separate asset categories.

## 21. Accessibility and legibility findings

The style can be preserved while making it easier to read. This section is a targeted source-level assessment, not an accessibility certification.

### 21.1 Calculated color contrast

Ratios below use the source sRGB values at full opacity and the relative-luminance formula. They do not represent sampled antialiased pixels, system semantic colors, or disabled/pressed composites.

| Pair | Ratio | Implication |
| --- | --- | --- |
| Native light accent on white | 4.68:1 | Barely above ordinary text's 4.5 target; little margin |
| Native light accent on selected lavender | 3.70:1 | Weak for 13-point selected labels |
| Native dark accent on charcoal | 7.06:1 | Strong contrast |
| Native dark accent on selected lavender | 3.62:1 | Weak for small selected labels |
| Light separator on white | 1.19:1 | Decorative separation; not a strong focus/required boundary |
| Dark separator on charcoal | 1.31:1 | Same limitation |
| Web selected foreground/container, light | 13.61:1 | Strong selected-tool pairing |
| Web selected foreground/container, dark | 7.64:1 | Strong selected-tool pairing |

For web implementations, WCAG's normal-text threshold is 4.5:1, with 3:1 for qualifying large text and exceptions such as inactive controls. These figures explain why a selected-text token is worth separating from the accent token. See [W3C text contrast guidance](https://www.w3.org/WAI/WCAG22/Understanding/contrast-minimum.html).

Recommended: keep the existing selection fills, and use `#030064` / `#E0DFFF` as selected text in the portable system. Recalculate for the actual chosen background and all interaction states. This is an accessibility-oriented adjustment that preserves the lavender identity.

Non-text control/state information can require 3:1 against adjacent colors; a faint decorative separator is not automatically a failure, but it should not be the only thing that identifies an essential control or state. See [W3C non-text contrast guidance](https://www.w3.org/WAI/WCAG22/Understanding/non-text-contrast.html).

### 21.2 Target size and input modes

The code contains useful 24–40-point desktop controls, but also a 22 × 18 case toggle and tiny icon details. Visible size and hit-target size are different. Some wrappers enlarge the interaction area; others need verification.

For web controls, WCAG 2.2's minimum target criterion uses 24 × 24 CSS pixels with specified exceptions, including spacing. Do not apply it as a simplistic blanket statement that every 18px glyph fails. See [W3C target-size guidance](https://www.w3.org/WAI/WCAG22/Understanding/target-size-minimum.html).

For the proposed family, use 32-point regular desktop targets and at least 44-point comfortable touch targets as a design preference, with larger hit areas around small visible glyphs. The touch value is a proposed family target, not a claim about every current iOS control.

### 21.3 Focus, naming, and selection

The custom menu already includes focus state, expanded/collapsed accessibility values, keyboard activation, and focus restoration. The web ToolIcon includes a 2px focus-visible treatment. The generic native flat button style itself does not draw a custom focus ring; final behavior depends on the containing view and platform.

Some swatches/option buttons appeared unnamed in the native accessibility tree. This needs a targeted VoiceOver check and explicit names such as “Stroke color, red, selected” where absent. Do not infer complete accessibility from a visible color outline.

Proposed family requirements: every icon-only control has a name; every selected tab/tool exposes state; all menus work without a pointer; labels remain visible or programmatically associated; errors are readable and reachable; dismissal returns focus predictably.

### 21.4 Scaling and motion

Fixed row/control heights can clip larger text. Semantic type elsewhere does not solve this automatically. Verify long names, localization, increased text size, large cursor, VoiceOver, contrast settings, and reduced motion. Preserve a scrollable or adaptive layout for compact widths. Large overlays should not obscure the only dismissal action.

## 22. Inconsistencies to document rather than accidentally copy

| Finding | Current evidence | Recommended family decision |
| --- | --- | --- |
| Two accent sources | Shared explicit violet versus system-indigo asset | One semantic accent with per-platform implementation |
| Two native surface definitions | Theme method and asset catalog | Generate both from one token |
| Several selected-state palettes | Native rows, web tools, option buttons, segments | Keep role-based tokens; use stronger selected text |
| Radius spread | 4 through 30+ across platform/secondary branches | Default 6/8/12; document exceptions |
| Spacing spread | Recurring 8/10/12/16 plus local odd values | Small named scale with local optical exceptions |
| Mixed typography | Native system, web Assistant, document fonts | Intentional native/web split; document fonts stay content-only |
| Glass-named flat wrappers | Adapter changes behavior on macOS | Name new portable APIs after roles, not outdated effects |
| Remaining shadows | Menus, inspectors, Home search fallback, presentation | Elevation only for overlays; explicitly list residual exceptions |
| Selected label contrast | Around 3.6–3.7:1 on current native selection fill | Separate on-selection text token |
| Motion has no common policy | Many per-view animations; sparse reduce-motion handling | Shared motion tokens and a reduce-motion switch |
| Multiple input recipes | System Form, native search, web text fields | Compact and comfortable variants with shared state rules |
| Build-flavor UI | Cloud AI/paywall source exists but local policy disables services | Classify by reachable product flavor |
| Old proposals and screenshots | Several design/proposal and promotional assets | Use active code and current capture for “as built” claims |

No application code was changed by this guideline work. These are recommendations for reuse and future consolidation, not fixes silently applied to the app.

## 23. The reusable family specification

This is the concise normative version for new sibling apps. It is a proposed standard distilled from the audit.

### 23.1 What stays constant

1. Use opaque white/charcoal app-owned surfaces and the shared light/dark lavender palette.
2. Use 6-point regular controls, 8-point cards/panels, and 12-point large dialogs.
3. Use 32-point regular desktop controls, with 24 small, 36 large, and 40 extra-large variants where appropriate.
4. Use system typography on native macOS and a deliberate system/Assistant choice on web; keep the same hierarchy.
5. Use 8–10-point control gaps, 12–16-point panel insets, and 16–24-point section spacing.
6. Use 1-point borders for structure and stronger independent indicators for focus, selected controls, and errors.
7. Keep primary actions softly lavender in ordinary workspace chrome. Reserve saturated fills for cases where stronger emphasis is needed and verified.
8. Keep hover, selected, pressed, focus, disabled, loading, and error states complete and consistent.
9. Keep labels and icons aligned, with predictable shortcut placement and accessible naming.
10. Keep content dominant, preserve native platform behaviors, and make navigation and status stable.

### 23.2 What may differ by application

The document/content type, primary workflow, product icon, app name, specialized data colors, inspector contents, and screen-specific density can differ. An audio utility may use a timeline instead of a canvas; a security app may use a table; a vault may use a file list. They should share the same surrounding control language.

Choose a full three-pane shell only when the product needs it. A small menu-bar utility can use the same colors, 6-point buttons, 8-point panel, typography, spacing, and interaction states without pretending to be a document editor.

### 23.3 Suggested component library

Build a small shared library around `Surface`, `ActionButton`, `IconButton`, `NavigationRow`, `MenuRow`, `TextField`, `Section`, `ContentCard`, `Inspector`, `StatusLabel`, `EmptyState`, and `DialogActions`. Add `Density` and `MotionPreference` at the environment level. Product-specific controls compose those primitives.

Keep raw colors and geometry out of screen code where they repeat. A new feature should choose a role and size, not re-invent a purple hex value and radius.

### 23.4 Reference token usage

The supplied `tokens.json` separates observed core colors from recommended portable text/state decisions. `quiet-lavender.css` demonstrates the proposed family in web components. It does not replace all existing editor CSS or implement native OS controls.

For SwiftUI, the equivalent architecture is a theme that resolves from `ColorScheme`, a small size/radius vocabulary, and shared button/row styles. Preserve `Color.primary`/`.secondary` where system adaptation matters, but provide explicit selected text and error/focus roles where the component paints its own background.

Do not automatically assign a saturated primary color as text on every tinted surface. A semantic system needs foreground-on-background pairs, not merely a list of attractive colors.

## 24. Adoption and acceptance checklist

Before adapting an existing application, map each major screen to these roles. Identify its current component library and replace shared tokens before changing screen layouts. A visual family does not require a disruptive navigation redesign.

A sensible adoption order is shared color/type/geometry tokens, buttons and rows, navigation and headers, forms/cards/inspectors, then specialized states and secondary screens. Validate real app screens after each meaningful step, including OS-owned transitions.

Check the following against actual rendered UI:

| Area | Acceptance question |
| --- | --- |
| Light and dark | Do surface, text, selection, hover, border, and focus each have correct paired colors? |
| Density | Are repeated rows and controls consistently sized without clipped text? |
| Geometry | Are ordinary controls 6, cards 8, large dialogs 12 unless documented otherwise? |
| Hierarchy | Is the user's content more visually prominent than navigation and decoration? |
| Alignment | Do icon columns, labels, trailing shortcuts, and action baselines line up? |
| Interaction | Can hover, selected, keyboard focus, pressed, and disabled be distinguished? |
| Loading | Does content keep stable geometry and communicate progress/failure? |
| Errors | Is there explanatory text and a recovery path, not just a red outline? |
| Keyboard | Can the whole workflow be completed, dismissed, and resumed without a pointer? |
| Accessibility | Are targets usable, controls named, states exposed, contrast tested, and reduced motion respected? |
| Resizing | Are narrow windows, inspector opening, long names, and large text usable? |
| Platform | Do native file pickers, window dragging, menus, and shortcuts still behave correctly? |
| Branding | Is the app's own icon/name present while the developer identity is consistent? |
| Performance | Do previews, animations, and navigation remain responsive with realistic content? |

Test representative populated and empty states, not just a specimen page. A style guide preview proves the tokens and examples render; it does not prove the application adopting them is complete.

## 25. Copyable implementation brief for your other applications

> Apply the Quiet Lavender design guideline from ExcalidrawDesktop to this application. Preserve its existing workflows and use its own product name and icon. Use opaque white (`#FFFFFF`) and charcoal (`#232329`) app-owned surfaces, violet accent (`#6965DB` light, `#A8A5FF` dark), lavender selection (`#E3E2FE` / `#4F4D6F`), subtle hover (`#EFEDFF` / `#37334F`), and thin structural borders (`#EBEBEB` / `#36363F`). Use stronger on-selection text (`#030064` / `#E0DFFF`) for legible small labels. Default to 6-point control corners, 8-point cards/panels, 12-point large dialogs, and 32-point desktop controls. Use 8–10-point internal gaps, 12–16-point panel insets, and 16–24-point section gaps. Keep system typography on native macOS; choose a consistent system or Assistant web UI face. Use complete hover, pressed, focus, selected, disabled, loading, and error states. Reserve shadows for overlays and keep ordinary surfaces flat. Preserve native window behavior, file pickers, keyboard shortcuts, and accessible semantics. Review all light/dark, narrow-window, long-text, empty, loading, and error states in the running application. Treat AI gradients, oversized corner radii, and old platform-specific treatments as exceptions rather than family defaults.

## 26. Coverage map and exact source references

The declaration index records every scanned matching file, including support UI outside obvious view folders. The JSON also records no-match files, checksums, tests, and working-tree overrides. It is intentionally lexical: a multi-line color or layout expression must be read in its source context, and absence of a regex match does not prove absence of visual behavior.

| Family | Main source locations |
| --- | --- |
| Shell palette and controls | `Sidebar/components/NavigationShellTheme.swift`; `components/EditorChromeStyle.swift`; color assets |
| Window and split layout | `ContentView+/Detail/ContentViewModern.swift`; `ContentViewDetail.swift`; `ExcalidrawZApp.swift`; `RootView.swift` |
| Desktop header/branding | `components/DesktopNavigationHeader.swift`; `DesktopSidebarHeading.swift` |
| Navigation/tree | `Sidebar/SidebarView.swift`; group/local/temporary/cloud rows; `SidebarRowModifier.swift`; `FileRowLabel.swift`; disclosure helpers |
| Menus | `components/DesktopAppMenu.swift`; `DesktopDrawingMenu.swift`; file/folder context menus |
| Home/browser | `ContentView+/Detail/Home/`; `ContentView+/Detail/Components/` |
| Native toolbar | `ExcalidrawView/Toolbar/`; platform guards determine visibility |
| Web toolbar/properties | `editor/packages/excalidraw/components/ToolIcon.scss`; `Toolbar.scss`; `Actions.scss`; `LayerUI.tsx`; `css/styles.scss` |
| Drawing choices/color | `ExcalidrawView/components/DrawingSettingsPanel/`; editor ColorPicker/FontPicker |
| Inspectors | `SidebarTrailing/InspectorPresentation.swift`; `CanvasSettings/`; `Search/` |
| Library and history | `SidebarTrailing/Library/`; `SidebarTrailing/FileHistory/` |
| Presentation | `SidebarTrailing/Presentation/` |
| Export/archive | `Share/`; `Share/components/ExportButtonStyle.swift` |
| Settings | `Settings/`, all 40 tracked source files |
| Security/locked UI | `Sidebar/components/LockedFileAccessSheet.swift`; recovery helpers; locked preview overlays |
| Storage/auth | `Persistence/CloudStorage/` plus linked-storage settings/sidebar |
| AI and subscriptions | `SidebarTrailing/AIChat/`; `Subscription/`; `components/styles/AIAppearancePalette.swift` |
| Math/Mermaid/PDF | `ExcalidrawView/Toolbar/components/`; `components/PDFViewer/`; math rendering helpers |
| Feedback | `components/SyncStatus*`; `LoadingView.swift`; `CopyFeedbackButton.swift`; `AnimatedPresence.swift` |
| Other support | `components/WhatsNew/`; `Debug/`; `Sparkle/`; `Extensions/`; feature tips |
| OS preview | `QuickLookPreviewExtension/QuickLookView.swift`; `PreviewViewController.swift` |
| Web secondary components | All 79 scanned CSS/SCSS files, plus React component/integration declarations |
| Assets | Named color sets, vector marks, app icon source, custom symbols, provider art, bundled fonts |

Native relative paths in this table are under `ExcalidrawZ/` unless they begin with `editor/` or `QuickLookPreviewExtension/`. Exact line numbers and full paths are in `SOURCE-INDEX.md`. Historical design notes were used only to understand intent; the implemented values above were checked against current source.
