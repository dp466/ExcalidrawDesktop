<callout icon="📋" color="purple_bg">
	Duplicate this page for each application and replace the bracketed fields. The family defaults remain shared; document product-specific exceptions.
</callout>

<mention-page url="https://app.notion.com/p/3e1ddaf9707a80c6a313ce6e7497828b">Full style guideline</mention-page>

<table_of_contents/>

## Application identity & palette

Duplicate this brief for each new application. Replace bracketed fields. Keep the family defaults unless an exception is documented. The full source audit and detailed component rules remain in the linked Notion reference.

<table header-row="true">
<tr><td>Project field</td><td>Your application</td></tr>
<tr><td>Application / platform</td><td>[Name] / [macOS, web, other]</td></tr>
<tr><td>Primary workflow</td><td>[What the user comes here to accomplish]</td></tr>
<tr><td>Main content / navigation</td><td>[Document, timeline, table, canvas] / [Navigation model]</td></tr>
<tr><td>Owner / version / date</td><td>[Owner] / [Version] / [Review date]</td></tr>
</table>

### Family identity

Quiet, compact, content-first workspaces. Opaque surfaces, restrained lavender emphasis, clear small icons, thin borders, soft rectangular corners, and stable navigation. Product names, icons, content, and specialized data colors may differ. Handwritten document lettering is not the default UI font.

<table header-row="true">
<tr><td>Semantic role</td><td>Light</td><td>Dark</td></tr>
<tr><td>Surface</td><td>#FFFFFF</td><td>#232329</td></tr>
<tr><td>Accent</td><td>#6965DB</td><td>#A8A5FF</td></tr>
<tr><td>Selection</td><td>#E3E2FE</td><td>#4F4D6F</td></tr>
<tr><td>Hover</td><td>#EFEDFF</td><td>#37334F</td></tr>
<tr><td>Structural border</td><td>#EBEBEB</td><td>#36363F</td></tr>
<tr><td>On-selection text*</td><td>#030064</td><td>#E0DFFF</td></tr>
</table>

*Recommended legibility improvement; the other five roles are observed native core colors. Use foreground/background pairs. Preserve adaptive system primary and secondary text where appropriate. Do not substitute the system-indigo AccentColor asset for the custom violet theme.

## Spacing, type & component geometry

<table header-row="true">
<tr><td>Role</td><td>Family default / implementation direction</td></tr>
<tr><td>Spacing vocabulary</td><td>0, 2, 4, 6, 8, 10, 12, 16, 20, 24, 32, 40 pt or CSS px</td></tr>
<tr><td>Control gaps</td><td>8–10; panel insets 12–16; section gaps 16–24</td></tr>
<tr><td>Control heights</td><td>24 small; 32 regular; 36 large; 40 extra-large</td></tr>
<tr><td>Corner radii</td><td>6 controls; 8 cards/panels; 12 large dialogs</td></tr>
<tr><td>Structure</td><td>1-point borders; overlays alone receive restrained shadows</td></tr>
<tr><td>UI typography</td><td>Native system font; web system or Assistant, chosen consistently</td></tr>
<tr><td>Type hierarchy</td><td>13 medium buttons; 14 semibold headers; 11 status labels</td></tr>
<tr><td>Navigation row</td><td>8 horizontal / 6 vertical inner padding; 1 outer vertical</td></tr>
<tr><td>Header reference</td><td>52 high; keep content/actions aligned and predictable</td></tr>
</table>

### Choose a shell suited to the product

Use a navigator, main content, and optional inspector only when the workflow needs them. A menu-bar utility can share the same controls without using three panes. ExcalidrawDesktop references: sidebar outer min/ideal/max 230/250/340; main detail minimum 480; docked inspector 280/350/400. These are source observations, not universal window requirements.

### Shared components

Surface, ActionButton, IconButton, NavigationRow, MenuRow, TextField, Section, ContentCard, Inspector, StatusLabel, EmptyState, and DialogActions. Centralize color, geometry, density, and motion preferences. Screens select semantic roles instead of repeating raw values.

### Product decisions

[Chosen shell and minimum window size]
[Typography and density by platform]
[Component library location]
[Documented exceptions and reasons]

## Screens, interaction & complete states

<table header-row="true">
<tr><td>Screen / flow</td><td>Components / content</td><td>Required states</td></tr>
<tr><td>[Primary workspace]</td><td>[Navigator, content, inspector]</td><td>[Normal, narrow, long names]</td></tr>
<tr><td>[Browser / search]</td><td>[Rows, cards, filter controls]</td><td>[Empty, results, no matches]</td></tr>
<tr><td>[Settings / forms]</td><td>[Sections, inputs, actions]</td><td>[Focus, invalid, disabled]</td></tr>
<tr><td>[Import / export / save]</td><td>[Progress, dialog actions]</td><td>[Busy, success, failure, recovery]</td></tr>
<tr><td>[Secondary surfaces]</td><td>[Menus, history, previews]</td><td>[Unavailable, selected, loading]</td></tr>
</table>

### Interaction contract

Specify default, hover, pressed, selected, keyboard focus, disabled, loading, and error states for each relevant component. Selection and keyboard focus need independent indicators. Use explanatory error text and a recovery action; color alone is insufficient. Provide accessible labels for icon-only buttons.

Observed desktop references: shared button pressed opacity 0.7 and disabled opacity 0.4; sidebar ease-in-out transition 0.16 seconds; multiselection outline 1.5 points. Apply these with contrast and reduced-motion checks rather than assuming opacity is always safe.

### Behavior that must remain dependable

Preserve native window dragging, menus, keyboard shortcuts, file pickers, and focus semantics. Keep content geometry stable while loading. Support long text, resizing, and opening or closing inspectors. Avoid decorative gradients, large rounded cards, and material effects unless a specific surface has a documented reason.

### State decisions

[Focus indicator and error roles]
[Loading and recovery copy]
[Keyboard routes and accessible names]
[Reduced-motion behavior and performance expectations]

## Adoption, acceptance & implementation prompt

### Implementation sequence

1. Map current screens and preserve established workflows.
2. Introduce shared color, type, spacing, and geometry tokens.
3. Apply shared buttons and rows, then navigation and headers.
4. Adapt forms, cards, inspectors, and secondary screens.
5. Review real application states after each meaningful change.

<table header-row="true">
<tr><td>Acceptance area</td><td>Evidence to record</td></tr>
<tr><td>Appearance</td><td>[Light/dark screenshots; paired-color contrast checks]</td></tr>
<tr><td>Layout</td><td>[Narrow window, large text, long names, populated content]</td></tr>
<tr><td>Interaction</td><td>[Hover, selection, focus, pressed, disabled, errors]</td></tr>
<tr><td>Accessibility</td><td>[Keyboard-only flow, labels, targets, reduced motion]</td></tr>
<tr><td>Resilience</td><td>[Empty/loading/failure/recovery and stable geometry]</td></tr>
<tr><td>Platform / performance</td><td>[Native transitions, responsive navigation and previews]</td></tr>
</table>

### Copyable implementation prompt

Apply the Quiet Lavender family specification to [application]. Preserve its workflows, product name, and icon. Use this brief’s paired light/dark semantic colors, 6/8/12 corner hierarchy, 32-point regular controls, 8–10 control gaps, 12–16 panel insets, and 16–24 section gaps. Keep native system typography or a deliberate system/Assistant web choice. Implement complete interaction and availability states. Keep content dominant, ordinary surfaces flat, and native behavior intact. Read the full reference for component details and distinguish observed implementation from recommended rules. Validate the running application with realistic data; document necessary exceptions.

### Reference and sign-off

Full 26-section guideline, interactive specimen, tokens, CSS, and source evidence:
https://app.notion.com/p/3e1ddaf9707a80c6a313ce6e7497828b

[Reviewer] / [Date] / [Remaining gaps] / [Accepted exceptions]
A specimen or build alone does not establish application acceptance.