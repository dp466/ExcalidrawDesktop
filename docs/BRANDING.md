# ExcalidrawDesktop branding

The desktop app icon uses the same purple Excalidraw drawing-tools mark as the sidebar,
centered on a flat charcoal background. The mark is the original vector path from the
pinned embedded editor, with no generated redraw or change to its geometry. The fork
is independently maintained and is not an official Excalidraw or ExcalidrawZ release.

## Sources and regeneration

- Mark: `ExcalidrawZ/Assets.xcassets/ExcalidrawLogoMark.imageset/ExcalidrawLogoMark.svg`.
- Wordmark: the neighboring `ExcalidrawWordmark.imageset` vector asset.
- Source revision: `b4c2a73a62e00b488d897ef5adba5eca7d34b7dc`,
  `packages/excalidraw/components/ExcalidrawLogo.tsx` in the embedded editor.
- Attribution: [Excalidraw MIT notice](../ExcalidrawZ/Resources/Licenses/Excalidraw-logo-MIT.txt).

From the repository root on macOS, run:

```sh
swift script/generate_app_icon.swift
```

The script generates the vector layer used by Icon Composer, all legacy app icon
sizes, and the in-app About/What's New image. Icon Composer specular lighting,
translucency, and layer shadow are disabled. macOS still supplies its system icon
mask and may apply system presentation effects. The sidebar assets remain template
vectors so they adapt to the app's light and dark themes.

This replaces the earlier monitor-and-pencil artwork and the unused sword asset.
Build 129 is the first build with this identity.
