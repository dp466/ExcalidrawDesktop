# UI source coverage and declaration index

Lexical scan of tracked authored source, using HEAD blobs for clean files and working-tree content for modified files. Includes inactive platform/build branches, tests and previews. Matches are evidence pointers, not proof of runtime reachability or complete multiline expressions. Vendor math bundles, snapshots, dependency checkouts, generated build output, untracked files and editor examples are excluded.

Scanned 1468 files; 712 contain lexical UI matches; 14249 matching lines.

Companion to STYLE-GUIDE.md. The guide interprets active desktop conventions; this appendix preserves exact source locations. No-match files are recorded in source-inventory.json.

## ExcalidrawZ/ContentView+/Content+OpenFromURL.swift

680 lines. Check platform/build reachability at the call site.

```text
125: .presentationDetents([.fraction(0.3)])
126: .presentationDragIndicator(.visible)
131: .presentationDetents([.height(240)])
132: .padding(.bottom)
448: @State private var viewWidth: CGFloat = 400
449: @State private var viewHeight: CGFloat = 240
452: VStack(spacing: 10) {
453: VStack(spacing: 6) {
457: .font(.title)
461: .font(.title)
465: .font(.title)
469: .font(.title)
476: VStack(spacing: 4) {
501: .fontWeight(.semibold)
513: .overlay {
518: .animation(.default, value: isPreviewWebViewLoading)
519: .clipShape(RoundedRectangle(cornerRadius: 12))
520: .overlay {
521: RoundedRectangle(cornerRadius: 12)
522: .stroke(.separator)
524: .background {
525: RoundedRectangle(cornerRadius: 12)
526: .shadow(radius: 2)
550: .frame(width: 160)
552: .frame(maxWidth: .infinity)
555: .buttonStyle(.borderedProminent)
556: .keyboardShortcut(.return)
562: .frame(width: 160)
564: .keyboardShortcut(.escape)
567: .controlSize({
576: .padding(40)
577: .frame(width: viewWidth, height: viewHeight)
578: .overlay(alignment: .topTrailing) {
586: .animation(nil, value: isPreviewWebView)
588: .buttonStyle(.text)
589: .padding(40)
592: .overlay(alignment: .bottomTrailing) {
594: .font(.footnote)
595: .foregroundStyle(.secondary)
596: .padding(6)
600: .padding(.top, 20)
601: .padding(.horizontal, 20)
603: .animation(.smooth, value: isPreviewWebView)
621: origin: window.frame.origin,
623: width: newWidth, height: newHeight
```

## ExcalidrawZ/ContentView+/Content+PrintModifier.swift

60 lines. Check platform/build reachability at the call site.

```text
29: .padding(.horizontal, 40)
36: Task.detached(priority: .background) {
```

## ExcalidrawZ/ContentView+/Content+Searchable.swift

602 lines. Check platform/build reachability at the call site.

```text
41: .background {
45: .opacity(0.01)
46: .keyboardShortcut("f", modifiers: [.command, .shift])
50: .opacity(0.01)
51: .keyboardShortcut("f", modifiers: fileState.currentActiveFile == nil ? [.command] : [.command, .shift])
57: .opacity(0.01)
58: .keyboardShortcut(.escape)
65: .padding(10)
68: .frame(width: 500, height: 400)
205: VStack(spacing: 0) {
212: .focused($isFocused)
218: .overlay(alignment: .trailing) {
225: .foregroundStyle(.secondary)
226: .padding()
227: .contentShape(Rectangle())
229: .buttonStyle(.borderless)
230: .keyboardShortcut(.escape)
231: .padding(.trailing, {
245: LazyVStack(spacing: 0, pinnedViews: .sectionHeaders) {
252: .padding()
258: proxy.scrollTo(searchCollaborationFiles[newValue])
260: proxy.scrollTo(searchFiles[newValue - searchCollaborationFiles.count])
262: proxy.scrollTo(searchLocalFiles[newValue - searchCollaborationFiles.count - searchFiles.count])
409: .font(.headline)
410: .padding(4)
414: .background(Color.textBackgroundColor)
417: .background(.background)
519: .focused($isFocused)
522: .padding(10)
557: HStack(spacing: 10) {
563: VStack(alignment: .leading, spacing: 6) {
564: Text(title).font(.headline)
565: Text(subtitle).font(.footnote)
566: .foregroundStyle(.secondary)
567: .lineLimit(1)
568: .truncationMode(.middle)
572: .padding(.horizontal, 12)
573: .padding(.vertical, 6)
574: .contentShape(Rectangle())
575: .background {
577: RoundedRectangle(cornerRadius: 8)
581: RoundedRectangle(cornerRadius: 8)
582: .stroke(Color.accentColor, lineWidth: 2)
585: .onHover { isHovered in
590: .opacity(icon == nil ? 0 : 1)
```

## ExcalidrawZ/ContentView+/Detail/Components/FileHomeItemLockPreviewModifier.swift

213 lines. Check platform/build reachability at the call site.

```text
25: .overlay {
28: .overlay {
35: .transition(.opacity.combined(with: .scale(scale: 0.985)))
38: .animation(.smooth(duration: 0.26), value: lockOverlayState)
135: var iconSize: CGFloat = 34
145: LinearGradient(
148: Color.black.opacity(colorScheme == .dark ? 0.16 : 0.08)
169: .font(.system(size: iconSize, weight: .semibold))
170: .foregroundStyle(.secondary)
189: .font(.system(size: symbolSize, weight: .semibold))
191: .foregroundStyle(Color.accentColor)
192: .frame(width: badgeSize, height: badgeSize)
193: .background {
194: Circle()
197: .overlay {
198: Circle()
199: .strokeBorder(Color.white.opacity(colorScheme == .dark ? 0.18 : 0.42), lineWidth: 0.75)
201: .shadow(color: Color.black.opacity(colorScheme == .dark ? 0.3 : 0.14), radius: 7, y: 3)
203: .accessibilityHidden(true)
206: private var badgeSize: CGFloat {
210: private var symbolSize: CGFloat {
```

## ExcalidrawZ/ContentView+/Detail/Components/FileHomeItemTransition.swift

594 lines. Check platform/build reachability at the call site.

```text
45: geometry.frame(in: .global).minY
63: width: rect.width,
64: height: rect.height + missingTopInset + missingBottomInset
87: width: CGFloat(cgImage.width),
88: height: CGFloat(cgImage.height)
92: width: image.size.width * image.scale,
93: height: image.size.height * image.scale
99: width: CGFloat(cgImage.width),
100: height: CGFloat(cgImage.height)
125: var openDuration: Double = 0.5
126: var dismissDuration: Double = 0.3
141: .background {
163: .transition(.identity)
395: var background: Color {
419: background: background
460: geometry.frame(in: .global).minY
466: width: rect.width,
467: height: rect.height + topInset
492: var background: Color
518: .frame(width: currentRect.width, height: currentRect.height)
519: .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
520: .background {
522: RoundedRectangle(cornerRadius: cornerRadius)
524: .shadow(
525: color: Color.gray.opacity(shadowOpacity),
530: .offset(x: currentRect.minX, y: currentRect.minY)
531: .transition(.identity)
533: .opacity(show ? 1 : 0) // <-- important
541: width: interpolate(sourceRect.width, destinationRect.width),
542: height: interpolate(sourceRect.height, destinationRect.height)
546: private var cornerRadius: CGFloat {
550: private var shadowRadius: CGFloat {
562: private var lockIconSize: CGFloat {
575: var viewSize: CGSize
592: .frame(width: animatableData.width, height: animatableData.height)
```

## ExcalidrawZ/ContentView+/Detail/Components/FileHomeItemView.swift

745 lines. Check platform/build reachability at the call site.

```text
108: static let roundedCornerRadius: CGFloat = 8
110: static let roundedCornerRadius: CGFloat = 12
119: .contentShape(Rectangle())
135: .overlay {
137: RoundedRectangle(cornerRadius: Self.roundedCornerRadius)
139: .opacity(0.5)
143: .background {
146: RoundedRectangle(cornerRadius: Self.roundedCornerRadius)
150: RoundedRectangle(cornerRadius: Self.roundedCornerRadius)
156: .editorChromeGlassEffect(.clear, in: .rect(cornerRadius: 12))
157: .shadow(
158: color: colorScheme == .light
159: ? Color.gray.opacity(0.33)
160: : Color.black.opacity(0.33),
166: RoundedRectangle(cornerRadius: Self.roundedCornerRadius)
167: .fill(.background)
168: .shadow(
169: color: colorScheme == .light
170: ? Color.gray.opacity(0.33)
171: : Color.black.opacity(0.33),
181: .overlay {
183: RoundedRectangle(cornerRadius: Self.roundedCornerRadius)
184: .strokeBorder(
194: .contentShape(Rectangle())
231: .onHover {
235: .opacity(fileHomeItemTransitionItemState.shouldHideItem == fileID ? 0 : 1)
236: .animation(.smooth(duration: 0.2), value: isHovered)
249: RoundedRectangle(cornerRadius: roundedCornerRadius)
251: .opacity(0.2)
252: .aspectRatio(16.0 / 9.0, contentMode: .fit)
254: RoundedRectangle(cornerRadius: roundedCornerRadius)
255: .fill(Color.gray.opacity(0.1))
256: .aspectRatio(16.0 / 9.0, contentMode: .fit)
328: .clipShape(
331: : AnyShape(RoundedRectangle(cornerRadius: FileHomeItemView.roundedCornerRadius))
334: VStack(spacing :0) {
337: .clipShape(RoundedRectangle(cornerRadius: FileHomeItemView.roundedCornerRadius))
358: .background {
366: .overlay {
368: RoundedRectangle(cornerRadius: FileHomeItemView.roundedCornerRadius)
369: .stroke(.secondary, lineWidth: 0.5)
372: .padding(.horizontal, style == .file && layoutState.compactBrowserLayout == .list ? 10 : 0)
373: .frame(width: style == .file && layoutState.compactBrowserLayout == .list ? 80 : nil)
375: .overlay {
377: RoundedRectangle(cornerRadius: FileHomeItemView.roundedCornerRadius)
379: .opacity(0.5)
393: VStack(
400: .lineLimit(1)
403: .foregroundStyle(.secondary)
408: .frame(width: 16, height: 0)
409: .overlay {
411: .controlSize(.mini)
412: .foregroundStyle(.secondary)
419: .transition(.scale(scale: 0.92).combined(with: .opacity))
422: .font(
434: .lineLimit(1)
441: .lineLimit(1)
442: .truncationMode(.middle)
448: .font(
455: .foregroundStyle(.secondary)
459: .overlay(alignment: .bottomTrailing) {
470: .controlSize(.mini)
483: .animation(.smooth(duration: 0.22), value: lockedContentState.previewLockState(for: file))
484: .padding(.horizontal, containerHorizontalSizeClass == .regular ? 8 : 6)
485: .padding(.vertical, containerHorizontalSizeClass == .regular ? 8 : 6)
503: .frame(height: 60)
506: .aspectRatio(style == .file ? 4.0 / 3.0 : 1.0 / 0.46, contentMode: .fit)
510: private var lockOverlayIconSize: CGFloat {
520: .clipShape(
522: ? AnyShape(RoundedRectangle(cornerRadius: FileHomeItemView.roundedCornerRadius))
527: .clipShape(RoundedRectangle(cornerRadius: FileHomeItemView.roundedCornerRadius))
683: .opacity(isActive ? 0.5 + (isBreathing ? 0.25 : 0.0) : 1)
725: animation: .smooth
737: animation: .smooth
```

## ExcalidrawZ/ContentView+/Detail/Components/FileICloudStatusIndicator.swift

113 lines. Check platform/build reachability at the call site.

```text
42: .animation(.smooth, value: fileStatus?.iCloudStatus)
```

## ExcalidrawZ/ContentView+/Detail/Components/FileICloudSyncStatusIndicator.swift

121 lines. Check platform/build reachability at the call site.

```text
31: .animation(.smooth, value: fileStatus?.iCloudStatus)
45: .foregroundStyle(.green)
57: .foregroundStyle(.green)
```

## ExcalidrawZ/ContentView+/Detail/Components/FileItemSelectionModifier.swift

309 lines. Check platform/build reachability at the call site.

```text
110: .overlay {
112: Circle()
113: .stroke(.white)
114: .frame(width: 20, height: 20)
115: .background {
126: .opacity(isSelected ? 1 : 0)
127: .animation(.default, value: isSelected)
133: .overlay {
140: RoundedRectangle(cornerRadius: FileHomeItemView.roundedCornerRadius)
141: .stroke(
```

## ExcalidrawZ/ContentView+/Detail/Components/HomeFolderItemView.swift

171 lines. Check platform/build reachability at the call site.

```text
26: HStack(spacing: 10) {
30: .frame(height: 24)
32: .foregroundStyle(NavigationShellTheme.primary(for: colorScheme))
34: .foregroundStyle(Color(red: 12/255.0, green: 157/255.0, blue: 229/255.0))
37: VStack(alignment: .leading) {
39: .font(.headline)
40: .lineLimit(1)
43: .font(.footnote)
44: .foregroundStyle(.secondary)
56: .controlSize(.mini)
57: .frame(width: 12, height: 12)
61: .font(.footnote)
62: .foregroundStyle(.secondary)
65: .padding(.horizontal, 20)
66: .padding(.vertical, 12)
67: .contentShape(Rectangle())
68: .onHover { isHovered = $0 }
69: .background {
71: RoundedRectangle(cornerRadius: 8)
79: .overlay {
80: RoundedRectangle(cornerRadius: 8)
81: .strokeBorder(
91: RoundedRectangle(cornerRadius: 12)
99: .stroke(
104: .editorChromeGlassEffect(.clear, in: .rect(cornerRadius: 12))
105: .shadow(
106: color: colorScheme == .light
107: ? Color.gray.opacity(0.33)
108: : Color.black.opacity(0.33),
115: RoundedRectangle(cornerRadius: 12)
121: .shadow(
122: color: colorScheme == .light
123: ? Color.gray.opacity(0.2)
124: : Color.black.opacity(0.2),
134: RoundedRectangle(cornerRadius: 12)
135: .stroke(
144: .animation(.smooth(duration: 0.2), value: isHovered)
```

## ExcalidrawZ/ContentView+/Detail/ContentViewLagacy.swift

40 lines. Check platform/build reachability at the call site.

```text
23: .clipShape(RoundedRectangle(cornerRadius: 12))
24: .background {
25: RoundedRectangle(cornerRadius: 12)
27: .shadow(radius: 4)
29: .transition(.move(edge: .leading))
33: .animation(.easeOut, value: layoutState.isSidebarPresented)
34: .animation(.easeOut, value: layoutState.isInspectorPresented)
35: .padding(.top, 10)
36: .padding(.horizontal, 10)
37: .padding(.bottom, 40)
```

## ExcalidrawZ/ContentView+/Detail/ContentViewModern.swift

131 lines. Check platform/build reachability at the call site.

```text
66: .frame(minWidth: 230, idealWidth: 250, maxWidth: 340)
69: .frame(minWidth: 480, maxWidth: .infinity, maxHeight: .infinity)
```

## ExcalidrawZ/ContentView+/Detail/Home/CloudStorageFolderFileHomeView.swift

367 lines. Check platform/build reachability at the call site.

```text
23: private let fileItemWidth: CGFloat = 240
24: private let folderItemWidth: CGFloat = 220
38: .scrollContentBackground(.hidden)
43: .background {
45: .contentShape(Rectangle())
57: .contentShape(Rectangle())
63: .overlay {
66: .controlSize(.small)
77: .overlay(alignment: .bottom) {
84: .editorChromeButtonStyle(style: .glassProminent, shape: .capsule)
85: .padding(.bottom, 12)
93: VStack(spacing: 30) {
95: .padding(.horizontal, 20)
98: .padding(.horizontal, 30)
101: .padding(.horizontal, 30)
103: .padding(.top, parentFolders.isEmpty ? 36 : 15)
139: VStack(spacing: 0) {
140: HStack(spacing: 2) {
147: .foregroundStyle(.secondary)
148: .lineLimit(1)
150: .buttonStyle(.text(size: .small))
154: .foregroundStyle(.secondary)
159: .font(.caption)
163: .font(.title)
170: .buttonStyle(.accessoryBar)
176: .editorChromeButtonStyle(style: .glass, shape: .circle)
182: .padding(.horizontal, 10)
201: .help(errorMessage)
206: HStack(spacing: 10) {
218: .editorChromeButtonStyle(style: .glass, size: .regular, shape: .capsule)
252: .padding(6)
265: .editorChromeButtonStyle(style: .glass, shape: .circle)
275: LazyVGrid(
359: content.buttonStyle(.accessoryBar)
```

## ExcalidrawZ/ContentView+/Detail/Home/CollaborationHome/CollaborationHome.swift

255 lines. Check platform/build reachability at the call site.

```text
31: @State private var scrollViewHeight: CGFloat = 0
37: .frame(
41: .background {
43: .contentShape(Rectangle())
52: .scrollClipDisabledIfAvailable()
58: VStack(spacing: 40) {
59: VStack(spacing: 0) {
60: VStack(spacing: 20) {
62: .font(.largeTitle)
70: .padding(.horizontal, 80)
71: .padding(.vertical, 60)
72: .background {
82: VStack(spacing: 10) {
90: .padding(10)
91: .presentationCompactAdaptation(.popover)
110: VStack(spacing: 10) {
114: HStack(spacing: 10) {
123: .padding(.horizontal, 80)
125: .frame(maxWidth: 560)
129: VStack(spacing: 0) {
131: .padding(.horizontal, 80)
133: .transition(.opacity.combined(with: .move(edge: .top)))
136: .animation(.smooth(duration: 0.24), value: collaborationFiles.count)
149: .frame(width: 150)
151: .controlSize(.large)
162: .frame(width: 150)
164: .controlSize(.large)
176: .focused($focusFied, equals: FocusField.username)
207: .opacity(isPresented ? 0.7 : 0)
209: .scaleEffect(1.2)
212: .offset(
219: .offset(
224: .offset(
229: .offset(
235: .opacity(0.7)
```

## ExcalidrawZ/ContentView+/Detail/Home/CollaborationHome/CollaborationRoomsList.swift

98 lines. Check platform/build reachability at the call site.

```text
24: animation: .smooth
30: LazyVGrid(
84: .lineLimit(1)
85: .font(.headline)
89: Circle()
91: .shadow(color: stateIndicatorColor, radius: 2)
92: .frame(width: 6, height: 6)
```

## ExcalidrawZ/ContentView+/Detail/Home/CompactIOS/CompactBrowseRootView.swift

739 lines. Check platform/build reachability at the call site.

```text
57: animation: .smooth
103: .foregroundStyle(.red)
106: .foregroundStyle(.blue)
141: .foregroundStyle(.gray)
180: .controlSize(.small)
191: .listStyle(.sidebar)
278: .controlSize(.small)
309: HStack(spacing: 12) {
311: .frame(width: 20, height: 20)
314: .lineLimit(1)
315: .truncationMode(.middle)
320: .font(.footnote)
321: .foregroundStyle(.secondary)
323: .contentShape(Rectangle())
325: .buttonStyle(.plain)
326: .background(alignment: .center) {
328: .frame(height: 0)
338: .opacity(fileHomeItemTransitionItemState.shouldHideItem == fileID ? 0 : 1)
349: .tint(.red)
376: .overlay(alignment: .bottomLeading) {
457: HStack(spacing: 6) {
459: .truncationMode(.middle)
461: .font(.footnote)
462: .foregroundStyle(.secondary)
464: .frame(maxWidth: 150)
485: HStack(spacing: 6) {
487: .truncationMode(.middle)
489: .font(.footnote)
490: .foregroundStyle(.secondary)
492: .frame(maxWidth: 150)
501: HStack(spacing: 16) {
511: }.padding(.horizontal, 16)
522: HStack(spacing: 16) {
535: .padding(.horizontal, 16)
536: .frame(height: 36)
591: .modernButtonStyle(style: .glassProminent)
```

## ExcalidrawZ/ContentView+/Detail/Home/CompactIOS/CompactBrowserView.swift

246 lines. Check platform/build reachability at the call site.

```text
36: [GridItem(.adaptive(minimum: 100))]
38: [GridItem(.flexible(minimum: 0, maximum: 1000))]
44: LazyVGrid(columns: columns, spacing: 20) {
57: .padding()
59: .animation(.smooth, value: layoutState.compactBrowserLayout)
60: .animation(.smooth(duration: 0.22), value: folders.map(\.id))
61: .animation(.smooth(duration: 0.22), value: files.map(\.id))
136: } else if scenePhase != .active, newValue == .background {
```

## ExcalidrawZ/ContentView+/Detail/Home/CompactIOS/CompactCloudStorageBrowserView.swift

328 lines. Check platform/build reachability at the call site.

```text
60: .controlSize(.small)
77: .controlSize(.large)
121: VStack(spacing: 12) {
123: .font(.largeTitle)
124: .foregroundStyle(.secondary)
127: .font(.callout)
128: .foregroundStyle(.secondary)
138: .modernButtonStyle(style: .glass, shape: .modern)
140: .padding()
190: .modernButtonStyle(style: .glassProminent)
242: let label = HStack(spacing: 6) {
244: .lineLimit(1)
245: .truncationMode(.middle)
247: .font(.footnote)
248: .foregroundStyle(.secondary)
250: .frame(maxWidth: 150)
```

## ExcalidrawZ/ContentView+/Detail/Home/CompactIOS/CompactCollaborationHomeView.swift

162 lines. Check platform/build reachability at the call site.

```text
29: VStack(spacing: 24) {
44: .padding()
58: VStack(spacing: 12) {
60: .font(.system(size: 60))
61: .foregroundStyle(.blue.gradient)
64: .font(.title2.bold())
67: .font(.subheadline)
68: .foregroundStyle(.secondary)
72: .padding(.vertical)
77: VStack(alignment: .leading, spacing: 8) {
79: .font(.headline)
86: .focused($isUsernameFieldFocused)
91: .font(.caption)
92: .foregroundStyle(.red)
95: .padding(.horizontal)
100: VStack(spacing: 12) {
109: .frame(maxWidth: .infinity)
112: .modernButtonStyle(style: .glassProminent, size: .large, shape: .modern)
122: .frame(maxWidth: .infinity)
125: .modernButtonStyle(style: .glass, size: .large, shape: .modern)
128: .padding(.horizontal)
133: VStack(alignment: .leading, spacing: 12) {
135: .font(.headline)
136: .padding(.horizontal)
138: LazyVGrid(
140: GridItem(.flexible(), spacing: 16),
141: GridItem(.flexible(), spacing: 16)
151: .padding(.horizontal)
```

## ExcalidrawZ/ContentView+/Detail/Home/CompactIOS/CompactExcalidrawHomeView.swift

172 lines. Check platform/build reachability at the call site.

```text
44: .opacity(disableInteration || !fileHomeItemTransitionState.canShowExcalidrawCanvas ? 0 : 1)
51: .background(.background)
123: .opacity(fileHomeItemTransitionState.canShowItemContainerView ? 1 : 0)
```

## ExcalidrawZ/ContentView+/Detail/Home/CompactIOS/CompactRecentlyView.swift

86 lines. Check platform/build reachability at the call site.

```text
22: GridItem(.flexible(), spacing: 16),
23: GridItem(.flexible(), spacing: 16)
26: [GridItem(.flexible(minimum: 0, maximum: 1000))]
45: LazyVGrid(columns: columns, spacing: 16) {
54: .padding(16)
73: .animation(.smooth, value: layoutState.compactBrowserLayout)
```

## ExcalidrawZ/ContentView+/Detail/Home/CompactIOS/CompactSearchFilesView.swift

68 lines. Check platform/build reachability at the call site.

```text
19: GridItem(.flexible(), spacing: 16),
20: GridItem(.flexible(), spacing: 16)
31: LazyVGrid(columns: columns, spacing: 16) {
39: .padding(16)
```

## ExcalidrawZ/ContentView+/Detail/Home/CompactIOS/components/CompactFolderItemView.swift

196 lines. Check platform/build reachability at the call site.

```text
51: .opacity(editMode?.wrappedValue.isEditing == true ? 0.7 : 1.0)
52: .overlay(alignment: .center) {
54: Circle()
55: .stroke(.white)
56: .frame(width: 20, height: 20)
57: .background {
68: .opacity(isSelected ? 1 : 0)
69: .animation(.default, value: isSelected)
74: .overlay(alignment: .topTrailing) {
77: .padding(8)
83: .animation(.smooth, value: layoutState.compactBrowserLayout)
108: .foregroundStyle(Color.accentColor)
109: .padding(10)
110: .frame(
111: width: layoutState.compactBrowserLayout == .grid ? nil : 80,
112: height: layoutState.compactBrowserLayout == .grid ? 80 : nil
114: .frame(maxWidth: layoutState.compactBrowserLayout == .grid ? .infinity : nil)
116: VStack(
121: .font(layoutState.compactBrowserLayout == .grid ? .caption : .body)
122: .lineLimit(1)
123: .truncationMode(.middle)
124: .frame(
130: .font(layoutState.compactBrowserLayout == .grid ? .caption2 : .footnote)
131: .foregroundStyle(.secondary)
133: .padding(.horizontal, 4)
148: LazyVGrid(columns: [
149: GridItem(.adaptive(minimum: 120), spacing: 12)
170: .padding()
185: .modernButtonStyle(style: .glassProminent)
```

## ExcalidrawZ/ContentView+/Detail/Home/Components/HomeTipsSection.swift

208 lines. Check platform/build reachability at the call site.

```text
13: VStack(alignment: .leading) {
19: .font(.headline)
31: .scrollClipDisabledIfAvailable()
71: .padding(8)
94: VStack(alignment: .leading, spacing: 10) {
96: RoundedRectangle(cornerRadius: 12)
98: .shadow(color: .gray.opacity(0.2), radius: isHovered ? 4 : 0)
99: RoundedRectangle(cornerRadius: 12)
100: .stroke(.separator, lineWidth: 0.5)
103: .padding(20)
104: .foregroundStyle(.secondary)
106: .frame(height: 100)
108: VStack(alignment: .leading, spacing: 0) {
111: .font(.headline)
113: .font(.title2)
115: .fontWeight(.semibold)
118: .font(.body)
119: .foregroundStyle(.secondary)
120: .lineLimit(2...2)
123: .font(.body)
124: .foregroundStyle(.secondary)
128: .frame(width: 230)
129: .padding(4)
130: .contentShape(Rectangle())
131: .onHover { isHovered in
165: LazyVStack(alignment: .leading, spacing: spacing) {
168: .padding(.vertical, 32)
169: .padding(.horizontal, 120)
170: .frame(width: 900)
173: .frame(maxHeight: 700)
174: .overlay(alignment: .topLeading) {
179: .editorChromeButtonStyle(style: .glass)
180: .controlSize(.extraLarge)
183: .buttonStyle(.borderless)
184: .controlSize(.large)
187: .padding(28)
199: .keyboardShortcut("w", modifiers: .command)
207: .padding()
```

## ExcalidrawZ/ContentView+/Detail/Home/Components/Tips/AITips.swift

37 lines. Check platform/build reachability at the call site.

```text
24: VStack(alignment: .leading, spacing: 6) {
26: .font(.title)
29: .foregroundStyle(.secondary)
31: .frame(maxWidth: .infinity, alignment: .leading)
34: .frame(maxWidth: .infinity, alignment: .leading)
```

## ExcalidrawZ/ContentView+/Detail/Home/Components/Tips/FileHistoryTips.swift

45 lines. Check platform/build reachability at the call site.

```text
34: .font(.title)
35: .frame(maxWidth: .infinity, alignment: .leading)
40: .clipShape(RoundedRectangle(cornerRadius: 30))
```

## ExcalidrawZ/ContentView+/Detail/Home/Components/Tips/LibraryTips.swift

51 lines. Check platform/build reachability at the call site.

```text
26: Text(localizable: .tipsLibraryDetailTitle).font(.title)
31: Text(localizable: .tipsLibraryDetailImportUseTitle).font(.headline)
36: .clipShape(RoundedRectangle(cornerRadius: 30))
41: Text(localizable: .tipsLibraryDetailAddExportTitle).font(.headline)
46: .clipShape(RoundedRectangle(cornerRadius: 30))
```

## ExcalidrawZ/ContentView+/Detail/Home/Components/Tips/OrginzeFilesTips.swift

45 lines. Check platform/build reachability at the call site.

```text
27: VStack(alignment: .leading, spacing: 20) {
29: .font(.title)
33: .frame(maxWidth: .infinity, alignment: .leading)
38: .clipShape(RoundedRectangle(cornerRadius: 30))
41: .frame(maxWidth: .infinity, alignment: .leading)
```

## ExcalidrawZ/ContentView+/Detail/Home/Components/Tips/ShareTips.swift

89 lines. Check platform/build reachability at the call site.

```text
26: VStack(alignment: .leading, spacing: 6) {
28: .font(.title)
34: VStack(alignment: .leading, spacing: 10) {
36: .font(.title3.bold())
42: .clipShape(RoundedRectangle(cornerRadius: 30))
48: VStack(alignment: .leading, spacing: 10) {
50: .font(.title3.bold())
56: .clipShape(RoundedRectangle(cornerRadius: 30))
63: VStack(alignment: .leading, spacing: 10) {
65: .font(.title3.bold())
71: .clipShape(RoundedRectangle(cornerRadius: 30))
76: VStack(alignment: .leading, spacing: 10) {
78: .font(.title3.bold())
83: .clipShape(RoundedRectangle(cornerRadius: 30))
```

## ExcalidrawZ/ContentView+/Detail/Home/ExcalidrawHomeView.swift

675 lines. Check platform/build reachability at the call site.

```text
24: var background: Color {
53: private let folderNavigationTransitionDuration: TimeInterval = 0.4
59: .frame(maxWidth: .infinity, maxHeight: .infinity)
61: .accessibilityHidden(!fileHomeItemTransitionState.canShowItemContainerView)
74: .overlay(alignment: .bottomTrailing) {
79: .overlay(alignment: .top) {
106: .opacity(disableInteration || !fileHomeItemTransitionState.canShowExcalidrawCanvas ? 0 : 1)
121: .background {
129: .opacity(
141: .opacity(
147: .background {
156: .shadow(
157: color: .gray.opacity(isTransitioning && i == renderedGroups.endIndex - 1 ? 0.3 : 0.0),
161: .animation(
166: .transition(
172: .transition(
183: .opacity(
189: .background {
198: .shadow(
199: color: .gray.opacity(isTransitioning && i == renderedFolders.endIndex - 1 ? 0.3 : 0.0),
203: .animation(
208: .transition(
215: .transition(
225: .opacity(
231: .background {
240: .shadow(
241: color: .gray.opacity(
250: .transition(.move(edge: .trailing))
254: .transition(
262: .opacity(
270: .opacity(
610: HStack(spacing: 8) {
612: .controlSize(.small)
614: .tint(NavigationShellTheme.primary(for: colorScheme))
617: .font(.callout.weight(.medium))
619: .foregroundStyle(NavigationShellTheme.primary(for: colorScheme))
622: .padding(.horizontal, 12)
623: .padding(.vertical, 7)
624: .background {
626: RoundedRectangle(cornerRadius: 6)
628: .overlay {
629: RoundedRectangle(cornerRadius: 6)
630: .strokeBorder(NavigationShellTheme.primary(for: colorScheme), lineWidth: 1)
634: Capsule()
635: .editorChromeGlassEffect(in: Capsule())
637: Capsule()
642: .padding()
643: .transition(.move(edge: .top).combined(with: .opacity))
```

## ExcalidrawZ/ContentView+/Detail/Home/FileHomeView.swift

751 lines. Check platform/build reachability at the call site.

```text
64: @State private var scrollViewHeight: CGFloat = 0
65: @State private var contentHeight: CGFloat = 0
96: VStack(spacing: 0) {
103: .font(.system(size: 13))
104: .foregroundStyle(.secondary)
105: .frame(maxWidth: .infinity, minHeight: 140)
109: .frame(height: max(0, scrollViewHeight - contentHeight))
110: .overlay(alignment: .top) {
112: LazyVGrid(
128: .padding(.horizontal, 30)
136: SmoothLinearGradient(
138: to: Color.white.opacity(0.0),
146: LinearGradient(
147: colors: [.white, .white.opacity(0.0)],
157: .overlay {
161: .foregroundStyle(.placeholder)
164: .foregroundStyle(.secondary)
170: .padding(.bottom, 30)
171: .background {
203: proxy.scrollTo(targetID)
212: var itemWidth: CGFloat = 240
217: @ViewBuilder background: () -> Background
301: @State private var scrollViewHeight: CGFloat = 0
302: @State private var contentHeight: CGFloat = 0
315: .scrollContentBackground(.hidden)
320: .background {
323: .contentShape(Rectangle())
339: Color.clear // .opacity(0.2)
340: .contentShape(Rectangle())
351: .overlay(alignment: .bottom) {
354: HStack(spacing: 20) {
365: .padding(.horizontal, 20)
366: .padding(.vertical, 12)
367: .frame(height: 56)
368: .background {
370: Capsule()
371: .fill(.background)
372: .editorChromeGlassEffect(in: Capsule())
374: Capsule()
375: .fill(.background)
376: .shadow(radius: 4)
381: .transition(.move(edge: .bottom))
390: VStack(spacing: 0) {
391: HStack(spacing: 2) {
398: .foregroundStyle(.secondary)
399: .lineLimit(1)
401: .buttonStyle(.text(size: .small))
406: .foregroundStyle(.secondary)
411: .font(.caption)
415: .font(.title)
431: .editorChromeButtonStyle(style: .glassProminent, shape: .circle)
438: .buttonStyle(.accessoryBar)
445: .padding(.horizontal, 10)
451: VStack(spacing: 30) {
453: .padding(.horizontal, 20)
455: .padding(.horizontal, 30)
457: .padding(.horizontal, 30)
459: .padding(.top, parentGroups.isEmpty ? 36 : 15)
496: .padding(6)
530: .padding(6)
539: .editorChromeButtonStyle(style: .glass, shape: .circle)
541: .frame(minWidth: 12, minHeight: 12)
554: HStack(spacing: 10) {
557: .controlSize(.large)
560: HStack(spacing: 10) {
568: .editorChromeButtonStyle(style: .glass, size: .regular, shape: .capsule)
579: LazyVGrid(
627: .animation(.smooth, value: Array(childGroups))
652: LazyVGrid(
672: .animation(.smooth(duration: 0.22), value: files.map(\.id))
696: content.buttonStyle(NavigationShellButtonStyle(bordered: true))
700: .editorChromeButtonStyle(style: .glass)
702: .controlSize(.regular)
705: .editorChromeButtonStyle(shape: .capsule)
```

## ExcalidrawZ/ContentView+/Detail/Home/HomeView.swift

522 lines. Check platform/build reachability at the call site.

```text
43: VStack(spacing: 30) {
44: Color.clear.frame(height: 40)
47: .font(.largeTitle)
49: HStack(spacing: 8) {
52: .foregroundStyle(.secondary.opacity(0.4))
55: .padding(10)
56: .frame(maxWidth: 500)
57: .contentShape(Rectangle())
58: .hoverCursor(.horizontalText)
62: .background {
65: RoundedRectangle(cornerRadius: 16)
67: .stroke(Color.separatorColor, lineWidth: 0.5)
68: .editorChromeGlassEffect(.regular, in: RoundedRectangle(cornerRadius: 16))
70: RoundedRectangle(cornerRadius: 16)
72: .shadow(
73: color: colorScheme == .light
74: ? Color.gray.opacity(0.33)
75: : Color.black.opacity(0.33),
78: RoundedRectangle(cornerRadius: 16)
79: .stroke(Color.separatorColor, lineWidth: 0.5)
84: .padding(1)
94: VStack(spacing: 30) {
107: .padding(40)
112: .contentShape(Rectangle())
122: .background {
125: RoundedRectangle(cornerRadius: 16)
127: .editorChromeGlassEffect(.regular, in: RoundedRectangle(cornerRadius: 16))
129: RoundedRectangle(cornerRadius: 16)
133: .shadow(
134: color: colorScheme == .light
135: ? .gray.opacity(0.33)
136: : .black.opacity(0.33),
140: .transition(.opacity)
142: .frame(width: rect.width, height: 500)
143: .offset(x: rect.minX, y: rect.minY)
144: .animation(.bouncy, value: rect)
149: .frame(maxWidth: .infinity)
152: .background {
153: Color.clear.contentShape(Rectangle())
159: .scrollClipDisabledIfAvailable()
190: animation: .default
196: animation: .default
205: animation: .default
269: .onHover { isHovered in
418: VStack(alignment: .leading) {
423: .font(.headline)
427: HStack(spacing: 10) {
434: .frame(width: 200)
438: HStack(spacing: 10) {
440: RoundedRectangle(cornerRadius: FileHomeItemView.roundedCornerRadius)
441: .fill(.secondary.opacity(0.6))
442: .frame(width: 200, height: 200 * 0.6)
447: SmoothLinearGradient(
448: from: .white.opacity(0.2),
454: LinearGradient(
456: .init(color: .white.opacity(0.2), location: 0),
457: .init(color: .clear, location: 1)
467: .padding(10)
469: .offset(x: -10)
470: .scrollClipDisabledIfAvailable()
471: .overlay {
474: .font(.title3)
475: .foregroundStyle(.secondary)
509: .imageScale(.large)
510: .foregroundStyle(.tint)
513: .padding()
```

## ExcalidrawZ/ContentView+/Detail/Home/TemporarayFilesHome/TemporaryFilesHomeView.swift

91 lines. Check platform/build reachability at the call site.

```text
23: .font(.title)
32: .buttonStyle(.accessoryBar)
39: .padding(.top, 36)
40: .padding(.horizontal, 30)
45: LazyVGrid(
60: .padding(30)
64: .contentShape(Rectangle())
```

## ExcalidrawZ/ContentView+/ICloudSyncingView.swift

54 lines. Check platform/build reachability at the call site.

```text
22: Text(.localizable(.welcomeTitle)).font(.title)
34: .editorChromeButtonStyle(style: .glass, shape: .capsule)
35: .padding(.top, 10)
40: .padding(40)
```

## ExcalidrawZ/ContentView.swift

409 lines. Check platform/build reachability at the call site.

```text
308: VStack(spacing: 20) {
310: .controlSize(.small)
312: VStack(spacing: 6) {
314: .font(.headline)
317: .font(.subheadline)
318: .foregroundStyle(.secondary)
326: .keyboardShortcut(.cancelAction)
327: .editorChromeButtonStyle(
339: .editorChromeButtonStyle(
344: .tint(.red)
347: .padding(24)
348: .frame(width: 360)
365: case .backgroundDocumentOperations:
```

## ExcalidrawZ/Debug/DebugInfoView.swift

101 lines. Check platform/build reachability at the call site.

```text
25: .frame(width: 800, height: 500)
26: .overlay(alignment: .topTrailing) {
33: .frame(height: 20)
35: .buttonStyle(.borderless)
36: .padding(20)
72: .font(.largeTitle)
73: .foregroundStyle(.placeholder)
```

## ExcalidrawZ/Debug/FileInfoDebugView.swift

54 lines. Check platform/build reachability at the call site.

```text
20: VStack(spacing: 20) {
22: .padding()
23: .background {
24: RoundedRectangle(cornerRadius: 12)
25: .fill(.background)
26: .stroke(.separator)
29: .padding()
30: .background {
31: RoundedRectangle(cornerRadius: 12)
32: .fill(.background)
33: .stroke(.separator)
36: .padding()
```

## ExcalidrawZ/ExcalidrawView/CloudStorageConflictResolutionSheetView.swift

379 lines. Check platform/build reachability at the call site.

```text
45: VStack(spacing: 0) {
57: .frame(maxWidth: .infinity, maxHeight: .infinity)
61: .frame(
74: HStack(spacing: 12) {
80: .editorChromeButtonStyle(style: .glass, size: .large, shape: .circle)
82: VStack(alignment: .leading, spacing: 2) {
89: .font(.headline)
92: .font(.subheadline)
93: .foregroundStyle(.secondary)
94: .lineLimit(1)
100: .foregroundStyle(.orange)
101: .accessibilityHidden(true)
103: .padding()
107: VStack(spacing: 12) {
109: .controlSize(.small)
116: .font(.callout)
117: .foregroundStyle(.secondary)
122: VStack(spacing: 14) {
124: .font(.largeTitle)
125: .foregroundStyle(.orange)
133: .font(.headline)
136: .font(.callout)
137: .foregroundStyle(.secondary)
145: .editorChromeButtonStyle(style: .glassProminent, shape: .modern)
147: .padding()
152: VStack(alignment: .leading, spacing: 16) {
159: .font(.callout)
160: .foregroundStyle(.secondary)
163: VStack(spacing: 12) {
176: HStack(alignment: .top, spacing: 12) {
192: .font(.footnote)
193: .foregroundStyle(.secondary)
194: .transition(.opacity)
197: .padding(.horizontal)
198: .padding(.bottom)
214: VStack(alignment: .leading, spacing: 10) {
215: Color.secondary.opacity(0.06)
216: .overlay {
223: .aspectRatio(4.0 / 3.0, contentMode: .fit)
224: .clipShape(RoundedRectangle(cornerRadius: 6))
226: HStack(alignment: .firstTextBaseline, spacing: 8) {
227: VStack(alignment: .leading, spacing: 3) {
229: .font(.headline)
233: .font(.caption)
234: .foregroundStyle(.secondary)
241: .font(.title2)
242: .foregroundStyle(isSelected ? Color.accentColor : .secondary)
245: .padding(10)
246: .contentShape(Rectangle())
247: .background {
248: RoundedRectangle(cornerRadius: 8)
249: .fill(isSelected ? Color.accentColor.opacity(0.1) : Color.clear)
251: .overlay {
252: RoundedRectangle(cornerRadius: 8)
253: .strokeBorder(
254: isSelected ? Color.accentColor : Color.secondary.opacity(0.18),
259: .buttonStyle(.plain)
260: .frame(maxWidth: .infinity)
264: HStack(spacing: 10) {
272: .editorChromeButtonStyle(style: .glass, shape: .modern)
273: .keyboardShortcut(.cancelAction)
280: .controlSize(.small)
290: .editorChromeButtonStyle(style: .glassProminent, shape: .modern)
293: .padding()
```

## ExcalidrawZ/ExcalidrawView/Collaboration/ArchiveRoomSheetView.swift

124 lines. Check platform/build reachability at the call site.

```text
21: .padding()
22: .frame(width: 350, height: 500)
43: .font(.title)
47: .background {
48: let roundedRectangle = RoundedRectangle(cornerRadius: 12)
52: roundedRectangle.stroke(.separator)
62: .frame(width: 60)
69: .frame(width: 60)
71: .editorChromeButtonStyle(style: .glassProminent)
74: .editorChromeButtonStyle(shape: .capsule)
```

## ExcalidrawZ/ExcalidrawView/Collaboration/CollaborationEditor.swift

337 lines. Check platform/build reachability at the call site.

```text
59: .opacity(isProgressViewPresented || !canShowCanvasContent ? 0 : 1)
104: Color(red: 255 / 255.0, green: 200 / 255.0, blue: 200 / 255.0, opacity: 1.0)
105: .overlay {
106: VStack(spacing: 20) {
111: .foregroundStyle(.red)
112: .frame(height: 80)
115: .font(.title)
125: .padding(.horizontal)
127: .controlSize(.large)
128: .buttonStyle(.borderedProminent)
142: .overlay(alignment: .top) {
145: .padding(.top, collaborationRoomSyncNoticeTopPadding)
146: .transition(.move(edge: .top).combined(with: .opacity))
149: .animation(.smooth(duration: 0.25), value: isRoomSyncNoticePresented)
150: .opacity(isActive ? 1 : 0)
192: HStack(spacing: 8) {
194: .font(.callout.weight(.semibold))
197: VStack(alignment: .leading, spacing: 1) {
199: .font(.callout)
200: .lineLimit(1)
203: .font(.caption)
204: .foregroundStyle(.secondary)
205: .lineLimit(1)
208: .foregroundStyle(.primary)
209: .padding(.horizontal, 16)
210: .frame(height: 52)
211: .background {
213: Capsule()
215: .editorChromeGlassEffect(.regular, in: Capsule())
217: Capsule()
221: .overlay {
222: Capsule()
223: .stroke(.primary.opacity(0.08), lineWidth: 0.5)
225: .shadow(color: .black.opacity(0.12), radius: 16, y: 8)
228: private var collaborationRoomSyncNoticeTopPadding: CGFloat {
250: .frame(width: rect.width, height: rect.height)
252: .offset(x: rect.minX, y: rect.minY)
272: geometry.frame(in: .global).minY
278: width: rect.width,
279: height: rect.height + topInset
```

## ExcalidrawZ/ExcalidrawView/Collaboration/CollaborationEditorStack.swift

77 lines. Check platform/build reachability at the call site.

```text
75: .frame(width: 500)
```

## ExcalidrawZ/ExcalidrawView/Collaboration/CreateRoomSheetView.swift

61 lines. Check platform/build reachability at the call site.

```text
28: .font(.title)
40: .frame(width: 60)
42: .editorChromeButtonStyle(style: .glass, shape: .modern)
49: .frame(width: 60)
51: .editorChromeButtonStyle(style: .glassProminent, shape: .modern)
54: .padding()
```

## ExcalidrawZ/ExcalidrawView/Collaboration/JoinRoomSheetView.swift

222 lines. Check platform/build reachability at the call site.

```text
44: .font(.headline)
75: .opacity(error == nil ? 0 : 1)
76: .font(.footnote)
77: .foregroundStyle(.red)
78: .frame(height: 18, alignment: .top)
86: .frame(width: 60)
88: .editorChromeButtonStyle(style: .glass)
95: .frame(width: 60)
97: .editorChromeButtonStyle(style: .glassProminent)
100: .editorChromeButtonStyle(shape: .modern)
102: .padding()
110: HStack(spacing: 10) {
112: .lineLimit(1)
113: .frame(width: 100, alignment: .leading)
```

## ExcalidrawZ/ExcalidrawView/Collaboration/NewRoomModifier.swift

209 lines. Check platform/build reachability at the call site.

```text
45: VStack(spacing: 16) {
47: .font(.title2)
49: .frame(maxWidth: 400)
52: VStack(spacing: 8) {
58: .frame(width: 200)
60: .buttonStyle(.bordered)
67: .frame(width: 200)
69: .buttonStyle(.borderedProminent)
72: .presentationDetents([.height(300)])
73: .padding()
117: .presentationDetents([.height(160)])
148: .presentationDetents([.height(240)])
```

## ExcalidrawZ/ExcalidrawView/ConflictResolutionSheetView.swift

353 lines. Check platform/build reachability at the call site.

```text
52: VStack(spacing: 0) {
64: VStack(spacing: 12) {
75: .padding()
82: HStack(spacing: 10) {
86: .padding()
89: .frame(width: isCompact ? nil : 600, height: isCompact ? nil : 500)
132: VStack(alignment: .leading, spacing: 8) {
135: .foregroundStyle(.orange)
141: .font(.headline)
144: .font(.subheadline)
145: .foregroundStyle(.secondary)
147: .padding()
152: VStack(spacing: 0) {
155: .controlSize(.large)
162: VStack(spacing: 0) {
164: VStack(spacing: 16) {
166: .font(.largeTitle)
167: .foregroundStyle(.red)
170: .font(.headline)
173: .font(.caption)
174: .foregroundStyle(.secondary)
180: .editorChromeButtonStyle(style: .glassProminent, shape: .modern)
182: .padding()
189: VStack(spacing: 0) {
191: VStack(spacing: 16) {
193: .font(.largeTitle)
194: .foregroundStyle(.secondary)
197: .font(.headline)
202: .buttonStyle(.bordered)
204: .padding()
215: .editorChromeButtonStyle(style: .glass, shape: .modern)
216: .keyboardShortcut(.cancelAction)
221: .editorChromeButtonStyle(style: .glassProminent, shape: .modern)
277: HStack(spacing: 16) {
280: .font(.title2)
281: .foregroundStyle(isSelected ? .blue : .secondary)
283: VStack(alignment: .leading, spacing: 8) {
287: .font(.headline)
291: .font(.caption)
292: .foregroundStyle(.blue)
293: .padding(.horizontal, 8)
294: .padding(.vertical, 4)
295: .background(Color.blue.opacity(0.1))
296: .clipShape(RoundedRectangle(cornerRadius: 4))
301: HStack(spacing: 16) {
302: HStack(spacing: 4) {
310: HStack(spacing: 4) {
318: .font(.caption)
319: .foregroundStyle(.secondary)
324: .padding()
325: .background(
326: RoundedRectangle(cornerRadius: 8)
327: .fill(isSelected ? Color.accentColor.opacity(0.1) : Color.clear)
329: .overlay(
330: RoundedRectangle(cornerRadius: 8)
331: .strokeBorder(isSelected ? Color.accentColor : Color.clear, lineWidth: 2)
334: .buttonStyle(.plain)
```

## ExcalidrawZ/ExcalidrawView/Editor/AIChatIslandOverlay.swift

56 lines. Check platform/build reachability at the call site.

```text
13: @Environment(\.containerSize) private var containerSize
51: .padding(.bottom, 24)
52: .transition(.scale.combined(with: .opacity))
54: .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
```

## ExcalidrawZ/ExcalidrawView/Editor/CompactAIChatEditorOverlays.swift

267 lines. Check platform/build reachability at the call site.

```text
15: static let horizontalPadding: CGFloat = 12
16: static let toolbarBottomPadding: CGFloat = 12
18: static let tickerHeight: CGFloat = 48
23: static let tickerCollapseDuration: Duration = .milliseconds(360)
28: @Environment(\.containerSize) private var containerSize
130: CollapsibleSpacingVStack(spacing: 8) {
133: .frame(maxWidth: .infinity)
134: .padding(.horizontal, CompactAIChatOverlayMetrics.horizontalPadding)
135: .padding(.bottom, CompactAIChatOverlayMetrics.toolbarBottomPadding)
152: .transition(.move(edge: .bottom).combined(with: .opacity))
163: .transition(.move(edge: .bottom).combined(with: .opacity))
164: .animation(.easeInOut(duration: 0.25), value: llmState.pendingApprovalRequest != nil)
180: HStack(spacing: 0) {
186: .padding(.leading, CompactAIChatOverlayMetrics.collapsedToolbarAttachmentLeadingOffset)
187: .padding(.bottom, CompactAIChatOverlayMetrics.collapsedToolbarAccessoryLift)
188: .transition(.move(edge: .bottom).combined(with: .opacity))
189: .animation(.smooth(duration: 0.18), value: draftState.images.count)
205: .frame(maxWidth: .infinity, minHeight: CompactAIChatOverlayMetrics.tickerHeight)
227: HStack(spacing: 6) {
234: .font(.caption.weight(.semibold))
236: .foregroundStyle(.secondary)
237: .frame(width: 34, height: 34)
238: .background {
239: RoundedRectangle(cornerRadius: 9, style: .continuous)
244: .padding(6)
246: .modernButtonStyle(style: .glass, size: .regular, shape: .capsule)
247: .help("Attached images")
259: .frame(width: 34, height: 34)
260: .clipShape(RoundedRectangle(cornerRadius: 9, style: .continuous))
261: .overlay {
262: RoundedRectangle(cornerRadius: 9, style: .continuous)
263: .stroke(.white.opacity(0.18), lineWidth: 0.5)
```

## ExcalidrawZ/ExcalidrawView/Editor/CompactAIChatInputOverlay.swift

336 lines. Check platform/build reachability at the call site.

```text
18: @Environment(\.containerSize) private var containerSize
26: @State private var keyboardHeight: CGFloat = 0
27: @State private var keyboardAnimationDuration: TimeInterval = 0.25
75: .padding(.horizontal, CompactAIChatOverlayMetrics.horizontalPadding)
76: .padding(.bottom, bottomPadding)
77: .transition(.move(edge: .bottom).combined(with: .opacity))
78: .animation(.easeOut(duration: keyboardAnimationDuration), value: keyboardHeight)
92: private var bottomPadding: CGFloat {
151: private var leadingPadding: CGFloat {
155: private var trailingPadding: CGFloat {
182: .frame(maxWidth: .infinity, alignment: .bottom)
191: CompactAIChatReplyTickerCapsule(
195: .scaleEffect(
200: .opacity(isTickerPresented || !isTickerCollapsing ? 1 : 0)
201: .padding(.leading, leadingPadding)
202: .padding(.trailing, trailingPadding)
203: .animation(.smooth(duration: 0.24), value: shouldReserveStopButtonSpace)
315: .transition(.opacity)
316: .frame(maxWidth: .infinity)
317: .frame(height: CompactAIChatOverlayMetrics.tickerHeight)
318: .background {
321: .animation(.smooth(duration: 0.18), value: isPending)
327: Capsule()
329: .glassEffect(.regular, in: Capsule())
331: Capsule()
```

## ExcalidrawZ/ExcalidrawView/Editor/ExcalidrawEditor+iOSSync.swift

225 lines. Check platform/build reachability at the call site.

```text
54: if scenePhase == .background {
```

## ExcalidrawZ/ExcalidrawView/Editor/ExcalidrawEditor.swift

1380 lines. Check platform/build reachability at the call site.

```text
30: @Environment(\.containerSize) private var containerSize
196: private var floatingToolbarDragRegionHeight: CGFloat {
207: @State private var editorContentSize: CGSize = .zero
245: .opacity(isInCollaborationSpace ? 0 : 1)
249: .opacity(isInCollaborationSpace ? 1 : 0)
258: .background {
270: .frame(maxWidth: .infinity)
271: .frame(height: floatingToolbarDragRegionHeight)
273: .transition(.opacity)
278: .opacity(isLoadingFile ? 0 : 1)
282: .overlay(alignment: .bottom) {
292: .overlay(alignment: .bottomTrailing) {
301: .padding(.trailing, 8)
302: .padding(.bottom, 18)
322: .overlay(alignment: .bottom) {
326: .background {
331: .animation(.smooth(duration: 0.3), value: layoutState.isAIChatIslandMode)
332: .animation(.smooth(duration: 0.3), value: layoutState.isCompactAIChatToolbarPresented)
333: .animation(.smooth(duration: 0.3), value: layoutState.isCompactAIChatInputEditing)
1323: proxy.frame(in: .global).minY
```

## ExcalidrawZ/ExcalidrawView/Editor/ExcalidrawEditorOverlayModifier.swift

459 lines. Check platform/build reachability at the call site.

```text
46: .opacity(hasFile ? 1 : 0)
76: .transition(.opacity)
98: VStack(spacing: 8) {
102: .tint(NavigationShellTheme.primary(for: colorScheme))
105: .font(.callout)
107: .foregroundStyle(NavigationShellTheme.primary(for: colorScheme))
109: .foregroundStyle(.secondary)
112: .padding(.horizontal, 18)
113: .padding(.vertical, 14)
114: .background {
116: RoundedRectangle(cornerRadius: 8)
118: .overlay {
119: RoundedRectangle(cornerRadius: 8)
120: .strokeBorder(NavigationShellTheme.primary(for: colorScheme), lineWidth: 1)
124: RoundedRectangle(cornerRadius: 16, style: .continuous)
126: .editorChromeGlassEffect(.clear, in: .rect(cornerRadius: 16))
128: RoundedRectangle(cornerRadius: 16, style: .continuous)
136: VStack(spacing: 10) {
138: .font(.title2)
140: .foregroundStyle(NavigationShellTheme.primary(for: colorScheme))
142: .foregroundStyle(.orange)
146: .font(.callout)
147: .foregroundStyle(.secondary)
149: .lineLimit(3)
160: .buttonStyle(NavigationShellButtonStyle(accent: true, bordered: true))
162: .editorChromeButtonStyle(style: .glassProminent, shape: .capsule)
165: .frame(maxWidth: 320)
166: .padding(.horizontal, 20)
167: .padding(.vertical, 16)
168: .background {
170: RoundedRectangle(cornerRadius: 8)
172: .overlay {
173: RoundedRectangle(cornerRadius: 8)
174: .strokeBorder(NavigationShellTheme.primary(for: colorScheme), lineWidth: 1)
178: RoundedRectangle(cornerRadius: 16, style: .continuous)
180: .editorChromeGlassEffect(.clear, in: .rect(cornerRadius: 16))
182: RoundedRectangle(cornerRadius: 16, style: .continuous)
195: .frame(width: rect.width, height: rect.height)
197: .offset(x: rect.minX, y: rect.minY)
217: geometry.frame(in: .global).minY
223: width: rect.width,
224: height: rect.height + topInset
337: .opacity(0)
338: .contentShape(Rectangle())
373: .editorChromeButtonStyle(style: .glassProminent)
410: .font(.title)
411: .foregroundStyle(.secondary)
413: .transition(
416: removal: .opacity.animation(.smooth.delay(0.2))
421: .animation(.default, value: isSelectFilePlaceholderPresented)
422: .contentShape(Rectangle())
```

## ExcalidrawZ/ExcalidrawView/Editor/IndicatorOverlay.swift

529 lines. Check platform/build reachability at the call site.

```text
12: private static let iconSize: CGFloat = 16
14: private static let expandedContentWidth: CGFloat = 132
24: private var buttonStyleSize: ModernButtonStyleModifier.Size {
32: private var contentWidth: CGFloat {
77: width: contentWidth,
78: height: Self.iconFrame,
84: .editorChromeButtonStyle(
89: .foregroundStyle(.primary)
91: .animation(.smooth(duration: 0.32), value: contentWidth)
92: .animation(.smooth(duration: 0.22), value: currentEvent?.presentationID ?? "idle")
104: HStack(spacing: event == nil ? 0 : 8) {
106: .font(.system(size: Self.iconSize, weight: .semibold))
107: .frame(width: Self.iconFrame, height: Self.iconFrame)
111: .font(.body)
112: .lineLimit(1)
113: .id(event.presentationID)
114: .transition(.opacity.combined(with: .scale(scale: 0.98)))
115: .frame(maxWidth: .infinity, alignment: .leading)
118: .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: event == nil ? .center : .leading)
119: .transition(.opacity.combined(with: .scale(scale: 0.98)))
125: .foregroundStyle(iconColor(for: event))
192: if currentEvent?.presentationID == event.presentationID {
200: queuedEvents[lastIndex].presentationID == event.presentationID {
247: var width: CGFloat
248: let height: CGFloat
257: content.frame(width: width, height: height, alignment: alignment)
```

## ExcalidrawZ/ExcalidrawView/Editor/LockedFileUnlockOverlayModifier.swift

224 lines. Check platform/build reachability at the call site.

```text
36: private let fadeDuration: UInt64 = 220_000_000
37: private let minimumLoadingDuration: TimeInterval = 0.45
49: .overlay {
52: .animation(.smooth(duration: 0.4), value: isVisible)
83: .opacity(isVisible ? 1 : 0)
85: .animation(.smooth(duration: 0.22), value: isVisible)
```

## ExcalidrawZ/ExcalidrawView/Editor/LockedFileUnlockView.swift

445 lines. Check platform/build reachability at the call site.

```text
57: VStack(spacing: 18) {
60: VStack(spacing: 6) {
62: .font(.title2.weight(.semibold))
66: .font(.callout)
67: .foregroundStyle(.secondary)
68: .lineLimit(2)
73: .padding(.top, 4)
77: .padding(32)
78: .frame(maxWidth: 520)
80: .animation(.smooth(duration: 0.18), value: isUnlockingOrLoading)
97: width: 520
130: private var background: some View {
139: .font(.system(size: 72, weight: .regular))
140: .foregroundStyle(.secondary)
142: .padding(.bottom, 4)
156: VStack(spacing: 6) {
164: .editorChromeButtonStyle(style: .glassProminent, size: .large, shape: .capsule)
166: .help(systemUnlockAvailability.buttonTitle)
172: .font(.callout.weight(.medium))
174: .buttonStyle(.plain)
175: .foregroundStyle(Color.accentColor)
182: VStack(spacing: 10) {
185: .font(.system(.body, design: .monospaced))
186: .focused($isRecoveryKeyFocused)
187: .frame(maxWidth: 360)
206: .editorChromeButtonStyle(style: .glassProminent, size: .large, shape: .capsule)
221: VStack(spacing: 8) {
223: .font(.callout)
224: .foregroundStyle(.red)
226: .frame(maxWidth: 360)
233: .font(.callout.weight(.medium))
235: .buttonStyle(.plain)
236: .foregroundStyle(.red)
247: .opacity(isUnlockingOrLoading ? 0 : 1)
250: .opacity(isUnlockingOrLoading ? 1 : 0)
252: .frame(minWidth: 118)
253: .animation(.smooth(duration: 0.18), value: isUnlockingOrLoading)
260: .opacity(isUnlockingOrLoading ? 0 : 1)
263: .opacity(isUnlockingOrLoading ? 1 : 0)
265: .frame(minWidth: 118)
266: .animation(.smooth(duration: 0.18), value: isUnlockingOrLoading)
271: HStack(spacing: 8) {
273: .controlSize(.small)
```

## ExcalidrawZ/ExcalidrawView/Engine/ExcalidrawCanvasView.swift

531 lines. Check platform/build reachability at the call site.

```text
176: if scenePhase == .background {
```

## ExcalidrawZ/ExcalidrawView/Engine/ExcalidrawCore/ExcalidrawCore+ScriptMessage.swift

1515 lines. Check platform/build reachability at the call site.

```text
1288: var fileSize: Double
```

## ExcalidrawZ/ExcalidrawView/Engine/ExcalidrawCore/Helpers/ExcalidrawCore+AICameraTypes.swift

158 lines. Check platform/build reachability at the call site.

```text
83: var viewportPadding: AICameraPaddingValue?
```

## ExcalidrawZ/ExcalidrawView/Engine/ExcalidrawCore/Helpers/ExcalidrawCore+ExportHelpers.swift

525 lines. Check platform/build reachability at the call site.

```text
28: let width: Double?
29: let height: Double?
163: width: Self.doubleValue(fromJavaScript: dict["width"]),
164: height: Self.doubleValue(fromJavaScript: dict["height"]),
```

## ExcalidrawZ/ExcalidrawView/Engine/ExcalidrawCore/Helpers/ExcalidrawCore+FrameHelpers.swift

69 lines. Check platform/build reachability at the call site.

```text
15: padding: Double? = nil,
21: padding: padding,
```

## ExcalidrawZ/ExcalidrawView/Engine/ExcalidrawCore/Helpers/ExcalidrawCore+FrameTypes.swift

29 lines. Check platform/build reachability at the call site.

```text
14: var padding: Double?
```

## ExcalidrawZ/ExcalidrawView/Engine/ExcalidrawCore/Helpers/ExcalidrawCore+MathImageTypes.swift

128 lines. Check platform/build reachability at the call site.

```text
17: var width: Double?
18: var height: Double?
33: var width: Double?
34: var height: Double?
```

## ExcalidrawZ/ExcalidrawView/Engine/ExcalidrawCore/Helpers/ExcalidrawCore+MermaidTypes.swift

157 lines. Check platform/build reachability at the call site.

```text
143: var width: Double
144: var height: Double
```

## ExcalidrawZ/ExcalidrawView/Engine/ExcalidrawCore/Helpers/ExcalidrawCore+NativeEyeDropper.swift

241 lines. Check platform/build reachability at the call site.

```text
24: var color: String?
27: static func selected(requestId: String, color: String) -> Self {
28: Self(requestId: requestId, color: color, cancelled: nil)
32: Self(requestId: requestId, color: nil, cancelled: true)
99: await complete(.selected(requestId: request.requestId, color: hex))
149: private static func sRGBHex(_ color: NSColor) -> String? {
169: private static func sRGBHex(_ color: UIColor) -> String? {
220: await complete(.selected(requestId: request.requestId, color: hex))
```

## ExcalidrawZ/ExcalidrawView/Engine/ExcalidrawCore/Helpers/ExcalidrawCore+PDF.swift

191 lines. Check platform/build reachability at the call site.

```text
36: width: Double = 600,
37: height: Double = 800,
66: width: \(width),
67: height: \(height),
108: let renderSize = CGSize(width: imageWidth * 2, height: imageHeight * 2)
```

## ExcalidrawZ/ExcalidrawView/Engine/ExcalidrawCore/Helpers/ExcalidrawCore+SaveStream.swift

317 lines. Check platform/build reachability at the call site.

```text
14: var chunkSize: Int
```

## ExcalidrawZ/ExcalidrawView/Engine/ExcalidrawCore/Helpers/ExcalidrawCore+ViewportHelpers.swift

170 lines. Check platform/build reachability at the call site.

```text
40: x: appState.width / 2 / zoom - appState.scrollX,
41: y: appState.height / 2 / zoom - appState.scrollY,
104: "window.excalidrawZHelper.scrollToCenter();",
115: "window.excalidrawZHelper.scrollToElement('\(id)', \(optionsJSON));",
```

## ExcalidrawZ/ExcalidrawView/Engine/ExcalidrawCore/Helpers/ExcalidrawCore+ViewportTypes.swift

60 lines. Check platform/build reachability at the call site.

```text
26: var width: Double
27: var height: Double
```

## ExcalidrawZ/ExcalidrawView/Engine/ExcalidrawWebView.swift

318 lines. Check platform/build reachability at the call site.

```text
60: self.scrollView.isScrollEnabled = false
61: self.scrollView.backgroundColor = .clear
120: self.scrollRecognizer = scrollRecognizer
```

## ExcalidrawZ/ExcalidrawView/Engine/OffscreenExcalidrawEditor.swift

305 lines. Check platform/build reachability at the call site.

```text
50: init(viewportSize: CGSize = CGSize(width: 1280, height: 800)) {
52: core.webView.frame = CGRect(origin: .zero, size: viewportSize)
64: viewportSize: CGSize = CGSize(width: 1280, height: 800),
224: webView.frame = contentView.bounds
230: panel.setFrameOrigin(screen.frame.origin)
```

## ExcalidrawZ/ExcalidrawView/NativeRenderer/ExcalidrawRenderer.swift

514 lines. Check platform/build reachability at the call site.

```text
42: .overlay {
48: .frame(
49: width: geometry.size.width * renderScale,
50: height: geometry.size.height * renderScale
52: .scaleEffect(1.0 / renderScale, anchor: .center)
53: .frame(
54: width: geometry.size.width,
55: height: geometry.size.height
58: .aspectRatio(frame.width / frame.height, contentMode: .fit)
66: var widthScaleEffect: CGFloat { size.width / self.frame.width }
67: var heightScaleEffect: CGFloat { size.height / self.frame.height }
72: width: element.width * widthScaleEffect,
73: height: element.height * heightScaleEffect
84: context.opacity = excalidrawGenericElement.opacity / 100.0
104: context.stroke(
122: context.opacity = excalidrawGenericElement.opacity / 100.0
154: context.stroke(
166: context.opacity = excalidrawGenericElement.opacity / 100.0
177: context.stroke(
192: context.opacity = excalidrawTextElement.opacity / 100.0
194: .font(.system(size: excalidrawTextElement.fontSize * widthScaleEffect * 0.8))
195: .foregroundColor(Color(excalidrawString: excalidrawTextElement.strokeColor))
203: context.opacity = excalidrawLinearElement.opacity / 100.0
214: context.stroke(
237: context.opacity = excalidrawArrowElement.opacity / 100.0
248: context.stroke(
289: context.stroke(
314: context.opacity = excalidrawFreeDrawElement.opacity / 100.0
325: context.stroke(
351: context.opacity = excalidrawImageElement.opacity / 100.0
364: context.opacity = excalidrawPdfElement.opacity / 100.0
369: with: .color(.gray.opacity(0.1))
373: context.stroke(
384: width: iconSize,
385: height: iconSize
389: context.stroke(
399: .font(.system(size: min(transformedRect.width * 0.08, 12)))
400: .foregroundStyle(.gray)
404: .font(.system(size: min(transformedRect.width * 0.08, 12)))
405: .foregroundColor(.gray)
412: width: transformedRect.width,
413: height: transformedRect.height / 3
430: x: (point.x - self.frame.minX) * canvasSize.width / (self.frame.maxX - self.frame.minX),
431: y: (point.y - self.frame.minY) * canvasSize.height / (self.frame.maxY - self.frame.minY)
438: self.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
459: self.frame = CGRect(x: minX, y: minY, width: width, height: height)
```

## ExcalidrawZ/ExcalidrawView/ScreenAnnotation/ScreenAnnotationCaptureRegionView.swift

513 lines. Check platform/build reachability at the call site.

```text
18: private let minimumSize = CGSize(width: 120, height: 80)
19: private let anchorSize: CGFloat = 14
20: private let anchorHitSize: CGFloat = 32
21: private let borderHitWidth: CGFloat = 24
50: width: width,
51: height: height
59: width: min(width, containerSize.width),
60: height: min(height, containerSize.height)
71: .frame(width: containerSize.width, height: containerSize.height)
84: Color.black.opacity(0.46),
93: .stroke(
103: .frame(
104: width: selection.width,
105: height: selection.height
110: Circle()
111: .fill(.black.opacity(0.28))
112: .overlay {
113: Circle()
114: .stroke(Color.white, lineWidth: 2)
116: .frame(width: anchorSize, height: anchorSize)
118: .frame(width: anchorHitSize, height: anchorHitSize)
119: .contentShape(Rectangle())
129: .frame(width: selection.width, height: selection.height)
151: .frame(height: borderHitWidth)
152: .frame(maxWidth: .infinity)
153: .contentShape(Rectangle())
164: .frame(width: borderHitWidth)
165: .frame(maxHeight: .infinity)
166: .contentShape(Rectangle())
188: width: start.width,
189: height: start.height
259: width: maxX - minX,
260: height: maxY - minY
273: width: width,
274: height: height
490: let size = NSSize(width: 24, height: 24)
501: path.stroke()
505: path.stroke()
```

## ExcalidrawZ/ExcalidrawView/ScreenAnnotation/ScreenAnnotationCaptureService.swift

58 lines. Check platform/build reachability at the call site.

```text
36: let pixelWidth = Int(screen.frame.width * screen.backingScaleFactor)
37: let pixelHeight = Int(screen.frame.height * screen.backingScaleFactor)
55: return NSImage(cgImage: image, size: screen.frame.size)
```

## ExcalidrawZ/ExcalidrawView/ScreenAnnotation/ScreenAnnotationController.swift

254 lines. Check platform/build reachability at the call site.

```text
74: guard let screen = NSScreen.screens.first(where: { $0.frame.contains(mouseLocation) })
92: ![.image, .frame, .webEmbed, .magicFrame].contains($0)
```

## ExcalidrawZ/ExcalidrawView/ScreenAnnotation/ScreenAnnotationDocumentBridge.swift

131 lines. Check platform/build reachability at the call site.

```text
41: width: imagePixelWidth,
42: height: imagePixelHeight,
48: width: viewportWidth,
49: height: viewportHeight,
56: width: selectionWidth,
57: height: selectionHeight,
117: gap: 40,
```

## ExcalidrawZ/ExcalidrawView/ScreenAnnotation/ScreenAnnotationElementPropertiesBridge.swift

186 lines. Check platform/build reachability at the call site.

```text
61: backgroundColor: "currentItemBackgroundColor",
67: opacity: "currentItemOpacity",
104: updates.opacity = properties.opacity;
```

## ExcalidrawZ/ExcalidrawView/ScreenAnnotation/ScreenAnnotationPanel.swift

64 lines. Check platform/build reachability at the call site.

```text
13: contentRect: screen.frame,
```

## ExcalidrawZ/ExcalidrawView/ScreenAnnotation/ScreenAnnotationSaveControls.swift

151 lines. Check platform/build reachability at the call site.

```text
19: HStack(spacing: 6) {
21: .controlSize(.small)
28: .help("Save annotation")
30: .editorChromeButtonStyle(
125: .help("Save destination: \(configuration.title)")
126: .buttonStyle(.borderless)
```

## ExcalidrawZ/ExcalidrawView/ScreenAnnotation/ScreenAnnotationSavePersistence.swift

439 lines. Check platform/build reachability at the call site.

```text
219: settingCanvasBackground color: String
```

## ExcalidrawZ/ExcalidrawView/ScreenAnnotation/ScreenAnnotationSaveService.swift

214 lines. Check platform/build reachability at the call site.

```text
48: width: cropRect.width * scaleX,
49: height: cropRect.height * scaleY
103: width: CGFloat(sourceImage.width),
104: height: CGFloat(sourceImage.height)
141: width: targetWidth,
142: height: targetHeight,
157: width: targetWidth,
158: height: targetHeight
```

## ExcalidrawZ/ExcalidrawView/ScreenAnnotation/ScreenAnnotationSelectionProperties.swift

156 lines. Check platform/build reachability at the call site.

```text
14: let rect = CGRect(x: x, y: y, width: width, height: height)
41: width: maxX - minX,
42: height: maxY - minY
62: properties.opacity = number(element["opacity"])
```

## ExcalidrawZ/ExcalidrawView/ScreenAnnotation/ScreenAnnotationSession.swift

746 lines. Check platform/build reachability at the call site.

```text
312: tool = .frame
475: width: bounds[2].doubleValue - bounds[0].doubleValue,
476: height: bounds[3].doubleValue - bounds[1].doubleValue
488: camera.scrollX = scrollX
491: camera.scrollY = scrollY
673: x: (bounds.minX + camera.scrollX) * camera.zoom,
674: y: (bounds.minY + camera.scrollY) * camera.zoom,
675: width: bounds.width * camera.zoom,
676: height: bounds.height * camera.zoom
```

## ExcalidrawZ/ExcalidrawView/ScreenAnnotation/ScreenAnnotationToolbar.swift

361 lines. Check platform/build reachability at the call site.

```text
27: @State private var toolRowSize = CGSize.zero
30: private let edgePadding: CGFloat = 12
36: .transition(
39: opacity: 0,
43: opacity: 1,
50: transaction.animation = nil
57: VStack(spacing: 8) {
58: HStack(spacing: 8) {
74: .frame(width: 20, height: 20)
76: .help(String(localizable: .toolbarButtonLockToolHelp))
77: .editorChromeButtonStyle(
94: .help(tool.help(shortcutLabel: shortcutLabel))
100: HStack(spacing: 8) {
115: .frame(width: toolRowSize.width > 0 ? toolRowSize.width : nil)
117: .padding(8)
118: .background {
120: .contentShape(
121: RoundedRectangle(cornerRadius: 20, style: .continuous)
125: .shadow(color: .black.opacity(0.16), radius: 18, y: 8)
131: .font(.system(size: 20, weight: .semibold))
133: .foregroundStyle(.primary)
135: .buttonStyle(.borderless)
136: .help("Exit screen annotation")
146: .controlSize(.small)
149: .font(.system(size: 16))
151: .font(.system(size: 7, weight: .bold))
154: .frame(width: 20, height: 20)
156: .help("Clear annotations")
158: .editorChromeButtonStyle(style: .glass, size: .large, shape: .circle)
165: .controlSize(.small)
166: .frame(width: 16, height: 16)
180: .help(session.isFrozen ? "Resume live screen" : "Freeze screen")
182: .editorChromeButtonStyle(
190: HStack(spacing: 6) {
193: .controlSize(.small)
204: .font(.callout)
205: .lineLimit(1)
206: .truncationMode(.middle)
208: .foregroundStyle(.secondary)
209: .padding(.horizontal, 12)
210: .padding(.vertical, 7)
211: .frame(maxWidth: .infinity)
212: .background {
214: Capsule()
216: .editorChromeGlassEffect(.regular, in: Capsule())
218: Capsule()
222: .shadow(color: .black.opacity(0.18), radius: 8, y: 4)
223: .contentShape(Capsule())
244: RoundedRectangle(cornerRadius: 20, style: .continuous)
246: .editorChromeGlassEffect(
248: in: RoundedRectangle(
254: RoundedRectangle(cornerRadius: 20, style: .continuous)
320: let opacity: Double
325: .opacity(opacity)
326: .blur(radius: blurRadius)
340: case .cursor:
```

## ExcalidrawZ/ExcalidrawView/ScreenAnnotation/ScreenAnnotationToolbarPlacement.swift

84 lines. Check platform/build reachability at the call site.

```text
76: let frame = screen.frame
```

## ExcalidrawZ/ExcalidrawView/ScreenAnnotation/ScreenAnnotationView.swift

341 lines. Check platform/build reachability at the call site.

```text
29: @State private var propertiesPanelSize = CGSize(width: 300, height: 52)
38: private let propertiesPanelEdgePadding: CGFloat = 12
39: private let propertiesPanelSelectionSpacing: CGFloat = 40
52: .opacity(session.isReady ? 1 : 0)
57: .contentShape(Rectangle())
68: .transition(
69: .opacity.combined(with: .offset(y: 8))
112: .transition(.opacity)
118: .transition(.opacity)
125: .animation(.easeOut(duration: 0.18), value: session.isReady)
205: Color.black.opacity(0.24)
206: .contentShape(Rectangle())
217: .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
218: .shadow(color: .black.opacity(0.24), radius: 28, y: 12)
289: .frame(width: proxy.size.width, height: proxy.size.height)
321: VStack(spacing: 10) {
324: .foregroundStyle(.orange)
326: .font(.callout)
328: .frame(maxWidth: 320)
331: .controlSize(.large)
333: .font(.callout)
334: .foregroundStyle(.secondary)
337: .padding(20)
338: .background(editorChromeSurface(), in: RoundedRectangle(cornerRadius: 16))
```

## ExcalidrawZ/ExcalidrawView/ScreenAnnotation/ScreenAnnotationWebView.swift

90 lines. Check platform/build reachability at the call site.

```text
77: webView.frame = bounds
```

## ExcalidrawZ/ExcalidrawView/ScreenAnnotation/ScreenAnnotationWelcomeView.swift

141 lines. Check platform/build reachability at the call site.

```text
28: VStack(spacing: 0) {
36: .padding(.top, 28)
42: .padding(28)
43: .frame(width: 560, height: 520)
44: .background(Color.windowBackgroundColor)
63: .editorChromeButtonStyle(style: .glass, size: .extraLarge, shape: .circle)
70: VStack(spacing: 16) {
72: .font(.system(size: 42, weight: .medium))
73: .foregroundStyle(.tint)
74: .frame(width: 88, height: 88)
75: .background(.tint.opacity(0.12), in: Circle())
77: VStack(spacing: 8) {
79: .font(.largeTitle.weight(.semibold))
82: .font(.body)
83: .foregroundStyle(.secondary)
85: .frame(maxWidth: 440)
91: HStack(alignment: .top, spacing: 14) {
97: .font(.system(size: 22, weight: .medium))
98: .foregroundStyle(hasPermission ? Color.green : Color.accentColor)
99: .frame(width: 28)
101: VStack(alignment: .leading, spacing: 5) {
103: .font(.headline)
106: .font(.callout)
107: .foregroundStyle(.secondary)
113: .padding(16)
114: .background(.secondary.opacity(0.08), in: RoundedRectangle(cornerRadius: 8))
127: .frame(maxWidth: .infinity)
129: .editorChromeButtonStyle(
```

## ExcalidrawZ/ExcalidrawView/ScreenAnnotation/ScreenCapturePermissionGuideController.swift

241 lines. Check platform/build reachability at the call site.

```text
97: size: CGSize(width: 520, height: 112)
156: width: settingsFrame.width,
157: height: 400
165: width: settingsFrame.width,
166: height: guideHeight
232: let primaryScreenMaxY = NSScreen.screens.first?.frame.maxY ?? 0
236: width: quartzFrame.width,
237: height: quartzFrame.height
```

## ExcalidrawZ/ExcalidrawView/ScreenAnnotation/ScreenCapturePermissionGuideView.swift

167 lines. Check platform/build reachability at the call site.

```text
9: HStack(spacing: 16) {
11: .frame(width: 72, height: 72)
14: .stroke(
22: .frame(width: 76, height: 48)
23: .shadow(
24: color: Color.accentColor.opacity(0.25),
28: VStack(alignment: .leading, spacing: 6) {
30: .font(.headline.weight(.semibold))
33: .font(.callout)
34: .foregroundStyle(.secondary)
43: .editorChromeButtonStyle(
49: .padding(.horizontal, 20)
50: .padding(.vertical, 14)
51: .frame(maxWidth: .infinity)
52: .background {
55: .overlay {
56: RoundedRectangle(cornerRadius: 20, style: .continuous)
57: .stroke(
58: Color(nsColor: .separatorColor).opacity(0.6),
66: let shape = RoundedRectangle(
73: .editorChromeGlassEffect(.regular, in: shape)
138: addCursorRect(bounds, cursor: .openHand)
```

## ExcalidrawZ/ExcalidrawView/Toolbar/ApplePencilToolbar/ApplePencilToolbar.swift

658 lines. Check platform/build reachability at the call site.

```text
23: @State private var viewSize: CGSize = .zero
24: @State private var toolbarSize: CGSize = .zero
35: private let margin: CGFloat = 16
64: return CGSize(width: x, height: y)
66: return CGSize(width: -x, height: y)
68: return CGSize(width: x, height: -y)
70: return CGSize(width: -x, height: -y)
78: .overlay {
82: .contentShape(Rectangle())
97: .frame(width: 20, height: 20)
98: .overlay {
110: .foregroundStyle(toolState.isActionsMenuPresneted ? .primary : .secondary)
112: .padding(10)
113: .background {
114: Circle()
115: .fill(.background)
116: .shadow(radius: 8)
120: .padding(.horizontal, 90)
121: .padding(.vertical, 60)
122: .transition(.asymmetric(insertion: .opacity.animation(.default.delay(0.5)), removal: .opacity))
125: .animation(.default, value: isDragging)
126: .animation(.default, value: isExpanded)
127: .animation(nil, value: toolbarAlignment)
144: .frame(width: 20, height: 20)
145: .overlay {
149: .foregroundStyle(.red)
151: .padding(10)
152: .background {
153: Circle()
154: .fill(.background)
155: .shadow(radius: 8)
159: .padding(.horizontal, 90)
160: .padding(.vertical, 10)
163: .transition(.asymmetric(insertion: .opacity.animation(.default.delay(0.5)), removal: .opacity))
166: .animation(.default, value: isDragging)
167: .animation(.default, value: isExpanded)
168: .animation(nil, value: toolbarAlignment)
172: .scaleEffect(isDragging || isExpanded ? 1 : 0.8)
173: .animation(.smooth, value: isDragging || isExpanded)
174: .overlay(alignment: handlerAligment) {
175: Capsule()
178: .frame(width: expansionDirection == .horizontal ? 50 : 6, height: expansionDirection == .horizontal ? 6 : 50)
184: .padding(10)
185: .opacity(isExpanded ? 1 : 0.001)
186: .offset(expansionHandlerOffset)
188: .offset(toolbarOffset)
207: .animation(.smooth, value: isExpanded)
208: .animation(.smooth, value: handlerAligment)
210: toolbarOffset = CGSize(width: -margin, height: -margin)
235: width: margin + toolbarSize.width / 2 - viewSize.width / 2,
236: height: margin + toolbarSize.height / 2 - viewSize.height / 2
241: width: viewSize.width / 2 - margin - toolbarSize.width / 2,
242: height: margin + toolbarSize.height / 2 - viewSize.height / 2
247: width: margin + toolbarSize.width / 2 - viewSize.width / 2,
248: height: viewSize.height / 2 - margin - toolbarSize.height / 2
253: width: viewSize.width / 2 - margin - toolbarSize.width / 2,
254: height: viewSize.height / 2 - margin - toolbarSize.height / 2
284: expansionHandlerOffset = CGSize(width: toolbarSize.width / 2 - 10, height: 0)
292: expansionHandlerOffset = CGSize(width: -toolbarSize.width / 2 + 10, height: 0)
300: expansionHandlerOffset = CGSize(width: 0, height: toolbarSize.height / 2 - 10)
308: expansionHandlerOffset = CGSize(width: 0, height: -toolbarSize.height / 2 + 10)
316: width: value.predictedEndTranslation.width - value.translation.width,
317: height: value.predictedEndTranslation.height - value.translation.height
430: let newOffset = CGSize(width: offsetXMultiplier * margin, height: offsetYMultiplier * margin)
475: .aspectRatio(1, contentMode: .fit)
476: .overlay {
481: properties: .frame,
484: .padding(6)
486: .contentShape(Rectangle())
491: .padding(.vertical, 4)
508: .aspectRatio(1, contentMode: .fit)
509: .overlay {
511: .font(.body.bold())
512: .foregroundStyle(.secondary)
515: .background {
516: Circle()
530: .aspectRatio(1, contentMode: .fit)
531: .overlay {
536: properties: .frame,
542: .aspectRatio(1, contentMode: .fit)
546: .foregroundStyle(.primary)
547: .padding(20)
548: .clipShape(Capsule())
552: width: expansionDirection == .horizontal ? (isExpanded ? 700 : 80) : 80,
553: height: expansionDirection == .vertical ? (isExpanded ? 700 : 80) : 80
557: .background {
558: Capsule()
559: .fill(.background)
560: .shadow(radius: 20)
586: .aspectRatio(1, contentMode: .fit)
587: .overlay {
594: .font(.body.bold())
596: .foregroundStyle(.secondary)
597: .background {
598: Circle().fill(.regularMaterial)
612: var targetSize: CGSize
616: set { targetSize = CGSize(width: newValue.first, height: newValue.second) }
621: .frame(width: targetSize.width, height: targetSize.height)
640: CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
```

## ExcalidrawZ/ExcalidrawView/Toolbar/ApplePencilToolbar/PencilTipsSheetView.swift

592 lines. Check platform/build reachability at the call site.

```text
43: offset: CGSize(width: -142, height: -32),
44: control: CGSize(width: -76, height: -116),
51: offset: CGSize(width: 2, height: 16),
52: control: CGSize(width: -18, height: -56),
59: offset: CGSize(width: 146, height: -22),
60: control: CGSize(width: 78, height: -110),
79: offset: CGSize(width: -148, height: -18),
80: control: CGSize(width: -82, height: -100),
87: offset: CGSize(width: 0, height: 18),
88: control: CGSize(width: 18, height: -58),
95: offset: CGSize(width: 150, height: -30),
96: control: CGSize(width: 78, height: -120),
110: offset: CGSize(width: -148, height: -24),
111: control: CGSize(width: -82, height: -108),
118: offset: CGSize(width: 0, height: 18),
119: control: CGSize(width: -20, height: -58),
126: offset: CGSize(width: 148, height: -22),
127: control: CGSize(width: 82, height: -112),
136: VStack(spacing: 18) {
138: .font(.title2.weight(.semibold))
144: .font(.footnote)
145: .foregroundStyle(.secondary)
155: .frame(maxWidth: .infinity)
157: .modernButtonStyle(style: .glassProminent, size: .large, shape: .capsule)
159: .padding(.horizontal, 24)
160: .padding(.vertical, 28)
161: .frame(maxWidth: 560)
181: VStack(spacing: 12) {
199: .frame(maxWidth: .infinity, maxHeight: .infinity)
202: .frame(height: 254)
213: LazyHStack(spacing: 14) {
219: .frame(width: cardWidth, height: 150)
221: .scrollTransition(.interactive, axis: .horizontal) { content, phase in
223: .scaleEffect(phase.isIdentity ? 1 : 0.88)
224: .opacity(phase.isIdentity ? 1 : 0.52)
229: .scrollTargetLayout()
230: .padding(.vertical, 18)
232: .scrollIndicators(.hidden)
233: .scrollClipDisabled()
234: .scrollTargetBehavior(.viewAligned)
235: .scrollPosition(id: $scrollPosition)
236: .contentMargins(.horizontal, sideInset, for: .scrollContent)
245: .padding(.horizontal, 2)
249: .frame(height: 186)
254: HStack(spacing: 7) {
256: Circle()
257: .fill(selectedMode == page.mode ? Color.accentColor : .secondary.opacity(0.35))
258: .frame(width: selectedMode == page.mode ? 8 : 6, height: selectedMode == page.mode ? 8 : 6)
259: .contentShape(Rectangle())
265: .animation(.smooth, value: selectedMode)
274: .font(.headline.weight(.semibold))
275: .frame(width: 26, height: 26)
277: .modernButtonStyle(style: .glass, size: .large, shape: .circle)
278: .shadow(color: .black.opacity(0.10), radius: 12, x: 0, y: 6)
327: var floatDuration: TimeInterval {
361: .frame(width: bubble.size * scale, height: bubble.size * scale)
362: .clipShape(Circle())
363: .contentShape(Circle())
365: .shadow(
366: color: .black.opacity(0.16 + 0.04 * visibleProgress),
371: .scaleEffect(0.28 + progress * 0.76)
372: .opacity(visibleProgress)
378: width: bubble.offset.width * scale,
379: height: bubble.offset.height * scale
382: width: bubble.control.width * scale,
383: height: bubble.control.height * scale
387: .offset(x: floatX, y: floatY)
413: PencilTipGlassCircle()
416: .clipShape(Circle())
418: Circle()
419: .strokeBorder(.white.opacity(0.54), lineWidth: 1.4)
420: .blur(radius: 0.25)
422: Circle()
424: LinearGradient(
426: .white.opacity(0.42),
427: .white.opacity(0.08),
436: Circle()
440: .white.opacity(0.28),
457: .padding(9 * scale)
463: .background(Color.black)
466: .background(Color.white)
474: Circle()
477: Circle()
478: .fill(.white.opacity(0.58))
482: Circle()
484: .glassEffect(.regular, in: Circle())
486: Circle()
490: .opacity(0.82)
492: Circle()
493: .strokeBorder(Color.primary.opacity(0.08), lineWidth: 1)
509: content.offset(currentOffset)
516: width: 2 * inverse * t * control.width + t * t * target.width,
517: height: 2 * inverse * t * control.height + t * t * target.height
528: ? AnyShapeStyle(Color.accentColor.opacity(0.13))
532: private var borderStyle: AnyShapeStyle {
534: ? AnyShapeStyle(Color.accentColor.opacity(0.45))
539: VStack(alignment: .leading, spacing: 12) {
540: HStack(alignment: .firstTextBaseline, spacing: 8) {
542: .font(.headline)
543: .foregroundStyle(.primary)
548: .font(.title3)
549: .foregroundStyle(isSelected ? .green : .secondary)
553: .font(.callout)
554: .foregroundStyle(.secondary)
559: .padding(18)
560: .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
561: .background {
563: RoundedRectangle(cornerRadius: 22, style: .continuous)
565: RoundedRectangle(cornerRadius: 22, style: .continuous)
568: .shadow(
569: color: .black.opacity(isSelected ? 0.14 : 0.08),
575: .overlay {
576: RoundedRectangle(cornerRadius: 22, style: .continuous)
577: .strokeBorder(borderStyle)
579: .padding(.horizontal, 2)
580: .scaleEffect(isSelected ? 1 : 0.985)
581: .animation(.smooth, value: isSelected)
```

## ExcalidrawZ/ExcalidrawView/Toolbar/CompactExcalidrawBottomToolbarContent.swift

817 lines. Check platform/build reachability at the call site.

```text
20: @Environment(\.containerSize) private var containerSize
38: .transition(.opacity.combined(with: .scale(scale: 0.92)))
46: .frame(maxWidth: .infinity)
51: .transition(.opacity.combined(with: .scale(scale: 0.92)))
72: .frame(maxWidth: .infinity, alignment: .center)
86: .modernButtonStyle(style: .glassProminent, shape: .circle)
96: .font(.system(size: 14, weight: .medium))
97: .frame(width: 28, height: 28)
98: .contentShape(Rectangle())
102: .font(.system(size: 14, weight: .medium))
103: .frame(width: 28, height: 28)
104: .contentShape(Rectangle())
107: .foregroundStyle(toolState.isToolLocked ? Color.accentColor : Color.primary)
108: .help("\(String(localizable: .toolbarButtonLockToolHelp)) - Q")
109: .accessibilityLabel(Text(localizable: .toolbarButtonLockToolLabel))
110: .animation(.default, value: toolState.isToolLocked)
115: HStack(spacing: 20) {
131: .foregroundStyle(Color.accentColor)
190: HStack(spacing: 8) {
201: .keyboardShortcut("f", modifiers: .command)
215: title: String(localizable: .presentationTitle)
229: HStack(spacing: 20) {
243: .padding(.horizontal, 16)
250: .frame(width: 28, height: 28)
272: .font(.system(size: 16, weight: .medium))
273: .frame(width: 28, height: 28)
274: .contentShape(Rectangle())
276: .foregroundStyle(Color.primary)
277: .help(.localizable(.aiChatButtonFullscreen))
278: .accessibilityLabel(Text(localizable: .aiChatButtonFullscreen))
293: .transition(.opacity.combined(with: .scale(scale: 0.8)))
296: .transition(.opacity.combined(with: .scale(scale: 0.8)))
299: .font(.system(size: 16, weight: .medium))
300: .frame(width: 28, height: 28)
301: .contentShape(Rectangle())
303: .foregroundStyle(compactAIChatShowsStopButton ? Color.accentColor : Color.primary)
304: .help(compactAIChatToolbarTrailingTitle)
305: .animation(.smooth(duration: 0.2), value: compactAIChatShowsStopButton)
319: .frame(width: 28, height: 28)
321: .modernButtonStyle(style: .glassProminent, size: .small, shape: .circle)
322: .help(String(localizable: .toolbarEdit))
345: .font(.system(size: 16))
346: .foregroundStyle(isActive ? Color.accentColor : Color.primary)
348: .help(title)
349: .opacity(isDisabled && !isActive ? 0.55 : 1)
366: .keyboardShortcut("f", modifiers: .command)
375: title: String(localizable: .presentationTitle)
380: .font(.system(size: 16))
381: .foregroundStyle(compactCollapsedInspectorTabsContainActive ? Color.accentColor : Color.primary)
385: .help(String(localizable: .generalButtonMore))
565: HStack(spacing: 6) {
569: .lineLimit(1)
570: .truncationMode(.tail)
571: .frame(maxWidth: .infinity, alignment: .leading)
573: .font(.subheadline)
574: .foregroundStyle(.secondary)
575: .frame(maxWidth: .infinity, minHeight: 28, alignment: .leading)
577: .buttonStyle(.plain)
578: .help("AI Chat")
584: @Environment(\.containerSize) private var containerSize
724: .font(.system(size: 17, weight: .semibold))
725: .frame(width: 28, height: 28)
726: .contentShape(Rectangle())
731: .frame(width: 0, height: 0)
```

## ExcalidrawZ/ExcalidrawView/Toolbar/ExcalidrawEditorToolbarModifier.swift

821 lines. Check platform/build reachability at the call site.

```text
21: @Environment(\.containerSize) private var containerSize
113: .safeAreaInset(edge: .top, spacing: 0) {
122: .focusable()
123: .focused($isDrawingMenuButtonFocused)
128: .accessibilityValue(isDrawingMenuPresented ? "Expanded" : "Collapsed")
132: .background {
142: .keyboardShortcut("f", modifiers: .command)
143: .hidden().frame(width: 0, height: 0)
160: Color.black.opacity(0.001)
161: .contentShape(Rectangle())
170: .keyboardShortcut(.escape, modifiers: [])
171: .hidden().frame(width: 0, height: 0)
174: .padding(.leading, 48).padding(.top, 48)
176: .offset(x: max(8, min(anchor.map { geometry[$0].minX } ?? 8, geometry.size.width - 272)),
221: .animation(.default, value: toolState.isBottomBarPresented)
222: .animation(.default, value: lockedContentState.activeFileLockState)
316: .buttonStyle(NavigationShellButtonStyle())
338: .buttonStyle(NavigationShellButtonStyle(accent: true, bordered: true))
350: .help(String(localizable: .lockedContentLockFilesHelp))
369: .help(String(localizable: .lockFileTitle))
394: .help(String(localizable: .lockFileTitle))
573: .foregroundStyle(.gray)
596: VStack(alignment: .leading) {
598: .font(.headline)
600: .font(.footnote)
601: .foregroundStyle(.secondary)
605: VStack(alignment: .leading) {
607: .font(.headline)
609: .font(.footnote)
610: .foregroundStyle(.secondary)
615: VStack(alignment: .leading) {
617: .font(.headline)
619: .font(.footnote)
620: .foregroundStyle(.secondary)
623: HStack(spacing: 10) {
624: VStack(alignment: .leading) {
626: .font(.headline)
628: .font(.footnote)
629: .foregroundStyle(.secondary)
637: VStack(alignment: .leading) {
639: .font(.headline)
644: .font(.footnote)
645: .foregroundStyle(.secondary)
649: .frame(width: 120, alignment: .leading)
693: .controlSize(.small)
694: .padding(.trailing, 8)
702: .font(.footnote)
703: .accessibilityLabel("Drawing actions")
799: HStack(spacing: 0) {
809: .scrollContentBackground(.hidden)
817: .font(.footnote)
818: .foregroundStyle(.secondary)
```

## ExcalidrawZ/ExcalidrawView/Toolbar/ExcalidrawToolbar+Layout.swift

177 lines. Check platform/build reachability at the call site.

```text
22: func sizeClass(for width: CGFloat) -> ExcalidrawToolbarToolSizeClass {
37: static let collaborationExtraWidth: CGFloat = 90
40: static let compactBottomToolbarWidth: CGFloat = 820
103: for width: CGFloat,
130: for width: CGFloat,
156: for width: CGFloat,
```

## ExcalidrawZ/ExcalidrawView/Toolbar/ExcalidrawToolbar.swift

979 lines. Check platform/build reachability at the call site.

```text
35: .animation(.smooth, value: toolState.activatedTool)
36: .animation(.smooth, value: toolState.inDragMode)
64: HStack(spacing: 10) {
84: HStack(spacing: 10) {
137: .foregroundStyle(toolState.isToolLocked ? AnyShapeStyle(Color.accentColor) : AnyShapeStyle(HierarchicalShapeStyle.primary))
138: .animation(.default, value: toolState.isToolLocked)
140: .help("\(String(localizable: .toolbarButtonLockToolHelp)) - Q")
154: HStack(spacing: size / 2) {
163: .padding({
176: .background {
180: RoundedRectangle(cornerRadius: size / 1.6)
182: .stroke(.separator, lineWidth: 0.5)
184: RoundedRectangle(cornerRadius: size / 1.6)
198: .buttonStyle(.borderless)
199: .padding(size / 3)
200: .background {
203: RoundedRectangle(cornerRadius: size / 1.6)
207: .stroke(.separator, lineWidth: 0.5)
209: RoundedRectangle(cornerRadius: size / 1.6)
211: isSelected ? AnyShapeStyle(Color.accentColor.opacity(0.3)) : AnyShapeStyle(editorChromeSurface())
213: RoundedRectangle(cornerRadius: size / 1.6)
214: .stroke(.secondary, lineWidth: 0.5)
224: .padding(.horizontal, {
247: .foregroundStyle(
252: .contentShape(Rectangle())
270: .foregroundStyle(
370: .help(tool.help(shortcutLabel: shortcutLabel))
379: Text(activatedTool.localization).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 6)
390: .editorChromeButtonStyle(style: .glassProminent, shape: .circle)
392: HStack(spacing: 20) {
393: Text(activatedTool.localization).frame(maxWidth: .infinity, alignment: .leading)
409: HStack(spacing: 20) {
423: .foregroundStyle(Color.accentColor)
484: .keyboardShortcut("f", modifiers: .command)
498: title: String(localizable: .presentationTitle)
515: .frame(width: 28, height: 28)
540: .frame(width: 28, height: 28)
542: .editorChromeButtonStyle(style: .glassProminent, size: .small, shape: .circle)
543: .help(String(localizable: .toolbarEdit))
566: .font(.system(size: 16))
567: .foregroundStyle(isActive ? Color.accentColor : Color.primary)
568: .frame(width: 28, height: 28)
570: .help(title)
571: .opacity(isDisabled && !isActive ? 0.55 : 1)
583: .keyboardShortcut("f", modifiers: .command)
597: title: String(localizable: .presentationTitle)
602: .font(.system(size: 16))
603: .foregroundStyle(compactCollapsedInspectorTabsContainActive ? Color.accentColor : Color.primary)
604: .frame(width: 28, height: 28)
607: .help(String(localizable: .generalButtonMore))
726: var horizontalPadding: CGFloat {
735: var verticalPadding: CGFloat {
752: .padding(.horizontal, shape.horizontalPadding)
753: .padding(.vertical, shape.verticalPadding)
754: .background {
758: .shadow(
759: color: shadowColor,
771: Circle()
773: .editorChromeGlassEffect(.clear, in: Circle())
775: Circle()
780: Capsule()
782: .editorChromeGlassEffect(.clear, in: Capsule())
784: Capsule()
795: return .black.opacity(0.08)
798: private var shadowRadius: CGFloat {
823: @Environment(\.containerSize) private var containerSize
879: case .cursor:
922: .padding(labelType == .nativeShape ? size / 6 : labelType == .svg ? 0 : size / 6)
923: .aspectRatio(1, contentMode: .fit)
924: .frame(width: size, height: size)
925: .padding(size / 5)
926: .overlay(alignment: .bottomTrailing) {
928: .font(.footnote)
930: .padding(1)
955: .foregroundStyle(.red)
960: .contentTransition(.opacity)
961: .animation(.smooth, value: hasSelection)
978: .background(.background)
```

## ExcalidrawZ/ExcalidrawView/Toolbar/ExcalidrawToolbarToolOrder.swift

120 lines. Check platform/build reachability at the call site.

```text
27: .frame,
```

## ExcalidrawZ/ExcalidrawView/Toolbar/components/CollaboratorsList.swift

78 lines. Check platform/build reachability at the call site.

```text
32: HStack(spacing: 10) {
34: .font(.title)
35: VStack(alignment: .leading, spacing: 2) {
37: .font(.headline)
40: .font(.footnote)
41: .foregroundStyle(.secondary)
45: .buttonStyle(.listCell)
48: .padding()
50: .frame(width: 200, height: 240)
```

## ExcalidrawZ/ExcalidrawView/Toolbar/components/MathInput/MathInputSheetView+Actions.swift

388 lines. Check platform/build reachability at the call site.

```text
57: width: 520,
58: height: 520,
66: backgroundColor: functionBackgroundColor,
```

## ExcalidrawZ/ExcalidrawView/Toolbar/components/MathInput/MathInputSheetView+Colors.swift

42 lines. Check platform/build reachability at the call site.

```text
14: static func isThemeDefaultSVGColor(_ color: String) -> Bool {
20: static func isThemeDefaultSVGColorSelection(_ color: String) -> Bool {
```

## ExcalidrawZ/ExcalidrawView/Toolbar/components/MathInput/MathInputSheetView+DrawingSettings.swift

73 lines. Check platform/build reachability at the call site.

```text
22: VStack(alignment: .leading, spacing: 14) {
24: .font(.caption.weight(.semibold))
25: .foregroundStyle(.secondary)
26: .tracking(1.2)
28: LazyVGrid(
46: HStack(alignment: .center, spacing: 10) {
48: .font(.caption.weight(.semibold))
49: .foregroundStyle(.secondary)
50: .tracking(1.2)
51: .frame(width: 96, alignment: .leading)
64: VStack(alignment: .leading, spacing: 4) {
66: .font(.caption)
67: .foregroundStyle(.secondary)
```

## ExcalidrawZ/ExcalidrawView/Toolbar/components/MathInput/MathInputSheetView+Function.swift

157 lines. Check platform/build reachability at the call site.

```text
14: VStack(alignment: .leading, spacing: 18) {
22: VStack(alignment: .leading, spacing: 14) {
31: .controlSize(.regular)
33: .frame(maxWidth: 360)
45: VStack(alignment: .leading, spacing: 10) {
46: HStack(alignment: .firstTextBaseline) {
48: .font(.caption.weight(.semibold))
49: .foregroundStyle(.secondary)
50: .tracking(1.2)
62: VStack(spacing: 9) {
71: HStack(spacing: 10) {
72: Circle()
74: .frame(width: 10, height: 10)
75: .overlay {
76: Circle()
77: .strokeBorder(Color.primary.opacity(0.12))
91: .font(.system(.body, design: .monospaced))
99: .font(.system(size: 10, weight: .semibold))
100: .frame(width: 18, height: 18)
101: .contentShape(Circle())
103: .font(.system(size: 12, weight: .semibold))
104: .frame(width: 26, height: 26)
105: .contentShape(Circle())
109: .buttonStyle(.plain)
110: .foregroundStyle(.tertiary)
113: .opacity(functionExpressions.count > 1 ? 1 : 0)
114: .help(String(localizable: .toolbarLatexMathRemoveFunctionHelp))
119: VStack(alignment: .leading, spacing: 10) {
121: .font(.caption.weight(.semibold))
122: .foregroundStyle(.secondary)
123: .tracking(1.2)
125: VStack(spacing: 8) {
130: VStack(alignment: .leading, spacing: 4) {
132: .font(.subheadline.weight(.semibold))
133: .foregroundStyle(.primary)
134: .lineLimit(1)
135: .truncationMode(.tail)
138: .font(.caption)
139: .foregroundStyle(.secondary)
140: .lineLimit(1)
143: .font(.system(.caption2, design: .monospaced))
144: .foregroundStyle(.secondary)
145: .lineLimit(1)
148: .frame(maxWidth: .infinity, alignment: .leading)
149: .padding(10)
150: .frame(minHeight: 78, maxHeight: 78, alignment: .topLeading)
152: .buttonStyle(MathTemplateCardButtonStyle())
```

## ExcalidrawZ/ExcalidrawView/Toolbar/components/MathInput/MathInputSheetView+Header.swift

210 lines. Check platform/build reachability at the call site.

```text
48: .padding(.horizontal, 18)
49: .padding(.vertical, 10)
57: .font(.system(size: 16, weight: .semibold))
59: .editorChromeButtonStyle(style: .glass, size: .extraLarge, shape: .circle)
60: .foregroundStyle(.secondary)
61: .help(String(localizable: .generalButtonCancel))
70: .help(String(localizable: .generalButtonCancel))
79: .lineLimit(1)
80: .editorChromeButtonStyle(style: .glassProminent, size: .extraLarge, shape: .capsule)
81: .keyboardShortcut(.defaultAction)
91: .keyboardShortcut(.defaultAction)
103: .font(.system(size: 16, weight: .semibold))
105: .editorChromeButtonStyle(style: .glass, size: .extraLarge, shape: .circle)
106: .foregroundStyle(isInspectorPresented ? Color.accentColor : Color.secondary)
107: .help(String(localizable: .toolbarLatexMathTemplatesHelp))
112: HStack(spacing: 3) {
117: .padding(4)
118: .background {
136: .controlSize(.regular)
160: HStack(spacing: 6) {
162: .font(.system(size: 15, weight: .semibold))
164: .font(.caption.weight(.semibold))
166: .foregroundStyle(isSelected ? Color.primary : Color.secondary)
167: .lineLimit(1)
169: .frame(width: 86, height: 30)
171: .editorChromeButtonStyle(
181: Capsule()
183: .editorChromeGlassEffect(.regular, in: Capsule())
185: Capsule()
187: .overlay {
188: Capsule()
189: .strokeBorder(Color.primary.opacity(0.10))
203: .controlSize(.regular)
205: .frame(maxWidth: .infinity)
```

## ExcalidrawZ/ExcalidrawView/Toolbar/components/MathInput/MathInputSheetView+PreviewFooter.swift

115 lines. Check platform/build reachability at the call site.

```text
27: .aspectRatio(1, contentMode: .fit)
28: .frame(maxWidth: 420)
29: .frame(maxWidth: .infinity, alignment: .center)
32: .frame(height: 168)
38: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
49: .overlay {
50: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
51: .strokeBorder(Color.primary.opacity(canvasColorScheme == .dark ? 0.18 : 0.1))
56: .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
63: .font(.callout)
65: .foregroundStyle(.red)
66: .padding()
70: padding: 18,
72: backgroundColor: canvasBackgroundColor,
73: backgroundFilter: previewCanvasFilter
77: .font(.title3)
78: .foregroundStyle(.secondary)
93: HStack(spacing: 12) {
100: .frame(minWidth: 96)
107: .frame(minWidth: 112)
109: .editorChromeButtonStyle(style: .glassProminent)
112: .editorChromeButtonStyle(size: .large, shape: .modern)
113: .padding(16)
```

## ExcalidrawZ/ExcalidrawView/Toolbar/components/MathInput/MathInputSheetView+Workspace.swift

379 lines. Check platform/build reachability at the call site.

```text
37: VStack(alignment: .leading, spacing: 16) {
55: VStack(alignment: .leading, spacing: 16) {
63: VStack(alignment: .leading, spacing: 8) {
65: .font(.caption.weight(.semibold))
66: .foregroundStyle(.secondary)
67: .tracking(1.2)
69: LazyVGrid(
79: .font(.system(.body, design: .serif).weight(.medium))
80: .lineLimit(1)
82: .frame(maxWidth: .infinity, minHeight: 34)
84: .buttonStyle(MathTokenButtonStyle())
91: VStack(alignment: .leading, spacing: 8) {
93: .font(.caption.weight(.semibold))
94: .foregroundStyle(.secondary)
95: .tracking(1.2)
103: .frame(minHeight: 118, alignment: .topLeading)
104: .background {
107: .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
108: .overlay(alignment: .bottomLeading) {
111: .padding(8)
114: .overlay(alignment: .bottomTrailing) {
116: .padding(8)
122: HStack(spacing: 5) {
124: .font(.system(size: 10, weight: .semibold))
125: .foregroundStyle(hasInsufficientLatexAICredits ? .orange : .secondary)
128: .font(.caption2.weight(.medium))
129: .foregroundStyle(hasInsufficientLatexAICredits ? .orange : .secondary)
130: .lineLimit(1)
132: .padding(.horizontal, 8)
133: .frame(height: 24)
134: .background {
135: Capsule()
137: .background {
139: Capsule()
141: .editorChromeGlassEffect(.regular, in: Capsule())
143: Capsule()
147: .overlay {
148: Capsule()
149: .strokeBorder(Color.primary.opacity(0.10))
184: RoundedRectangle(cornerRadius: 12, style: .continuous)
185: .fill(Color.secondary.opacity(canvasColorScheme == .dark ? 0.12 : 0.06))
186: .overlay {
187: RoundedRectangle(cornerRadius: 12, style: .continuous)
188: .strokeBorder(Color.secondary.opacity(0.22))
195: HStack(spacing: 8) {
202: .buttonStyle(MathInlineCircleButtonStyle())
203: .help(String(localizable: .toolbarLatexMathCancelAIModeHelp))
212: HStack(spacing: 6) {
215: .controlSize(.small)
222: .buttonStyle(MathInlineGenerateButtonStyle())
224: .help(
235: .buttonStyle(MathInlineCircleButtonStyle())
237: .help(
299: VStack(alignment: .leading, spacing: 14) {
300: VStack(alignment: .leading, spacing: 4) {
302: .font(.caption.weight(.semibold))
303: .foregroundStyle(.secondary)
304: .tracking(1.2)
307: .font(.callout)
308: .foregroundStyle(.secondary)
312: HStack(spacing: 8) {
314: .foregroundStyle(.secondary)
318: .padding(.horizontal, 12)
319: .padding(.vertical, 10)
320: .background {
321: RoundedRectangle(cornerRadius: 10, style: .continuous)
322: .fill(Color.secondary.opacity(canvasColorScheme == .dark ? 0.12 : 0.06))
323: .overlay {
324: RoundedRectangle(cornerRadius: 10, style: .continuous)
325: .strokeBorder(Color.secondary.opacity(0.18))
330: LazyVGrid(
339: VStack(alignment: .leading, spacing: 6) {
341: .font(.headline)
342: .foregroundStyle(.primary)
343: .lineLimit(1)
345: .font(.subheadline)
346: .foregroundStyle(.secondary)
348: .font(.system(.caption, design: .monospaced))
349: .foregroundStyle(.secondary)
350: .lineLimit(2)
353: .frame(maxWidth: .infinity, alignment: .leading)
354: .padding(14)
356: .buttonStyle(MathTemplateCardButtonStyle())
363: VStack(alignment: .leading, spacing: 8) {
365: .font(.caption.weight(.semibold))
366: .foregroundStyle(.secondary)
367: .tracking(1.2)
```

## ExcalidrawZ/ExcalidrawView/Toolbar/components/MathInput/MathInputSheetView.swift

263 lines. Check platform/build reachability at the call site.

```text
100: VStack(spacing: 0) {
116: .padding(18)
119: .frame(width: 920, height: 680)
164: backgroundColor: functionBackgroundColor
192: .padding(20)
193: .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
198: .padding(20)
200: .frame(maxWidth: .infinity, maxHeight: .infinity)
204: VStack(alignment: .leading, spacing: 18) {
214: .padding(20)
220: VStack(alignment: .leading, spacing: 18) {
238: return VStack(alignment: .leading, spacing: 18) {
240: .frame(maxWidth: .infinity)
241: .frame(height: previewHeight)
244: .frame(maxWidth: .infinity, alignment: .leading)
```

## ExcalidrawZ/ExcalidrawView/Toolbar/components/MathInput/MathInputStyles.swift

186 lines. Check platform/build reachability at the call site.

```text
13: .padding(.horizontal, 8)
14: .background {
15: RoundedRectangle(cornerRadius: 8, style: .continuous)
16: .fill(Color.secondary.opacity(configuration.isPressed ? 0.16 : 0.08))
17: .overlay {
18: RoundedRectangle(cornerRadius: 8, style: .continuous)
19: .strokeBorder(Color.secondary.opacity(configuration.isPressed ? 0.3 : 0.16))
22: .scaleEffect(configuration.isPressed ? 0.97 : 1)
29: .background {
30: RoundedRectangle(cornerRadius: 12, style: .continuous)
31: .fill(Color.secondary.opacity(configuration.isPressed ? 0.13 : 0.07))
32: .overlay {
33: RoundedRectangle(cornerRadius: 12, style: .continuous)
34: .strokeBorder(Color.secondary.opacity(configuration.isPressed ? 0.28 : 0.13))
37: .scaleEffect(configuration.isPressed ? 0.985 : 1)
44: .font(.system(size: 13, weight: .semibold))
45: .foregroundStyle(.primary)
46: .frame(width: 30, height: 30)
47: .background {
50: .contentShape(Circle())
51: .scaleEffect(configuration.isPressed ? 0.94 : 1)
58: .font(.callout.weight(.semibold))
59: .foregroundStyle(.primary)
60: .padding(.horizontal, 12)
61: .frame(height: 30)
62: .background {
65: .contentShape(Capsule())
66: .scaleEffect(configuration.isPressed ? 0.97 : 1)
74: Circle()
76: .background {
78: Circle()
80: .editorChromeGlassEffect(.regular.interactive(), in: Circle())
82: Circle()
86: .overlay {
87: Circle()
88: .strokeBorder(Color.primary.opacity(isPressed ? 0.24 : 0.10))
97: Capsule()
99: .background {
101: Capsule()
103: .editorChromeGlassEffect(.regular.interactive(), in: Capsule())
105: Capsule()
109: .overlay {
110: Capsule()
111: .strokeBorder(Color.primary.opacity(isPressed ? 0.24 : 0.10))
117: var cornerRadius: CGFloat
121: TimelineView(.animation) { timeline in
125: let gradient = AngularGradient(
133: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
135: .editorChromeGlassEffect(.regular, in: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
137: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
141: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
143: .opacity(colorScheme == .dark ? 0.08 : 0.055)
145: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
146: .strokeBorder(gradient, lineWidth: 1.2)
147: .opacity(palette.borderOpacity)
149: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
150: .stroke(gradient, lineWidth: 10)
151: .blur(radius: 9)
152: .opacity(palette.innerGlowBase * 0.5)
```

## ExcalidrawZ/ExcalidrawView/Toolbar/components/MathInput/MathInputTypes.swift

161 lines. Check platform/build reachability at the call site.

```text
124: var backgroundColor: String?
152: var minimumItemWidth: CGFloat = 52
```

## ExcalidrawZ/ExcalidrawView/Toolbar/components/MermaidInputSheetView.swift

500 lines. Check platform/build reachability at the call site.

```text
42: .presentationSizing(.page)
43: .presentationDragIndicator(.hidden)
95: VStack(spacing: 16) {
99: .padding()
125: .font(.headline)
126: .lineLimit(1)
127: .padding(.horizontal, 132)
137: .editorChromeButtonStyle(style: .glass, size: .extraLarge, shape: .circle)
138: .keyboardShortcut(.cancelAction)
146: HStack(spacing: 6) {
148: .controlSize(.small)
155: .lineLimit(1)
156: .editorChromeButtonStyle(style: .glassProminent, size: .extraLarge, shape: .capsule)
157: .keyboardShortcut(.defaultAction)
161: .frame(minHeight: 48)
174: VStack(alignment: .leading, spacing: 14) {
175: HStack(spacing: 10) {
194: .frame(minHeight: contentHeight)
199: HStack(alignment: .top, spacing: 16) {
200: VStack(alignment: .leading, spacing: 8) {
204: .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
206: VStack(alignment: .leading, spacing: 8) {
208: .font(.headline)
211: .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
214: .frame(minWidth: 820, idealWidth: 900, minHeight: 460, idealHeight: 520)
216: .frame(maxWidth: .infinity)
217: .frame(minHeight: 460, idealHeight: 520)
241: .font(.headline)
244: private var contentHeight: CGFloat {
281: .background {
282: RoundedRectangle(cornerRadius: 14, style: .continuous)
283: .fill(Color.secondary.opacity(0.08))
285: .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
286: .overlay(alignment: .bottomTrailing) {
293: .editorChromeButtonStyle(style: .glassProminent, size: .extraLarge, shape: .circle)
294: .padding(12)
300: RoundedRectangle(cornerRadius: 16, style: .continuous)
306: .font(.callout)
307: .foregroundStyle(.secondary)
309: .padding()
312: .controlSize(.regular)
317: .aspectRatio(contentMode: .fit)
318: .padding(12)
321: .font(.callout)
322: .foregroundStyle(.secondary)
324: .padding()
328: .font(.callout)
329: .foregroundStyle(.red)
331: .padding()
334: .frame(maxWidth: .infinity, maxHeight: .infinity)
335: .overlay {
336: RoundedRectangle(cornerRadius: 16, style: .continuous)
337: .stroke(Color.secondary.opacity(0.14), lineWidth: 1)
```

## ExcalidrawZ/ExcalidrawView/Toolbar/components/PDFInsertSheet.swift

707 lines. Check platform/build reachability at the call site.

```text
106: HStack(spacing: 0) {
108: VStack(alignment: .leading, spacing: 20) {
110: VStack(alignment: .leading, spacing: 8) {
112: .font(.headline)
117: .foregroundStyle(.red)
119: .lineLimit(1)
126: .editorChromeButtonStyle(style: .glass, shape: .modern)
128: .padding(12)
129: .background(Color.gray.opacity(0.1))
130: .cornerRadius(999)
140: .frame(maxWidth: .infinity)
142: .editorChromeButtonStyle(style: .glassProminent, size: .regular, shape: .capsule)
143: .controlSize(.large)
150: VStack(alignment: .leading, spacing: 8) {
152: .font(.headline)
159: VStack(alignment: .leading, spacing: 2) {
161: .font(.body)
162: .foregroundStyle(.primary)
164: .font(.caption)
165: .foregroundStyle(.secondary)
170: .foregroundStyle(selectedMode == mode ? AnyShapeStyle(Color.accentColor) : AnyShapeStyle(HierarchicalShapeStyle.secondary))
172: .contentShape(Rectangle())
173: .padding(.vertical, 12)
174: .padding(.horizontal, 20)
175: .background {
176: Capsule()
177: .fill(selectedMode == mode ? Color.accentColor.opacity(0.1) : Color.clear)
179: .overlay(
180: Capsule()
181: .stroke(selectedMode == mode ? Color.accentColor : Color.gray.opacity(0.3), lineWidth: 1)
184: .buttonStyle(.plain)
192: VStack(alignment: .leading, spacing: 12) {
194: .font(.headline)
207: .editorChromeButtonStyle(style: .glass, shape: .capsule)
217: .frame(width: 48)
230: .font(.caption)
231: .foregroundColor(.red)
232: .padding(8)
233: .background(Color.red.opacity(0.1))
234: .cornerRadius(6)
239: .frame(width: 300)
240: .padding()
247: .font(.headline)
248: .frame(maxWidth: .infinity, alignment: .leading)
249: .padding(.horizontal)
250: .padding(.top)
253: VStack(spacing: 16) {
256: .font(.system(size: 64))
257: .foregroundColor(.gray)
260: .font(.system(size: 64))
261: .foregroundColor(.gray)
264: .foregroundColor(.secondary)
266: .frame(maxWidth: .infinity, maxHeight: .infinity)
271: .frame(maxWidth: .infinity, maxHeight: .infinity)
272: .background(Color.gray.opacity(0.05))
277: .frame(width: 800, height: 600)
315: .foregroundStyle(.secondary)
333: .font(.caption)
334: .foregroundColor(.red)
338: .formStyle(.grouped)
343: .presentationDetents([.large])
344: .presentationDragIndicator(.visible)
358: .editorChromeButtonStyle(style: .glass, shape: .modern)
366: .editorChromeButtonStyle(style: .glassProminent, shape: .modern)
386: .editorChromeButtonStyle(style: .glassProminent)
394: HStack(spacing: 12) {
396: .foregroundStyle(.red)
398: .lineLimit(1)
420: HStack(alignment: .top, spacing: 12) {
421: VStack(alignment: .leading, spacing: 3) {
423: .foregroundStyle(.primary)
425: .font(.caption)
426: .foregroundStyle(.secondary)
433: .foregroundStyle(selectedMode == mode ? AnyShapeStyle(Color.accentColor) : AnyShapeStyle(HierarchicalShapeStyle.secondary))
435: .contentShape(Rectangle())
437: .buttonStyle(.plain)
443: VStack(spacing: 12) {
446: .font(.system(size: 44))
447: .foregroundColor(.gray)
450: .font(.system(size: 44))
451: .foregroundColor(.gray)
454: .font(.subheadline)
455: .foregroundColor(.secondary)
458: .frame(maxWidth: .infinity, minHeight: 220)
477: .foregroundColor(.secondary)
484: VStack(spacing: 16) {
488: .aspectRatio(
492: .frame(maxWidth: .infinity)
493: .shadow(radius: 2)
499: .font(.caption)
500: .foregroundColor(.secondary)
503: .padding(.vertical, 8)
504: .frame(maxWidth: .infinity)
510: repeating: GridItem(.flexible(), spacing: 12),
514: LazyVGrid(columns: columns, spacing: 12) {
519: .padding(.vertical, 8)
520: .frame(maxWidth: .infinity)
543: VStack(spacing: 20) {
547: .aspectRatio(
551: .frame(maxWidth: 400)
552: .shadow(radius: 4)
556: .padding()
561: .font(.caption)
562: .foregroundColor(.secondary)
563: .padding(.bottom, 8)
569: .foregroundColor(.secondary)
582: return Array(repeating: GridItem(.flexible(), spacing: 16), count: itemsPerLine)
584: return [GridItem(.adaptive(minimum: 150, maximum: 200), spacing: 16)]
588: LazyVGrid(columns: columns, spacing: 16) {
593: .padding()
600: return Array(repeating: GridItem(.flexible(), spacing: 16), count: itemsPerLine)
602: return [GridItem(.adaptive(minimum: 150, maximum: 200), spacing: 16)]
611: .padding()
613: .frame(maxHeight: .infinity)
618: .foregroundColor(.secondary)
625: VStack(spacing: 4) {
627: .aspectRatio(page.bounds(for: .mediaBox).size.width / page.bounds(for: .mediaBox).size.height, contentMode: .fit)
629: .shadow(radius: 2)
632: .font(.caption)
633: .foregroundColor(.secondary)
691: .aspectRatio(contentMode: .fit)
695: .aspectRatio(contentMode: .fit)
```

## ExcalidrawZ/ExcalidrawView/Toolbar/components/PDFInsertSheetViewModifier.swift

85 lines. Check platform/build reachability at the call site.

```text
71: width: 600,
72: height: 800
```

## ExcalidrawZ/ExcalidrawView/components/DrawingSettingsPanel/ArrowheadPicker.swift

271 lines. Check platform/build reachability at the call site.

```text
20: .stroke(.primary, lineWidth: lineWidth)
21: .scaleEffect(x: -1)
24: .stroke(.primary, lineWidth: lineWidth)
26: Circle()
27: .frame(width: 6, height: 6)
29: ArrowheadCircle()
31: ArrowheadCircle()
32: .stroke(.primary, lineWidth: lineWidth)
34: ArrowheadCircle()
35: .stroke(.primary, lineWidth: lineWidth)
40: .stroke(.primary, lineWidth: lineWidth)
43: .stroke(.primary, lineWidth: lineWidth)
48: .stroke(.primary, lineWidth: lineWidth)
51: .stroke(.primary, lineWidth: lineWidth)
54: .stroke(.primary, lineWidth: lineWidth)
57: .stroke(.primary, lineWidth: lineWidth)
60: .stroke(.primary, lineWidth: lineWidth)
63: .stroke(.primary, lineWidth: lineWidth)
66: .stroke(.primary, lineWidth: lineWidth)
69: .stroke(.primary, lineWidth: lineWidth)
72: .stroke(.primary, lineWidth: lineWidth)
75: .stroke(.primary, lineWidth: lineWidth)
78: .stroke(.primary, lineWidth: lineWidth)
83: .stroke(.primary, lineWidth: lineWidth)
84: .opacity(0.5)
87: .stroke(.primary, lineWidth: lineWidth)
97: .padding(.horizontal, 4)
98: .padding(.vertical, 4)
99: .frame(width: 28, height: 28)
100: .background(Color.secondary.opacity(0.1))
101: .clipShape(RoundedRectangle(cornerRadius: 6))
115: .overlay(
116: RoundedRectangle(cornerRadius: 6)
117: .strokeBorder(isSelected ? Color.accentColor : Color.clear, lineWidth: 1)
120: .buttonStyle(.plain)
161: .scaleEffect(x: direction == .start ? 1 : -1)
162: .overlay(
163: RoundedRectangle(cornerRadius: 6)
164: .strokeBorder(
165: showFullPicker ? Color.accentColor : Color.secondary.opacity(0.3),
170: .buttonStyle(.plain)
196: VStack(alignment: .leading, spacing: 12) {
198: .font(.headline)
199: .padding(.horizontal)
201: LazyVGrid(columns: [
202: GridItem(.adaptive(minimum: 28, maximum: 28), spacing: 4)
212: .scaleEffect(x: reverse ? -1 : 1)
215: .padding(.horizontal)
217: .padding(.vertical)
218: .frame(width: 220)
242: VStack(spacing: 24) {
243: VStack(alignment: .leading, spacing: 8) {
245: .font(.subheadline)
246: .fontWeight(.medium)
254: VStack(alignment: .leading, spacing: 8) {
256: .font(.subheadline)
257: .fontWeight(.medium)
265: .padding()
266: .frame(width: 260)
```

## ExcalidrawZ/ExcalidrawView/components/DrawingSettingsPanel/ArrowheadsIcon/ArrowheadArrow.swift

31 lines. Check platform/build reachability at the call site.

```text
30: .stroke(.primary)
```

## ExcalidrawZ/ExcalidrawView/components/DrawingSettingsPanel/ArrowheadsIcon/ArrowheadCardinalityZeroOrMany.swift

38 lines. Check platform/build reachability at the call site.

```text
25: width: radius * 2,
26: height: radius * 2
```

## ExcalidrawZ/ExcalidrawView/components/DrawingSettingsPanel/ArrowheadsIcon/ArrowheadCardinalityZeroOrOne.swift

35 lines. Check platform/build reachability at the call site.

```text
28: width: radius * 2,
29: height: radius * 2
```

## ExcalidrawZ/ExcalidrawView/components/DrawingSettingsPanel/ArrowheadsIcon/ArrowheadCircle.swift

42 lines. Check platform/build reachability at the call site.

```text
30: width: radius * 2,
31: height: radius * 2
39: ArrowheadCircle()
40: .stroke(.primary, lineWidth: 2)
41: .frame(width: 40, height: 40)
```

## ExcalidrawZ/ExcalidrawView/components/DrawingSettingsPanel/ArrowheadsIcon/ArrowheadNone.swift

29 lines. Check platform/build reachability at the call site.

```text
27: .stroke(.primary, lineWidth: 2)
28: .frame(width: 20, height: 20)
```

## ExcalidrawZ/ExcalidrawView/components/DrawingSettingsPanel/ArrowheadsIcon/ArrowheadTriangle.swift

29 lines. Check platform/build reachability at the call site.

```text
27: .stroke(.primary)
```

## ExcalidrawZ/ExcalidrawView/components/DrawingSettingsPanel/ArrowheadsIcon/ArrowheadTriangleOutline.swift

30 lines. Check platform/build reachability at the call site.

```text
27: .stroke(.primary, lineWidth: 2)
28: .frame(width: 20, height: 20)
```

## ExcalidrawZ/ExcalidrawView/components/DrawingSettingsPanel/ColorPicker/ColorButton.swift

104 lines. Check platform/build reachability at the call site.

```text
15: let color: String
21: color: String,
43: .overlay(
44: RoundedRectangle(cornerRadius: 6)
45: .strokeBorder(
46: isSelected ? Color.accentColor : Color.secondary.opacity(0.3),
51: .buttonStyle(.plain)
60: .frame(width: size, height: size)
61: .clipShape(RoundedRectangle(cornerRadius: 6))
64: RoundedRectangle(cornerRadius: 6)
66: .frame(width: size, height: size)
71: RoundedRectangle(cornerRadius: 6)
73: .frame(width: size, height: size)
89: VStack(spacing: 16) {
90: HStack(spacing: 8) {
91: ColorButton(color: "#1e1e1e", isSelected: true) {}
92: ColorButton(color: "#e03131", isSelected: false) {}
93: ColorButton(color: "#2f9e44", isSelected: false) {}
94: ColorButton(color: "transparent", isSelected: false) {}
97: HStack(spacing: 8) {
98: ColorButton(color: "#ffc9c9", isSelected: false) {}
99: ColorButton(color: "#b2f2bb", isSelected: true) {}
100: ColorButton(color: "#a5d8ff", isSelected: false) {}
103: .padding()
```

## ExcalidrawZ/ExcalidrawView/components/DrawingSettingsPanel/ColorPicker/ColorButtonGroup.swift

241 lines. Check platform/build reachability at the call site.

```text
21: HStack(spacing: 8) {
25: color: color,
34: .frame(height: 28)
71: .frame(width: 28, height: 28)
72: .clipShape(RoundedRectangle(cornerRadius: 6))
73: .overlay(
74: RoundedRectangle(cornerRadius: 6)
75: .strokeBorder(
76: showFullPicker ? Color.accentColor : Color.secondary.opacity(0.3),
81: .buttonStyle(.plain)
108: VStack(spacing: 8) {
111: HStack(spacing: 8) {
115: .font(.system(.body, design: .monospaced))
116: .frame(height: 28)
117: .padding(.horizontal, 8)
119: .background(Color(nsColor: .controlBackgroundColor))
121: .background(Color(.systemGray6))
123: .cornerRadius(6)
124: .overlay(
125: RoundedRectangle(cornerRadius: 6)
126: .strokeBorder(Color.secondary.opacity(0.3), lineWidth: 1)
135: .frame(width: 28, height: 28)
217: VStack(spacing: 24) {
218: VStack(alignment: .leading, spacing: 8) {
220: .font(.subheadline)
221: .fontWeight(.medium)
229: VStack(alignment: .leading, spacing: 8) {
231: .font(.subheadline)
232: .fontWeight(.medium)
240: .padding()
```

## ExcalidrawZ/ExcalidrawView/components/DrawingSettingsPanel/ColorPicker/ColorPalette.swift

88 lines. Check platform/build reachability at the call site.

```text
26: static let backgroundQuickPicks: [String] = [
83: static func getShades(for color: String) -> [String]? {
```

## ExcalidrawZ/ExcalidrawView/components/DrawingSettingsPanel/ColorPicker/FullColorPicker.swift

141 lines. Check platform/build reachability at the call site.

```text
31: VStack(alignment: .leading, spacing: 16) {
33: VStack(alignment: .leading, spacing: 8) {
35: .font(.caption)
36: .fontWeight(.medium)
37: .foregroundStyle(.secondary)
44: VStack(alignment: .leading, spacing: 8) {
46: .font(.caption)
47: .fontWeight(.medium)
48: .foregroundStyle(.secondary)
56: .padding(12)
57: .frame(width: 220)
70: let columns = Array(repeating: GridItem(.fixed(30), spacing: 6), count: 5)
72: LazyVGrid(columns: columns, spacing: 6) {
78: color: baseColor,
93: let columns = Array(repeating: GridItem(.fixed(30), spacing: 6), count: 5)
95: LazyVGrid(columns: columns, spacing: 6) {
100: color: shade,
119: VStack(spacing: 20) {
125: .font(.caption)
129: .frame(width: 100, height: 100)
131: .padding()
```

## ExcalidrawZ/ExcalidrawView/components/DrawingSettingsPanel/DrawingSettingsIcons.swift

691 lines. Check platform/build reachability at the call site.

```text
15: static let viewBox = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
47: .stroke(Color(white: 0), style: StrokeStyle(lineWidth: 1.25))
84: .stroke(Color(white: 0), style: StrokeStyle(lineWidth: 1.25))
111: .stroke(Color(white: 0), style: StrokeStyle(lineWidth: 1.25, lineCap: .round, lineJoin: .round))
127: .frame(width: Self.viewBox.width, height: Self.viewBox.height,
129: .scaleEffect(
133: .frame(width: proxy.size.width, height: proxy.size.height)
190: static let viewBox = CGRect(x: 0, y: 0, width: 20, height: 20)
198: .stroke(.primary, style: StrokeStyle(lineWidth: strokeWidths[0], lineCap: .round, lineJoin: .round))
200: .stroke(.primary, style: StrokeStyle(lineWidth: strokeWidths[1], lineCap: .round, lineJoin: .round))
202: .stroke(.primary, style: StrokeStyle(lineWidth: strokeWidths[2], lineCap: .round, lineJoin: .round))
204: .stroke(.primary, style: StrokeStyle(lineWidth: strokeWidths[3], lineCap: .round, lineJoin: .round))
206: .frame(width: Self.viewBox.width, height: Self.viewBox.height, alignment: .topLeading)
207: .scaleEffect(
211: .frame(width: proxy.size.width, height: proxy.size.height)
259: static let viewBox = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
283: .stroke(.primary, style: StrokeStyle(lineWidth: 1.25))
290: .frame(width: Self.viewBox.width, height: Self.viewBox.height,
292: .scaleEffect(x: proxy.size.width  / Self.viewBox.width,
294: .frame(width: proxy.size.width, height: proxy.size.height)
300: static let viewBox = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
334: .stroke(.primary, style: StrokeStyle(lineWidth: 1.25))
341: .frame(width: Self.viewBox.width, height: Self.viewBox.height,
343: .scaleEffect(x: proxy.size.width  / Self.viewBox.width,
345: .frame(width: proxy.size.width, height: proxy.size.height)
352: static let viewBox = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
386: .stroke(.primary, style: StrokeStyle(lineWidth: 1.25))
393: .frame(width: Self.viewBox.width, height: Self.viewBox.height,
395: .scaleEffect(x: proxy.size.width  / Self.viewBox.width,
397: .frame(width: proxy.size.width, height: proxy.size.height)
407: static let viewBox = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
432: .stroke(Color(white: 0), style: StrokeStyle(lineWidth: 1.5))
450: .stroke(Color(white: 0), style: StrokeStyle(lineWidth: 1.5))
468: .stroke(Color(white: 0), style: StrokeStyle(lineWidth: 1.5))
486: .stroke(Color(white: 0), style: StrokeStyle(lineWidth: 1.5))
504: .stroke(Color(white: 0), style: StrokeStyle(lineWidth: 1.5))
522: .stroke(Color(white: 0), style: StrokeStyle(lineWidth: 1.5))
540: .stroke(Color(white: 0), style: StrokeStyle(lineWidth: 1.5))
558: .stroke(Color(white: 0), style: StrokeStyle(lineWidth: 1.5))
576: .stroke(Color(white: 0), style: StrokeStyle(lineWidth: 1.5))
594: .stroke(Color(white: 0), style: StrokeStyle(lineWidth: 1.5))
612: .stroke(Color(white: 0), style: StrokeStyle(lineWidth: 1.5))
630: .stroke(Color(white: 0), style: StrokeStyle(lineWidth: 1.5))
659: .frame(width: Self.viewBox.width, height: Self.viewBox.height,
661: .scaleEffect(x: proxy.size.width  / Self.viewBox.width,
663: .frame(width: proxy.size.width, height: proxy.size.height)
```

## ExcalidrawZ/ExcalidrawView/components/DrawingSettingsPanel/DrawingSettingsPanel.swift

381 lines. Check platform/build reachability at the call site.

```text
19: VStack(alignment: .leading, spacing: 20) {
138: RoundedRectangle(cornerRadius: 6)
140: .padding(1)
141: .frame(width: 20, height: 20)
288: HStack(spacing: 8) {
325: opacity: Binding(
340: .animation(
355: VStack(alignment: .leading, spacing: 8) {
357: .font(.subheadline)
358: .fontWeight(.medium)
374: .padding(12)
375: .frame(width: 260)
```

## ExcalidrawZ/ExcalidrawView/components/DrawingSettingsPanel/OpacitySlider.swift

84 lines. Check platform/build reachability at the call site.

```text
12: @Binding var opacity: Double
18: opacity: Binding<Double>,
30: VStack(spacing: 4) {
43: .font(.caption)
44: .foregroundStyle(.secondary)
47: .font(.caption)
48: .foregroundStyle(.secondary)
58: @State private var opacity: Double = 75
61: VStack(spacing: 24) {
62: VStack(alignment: .leading, spacing: 8) {
64: .font(.subheadline)
65: .fontWeight(.medium)
67: OpacitySlider(opacity: $opacity)
71: .fill(Color.blue.opacity(opacity / 100))
72: .frame(height: 100)
73: .overlay(
75: .foregroundColor(.white)
76: .font(.title)
79: .padding()
```

## ExcalidrawZ/ExcalidrawView/components/DrawingSettingsPanel/OptionButton.swift

95 lines. Check platform/build reachability at the call site.

```text
30: .font(.system(size: 14))
31: .frame(width: 28, height: 28)
32: .background(isSelected ? Color.accentColor.opacity(0.2) : Color.secondary.opacity(0.1))
33: .foregroundStyle(Color.primary)
34: .clipShape(RoundedRectangle(cornerRadius: 6))
35: .overlay(
36: RoundedRectangle(cornerRadius: 6)
37: .strokeBorder(isSelected ? Color.accentColor : Color.clear, lineWidth: 1)
40: .buttonStyle(.plain)
66: HStack(spacing: 8) {
89: .padding()
```

## ExcalidrawZ/ExcalidrawView/components/DrawingSettingsPanel/StrokeWidthPicker.swift

84 lines. Check platform/build reachability at the call site.

```text
12: let width: Double
20: Capsule()
22: .frame(width: 20, height: CGFloat(width * 1))
25: .frame(width: 28, height: 28)
26: .background(isSelected ? Color.accentColor.opacity(0.2) : Color.secondary.opacity(0.1))
27: .clipShape(RoundedRectangle(cornerRadius: 6))
28: .overlay(
29: RoundedRectangle(cornerRadius: 6)
30: .strokeBorder(isSelected ? Color.accentColor : Color.clear, lineWidth: 1)
33: .buttonStyle(.plain)
44: HStack(spacing: 8) {
47: width: width,
60: VStack(spacing: 24) {
61: VStack(alignment: .leading, spacing: 8) {
63: .font(.subheadline)
64: .fontWeight(.medium)
72: VStack(alignment: .leading, spacing: 8) {
74: .font(.subheadline)
75: .fontWeight(.medium)
83: .padding()
```

## ExcalidrawZ/ExcalidrawView/components/DrawingSettingsPanel/UserDrawingSettings.swift

348 lines. Check platform/build reachability at the call site.

```text
21: var currentItemFontSize: Double?
28: var strokeWidth: Double? {
212: static let strokeWidth: Double = strokeWidthKey.strokeWidth
215: static let backgroundColor: String = "transparent"
219: static let opacity: Double = 100
221: static let fontSize: Double = 20
240: s.currentItemOpacity = Defaults.opacity
314: var strokeWidth: Double {
```

## ExcalidrawZ/ExcalidrawView/components/ElementPropertiesPanel/ElementProperties.swift

190 lines. Check platform/build reachability at the call site.

```text
12: var backgroundColor: String?
18: var opacity: Double?
20: var fontSize: Double?
27: var strokeWidth: Double? {
40: var strokeWidth: Double {
76: static let strokeWidth: Double = 2
81: static let opacity: Double = 100
83: static let fontSize: Double = 20
114: if opacity != previous.opacity {
115: result.opacity = opacity
```

## ExcalidrawZ/ExcalidrawView/components/ElementPropertiesPanel/ElementPropertiesPanel.swift

927 lines. Check platform/build reachability at the call site.

```text
27: HStack(spacing: 4) {
33: .frame(width: 20, height: 20)
35: .help(control.title)
36: .editorChromeButtonStyle(
46: .padding(12)
50: .padding(8)
51: .background {
54: .shadow(color: .black.opacity(0.16), radius: 16, y: 7)
76: opacity: properties.opacity
77: ?? ElementProperties.Defaults.opacity
81: properties.opacity = opacity
85: case .backgroundColor:
90: opacity: properties.opacity
91: ?? ElementProperties.Defaults.opacity
95: properties.opacity = opacity
123: Capsule()
125: .frame(width: 22, height: max(1, width))
232: .font(.caption.monospacedDigit())
245: case .opacity:
246: HStack(spacing: 10) {
248: .foregroundStyle(.secondary)
251: get: { properties.opacity ?? 100 },
252: set: { properties.opacity = Double(Int($0)) }
261: Text("\(Int(properties.opacity ?? 100))")
262: .font(.caption.monospacedDigit())
263: .foregroundStyle(.secondary)
264: .frame(width: 28, alignment: .trailing)
266: .frame(width: 220)
273: opacity: Double,
279: opacity: opacity,
290: HStack(spacing: 5) {
296: .frame(width: 28, height: 28)
298: .editorChromeButtonStyle(
317: case .backgroundColor:
330: Capsule()
332: .frame(
333: width: 20,
334: height: properties.strokeWidth
367: .scaleEffect(x: -1)
379: case .opacity:
395: .opacity,
409: .opacity,
417: .opacity,
424: .opacity,
435: .opacity,
449: .opacity,
456: .opacity,
466: .opacity,
469: [.opacity]
498: Circle()
500: .frame(width: size, height: size)
501: .overlay {
504: .font(.system(size: size * 0.72, weight: .medium))
505: .foregroundStyle(.red)
508: .overlay {
509: Circle()
510: .strokeBorder(
513: : Color.primary.opacity(0.18),
526: .frame(width: 20, height: 20)
532: .frame(width: 20, height: 20)
535: RoundedRectangle(cornerRadius: 5)
537: .frame(width: 18, height: 18)
562: .frame(width: 20, height: 20)
630: return LazyVGrid(
632: repeating: GridItem(.fixed(32), spacing: 5),
648: .scaleEffect(x: direction == .end ? -1 : 1)
649: .frame(width: 20, height: 20)
651: .editorChromeButtonStyle(
660: .frame(width: 180)
666: Capsule()
668: .editorChromeGlassEffect(.regular, in: Capsule())
670: Capsule().fill(editorChromeSurface())
697: case .backgroundColor:
723: case .opacity:
733: let opacity: Double
742: opacity: Double,
747: self.opacity = opacity
752: opacity: opacity
758: HStack(spacing: 7) {
764: color: color,
768: .padding(2)
770: .buttonStyle(.plain)
774: .frame(height: 25)
779: Circle()
781: AngularGradient(
794: .frame(width: 25, height: 25)
795: .overlay {
796: Circle()
797: .strokeBorder(.primary.opacity(0.18))
799: .padding(2)
801: .buttonStyle(.plain)
813: Self.opacity(from: color) * 100
822: .padding(12)
826: value: SelectionValue(color: selectedColor, opacity: opacity)
830: opacity: value.opacity
837: opacity: Double
840: return color.opacity(min(max(opacity / 100, 0), 1))
843: private static func opacity(from color: Color) -> Double {
852: let color: String
853: let opacity: Double
858: let color: String
863: Circle()
865: .frame(width: size, height: size)
866: .overlay {
869: .font(.system(size: size * 0.72, weight: .medium))
870: .foregroundStyle(.red)
873: .overlay {
874: Circle()
875: .strokeBorder(
878: : Color.primary.opacity(0.18),
904: context.stroke(
914: .frame(width: 24, height: 16)
```

## ExcalidrawZ/ExcalidrawView/components/ExcalidrawFileCover.swift

431 lines. Check platform/build reachability at the call site.

```text
283: .fill(Color.secondary.opacity(colorScheme == .dark ? 0.08 : 0.06))
373: let targetSize = CGSize(width: max(1, width * scale), height: max(1, height * scale))
377: width: Int(targetSize.width),
378: height: Int(targetSize.height),
414: let targetSize = CGSize(width: max(1, width * scale), height: max(1, height * scale))
418: width: Int(targetSize.width),
419: height: Int(targetSize.height),
```

## ExcalidrawZ/ExcalidrawView/components/FileCoverCacheCoordinator.swift

1013 lines. Check platform/build reachability at the call site.

```text
98: var thumbnailMaxPixelSize: CGFloat {
216: priority: Priority = .background,
288: priority: Priority = .background,
333: priority: Priority = .background,
438: priority: .background
998: width: CGFloat(cgThumb.width),
999: height: CGFloat(cgThumb.height)
```

## ExcalidrawZ/ExcalidrawZApp.swift

461 lines. Check platform/build reachability at the call site.

```text
212: Task.detached(priority: .background) {
266: Color.clear.frame(width: 1, height: 1)
304: .defaultSizeIfAvailable(CGSize(width: 1200, height: 700))
315: .keyboardShortcut("N", modifiers: .command)
325: .keyboardShortcut("N", modifiers: [.command, .option, .shift])
341: .keyboardShortcut("p", modifiers: .command)
380: .keyboardShortcut("0", modifiers: [.command])
387: .keyboardShortcut("0", modifiers: [.command, .option])
394: .keyboardShortcut("S", modifiers: [.command, .shift])
397: CommandGroup(after: .help) {
```

## ExcalidrawZ/Extensions/AppWindowBinding.swift

46 lines. Check platform/build reachability at the call site.

```text
36: background(AppWindowBinding(window: window).frame(width: 0, height: 0))
```

## ExcalidrawZ/Extensions/NSImage+Extension.swift

134 lines. Check platform/build reachability at the call site.

```text
13: var height: CGFloat {
18: var width: CGFloat {
72: let newSize = NSSize(width: self.size.width * scaleFactor, height: self.size.height * scaleFactor)
```

## ExcalidrawZ/Extensions/ScrollView+Extension.swift

19 lines. Check platform/build reachability at the call site.

```text
14: self.scrollClipDisabled(isDisabled)
```

## ExcalidrawZ/Extensions/View+Extension.swift

38 lines. Check platform/build reachability at the call site.

```text
23: .padding(.horizontal, {
30: .padding(.vertical, {
```

## ExcalidrawZ/Models/ExcalidrawElement.swift

259 lines. Check platform/build reachability at the call site.

```text
48: case .frame, .magicFrame:
185: var width: Double {
210: var height: Double {
```

## ExcalidrawZ/Models/ExcalidrawElementBase.swift

188 lines. Check platform/build reachability at the call site.

```text
87: var backgroundColor: String { get }
89: var strokeWidth: Double { get }
93: var opacity: Double { get }
94: var width: Double { get }
95: var height: Double { get }
```

## ExcalidrawZ/Models/ExcalidrawElements/ExcalidrawFrameLikeElement.swift

128 lines. Check platform/build reachability at the call site.

```text
17: var backgroundColor: String
19: var strokeWidth: Double
23: var opacity: Double
24: var width: Double
25: var height: Double
90: try container.encode(opacity, forKey: .opacity)
```

## ExcalidrawZ/Models/ExcalidrawElements/ExcalidrawFreeDrawElement.swift

348 lines. Check platform/build reachability at the call site.

```text
22: var backgroundColor: String
24: var strokeWidth: Double
28: var opacity: Double
29: var width: Double
30: var height: Double
97: self.opacity = try container.decode(Double.self, forKey: .opacity)
137: try container.encode(opacity, forKey: .opacity)
191: lhs.opacity == rhs.opacity &&
218: var backgroundColor: String
220: var strokeWidth: Double
224: var opacity: Double
225: var width: Double
226: var height: Double
288: try container.encode(opacity, forKey: .opacity)
334: lhs.opacity == rhs.opacity &&
```

## ExcalidrawZ/Models/ExcalidrawElements/ExcalidrawGenricElement.swift

159 lines. Check platform/build reachability at the call site.

```text
22: var backgroundColor: String
24: var strokeWidth: Double
28: var opacity: Double
29: var width: Double
30: var height: Double
96: try container.encode(opacity, forKey: .opacity)
143: lhs.opacity == rhs.opacity &&
```

## ExcalidrawZ/Models/ExcalidrawElements/ExcalidrawIframeLikeElement.swift

178 lines. Check platform/build reachability at the call site.

```text
17: var backgroundColor: String
19: var strokeWidth: Double
23: var opacity: Double
24: var width: Double
25: var height: Double
145: try container.encode(opacity, forKey: .opacity)
```

## ExcalidrawZ/Models/ExcalidrawElements/ExcalidrawImageElement.swift

191 lines. Check platform/build reachability at the call site.

```text
16: var width: Double
17: var height: Double
18: var naturalWidth: Double
19: var naturalHeight: Double
36: var backgroundColor: String
38: var strokeWidth: Double
42: var opacity: Double
43: var width: Double
44: var height: Double
115: try container.encode(opacity, forKey: .opacity)
173: lhs.opacity == rhs.opacity &&
```

## ExcalidrawZ/Models/ExcalidrawElements/ExcalidrawLinearElement.swift

606 lines. Check platform/build reachability at the call site.

```text
48: var gap: Double?
180: var backgroundColor: String
182: var strokeWidth: Double
186: var opacity: Double
187: var width: Double
188: var height: Double
263: try container.encode(opacity, forKey: .opacity)
332: lhs.opacity == rhs.opacity &&
359: var backgroundColor: String
361: var strokeWidth: Double
365: var opacity: Double
366: var width: Double
367: var height: Double
448: self.opacity = try container.decode(Double.self, forKey: .opacity)
493: try container.encode(opacity, forKey: .opacity)
582: lhs.opacity == rhs.opacity &&
```

## ExcalidrawZ/Models/ExcalidrawElements/ExcalidrawPdfElement.swift

178 lines. Check platform/build reachability at the call site.

```text
28: var backgroundColor: String
30: var strokeWidth: Double
34: var opacity: Double
35: var width: Double
36: var height: Double
107: try container.encode(opacity, forKey: .opacity)
161: lhs.opacity == rhs.opacity &&
```

## ExcalidrawZ/Models/ExcalidrawElements/ExcalidrawTextElement.swift

279 lines. Check platform/build reachability at the call site.

```text
44: var fontSize: Double { get }
55: var lineHeight: Double? { get }
68: var backgroundColor: String
70: var strokeWidth: Double
74: var opacity: Double
75: var width: Double
76: var height: Double
91: var fontSize: Double
99: var lineHeight: Double?
153: lhs.opacity == rhs.opacity &&
189: self.opacity = try container.decode(Double.self, forKey: .opacity)
233: try container.encode(opacity, forKey: .opacity)
```

## ExcalidrawZ/Models/ExcalidrawFile/ExcalidrawFile.swift

281 lines. Check platform/build reachability at the call site.

```text
35: var gridSize: Int?
```

## ExcalidrawZ/Persistence/CloudStorage/Box/BoxCloudStorageSession.swift

210 lines. Check platform/build reachability at the call site.

```text
138: since cursor: CloudStorageChangeCursor?
```

## ExcalidrawZ/Persistence/CloudStorage/Box/BoxOAuthAuthenticator.swift

325 lines. Check platform/build reachability at the call site.

```text
190: session.presentationContextProvider = self
```

## ExcalidrawZ/Persistence/CloudStorage/CloudStorageDocumentStore.swift

3283 lines. Check platform/build reachability at the call site.

```text
34: var cursor: CloudStorageChangeCursor?
49: cursor: CloudStorageChangeCursor?,
668: priority: CloudStorageContentSynchronizationPriority = .background,
706: priority: CloudStorageContentSynchronizationPriority = .background
744: if $1 == .background { $0 += 1 }
769: : .background
2279: cursor: nil,
3131: cursor: nil,
```

## ExcalidrawZ/Persistence/CloudStorage/CloudStorageFolderPicker.swift

293 lines. Check platform/build reachability at the call site.

```text
44: VStack(spacing: 0) {
52: .padding(16)
61: .frame(minWidth: 560, idealWidth: 680, minHeight: 480, idealHeight: 600)
67: VStack(spacing: 1) {
69: .font(.headline)
70: .lineLimit(1)
71: .truncationMode(.middle)
73: .font(.caption2)
74: .foregroundStyle(.secondary)
75: .lineLimit(1)
76: .truncationMode(.middle)
78: .padding(.horizontal, 116)
79: .frame(maxWidth: .infinity)
81: HStack(spacing: 8) {
87: .editorChromeButtonStyle(style: .glass, size: .large, shape: .circle)
96: .editorChromeButtonStyle(style: .glass, size: .large, shape: .circle)
98: .transition(.opacity.combined(with: .scale(scale: 0.9)))
111: .editorChromeButtonStyle(style: .glassProminent, size: .large, shape: .modern)
114: .padding(.horizontal, 12)
116: .frame(height: 68)
117: .animation(.smooth(duration: 0.2), value: model.path.count > 1)
132: .transition(folderTransition)
136: .controlSize(.small)
152: LazyVStack(spacing: 6) {
158: .scrollIndicators(.automatic)
163: VStack(spacing: 10) {
165: .controlSize(.small)
170: .font(.callout)
171: .foregroundStyle(.secondary)
173: .frame(maxWidth: .infinity, maxHeight: .infinity)
177: VStack(spacing: 12) {
179: .font(.system(size: 32, weight: .light))
180: .foregroundStyle(.secondary)
185: .font(.headline)
189: .editorChromeButtonStyle(style: .glass, size: .regular, shape: .modern)
191: .frame(maxWidth: .infinity, maxHeight: .infinity)
195: HStack(spacing: 16) {
197: .font(.system(size: 30, weight: .regular))
198: .foregroundStyle(.blue)
199: .frame(width: 42, height: 42)
202: .font(.body)
203: .foregroundStyle(.primary)
204: .lineLimit(2)
209: .font(.callout.weight(.semibold))
210: .foregroundStyle(.tertiary)
212: .padding(.horizontal, 16)
213: .frame(minHeight: 64)
214: .background {
215: Capsule()
218: .contentShape(Capsule())
223: .onHover { isHovered in
227: .animation(.easeOut(duration: 0.14), value: hoveredFolderID)
231: VStack(spacing: 10) {
233: .font(.system(size: 36, weight: .light))
234: .foregroundStyle(.secondary)
239: .font(.headline)
244: .font(.callout)
245: .foregroundStyle(.secondary)
248: .frame(maxWidth: .infinity, maxHeight: .infinity)
249: .padding(24)
253: HStack(spacing: 10) {
255: .foregroundStyle(.orange)
257: .font(.callout)
258: .foregroundStyle(.secondary)
259: .lineLimit(2)
262: .padding(.horizontal, 16)
263: .padding(.vertical, 10)
264: .background(editorChromeSurface())
271: insertion: .move(edge: .trailing).combined(with: .opacity),
272: removal: .move(edge: .leading).combined(with: .opacity)
276: insertion: .move(edge: .leading).combined(with: .opacity),
277: removal: .move(edge: .trailing).combined(with: .opacity)
284: return Color.secondary.opacity(0.12)
```

## ExcalidrawZ/Persistence/CloudStorage/CloudStorageProvider.swift

219 lines. Check platform/build reachability at the call site.

```text
160: since cursor: CloudStorageChangeCursor?
215: since cursor: CloudStorageChangeCursor?
```

## ExcalidrawZ/Persistence/CloudStorage/CloudStorageServerConnectionSheet.swift

296 lines. Check platform/build reachability at the call site.

```text
37: VStack(spacing: 0) {
74: VStack(alignment: .leading, spacing: 12) {
92: HStack(spacing: 8) {
95: .controlSize(.small)
108: .frame(maxWidth: .infinity)
110: .editorChromeButtonStyle(style: .glassProminent, size: .large, shape: .modern)
136: .foregroundStyle(.orange)
140: .formStyle(.grouped)
147: .frame(minWidth: 620, idealWidth: 700, minHeight: 600, idealHeight: 680)
160: .font(.headline)
161: .lineLimit(1)
162: .truncationMode(.middle)
163: .padding(.horizontal, 72)
164: .frame(maxWidth: .infinity)
172: .editorChromeButtonStyle(style: .glass, size: .large, shape: .circle)
176: .padding(.horizontal, 12)
178: .frame(height: 68)
204: HStack(spacing: 12) {
210: .frame(width: 32, height: 32)
213: .foregroundStyle(.primary)
214: .lineLimit(1)
220: .controlSize(.small)
223: .font(.caption.weight(.semibold))
224: .foregroundStyle(.tertiary)
227: .contentShape(Rectangle())
229: .buttonStyle(.plain)
```

## ExcalidrawZ/Persistence/CloudStorage/CloudStorageSyncService.swift

436 lines. Check platform/build reachability at the call site.

```text
412: priority: .background
```

## ExcalidrawZ/Persistence/CloudStorage/Dropbox/DropboxAPIClient.swift

448 lines. Check platform/build reachability at the call site.

```text
64: cursor: String,
```

## ExcalidrawZ/Persistence/CloudStorage/Dropbox/DropboxCloudStorageSession.swift

327 lines. Check platform/build reachability at the call site.

```text
76: response = try await client.continueListFolder(cursor: pageToken)
91: nextPageToken: response.hasMore ? response.cursor : nil
187: since cursor: CloudStorageChangeCursor?
199: cursor: cursor.rawValue,
225: cursor: response.cursor,
```

## ExcalidrawZ/Persistence/CloudStorage/Dropbox/DropboxModels.swift

205 lines. Check platform/build reachability at the call site.

```text
159: let cursor: String
```

## ExcalidrawZ/Persistence/CloudStorage/Dropbox/DropboxOAuthAuthenticator.swift

370 lines. Check platform/build reachability at the call site.

```text
213: session.presentationContextProvider = self
```

## ExcalidrawZ/Persistence/CloudStorage/GoogleDrive/GoogleDriveOAuthAuthenticator.swift

455 lines. Check platform/build reachability at the call site.

```text
305: session.presentationContextProvider = self
```

## ExcalidrawZ/Persistence/CloudStorage/OneDrive/OneDriveCloudStorageSession.swift

133 lines. Check platform/build reachability at the call site.

```text
111: since cursor: CloudStorageChangeCursor?
```

## ExcalidrawZ/Persistence/CloudStorage/WebDAV/WebDAVServiceMarqueeHeader.swift

152 lines. Check platform/build reachability at the call site.

```text
12: VStack(spacing: 12) {
25: .padding(.top, 66)
26: .padding(.bottom, 18)
27: .frame(height: 218)
28: .background {
31: LinearGradient(
33: Color.accentColor.opacity(0.22),
34: Color.accentColor.opacity(0.13),
35: Color.accentColor.opacity(0.05),
43: LinearGradient(
45: .init(color: .black, location: 0),
46: .init(color: .black, location: 0.68),
47: .init(color: .black.opacity(0.86), location: 0.80),
48: .init(color: .black.opacity(0.48), location: 0.92),
49: .init(color: .clear, location: 1),
55: LinearGradient(
57: .init(color: .clear, location: 0),
58: .init(color: .black, location: 0.06),
59: .init(color: .black, location: 0.94),
60: .init(color: .clear, location: 1),
68: .accessibilityHidden(true)
86: @Environment(\.accessibilityReduceMotion) private var reduceMotion
96: TimelineView(.animation(paused: reduceMotion)) { timeline in
98: HStack(spacing: 0) {
104: .offset(x: offset(at: timeline.date))
107: .frame(height: 60)
111: HStack(spacing: Self.spacing) {
113: Circle()
114: .fill(.background.opacity(0.82))
115: .frame(width: Self.iconLength, height: Self.iconLength)
116: .overlay {
120: .frame(width: 32, height: 32)
122: .overlay {
123: Circle()
124: .stroke(.secondary.opacity(0.12), lineWidth: 0.5)
126: .shadow(color: .black.opacity(0.08), radius: 5, y: 2)
130: .frame(width: 0, height: Self.iconLength)
134: private var sequenceWidth: CGFloat {
```

## ExcalidrawZ/Persistence/Encryption/LockedContentUnlockSupport.swift

392 lines. Check platform/build reachability at the call site.

```text
23: private static let failedAttemptMinimumDuration: TimeInterval = 1
```

## ExcalidrawZ/Persistence/FileStorage/LocalStorageManager.swift

367 lines. Check platform/build reachability at the call site.

```text
321: var totalSize: Int64 = 0
```

## ExcalidrawZ/Persistence/Migrations/MigrationSheetView.swift

682 lines. Check platform/build reachability at the call site.

```text
53: private var sheetPadding: CGFloat {
58: VStack(spacing: 0) {
59: VStack(spacing: 20) {
62: .font(.title)
63: .fontWeight(.semibold)
64: .padding(.top, 20)
68: .font(.body)
69: .foregroundStyle(.secondary)
71: .padding(.horizontal, containerHorizontalSizeClass != .compact ? 40 : 0)
73: .padding(.horizontal, sheetPadding)
76: VStack(spacing: 12) {
81: .padding(.vertical, 20)
82: .padding(.horizontal, sheetPadding)
85: VStack(spacing: 4) {
88: VStack(spacing: 8) {
89: HStack(spacing: 8) {
96: .font(.headline)
99: .font(.caption2)
100: .foregroundStyle(.secondary)
103: .padding(12)
104: .frame(maxWidth: .infinity)
105: .background {
106: RoundedRectangle(cornerRadius: 16).fill(Color.accentColor.opacity(0.2))
107: RoundedRectangle(cornerRadius: 16).stroke(Color.accentColor)
109: .padding(.horizontal, sheetPadding)
126: .padding(.horizontal, sheetPadding)
128: HStack(spacing: 12) {
131: .padding(.horizontal, sheetPadding)
147: .padding(.horizontal, sheetPadding)
149: HStack(spacing: 12) {
152: .padding(.horizontal, sheetPadding)
160: .frame(maxWidth: .infinity)
162: .editorChromeButtonStyle(style: .glassProminent, size: .large, shape: .capsule)
164: .padding(.horizontal, sheetPadding)
168: .padding(.vertical, sheetPadding)
169: .overlay(alignment: .topTrailing) {
179: .foregroundStyle(.secondary)
180: .padding(20)
184: .frame(width: 500, height: 500)
195: .overlay(alignment: .top) {
198: .transition(.move(edge: .top).combined(with: .opacity))
206: VStack(alignment: .leading, spacing: 12) {
208: HStack(spacing: 8) {
210: .foregroundStyle(.orange)
212: .font(.headline)
213: .foregroundStyle(.primary)
221: .foregroundStyle(.secondary)
223: .buttonStyle(.plain)
228: VStack(alignment: .leading, spacing: 8) {
230: VStack(alignment: .leading, spacing: 4) {
232: .font(.body)
233: .fontWeight(.medium)
235: .font(.caption)
236: .foregroundStyle(.secondary)
238: .padding(.vertical, 4)
243: .font(.caption)
244: .foregroundStyle(.secondary)
245: .padding(.top, 4)
249: .frame(maxHeight: 200)
251: .padding(16)
252: .background {
253: RoundedRectangle(cornerRadius: 16)
255: RoundedRectangle(cornerRadius: 16)
256: .stroke(Color.orange, lineWidth: 2)
258: .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
259: .padding(.horizontal, sheetPadding)
260: .padding(.top, sheetPadding)
282: .controlSize(.small)
285: .frame(maxWidth: .infinity)
288: .frame(maxWidth: .infinity)
291: .editorChromeButtonStyle(style: .glass, size: .large, shape: .capsule)
307: .frame(maxWidth: .infinity)
308: .opacity(isMigrating ? 0 : 1)
309: .overlay {
311: ProgressView().controlSize(.small)
317: .opacity(0.5)
320: .editorChromeButtonStyle(style: .glassProminent, size: .large, shape: .capsule)
337: .frame(maxWidth: .infinity)
338: .opacity(isMigrating ? 0 : 1)
339: .overlay {
341: ProgressView().controlSize(.small)
345: .editorChromeButtonStyle(style: .glass, size: .large, shape: .capsule)
371: .frame(maxWidth: .infinity)
372: .opacity(isMigrating ? 0 : 1)
373: .overlay {
375: ProgressView().controlSize(.small)
379: .editorChromeButtonStyle(style: .glassProminent, size: .large, shape: .capsule)
544: VStack(alignment: .leading, spacing: 8) {
545: HStack(spacing: 12) {
551: .font(.headline)
561: VStack(alignment: .leading, spacing: 10) {
565: VStack(alignment: .leading, spacing: 4) {
570: .font(.caption)
571: .foregroundStyle(.secondary)
574: VStack(alignment: .leading, spacing: 8) {
576: .font(.caption)
577: .fontWeight(.semibold)
578: .foregroundStyle(.orange)
579: VStack(alignment: .leading, spacing: 4) {
583: .font(.caption)
584: .foregroundStyle(.orange)
587: .font(.caption2)
588: .foregroundStyle(.secondary)
594: VStack(alignment: .leading, spacing: 4) {
597: .foregroundStyle(.red)
600: .font(.caption)
601: .foregroundStyle(.red)
605: .padding(.leading, 24)
608: .padding()
609: .contentShape(Rectangle())
615: .onHover { isHovered in
620: .background {
622: RoundedRectangle(cornerRadius: 24)
624: RoundedRectangle(cornerRadius: 24)
625: .stroke(borderColor, lineWidth: 1)
628: .clipShape(RoundedRectangle(cornerRadius: 24))
645: private var backgroundStyle: AnyShapeStyle {
647: return AnyShapeStyle(Color.yellow.opacity(0.1))
652: private var borderColor: Color {
656: return .secondary.opacity(0.5)
664: .foregroundStyle(.secondary)
667: .controlSize(.small)
670: .foregroundStyle(.green)
673: .foregroundStyle(.yellow)
676: .controlSize(.small)
679: .foregroundStyle(.red)
```

## ExcalidrawZ/Persistence/Repository/PresentationConfigurationRepository.swift

114 lines. Check platform/build reachability at the call site.

```text
48: guard file.presentationData != data else { return }
49: file.presentationData = data
52: guard file.presentationData != data else { return }
53: file.presentationData = data
75: file.presentationData
77: file.presentationData
```

## ExcalidrawZ/Persistence/iCloudDrive/iCloudDriveFileManager.swift

511 lines. Check platform/build reachability at the call site.

```text
479: var totalSize: Int64 = 0
```

## ExcalidrawZ/RootView.swift

73 lines. Check platform/build reachability at the call site.

```text
41: LazyHStack(spacing: 0) {
44: RoundedRectangle(cornerRadius: 12)
46: .aspectRatio(aspectioes[i % 5], contentMode: .fit)
49: .scrollTransition(.interactive, axis: .horizontal) { content, phase in
51: .scaleEffect(phase.isIdentity ? 1.0 : 0.9)
55: .scrollTargetLayout()
57: .scrollPosition($scrollPosition)
58: .contentMargins(.horizontal, 30, for: .scrollContent)
59: .scrollClipDisabled()
60: .scrollTargetBehavior(.viewAligned)
```

## ExcalidrawZ/Settings/AISettings/AISettingsView+Account.swift

206 lines. Check platform/build reachability at the call site.

```text
20: VStack(alignment: .leading, spacing: 4) {
22: .font(.headline)
23: .foregroundStyle(.primary)
26: .font(.caption)
27: .foregroundStyle(.secondary)
54: HStack(alignment: .firstTextBaseline, spacing: 12) {
65: VStack(alignment: .leading, spacing: 4) {
69: .frame(maxWidth: .infinity, alignment: .leading)
74: VStack(alignment: .leading, spacing: 6) {
78: .frame(maxWidth: .infinity, alignment: .leading)
90: .foregroundStyle(.secondary)
93: .foregroundStyle(.secondary)
96: .foregroundStyle(.secondary)
108: HStack(alignment: .firstTextBaseline, spacing: 10) {
110: .font(.system(.caption, design: .monospaced))
111: .foregroundStyle(.secondary)
112: .lineLimit(1)
113: .truncationMode(.middle)
115: .frame(maxWidth: .infinity, alignment: .leading)
122: .buttonStyle(.borderless)
125: HStack(spacing: 10) {
127: .foregroundStyle(.secondary)
137: .buttonStyle(.borderless)
```

## ExcalidrawZ/Settings/AISettings/AISettingsView+Activity.swift

270 lines. Check platform/build reachability at the call site.

```text
18: .font(.caption)
19: .foregroundStyle(.red)
22: ProgressView().controlSize(.small)
24: .foregroundStyle(.secondary)
28: .font(.caption)
29: .foregroundStyle(.secondary)
43: ProgressView().controlSize(.small)
45: .foregroundStyle(.secondary)
49: .font(.caption)
50: .foregroundStyle(.red)
53: .font(.caption)
54: .foregroundStyle(.secondary)
68: ProgressView().controlSize(.small)
75: .buttonStyle(.borderless)
85: .font(.caption)
86: .foregroundStyle(.secondary)
96: .font(.caption)
97: .foregroundStyle(.secondary)
106: HStack(alignment: .top) {
107: VStack(alignment: .leading, spacing: 3) {
109: .font(.callout)
111: .font(.caption2)
112: .foregroundStyle(.secondary)
115: .font(.caption2)
116: .foregroundStyle(.tertiary)
117: .lineLimit(1)
122: .font(.callout.weight(.medium))
124: .foregroundStyle(tx.amount >= 0 ? .green : .secondary)
126: .padding(.vertical, 2)
131: HStack(alignment: .center, spacing: 12) {
133: .font(.body)
134: .foregroundStyle(group.hasFileContext ? Color.accentColor : Color.secondary)
135: .frame(width: 24)
137: VStack(alignment: .leading, spacing: 3) {
139: .font(.callout.weight(.medium))
140: .lineLimit(1)
142: .font(.caption2)
143: .foregroundStyle(.secondary)
149: .font(.callout.weight(.semibold))
150: .foregroundStyle(.secondary)
153: .padding(.vertical, 2)
```

## ExcalidrawZ/Settings/AISettings/AISettingsView+Gauge.swift

144 lines. Check platform/build reachability at the call site.

```text
23: .stroke(
24: Color.secondary.opacity(0.16),
29: .stroke(
33: VStack(alignment: .center, spacing: 0) {
35: .font(.system(size: 34, weight: .semibold, design: .rounded))
36: .foregroundStyle(AIAppearancePalette.foregroundGradient)
39: .font(.callout)
40: .foregroundStyle(.secondary)
43: .offset(y: 8)
45: .padding(.bottom, 8)
46: .accessibilityElement(children: .combine)
47: .accessibilityLabel(Text(localizable: .settingsAIUsageGaugeAccessibilityLabel))
48: .accessibilityValue(
88: .background {
89: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
90: .fill(Color.secondary.opacity(0.08))
105: ? Glass.regular.tint(tint.opacity(0.22))
106: : Glass.clear.tint(tint.opacity(0.08))
108: content.glassEffect(glass.interactive(), in: Capsule())
110: content.glassEffect(glass, in: Capsule())
114: .background {
115: Capsule()
116: .fill(tint.opacity(isProminent ? 0.16 : 0.08))
118: .overlay {
119: Capsule()
120: .strokeBorder(tint.opacity(isProminent ? 0.26 : 0.0))
131: func aiSettingsGlassCapsule(
```

## ExcalidrawZ/Settings/AISettings/AISettingsView+Information.swift

156 lines. Check platform/build reachability at the call site.

```text
15: HStack(alignment: .top, spacing: 16) {
17: .font(.title2)
18: .foregroundStyle(Color.accentColor)
20: VStack(alignment: .leading, spacing: 6) {
22: .font(.title2.weight(.semibold))
23: .foregroundStyle(.primary)
26: .font(.callout)
27: .foregroundStyle(.secondary)
38: VStack(alignment: .leading, spacing: 3) {
41: .font(.caption)
42: .foregroundStyle(.secondary)
92: HStack(alignment: .top, spacing: 12) {
94: .font(.body.weight(.semibold))
95: .foregroundStyle(.secondary)
96: .frame(width: 22)
98: VStack(alignment: .leading, spacing: 4) {
100: .font(.body.weight(.semibold))
103: .font(.callout)
104: .foregroundStyle(.secondary)
108: .padding(.vertical, 3)
113: HStack(alignment: .top, spacing: 12) {
115: .font(.body.weight(.semibold))
116: .foregroundStyle(.secondary)
117: .frame(width: 22)
119: VStack(alignment: .leading, spacing: 8) {
121: .font(.body.weight(.semibold))
124: .font(.callout)
125: .foregroundStyle(.secondary)
129: HStack(spacing: 14) {
133: VStack(alignment: .leading, spacing: 8) {
137: .font(.callout.weight(.semibold))
140: .padding(.vertical, 3)
```

## ExcalidrawZ/Settings/AISettings/AISettingsView+MCP.swift

1081 lines. Check platform/build reachability at the call site.

```text
38: HStack(alignment: .bottom, spacing: 12) {
39: VStack(alignment: .leading, spacing: 4) {
41: .font(.headline)
42: .foregroundStyle(.primary)
45: .font(.caption)
46: .foregroundStyle(.secondary)
55: .frame(maxWidth: .infinity, alignment: .leading)
62: VStack(alignment: .leading, spacing: 3) {
66: .font(.caption)
67: .foregroundStyle(.secondary)
89: HStack(alignment: .top, spacing: 10) {
91: .font(.body.weight(.semibold))
92: .foregroundStyle(.secondary)
93: .frame(width: 20)
96: .font(.footnote)
97: .foregroundStyle(.secondary)
100: .frame(maxWidth: .infinity, alignment: .leading)
101: .padding(.vertical, 2)
107: HStack(alignment: .center, spacing: 16) {
115: VStack(alignment: .leading, spacing: 8) {
120: .frame(maxWidth: .infinity, alignment: .leading)
125: HStack(spacing: 4) {
132: .font(.caption.weight(.semibold))
133: .foregroundStyle(.secondary)
134: .frame(width: 16, height: 16)
135: .contentShape(Rectangle())
137: .buttonStyle(.plain)
138: .help(String(localizable: .settingsAIMCPServiceModeHelp))
162: HStack(spacing: 16) {
182: VStack(spacing: 0) {
186: .font(.system(.body, design: .monospaced))
187: .scrollContentBackground(.hidden)
188: .background {
189: RoundedRectangle(cornerRadius: 8, style: .continuous)
190: .fill(Color.secondary.opacity(0.08))
192: .overlay {
193: RoundedRectangle(cornerRadius: 8, style: .continuous)
194: .strokeBorder(Color.primary.opacity(0.10))
196: .padding(.horizontal, 18)
197: .padding(.bottom, 18)
206: .font(.headline)
207: .lineLimit(1)
209: HStack(spacing: 10) {
229: .buttonStyle(.borderedProminent)
233: .padding(.horizontal, 18)
234: .padding(.top, 14)
235: .padding(.bottom, 10)
240: HStack(alignment: .firstTextBaseline, spacing: 12) {
246: .foregroundStyle(mcpStatusColor)
252: VStack(alignment: .leading, spacing: 4) {
256: .foregroundStyle(mcpStatusColor)
258: .frame(maxWidth: .infinity, alignment: .leading)
271: .font(.caption.weight(.semibold))
273: .controlSize(.small)
274: .help(String(localizable: .settingsAIMCPHowToConnectButton))
279: VStack(spacing: 0) {
283: VStack(alignment: .leading, spacing: 20) {
300: .padding(.horizontal, 24)
301: .padding(.top, 14)
302: .padding(.bottom, 24)
303: .frame(maxWidth: .infinity, alignment: .topLeading)
305: .scrollIndicators(.hidden)
306: .scrollClipDisabledIfAvailable()
323: .font(.headline)
324: .lineLimit(1)
332: .padding(.horizontal, 18)
333: .padding(.top, 14)
334: .padding(.bottom, 8)
349: .frame(width: 36, height: 36)
350: .contentShape(Circle())
351: .background {
353: Circle()
355: .editorChromeGlassEffect(.clear, in: Circle())
357: Circle()
362: .buttonStyle(.plain)
363: .controlSize(.regular)
364: .contentShape(Circle())
365: .help(String(localizable: .generalButtonClose))
370: HStack(spacing: 2) {
384: .padding(3)
385: .background {
386: Capsule()
387: .fill(Color.secondary.opacity(0.10))
390: .frame(maxWidth: .infinity, alignment: .center)
405: .font(.caption.weight(.semibold))
406: .foregroundStyle(isSelected ? Color.primary : Color.secondary)
407: .frame(minWidth: 86, minHeight: 28)
408: .padding(.horizontal, 8)
409: .background {
410: Capsule()
411: .fill(isSelected ? Color.accentColor.opacity(0.18) : Color.clear)
413: .contentShape(Capsule())
415: .buttonStyle(.plain)
420: VStack(alignment: .leading, spacing: 18) {
421: VStack(alignment: .leading, spacing: 10) {
423: .foregroundStyle(.secondary)
426: .font(.callout)
429: VStack(alignment: .leading, spacing: 8) {
438: VStack(alignment: .leading, spacing: 8) {
447: .frame(maxWidth: .infinity, alignment: .leading)
452: VStack(alignment: .leading, spacing: 18) {
453: VStack(alignment: .leading, spacing: 10) {
455: .foregroundStyle(.secondary)
458: .font(.callout)
461: VStack(alignment: .leading, spacing: 8) {
470: VStack(alignment: .leading, spacing: 8) {
479: .frame(maxWidth: .infinity, alignment: .leading)
484: VStack(alignment: .leading, spacing: 18) {
485: VStack(alignment: .leading, spacing: 10) {
487: .foregroundStyle(.secondary)
490: .font(.callout)
493: VStack(alignment: .leading, spacing: 8) {
502: .frame(maxWidth: .infinity, alignment: .leading)
508: .font(.system(.caption, design: .monospaced))
509: .foregroundStyle(.secondary)
510: .lineLimit(nil)
513: .frame(maxWidth: .infinity, alignment: .leading)
514: .padding(10)
515: .background {
516: RoundedRectangle(cornerRadius: 8, style: .continuous)
517: .fill(Color.secondary.opacity(0.08))
523: HStack(alignment: .firstTextBaseline, spacing: 12) {
525: .font(.headline)
531: iconFrame: CGSize(width: 16, height: 16),
534: .buttonStyle(.plain)
666: VStack(spacing: 0) {
672: .padding(.horizontal, 24)
673: .padding(.top, 14)
674: .padding(.bottom, 24)
675: .frame(maxWidth: .infinity, alignment: .topLeading)
677: .scrollIndicators(.hidden)
678: .scrollClipDisabledIfAvailable()
696: .font(.headline)
697: .lineLimit(1)
698: .foregroundStyle(.secondary)
701: .padding(.horizontal, 18)
702: .padding(.top, 14)
703: .padding(.bottom, 10)
711: .frame(width: 36, height: 36)
712: .contentShape(Circle())
713: .background {
715: Circle()
717: .editorChromeGlassEffect(.clear, in: Circle())
719: Circle()
724: .buttonStyle(.plain)
725: .controlSize(.regular)
726: .contentShape(Circle())
727: .help(String(localizable: .generalButtonClose))
747: VStack(spacing: 14) {
753: .padding(.vertical, 2)
755: .scrollIndicators(.hidden)
756: .scrollClipDisabledIfAvailable()
759: .padding(16)
760: .frame(minWidth: 320, idealWidth: 410, maxWidth: 440)
761: .frame(minHeight: 260, idealHeight: 420, maxHeight: 500)
772: HStack(spacing: 2) {
777: .padding(3)
778: .background {
782: .frame(maxWidth: .infinity, alignment: .center)
794: .font(.caption.weight(.semibold))
795: .foregroundStyle(isSelected ? Color.primary : Color.secondary)
796: .frame(minWidth: 92, minHeight: 28)
797: .padding(.horizontal, 8)
798: .background {
803: .contentShape(Capsule())
805: .buttonStyle(.plain)
822: VStack(alignment: .leading, spacing: 10) {
831: HStack(alignment: .top, spacing: 12) {
833: .font(.system(size: 14, weight: .semibold))
834: .foregroundStyle(Color.accentColor)
835: .frame(width: 28, height: 28)
836: .background {
840: VStack(alignment: .leading, spacing: 4) {
842: .font(.callout.weight(.semibold))
843: .foregroundStyle(.primary)
846: .font(.callout)
847: .foregroundStyle(.secondary)
851: .frame(maxWidth: .infinity, alignment: .leading)
852: .padding(16)
853: .background {
955: let shape = RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
958: .background {
962: .editorChromeGlassEffect(.regular, in: shape)
968: .overlay {
970: .strokeBorder(Color.primary.opacity(0.08))
979: Capsule()
981: .background {
984: Capsule()
986: .editorChromeGlassEffect(.regular.interactive(), in: Capsule())
988: Capsule()
990: .editorChromeGlassEffect(.regular, in: Capsule())
993: Capsule()
997: .overlay {
998: Capsule()
999: .strokeBorder(Color.primary.opacity(0.08))
1006: Capsule()
1007: .fill(Color.primary.opacity(0.08))
1008: .background {
1010: Capsule()
1012: .editorChromeGlassEffect(.clear.interactive(), in: Capsule())
1020: Circle()
1022: .background {
1024: Circle()
1026: .editorChromeGlassEffect(.regular.interactive(), in: Circle())
1028: Circle()
1032: .overlay {
1033: Circle()
1034: .strokeBorder(Color.primary.opacity(0.08))
1043: self.scrollTransition(.interactive, axis: .vertical) { content, phase in
1045: .opacity(phase.isIdentity ? 1 : 0.32)
1046: .scaleEffect(phase.isIdentity ? 1 : 0.98)
1056: self.frame(minWidth: 520, idealWidth: 620, minHeight: 320, idealHeight: 420)
1065: self.frame(minWidth: 640, idealWidth: 760, minHeight: 480, idealHeight: 640)
```

## ExcalidrawZ/Settings/AISettings/AISettingsView+ModelPicker.swift

111 lines. Check platform/build reachability at the call site.

```text
22: .help(.localizable(.settingsAIEnableFeatureHelp))
58: .help(.localizable(.settingsAIDefaultModelHelp))
```

## ExcalidrawZ/Settings/AISettings/AISettingsView+Tabs.swift

248 lines. Check platform/build reachability at the call site.

```text
17: HStack(alignment: .top, spacing: 22) {
23: VStack(alignment: .trailing, spacing: 12) {
29: .frame(maxWidth: .infinity, alignment: .leading)
32: VStack(alignment: .leading, spacing: 12) {
39: .frame(maxWidth: .infinity, alignment: .leading)
42: HStack(alignment: .top, spacing: 22) {
48: VStack(alignment: .trailing, spacing: 12) {
58: VStack(alignment: .leading, spacing: 12) {
63: HStack(alignment: .center, spacing: 12) {
70: VStack(alignment: .leading, spacing: 10) {
80: .frame(maxWidth: .infinity, alignment: .leading)
118: .foregroundStyle(selectedTab == tab ? Color.accentColor : Color.primary)
119: .tint(selectedTab == tab ? Color.accentColor : Color.primary)
120: .help(tab.title)
139: HStack(spacing: 2) {
148: .font(.caption.weight(.semibold))
150: .frame(width: 72, height: 26)
151: .foregroundStyle(
154: .background {
155: Capsule()
156: .fill(selectedTab == tab ? Color.accentColor.opacity(0.16) : Color.clear)
158: .contentShape(Capsule())
160: .buttonStyle(.plain)
164: .padding(3)
165: .background {
166: Capsule()
167: .fill(Color.secondary.opacity(0.08))
198: VStack(spacing: 10) {
```

## ExcalidrawZ/Settings/AISettings/AISettingsView+Usage.swift

312 lines. Check platform/build reachability at the call site.

```text
16: VStack(alignment: .leading, spacing: 22) {
25: .modernButtonStyle(style: .glassProminent, size: .regular, shape: .modern)
31: .frame(maxWidth: .infinity, alignment: .leading)
37: VStack(alignment: .leading, spacing: 12) {
43: HStack(alignment: .center, spacing: 16) {
49: VStack(alignment: .leading, spacing: 12) {
54: .frame(maxWidth: .infinity, alignment: .leading)
60: VStack(alignment: .leading, spacing: 8) {
62: HStack(spacing: 8) {
64: .font(.title2.weight(.semibold))
65: .foregroundStyle(.primary)
70: VStack(alignment: .leading, spacing: 6) {
72: .font(.title2.weight(.semibold))
73: .foregroundStyle(.primary)
80: .font(.callout)
81: .foregroundStyle(.secondary)
82: .lineLimit(3)
90: VStack(alignment: .leading, spacing: 10) {
92: .font(.headline)
93: .foregroundStyle(.primary)
99: HStack(alignment: .center) {
101: .font(.headline)
102: .foregroundStyle(.primary)
110: VStack(alignment: .leading, spacing: 10) {
112: .font(.headline)
113: .foregroundStyle(.primary)
118: .frame(maxWidth: .infinity, alignment: .leading)
136: .frame(width: 144)
150: .frame(width: 144)
159: VStack(alignment: .leading, spacing: 16) {
161: VStack(alignment: .leading, spacing: 6) {
163: .font(.title2.weight(.semibold))
164: .foregroundStyle(.primary)
167: .font(.callout)
168: .foregroundStyle(.secondary)
173: .frame(maxWidth: .infinity, alignment: .leading)
184: .frame(
185: width: usesCompactSettingsLayout ? 156 : 176,
186: height: usesCompactSettingsLayout ? 96 : 106
192: VStack(alignment: .leading, spacing: 8) {
195: .font(.headline)
196: .foregroundStyle(.primary)
199: HStack(spacing: 5) {
200: ProgressView().controlSize(.small)
203: .font(.caption)
204: .foregroundStyle(.secondary)
207: .font(.caption)
208: .foregroundStyle(.orange)
211: .font(.caption)
212: .foregroundStyle(.secondary)
221: .foregroundStyle(AIAppearancePalette.foregroundGradient)
222: .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
232: .frame(height: 120)
239: .font(.caption.weight(.semibold))
240: .foregroundStyle(.primary)
241: .padding(.horizontal, 8)
242: .padding(.vertical, 3)
243: .aiSettingsGlassCapsule(
```

## ExcalidrawZ/Settings/AISettings/AISettingsView.swift

196 lines. Check platform/build reachability at the call site.

```text
95: .formStyle(.grouped)
99: VStack(alignment: .leading, spacing: 16) {
102: .padding()
```

## ExcalidrawZ/Settings/AboutView.swift

138 lines. Check platform/build reachability at the call site.

```text
17: .formStyle(.grouped)
21: VStack(spacing: 14) {
22: VStack(spacing: 6) {
25: .padding()
26: .background {
27: RoundedRectangle(cornerRadius: 8)
29: RoundedRectangle(cornerRadius: 8)
30: .stroke(.gray.opacity(0.7))
33: .padding()
34: .background {
35: RoundedRectangle(cornerRadius: 8)
37: RoundedRectangle(cornerRadius: 8)
38: .stroke(.gray.opacity(0.7))
41: .padding()
54: .foregroundColor(.secondary)
60: .foregroundColor(.secondary)
65: VStack(spacing: 0) {
68: .frame(width: 128, height: 128)
70: .font(.title3)
71: .fontWeight(.bold)
75: .padding(.bottom)
83: HStack(spacing: 10) {
88: .frame(width: 20, height: 20)
90: VStack(alignment: .leading, spacing: 2) {
92: .font(.headline)
94: .font(.caption)
95: .foregroundStyle(.secondary)
99: .buttonStyle(.plain)
```

## ExcalidrawZ/Settings/BackupsSettings/BackupContentView.swift

104 lines. Check platform/build reachability at the call site.

```text
20: @Binding private var selectedBackupSize: Int
36: HStack(spacing: 0) {
38: VStack(spacing: 0) {
43: .padding(.horizontal)
44: .frame(minHeight: 400, alignment: .top)
45: .background {
47: .contentShape(Rectangle())
88: var totalSize = 0
```

## ExcalidrawZ/Settings/BackupsSettings/BackupFoldersView.swift

129 lines. Check platform/build reachability at the call site.

```text
39: TreeStructureView(children: content, id: \.url, paddingLeading: 6, usesLazyChildren: false) {
40: HStack(spacing: 4) {
47: .lineLimit(1)
48: .truncationMode(.middle)
52: .padding(6)
61: HStack(spacing: 4) {
69: .lineLimit(1)
70: .truncationMode(.tail)
72: .buttonStyle(
```

## ExcalidrawZ/Settings/BackupsSettings/BackupLockedPreviewView.swift

113 lines. Check platform/build reachability at the call site.

```text
22: VStack(spacing: 12) {
24: .font(.system(size: 44, weight: .semibold))
25: .foregroundStyle(Color.accentColor)
28: .font(.title3.weight(.semibold))
31: .font(.callout)
32: .foregroundStyle(.secondary)
34: .frame(maxWidth: 360)
36: VStack(spacing: 6) {
42: .controlSize(.small)
47: .editorChromeButtonStyle(style: .glassProminent, size: .large, shape: .capsule)
49: .help(systemUnlockAvailability.buttonTitle)
55: .font(.callout.weight(.medium))
57: .buttonStyle(.plain)
58: .foregroundStyle(Color.accentColor)
61: .padding(.top, 4)
65: .font(.callout)
66: .foregroundStyle(.red)
68: .frame(maxWidth: 360)
71: .padding()
96: VStack(spacing: 12) {
99: .controlSize(.small)
104: .font(.callout)
105: .foregroundStyle(.red)
107: .frame(maxWidth: 360)
110: .padding()
```

## ExcalidrawZ/Settings/BackupsSettings/BackupsHomeView.swift

267 lines. Check platform/build reachability at the call site.

```text
16: VStack(spacing: 20) {
19: VStack(spacing: 6) {
21: .font(.largeTitle.weight(.semibold))
24: .font(.callout)
25: .foregroundStyle(.secondary)
27: .frame(maxWidth: 420)
30: VStack(spacing: 10) {
43: .frame(maxWidth: 480)
45: .padding(32)
46: .frame(maxWidth: 560)
67: VStack(spacing: 10) {
70: VStack(spacing: 6) {
72: .font(.title.weight(.semibold))
76: .font(.callout)
77: .foregroundStyle(.secondary)
79: .frame(maxWidth: 420)
82: HStack(spacing: 10) {
95: .frame(maxWidth: 460)
101: HStack(spacing: 6) {
104: .controlSize(.small)
109: .editorChromeButtonStyle(style: .glass, shape: .modern)
118: .editorChromeButtonStyle(style: .glass, shape: .modern)
126: .editorChromeButtonStyle(style: .glass, shape: .modern)
129: .padding(20)
130: .frame(maxWidth: 560)
151: Circle()
153: .overlay {
154: Circle()
155: .stroke(.separator.opacity(0.7), lineWidth: 1)
157: .frame(width: 82, height: 82)
161: .font(.system(size: 36, weight: .medium))
162: .foregroundStyle(Color.accentColor)
163: .frame(width: 82, height: 82)
167: Circle()
168: .fill(.background)
169: .frame(width: 30, height: 30)
170: .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 3)
172: .font(.system(size: 18, weight: .semibold))
173: .foregroundStyle(.green)
175: .frame(width: 30, height: 30)
178: .frame(width: 82, height: 82)
188: HStack(alignment: .top, spacing: 12) {
190: Circle()
191: .fill(Color.accentColor.opacity(0.12))
192: .frame(width: 34, height: 34)
194: .font(.system(size: 16, weight: .semibold))
195: .foregroundStyle(Color.accentColor)
198: VStack(alignment: .leading, spacing: 3) {
200: .font(.callout.weight(.semibold))
202: .font(.callout)
203: .foregroundStyle(.secondary)
204: .lineLimit(1)
209: .padding(12)
210: .background {
212: Capsule()
214: .overlay {
215: Capsule()
216: .stroke(.separator.opacity(0.65), lineWidth: 1)
219: RoundedRectangle(cornerRadius: 12, style: .continuous)
221: .overlay {
222: RoundedRectangle(cornerRadius: 12, style: .continuous)
223: .stroke(.separator.opacity(0.65), lineWidth: 1)
236: HStack(spacing: 10) {
238: .font(.system(size: 17, weight: .semibold))
239: .foregroundStyle(Color.accentColor)
240: .frame(width: 24)
242: VStack(alignment: .leading, spacing: 2) {
244: .font(.caption)
245: .foregroundStyle(.secondary)
247: .font(.callout.weight(.semibold))
248: .lineLimit(1)
254: .padding(.horizontal, 12)
255: .padding(.vertical, 10)
256: .frame(maxWidth: .infinity, alignment: .leading)
257: .background {
258: RoundedRectangle(cornerRadius: 12, style: .continuous)
260: .overlay {
261: RoundedRectangle(cornerRadius: 12, style: .continuous)
262: .stroke(.separator.opacity(0.65), lineWidth: 1)
```

## ExcalidrawZ/Settings/BackupsSettings/BackupsSettingsView.swift

427 lines. Check platform/build reachability at the call site.

```text
29: @State private var selectedBackupSize: Int = 0
51: HStack(spacing: 0) {
57: VStack(spacing: 0) {
66: .buttonStyle(.borderless)
69: .padding(6)
70: .transition(.opacity)
78: .transition(.opacity.combined(with: .offset(x: 50)).animation(.smooth(duration: 0.2)))
81: .animation(.default, value: selectedBackup)
85: .animation(.default, value: route)
86: .frame(width: 240)
111: .frame(maxWidth: .infinity)
145: width: 520
167: LazyVStack(spacing: 4) {
174: .lineLimit(1)
175: .truncationMode(.middle)
177: .buttonStyle(.listCell(selected: selectedBackup == item))
188: .padding(10)
189: .frame(minHeight: 400, alignment: .top)
190: .background {
192: .contentShape(Rectangle())
```

## ExcalidrawZ/Settings/CloudStorageSettingsView.swift

144 lines. Check platform/build reachability at the call site.

```text
68: HStack(spacing: 14) {
70: .font(.title2)
71: .foregroundStyle(.secondary)
73: VStack(alignment: .leading, spacing: 3) {
75: .font(.headline)
77: .font(.callout)
78: .foregroundStyle(.secondary)
81: .padding(.vertical, 8)
85: HStack(spacing: 14) {
91: .frame(width: 38, height: 38)
93: VStack(alignment: .leading, spacing: 3) {
95: .font(.body.weight(.medium))
96: .lineLimit(1)
99: .font(.caption)
100: .foregroundStyle(.secondary)
101: .lineLimit(1)
108: .controlSize(.small)
113: .buttonStyle(.bordered)
114: .tint(.red)
117: .padding(.vertical, 6)
```

## ExcalidrawZ/Settings/ExcalidrawSettingsView.swift

348 lines. Check platform/build reachability at the call site.

```text
179: VStack(alignment: .leading) {
180: HStack(spacing: 8) {
197: .buttonStyle(.bordered)
205: .buttonStyle(.bordered)
207: .editorChromeButtonStyle(style: .glass, shape: .modern)
213: .padding(.horizontal, 12)
214: .frame(width: 260, alignment: .leading)
224: .foregroundStyle(.secondary)
260: .padding(.horizontal, 12)
261: .padding(.vertical, 8)
262: .background(editorChromeSurface(), in: RoundedRectangle(cornerRadius: 10))
272: HStack(spacing: 10) {
275: .font(.caption.weight(.semibold))
276: .foregroundStyle(.tertiary)
277: .frame(width: 18)
281: .frame(width: 20, height: 20)
289: .font(.caption)
291: .foregroundStyle(.secondary)
292: .frame(minWidth: 22)
293: .padding(.horizontal, 6)
294: .padding(.vertical, 3)
295: .background(.quaternary, in: Capsule())
298: .padding(.vertical, 4)
299: .contentShape(Rectangle())
```

## ExcalidrawZ/Settings/FontsSettingsView.swift

310 lines. Check platform/build reachability at the call site.

```text
18: }.formStyle(.grouped)
63: VStack(spacing: 1) {
66: .font(.title.bold())
67: .foregroundStyle(.secondary)
68: .frame(maxWidth: .infinity, alignment: .center)
69: .frame(height: 200, alignment: .center)
76: .font(.custom(font, size: 14))
77: .padding(.horizontal, 12)
78: .padding(.vertical, 4)
79: .frame(maxWidth: .infinity, alignment: .leading)
80: .contentShape(Rectangle())
81: .background(
85: .foregroundStyle(
132: .editorChromeButtonStyle(shape: .modern)
153: .buttonStyle(.text(square: true))
221: VStack(spacing: 12) {
223: .font(.title2)
225: .padding(.horizontal, 20)
226: .padding(.top, 20)
230: .padding(.horizontal, 20)
241: .padding(.horizontal, 20)
244: LazyVStack(spacing: 0) {
252: .font(.custom(font, size: 16))
256: .foregroundColor(.accentColor)
259: .padding(.horizontal, 12)
260: .padding(.vertical, 4)
261: .contentShape(Rectangle())
262: .background {
263: RoundedRectangle(cornerRadius: 8)
266: ? AnyShapeStyle(Color.accentColor.opacity(0.2))
276: .padding(.horizontal, 20)
278: .frame(height: 300)
279: .animation(.default, value: displayType)
287: .frame(width: 80)
294: .frame(width: 80)
296: .buttonStyle(.borderedProminent)
298: .padding(.horizontal, 20)
299: .padding(.bottom, 20)
```

## ExcalidrawZ/Settings/GeneralSettingsView.swift

556 lines. Check platform/build reachability at the call site.

```text
74: .frame(maxWidth: .infinity, alignment: .leading)
83: .font(.caption)
84: .foregroundStyle(.secondary)
86: .font(.caption)
87: .foregroundStyle(.secondary)
90: .foregroundStyle(.secondary)
93: .foregroundStyle(NavigationShellTheme.primary(for: colorScheme))
109: .font(.caption)
110: .foregroundStyle(.secondary)
143: let containerShape = RoundedRectangle(cornerRadius: 8)
144: HStack(alignment: .top, spacing: 20) {
145: Text("Sidebar").font(.headline).foregroundStyle(.secondary)
151: .frame(height: 120)
152: .clipShape(containerShape)
153: .padding(2)
154: .overlay {
156: containerShape.stroke(Color.accentColor.opacity(0.5), lineWidth: 4)
165: HStack(alignment: .top, spacing: 20) {
166: Text("Inspector").font(.headline).foregroundStyle(.secondary)
172: .frame(height: 120)
173: .clipShape(containerShape)
174: .padding(2)
175: .overlay {
177: containerShape.stroke(Color.accentColor.opacity(0.5), lineWidth: 4)
212: .frame(maxWidth: .infinity, alignment: .leading)
258: VStack(alignment: .leading, spacing: 10) {
260: .fontWeight(.medium)
263: .padding(.vertical, 2)
266: HStack(spacing: 16) {
286: .frame(maxWidth: .infinity)
292: VStack(alignment: .leading, spacing: 10) {
294: .fontWeight(.medium)
297: .padding(.vertical, 2)
311: .frame(maxWidth: .infinity)
345: VStack(alignment: .leading, spacing: 12) {
353: .padding(.top, 4)
357: .frame(maxWidth: 160)
362: .frame(maxWidth: 160)
366: .foregroundStyle(.secondary)
373: .padding(12)
374: .frame(maxWidth: .infinity, alignment: .leading)
375: .background {
376: RoundedRectangle(cornerRadius: 10, style: .continuous)
377: .fill(Color.secondary.opacity(0.08))
383: VStack(spacing: 10) {
385: .font(.headline)
386: VStack(alignment: .leading, spacing: 4) {
387: VStack(alignment: .leading, spacing: 4) {
388: HStack(spacing: 4) {
389: Image(systemSymbol: .chevronDown).font(.footnote)
393: VStack(spacing: 4) {
397: .padding(.leading, 24)
400: HStack(spacing: 4) {
401: Image(systemSymbol: .chevronDown).font(.footnote).opacity(0)
405: .frame(maxWidth: .infinity, alignment: .leading)
414: VStack(spacing: 10) {
416: .font(.headline)
417: VStack(alignment: .leading, spacing: 4) {
418: VStack(alignment: .leading, spacing: 0) {
430: Text(.localizable(.generalFolderName)).padding(.vertical, 4)
435: .frame(maxWidth: .infinity, alignment: .leading)
445: VStack(alignment: .leading, spacing: 4) {
448: .fontWeight(.medium)
552: .formStyle(.grouped)
```

## ExcalidrawZ/Settings/MediaSettings/DataImage.swift

89 lines. Check platform/build reachability at the call site.

```text
18: var thumbnailSize: CGSize?
20: init(data: Data, thumbnailSize: CGSize? = CGSize(width: 300, height: 300)) {
34: FittedSVGPreviewView(svg: svgContent, padding: 0)
35: .frame(maxWidth: .infinity, maxHeight: .infinity)
49: .fill(.secondary.opacity(0.4))
```

## ExcalidrawZ/Settings/MediaSettings/MediaCleanupSheet.swift

741 lines. Check platform/build reachability at the call site.

```text
44: .overlay(alignment: .topTrailing) {
46: .padding(12)
49: .frame(minWidth: 760, idealWidth: 900, minHeight: 520, idealHeight: 640)
86: HStack(spacing: 8) {
92: .controlSize(.small)
97: .editorChromeButtonStyle(style: .glassProminent, size: .regular, shape: .capsule)
105: .editorChromeButtonStyle(style: .glass, size: .regular, shape: .circle)
107: .accessibilityLabel(Text(localizable: .generalButtonClose))
129: .frame(maxWidth: .infinity, maxHeight: .infinity)
164: .listStyle(.sidebar)
171: HStack(spacing: 10) {
181: .foregroundStyle(.secondary)
184: .lineLimit(1)
189: .font(.caption)
190: .foregroundStyle(.secondary)
192: .contentShape(Rectangle())
196: HStack(spacing: 10) {
206: .frame(width: 38, height: 38)
210: VStack(alignment: .leading, spacing: 2) {
212: .lineLimit(1)
218: .font(.caption)
219: .foregroundStyle(.secondary)
222: .contentShape(Rectangle())
226: HStack(spacing: 10) {
228: .foregroundStyle(.orange)
231: .lineLimit(1)
236: .font(.caption)
237: .foregroundStyle(.secondary)
239: .contentShape(Rectangle())
243: HStack(spacing: 10) {
252: .foregroundStyle(.secondary)
254: VStack(alignment: .leading, spacing: 2) {
256: .lineLimit(1)
258: .font(.caption)
259: .foregroundStyle(.secondary)
262: .contentShape(Rectangle())
273: .foregroundStyle(isSelected ? Color.accentColor : Color.secondary)
275: .buttonStyle(.borderless)
312: VStack(spacing: 12) {
315: .foregroundStyle(.secondary)
317: .frame(maxWidth: .infinity, maxHeight: .infinity)
321: VStack(spacing: 12) {
323: .font(.title)
324: .foregroundStyle(.secondary)
326: .foregroundStyle(.secondary)
334: .frame(maxWidth: .infinity, maxHeight: .infinity)
335: .padding()
339: VStack(spacing: 12) {
341: .font(.system(size: 36))
342: .foregroundStyle(.green)
344: .font(.headline)
347: .frame(maxWidth: .infinity, maxHeight: .infinity)
348: .padding()
352: VStack(spacing: 10) {
354: .font(.system(size: 36))
355: .foregroundStyle(.secondary)
357: .font(.headline)
358: .foregroundStyle(.secondary)
360: .frame(maxWidth: .infinity, maxHeight: .infinity)
368: VStack(alignment: .leading, spacing: 16) {
369: VStack(alignment: .leading, spacing: 4) {
371: .font(.title2.weight(.semibold))
373: .foregroundStyle(.secondary)
379: .foregroundStyle(.secondary)
380: .frame(maxWidth: .infinity, minHeight: 180)
382: LazyVGrid(
383: columns: [GridItem(.adaptive(minimum: 120, maximum: 180), spacing: 8)],
392: .padding(20)
399: VStack(alignment: .leading, spacing: 20) {
405: .frame(maxWidth: 360)
409: .frame(maxWidth: .infinity)
412: VStack(alignment: .leading, spacing: 4) {
414: .font(.title2.weight(.semibold))
416: .foregroundStyle(.secondary)
419: VStack(alignment: .leading, spacing: 8) {
421: .font(.headline)
431: .padding(20)
438: VStack(alignment: .leading, spacing: 16) {
439: VStack(alignment: .leading, spacing: 4) {
441: .font(.title2.weight(.semibold))
443: .foregroundStyle(.secondary)
446: LazyVGrid(
447: columns: [GridItem(.adaptive(minimum: 120, maximum: 180), spacing: 8)],
453: .accessibilityLabel(candidate.sourceName)
458: .padding(20)
465: VStack(alignment: .leading, spacing: 16) {
466: VStack(alignment: .leading, spacing: 4) {
468: .font(.title2.weight(.semibold))
470: .foregroundStyle(.secondary)
473: LazyVGrid(
474: columns: [GridItem(.adaptive(minimum: 120, maximum: 180), spacing: 8)],
483: .contentShape(Rectangle())
491: .padding(20)
503: .overlay(alignment: .topTrailing) {
509: .font(.title3)
510: .foregroundStyle(
515: .padding(6)
517: .contentShape(Rectangle())
521: .accessibilityLabel(candidate.sourceName)
530: .font(.caption)
531: .foregroundStyle(.secondary)
```

## ExcalidrawZ/Settings/MediaSettings/MediaItemDetailView.swift

304 lines. Check platform/build reachability at the call site.

```text
41: VStack(spacing: 20) {
43: .frame(maxWidth: .infinity)
44: .aspectRatio(4.0 / 3.0, contentMode: .fit)
45: .background {
46: RoundedRectangle(cornerRadius: 8, style: .continuous)
47: .fill(Color.secondary.opacity(0.08))
49: .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
64: VStack(alignment: .leading, spacing: 12) {
81: .frame(maxWidth: .infinity, alignment: .leading)
83: .padding()
112: .fill(.secondary.opacity(0.25))
118: VStack(alignment: .leading, spacing: 3) {
120: .font(.caption)
121: .foregroundStyle(.secondary)
123: .font(.body)
124: .lineLimit(2)
130: VStack(alignment: .leading, spacing: 8) {
132: .font(.caption)
133: .foregroundStyle(.secondary)
135: HStack(alignment: .center, spacing: 10) {
136: VStack(alignment: .leading, spacing: 4) {
138: .font(.body)
139: .lineLimit(2)
154: .buttonStyle(.borderless)
156: .help(.localizable(.generalButtonOpen))
165: .controlSize(.small)
170: .buttonStyle(.borderless)
171: .foregroundStyle(.red)
173: .help(.localizable(.sidebarFileRowContextMenuDeletePermanently))
178: .frame(maxWidth: .infinity, alignment: .leading)
193: .font(.caption)
194: .foregroundStyle(isInTrash ? .orange : .green)
201: .font(.caption)
202: .foregroundStyle(.secondary)
```

## ExcalidrawZ/Settings/MediaSettings/MediaItemImageView.swift

57 lines. Check platform/build reachability at the call site.

```text
42: Color.gray.opacity(0.12)
43: .aspectRatio(1, contentMode: .fit)
44: .overlay {
46: .frame(maxWidth: .infinity, maxHeight: .infinity)
48: .clipShape(RoundedRectangle(cornerRadius: 6))
49: .overlay {
51: RoundedRectangle(cornerRadius: 6)
52: .stroke(Color.accentColor, lineWidth: 2)
55: .contentShape(RoundedRectangle(cornerRadius: 6))
```

## ExcalidrawZ/Settings/MediaSettings/MediaItemThumbnailCoordinator.swift

139 lines. Check platform/build reachability at the call site.

```text
119: width: max(1, sourceSize.width * scale),
120: height: max(1, sourceSize.height * scale)
129: width: max(result.width, CGFloat(representation.pixelsWide)),
130: height: max(result.height, CGFloat(representation.pixelsHigh))
```

## ExcalidrawZ/Settings/MediaSettings/MediaSettingsDestinationView.swift

44 lines. Check platform/build reachability at the call site.

```text
29: VStack(spacing: 8) {
31: .font(.headline)
33: .foregroundStyle(.secondary)
35: .frame(maxWidth: .infinity, maxHeight: .infinity)
```

## ExcalidrawZ/Settings/MediaSettings/MediasSettingsView.swift

204 lines. Check platform/build reachability at the call site.

```text
74: .frame(width: 320)
75: .padding(10)
76: .transition(.move(edge: .trailing).combined(with: .opacity))
80: .animation(.smooth(duration: 0.25), value: selectedMediaID)
90: .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
91: .background {
92: let shape = RoundedRectangle(cornerRadius: 16, style: .continuous)
95: .fill(.background)
96: .editorChromeGlassEffect(.regular, in: shape)
97: .shadow(radius: 4)
101: .shadow(radius: 4)
107: VStack(spacing: 0) {
108: HStack(spacing: 8) {
110: .font(.headline)
111: .lineLimit(1)
120: .editorChromeButtonStyle(style: .glass, size: .small, shape: .circle)
122: .padding(12)
135: VStack(spacing: 10) {
137: .font(.system(size: 36))
138: .foregroundStyle(.secondary)
140: .foregroundStyle(.secondary)
142: .frame(maxWidth: 360)
144: .frame(maxWidth: .infinity, maxHeight: .infinity)
145: .padding()
148: LazyVGrid(columns: gridColumns, spacing: 8) {
154: .buttonStyle(.plain)
164: .buttonStyle(.plain)
168: .padding(.horizontal, 16)
169: .padding(.top, 16)
170: .padding(.bottom, 72)
174: .overlay(alignment: .bottomLeading) {
177: .padding(16)
184: [GridItem(.adaptive(minimum: 150, maximum: 220), spacing: 8)]
186: [GridItem(.adaptive(minimum: 120, maximum: 200), spacing: 8)]
197: .editorChromeButtonStyle(style: .glass, size: .regular, shape: .capsule)
198: .help(.localizable(.settingsMediaFilesButtonHelpCleanUp))
```

## ExcalidrawZ/Settings/PencilSettingsView.swift

122 lines. Check platform/build reachability at the call site.

```text
57: VStack(spacing: 10) {
81: .font(.footnote)
82: .foregroundStyle(.secondary)
89: .foregroundStyle(isFirstOpenPencilMode ? .green : .secondary)
94: .foregroundStyle(inPenMode ? .green : .secondary)
```

## ExcalidrawZ/Settings/SecuritySettingsView.swift

979 lines. Check platform/build reachability at the call site.

```text
112: .foregroundStyle(.secondary)
125: VStack(alignment: .leading, spacing: 8) {
139: .controlSize(.small)
150: VStack(alignment: .leading, spacing: 8) {
172: .buttonStyle(.borderless)
173: .controlSize(.small)
182: .buttonStyle(.borderless)
183: .controlSize(.small)
190: HStack(spacing: 12) {
192: .font(.title2)
193: .foregroundStyle(.secondary)
195: VStack(alignment: .leading, spacing: 4) {
197: .font(.headline)
199: .foregroundStyle(.secondary)
202: .padding(.vertical, 6)
207: VStack(alignment: .leading, spacing: 14) {
208: HStack(spacing: 12) {
210: .font(.system(size: 36, weight: .semibold))
211: .foregroundStyle(Color.accentColor)
213: VStack(alignment: .leading, spacing: 4) {
215: .font(.headline)
217: .foregroundStyle(.secondary)
222: HStack(alignment: .bottom) {
227: .font(.callout.weight(.medium))
229: .buttonStyle(.plain)
230: .foregroundStyle(.red)
235: HStack(spacing: 12) {
240: .font(.callout.weight(.medium))
242: .buttonStyle(.plain)
243: .foregroundStyle(Color.accentColor)
253: .controlSize(.small)
258: .editorChromeButtonStyle(style: .glassProminent, size: .large, shape: .capsule)
260: .help(systemUnlockAvailability.buttonTitle)
263: .padding(.top, 2)
267: .font(.callout)
268: .foregroundStyle(.red)
272: .padding(.vertical, 6)
277: VStack(alignment: .leading, spacing: 12) {
278: VStack(spacing: 0) {
300: .padding(.leading, 36)
574: VStack(spacing: 0) {
577: HStack(spacing: 10) {
581: .padding(.horizontal, 24)
582: .padding(.top, 10)
583: .padding(.bottom, 22)
589: .frame(width: 560)
595: VStack(alignment: .leading, spacing: 18) {
601: .padding(24)
606: VStack(alignment: .leading, spacing: 10) {
608: .font(.system(size: 42, weight: .semibold))
610: .foregroundStyle(.red)
613: .font(.title2.weight(.semibold))
616: .font(.callout)
617: .foregroundStyle(.secondary)
623: VStack(alignment: .leading, spacing: 10) {
625: .font(.callout.weight(.medium))
626: .foregroundStyle(.red)
635: .font(.caption)
636: .foregroundStyle(.secondary)
638: .padding(14)
639: .frame(maxWidth: .infinity, alignment: .leading)
640: .background(.red.opacity(0.08), in: RoundedRectangle(cornerRadius: 8))
641: .overlay {
642: RoundedRectangle(cornerRadius: 8)
643: .stroke(.red.opacity(0.22), lineWidth: 1)
649: HStack(spacing: 10) {
651: .font(.body.weight(.semibold))
652: .foregroundStyle(.red)
653: .frame(width: 22)
656: .font(.callout)
662: .font(.callout.monospacedDigit().weight(.semibold))
663: .foregroundStyle(.secondary)
666: .controlSize(.small)
673: VStack(alignment: .leading, spacing: 8) {
675: .font(.callout.weight(.medium))
687: .font(.callout)
688: .foregroundStyle(.red)
705: HStack(spacing: 10) {
709: .keyboardShortcut(.cancelAction)
710: .editorChromeButtonStyle(style: .glass, size: .large, shape: .capsule)
720: .controlSize(.small)
725: .keyboardShortcut(.defaultAction)
726: .editorChromeButtonStyle(style: .glassProminent, size: .large, shape: .capsule)
777: HStack(spacing: 12) {
779: .font(.body.weight(.semibold))
780: .foregroundStyle(isUnlocked ? Color.accentColor : Color.secondary)
781: .frame(width: 24)
783: VStack(alignment: .leading, spacing: 3) {
785: .font(.body)
786: .lineLimit(1)
788: HStack(spacing: 8) {
794: .font(.caption)
795: .foregroundStyle(.secondary)
820: .padding(.vertical, 8)
841: VStack(spacing: 0) {
842: VStack(alignment: .leading, spacing: 18) {
846: .font(.callout)
847: .foregroundStyle(.secondary)
850: HStack(spacing: 10) {
852: .font(.system(.callout, design: .monospaced).weight(.semibold))
854: .padding(.horizontal, 12)
855: .padding(.vertical, 10)
856: .frame(maxWidth: .infinity, alignment: .leading)
857: .background(.quaternary, in: RoundedRectangle(cornerRadius: 8))
862: iconFrame: CGSize(width: 18, height: 18),
865: .buttonStyle(.borderless)
871: .font(.callout.weight(.medium))
879: .font(.callout)
880: .foregroundStyle(.red)
884: .padding(24)
886: HStack(spacing: 10) {
890: .padding(.horizontal, 24)
891: .padding(.top, 10)
892: .padding(.bottom, 22)
904: .frame(width: 560)
910: VStack(alignment: .leading, spacing: 10) {
912: .font(.system(size: 42, weight: .semibold))
914: .foregroundStyle(Color.accentColor)
917: .font(.title2.weight(.semibold))
920: .font(.callout)
921: .foregroundStyle(.secondary)
922: .lineLimit(2)
939: HStack(spacing: 10) {
943: .keyboardShortcut(.cancelAction)
944: .editorChromeButtonStyle(style: .glass, size: .large, shape: .capsule)
954: .keyboardShortcut(.defaultAction)
955: .editorChromeButtonStyle(style: .glassProminent, size: .large, shape: .capsule)
```

## ExcalidrawZ/Settings/SettingsView.swift

354 lines. Check platform/build reachability at the call site.

```text
31: .tint(NavigationShellTheme.primary(for: colorScheme))
32: .background(editorChromeSurface())
86: .background(
98: HStack(spacing: 0) {
103: .frame(width: 200)
118: VStack(spacing: 0) {
126: .buttonStyle(
134: .padding(10)
136: .background(editorChromeSurface())
```

## ExcalidrawZ/Settings/SettingsViewModifier.swift

80 lines. Check platform/build reachability at the call site.

```text
36: .presentationContentInteraction(.scrolls)
72: .presentationContentInteraction(.scrolls)
```

## ExcalidrawZ/Settings/components/SettingsFormContainer.swift

45 lines. Check platform/build reachability at the call site.

```text
12: private let legacySpacing: CGFloat?
30: .formStyle(.grouped)
32: .scrollContentBackground(.hidden)
33: .background(editorChromeSurface())
34: .buttonStyle(NavigationShellButtonStyle(bordered: true))
38: VStack(alignment: legacyAlignment, spacing: legacySpacing) {
41: .padding()
```

## ExcalidrawZ/Share/ArchiveFilesView.swift

243 lines. Check platform/build reachability at the call site.

```text
16: static let preferredSheetHeight: CGFloat = 320
17: private let macOSActionsSectionHeight: CGFloat = 36
35: VStack(spacing: 16) {
41: .frame(maxWidth: 390)
71: VStack(spacing: 8) {
73: .font(.title2)
76: .font(.caption)
77: .foregroundStyle(.secondary)
80: .frame(maxWidth: 340)
89: HStack(alignment: .center, spacing: 12) {
91: .font(.title3)
92: .foregroundStyle(.secondary)
93: .frame(width: 24)
95: VStack(alignment: .leading, spacing: 4) {
97: .font(.callout.weight(.medium))
99: .font(.caption)
100: .foregroundStyle(.secondary)
113: .font(.callout)
114: .foregroundStyle(.secondary)
117: HStack(spacing: 10) {
119: .controlSize(.small)
121: .font(.callout)
122: .foregroundStyle(.secondary)
126: .padding(.horizontal, 24)
127: .frame(maxWidth: .infinity, alignment: .leading)
134: .font(.callout)
135: .foregroundStyle(.red)
139: .font(.callout)
140: .foregroundStyle(.secondary)
150: .frame(height: 22, alignment: .top)
164: HStack(spacing: 6) {
166: .controlSize(.small)
169: .padding(.horizontal, 6)
172: .padding(.horizontal, 6)
173: .padding(.vertical, 1)
176: .editorChromeButtonStyle(style: .glassProminent, size: .large, shape: .modern)
181: .editorChromeButtonStyle(style: .glass, size: .regular, shape: .modern)
183: .frame(height: macOSActionsSectionHeight)
```

## ExcalidrawZ/Share/ExportFileView.swift

252 lines. Check platform/build reachability at the call site.

```text
54: .aspectRatio(contentMode: .fit)
55: .frame(height: 80)
59: .padding()
63: .aspectRatio(contentMode: .fit)
64: .frame(height: 80)
65: .padding()
70: VStack(spacing: 20) {
71: VStack(spacing: 4) {
74: .aspectRatio(contentMode: .fit)
75: .frame(height: 80)
76: .padding()
156: .padding(.horizontal, 6)
160: .padding(.horizontal, 6)
164: .padding(.horizontal, 6)
174: .padding(.horizontal, 6)
175: .padding(.vertical, 1)
182: .padding(.horizontal, 6)
183: .padding(.vertical, 1)
190: .padding(.horizontal, 6)
192: .background(SharingsPicker(
200: .editorChromeButtonStyle(style: .glass, shape: .modern)
```

## ExcalidrawZ/Share/ExportImageView.swift

768 lines. Check platform/build reachability at the call site.

```text
16: private let macOSPreviewSectionHeight: CGFloat = 160
17: private let macOSActionsSectionHeight: CGFloat = 36
125: VStack(spacing: 16) {
137: .foregroundColor(.red)
160: .frame(height: 200)
161: .padding(.vertical)
166: .foregroundColor(.red)
177: .scrollDisabled(true)
178: .formStyle(.grouped)
207: .frame(width: 200, height: 120, alignment: .center)
210: .overlay {
223: RoundedRectangle(cornerRadius: 16, style: .continuous)
224: .fill(Color.secondary.opacity(0.08))
225: .frame(width: 220, height: 140)
227: RoundedRectangle(cornerRadius: 16, style: .continuous)
228: .fill(Color.secondary.opacity(0.08))
234: VStack(spacing: 8) {
237: .foregroundStyle(.secondary)
241: .overlay {
243: RoundedRectangle(cornerRadius: 16, style: .continuous)
244: .fill(editorChromeSurface().opacity(0.85))
250: .frame(height: macOSPreviewSectionHeight)
262: .controlSize(horizontalSizeClass == .compact ? .mini : .regular)
264: .font(horizontalSizeClass == .compact ? .footnote : .body)
265: .animation(.default, value: keepEditable)
266: .padding(.horizontal, 48)
272: HStack(alignment: .center, spacing: 4) {
274: Color.clear.frame(height: 30)
275: .overlay {
280: HStack(alignment: .bottom, spacing: 0) {
283: .lineLimit(1)
284: .frame(height: 20)
286: .padding(.bottom, 4)
289: HStack(
301: .offset(y: -2)
311: .buttonStyle(.borderless)
315: .offset(y: -2)
330: VStack(alignment: .leading, spacing: 12) {
414: .editorChromeButtonStyle(style: .glass, shape: .capsule)
415: .frame(maxWidth: containerHorizontalSizeClass == .compact ? 180 : nil)
425: .editorChromeButtonStyle(size: .regular, shape: .modern)
427: .frame(height: macOSActionsSectionHeight)
436: .padding(.horizontal, 6)
439: .padding(.horizontal, 6)
443: .padding(.horizontal, 6)
444: .padding(.vertical, 1)
447: .padding(.horizontal, 6)
448: .padding(.vertical, 1)
450: .opacity(0.5)
451: .editorChromeButtonStyle(size: .regular, shape: .modern)
454: .frame(height: macOSActionsSectionHeight)
464: .editorChromeButtonStyle(style: .glass)
471: .editorChromeButtonStyle(style: .glass)
482: .editorChromeButtonStyle(style: .glass)
489: .editorChromeButtonStyle(style: .glass)
498: .padding(.horizontal, 6)
499: .frame(maxWidth: containerHorizontalSizeClass == .compact ? .infinity : nil)
502: .padding(.horizontal, 6)
503: .frame(maxWidth: containerHorizontalSizeClass == .compact ? .infinity : nil)
507: .padding(.horizontal, 6)
508: .padding(.vertical, 1)
509: .frame(maxWidth: containerHorizontalSizeClass == .compact ? .infinity : nil)
512: .padding(.horizontal, 6)
513: .padding(.vertical, 1)
514: .frame(maxWidth: containerHorizontalSizeClass == .compact ? .infinity : nil)
569: .padding(.horizontal, 6)
573: .padding(.horizontal, 6)
577: .padding(.horizontal, 6)
581: .frame(maxWidth: containerHorizontalSizeClass == .compact ? .infinity : nil)
589: .padding(.horizontal, 6)
590: .padding(.vertical, 1)
591: .frame(maxWidth: containerHorizontalSizeClass == .compact ? .infinity : nil)
610: .padding(.horizontal, 6)
611: .padding(.vertical, 1)
612: .frame(maxWidth: containerHorizontalSizeClass == .compact ? .infinity : nil)
619: .padding(.horizontal, 6)
620: .frame(maxWidth: containerHorizontalSizeClass == .compact ? .infinity : nil)
622: .background(
655: .resizeWhileMaintainingAspectRatioToSize(size: .init(width: 200, height: 120))
```

## ExcalidrawZ/Share/ShareToolbarButton.swift

200 lines. Check platform/build reachability at the call site.

```text
71: .opacity(isSharing ? 0 : 1)
72: .overlay {
75: .controlSize(.small)
79: .help(String(localizable: .export))
80: .keyboardShortcut("s", modifiers: [.command, .shift])
```

## ExcalidrawZ/Share/ShareView.swift

523 lines. Check platform/build reachability at the call site.

```text
85: static let rootSheetHeight: CGFloat = 300
87: var preferredSheetHeight: CGFloat {
111: private var preferredSheetHeight: CGFloat {
123: let currentContentRect = window.contentRect(forFrameRect: window.frame)
127: width: currentContentRect.width,
128: height: preferredSheetHeight
132: let heightDelta = targetFrameRect.height - window.frame.height
134: var nextFrame = window.frame
152: VStack(spacing: horizontalSizeClass == .compact ? 10 : 20) {
155: .font(containerSizeClass == .compact ? .headline : .title)
160: Color.clear.frame(height: 40)
187: .padding(40)
190: .frame(height: preferredSheetHeight)
197: .overlay(alignment: .topLeading) {
204: .editorChromeButtonStyle(style: .glass, size: .large, shape: .modernCircle)
205: .padding(24)
231: HStack(spacing: 10) {
243: SquareButton(title: .localizable(.exportSheetButtonPDF), icon: .docRichtext, priority: .background) {
305: .controlSize(.large)
331: .transition(.opacity)
336: .transition(.opacity)
339: .transition(.identity)
342: .animation(.default, value: route.last)
343: .padding(.horizontal, 40)
344: .frame(width: 460, height: 300)
353: VStack(spacing: 20) {
355: .font(.largeTitle)
357: HStack(spacing: 14) {
365: SquareButton(title: .localizable(.exportSheetButtonPDF), icon: .docRichtext, priority: .background) {
411: .overlay(alignment: .topLeading) {
418: .editorChromeButtonStyle(style: .glass, size: .large, shape: .modernCircle)
467: .opacity(showLoading ? 0 : 1)
468: .overlay {
473: .animation(.default, value: showLoading)
475: .buttonStyle(ExportButtonStyle())
484: .padding(.horizontal, 10)
```

## ExcalidrawZ/Share/components/ExportButtonStyle.swift

90 lines. Check platform/build reachability at the call site.

```text
24: .foregroundStyle(isEnabled ? .primary : .secondary)
25: .padding()
26: .frame(width: size, height: size)
27: .background {
30: RoundedRectangle(cornerRadius: 8)
34: .overlay {
35: RoundedRectangle(cornerRadius: 8)
36: .strokeBorder(NavigationShellTheme.border(for: colorScheme), lineWidth: 1)
40: let roundedRectangle = RoundedRectangle(cornerRadius: 20)
43: .fill(Color.primary.opacity(colorScheme == .dark ? 0.04 : 0.02))
48: .editorChromeGlassEffect(
50: .tint(Color.accentColor.opacity(isHovered ? 0.14 : 0.08))
57: .fill(Color.primary.opacity(colorScheme == .dark ? 0.18 : 0.12))
60: .fill(Color.primary.opacity(colorScheme == .dark ? 0.08 : 0.05))
65: .editorChromeGlassEffect(
71: RoundedRectangle(cornerRadius: 12)
75: isPressed ? AnyShapeStyle(Color.gray.opacity(0.4)) : AnyShapeStyle(isHovered ? editorChromeSurface(material: .ultraThick) : editorChromeSurface())
79: RoundedRectangle(cornerRadius: 12)
80: .stroke(.separator, lineWidth: 0.5)
84: .animation(.easeOut(duration: 0.1), value: isHovered)
86: .contentShape(Rectangle())
87: .onHover { isHovered = $0 }
```

## ExcalidrawZ/Share/components/ShareSubViewBackButton.swift

53 lines. Check platform/build reachability at the call site.

```text
19: .padding(horizontalSizeClass == .compact ? 0 : 20)
30: .overlay(alignment: .topLeading) {
36: .padding(4)
38: .editorChromeButtonStyle(style: .glass, shape: .modernCircle)
39: .transition(
40: .offset(x: -10).combined(with: .opacity)
44: .animation(.default, value: showBackButton)
```

## ExcalidrawZ/Sidebar/CloudStorageItemContextMenu.swift

682 lines. Check platform/build reachability at the call site.

```text
80: .tint(.red)
552: .controlSize(.large)
554: .frame(width: 400, height: 140)
```

## ExcalidrawZ/Sidebar/CloudStorageSidebarLocationRow.swift

437 lines. Check platform/build reachability at the call site.

```text
47: HStack(spacing: 6) {
49: .frame(width: 18, height: 16)
51: .lineLimit(1)
52: .truncationMode(.middle)
56: .controlSize(.mini)
57: .frame(width: 12, height: 12)
61: .imageScale(.small)
62: .foregroundStyle(.orange)
63: .frame(width: 12, height: 12)
65: .buttonStyle(.borderless)
66: .help(String(
75: .imageScale(.small)
76: .foregroundStyle(.secondary)
77: .frame(width: 12, height: 12)
78: .help(
86: .controlSize(.mini)
87: .frame(width: 12, height: 12)
92: .contentShape(Rectangle())
163: VStack(alignment: .leading, spacing: 0) {
180: .lineLimit(1)
189: .buttonStyle(.borderless)
194: .controlSize(.mini)
240: HStack(spacing: 6) {
243: .font(.caption)
244: .foregroundStyle(.secondary)
245: .padding(.leading, 22)
246: .padding(.vertical, 5)
247: .frame(maxWidth: .infinity, alignment: .leading)
271: HStack(spacing: 6) {
273: .font(.system(size: 15))
274: .foregroundStyle(.blue)
275: .frame(width: 18, height: 16)
282: .lineLimit(1)
283: .truncationMode(.middle)
284: .contentShape(Rectangle())
402: .controlSize(.mini)
403: .frame(width: 12, height: 12)
408: .font(.caption2)
409: .foregroundStyle(.secondary)
410: .frame(width: 12, height: 12)
```

## ExcalidrawZ/Sidebar/Collaboration/CollaborationFileRow.swift

104 lines. Check platform/build reachability at the call site.

```text
68: VStack(alignment: .leading) {
71: .foregroundColor(.secondary)
72: .font(.title3)
73: .lineLimit(1)
77: HStack(spacing: 4) {
81: .font(.footnote)
84: .padding(.bottom, 4)
93: Circle()
95: .shadow(color: stateIndicatorColor, radius: 2)
96: .frame(width: 6, height: 6)
98: .font(.footnote)
```

## ExcalidrawZ/Sidebar/Collaboration/CollaborationFilesList.swift

61 lines. Check platform/build reachability at the call site.

```text
23: VStack(spacing: 0) {
28: .padding(.horizontal, 8)
29: .padding(.vertical, 12)
42: animation: .smooth
47: LazyVStack(alignment: .leading) {
```

## ExcalidrawZ/Sidebar/FileRowView+DragMove.swift

507 lines. Check platform/build reachability at the call site.

```text
55: .opacity({
60: .contentShape(Rectangle())
109: .overlay {
123: VStack(spacing: 0) {
125: .contentShape(Rectangle())
182: .contentShape(Rectangle())
227: .overlay(alignment: .bottom) {
496: HStack(spacing: 0) {
497: Circle()
498: .stroke(Color.accentColor, lineWidth: 2)
499: .frame(width: 5, height: 5)
502: .frame(height: 2)
504: .frame(height: 5)
505: .padding(.leading, 14 + CGFloat(depth+1) * 8)
```

## ExcalidrawZ/Sidebar/FileRowView.swift

169 lines. Check platform/build reachability at the call site.

```text
122: .foregroundStyle(
130: .font(.footnote)
131: .foregroundStyle(.secondary)
```

## ExcalidrawZ/Sidebar/GroupListView.swift

609 lines. Check platform/build reachability at the call site.

```text
39: @State private var scrollViewHeight: CGFloat = .zero
40: @State private var scrollViewContentHeight: CGFloat = .zero
44: VStack(alignment: .leading, spacing: 0) {
50: VStack(spacing: 0) {
51: VStack(spacing: 8) {
52: VStack(spacing: 0) {
59: .frame(width: 30, alignment: .leading)
63: .buttonStyle(
81: .frame(width: 30, alignment: .leading)
90: .foregroundStyle(.secondary)
91: .padding(.trailing, 4)
95: .buttonStyle(
123: .padding(.horizontal, 8)
124: .padding(.vertical, 10)
130: .frame(height: max(0, scrollViewHeight - scrollViewContentHeight))
133: .background {
135: .contentShape(Rectangle())
160: proxy.scrollTo(targetGroupID)
162: proxy.scrollTo(group)
165: proxy.scrollTo(folder)
178: proxy.scrollTo("home")
190: .frame(height: 1)
193: .buttonStyle(.borderless)
196: .font(.system(size: 10))
197: .foregroundStyle(.secondary)
198: .padding(.horizontal, 20)
199: .padding(.bottom, 12)
212: .buttonStyle(NavigationShellButtonStyle())
229: .padding(.horizontal, 10)
230: .padding(.vertical, 8)
231: .controlSize(.small)
232: .foregroundStyle(.secondary)
275: proxy.scrollTo(
280: proxy.scrollTo(
285: proxy.scrollTo(groupID, anchor: .center)
319: proxy.scrollTo(target, anchor: .center)
423: VStack(alignment: .leading, spacing: 0) {
462: VStack(spacing: 0) {
466: .contentShape(Rectangle())
467: .onHover { isHovered = $0 }
474: .foregroundStyle(.secondary)
510: .controlSize(.small)
511: .padding(.trailing, 2)
514: .buttonStyle(.borderless)
515: .opacity(isHovered ? 1 : 0.4)
517: .frame(maxWidth: .infinity)
518: .font(.caption2.weight(.semibold))
519: .padding(.top, 14)
520: .padding(.bottom, 5)
521: .animation(.smooth, value: isHovered)
599: HStack(spacing: 4) {
```

## ExcalidrawZ/Sidebar/GroupRowView+DragMove.swift

492 lines. Check platform/build reachability at the call site.

```text
97: .opacity(sidebarDragState.currentDragItem == .group(group.objectID) ? 0.3 : 1)
441: VStack(spacing: 16) {
443: .font(.title2.bold())
450: HStack(spacing: 10) {
456: .frame(maxWidth: .infinity)
465: .frame(maxWidth: .infinity)
467: .editorChromeButtonStyle(style: .glassProminent)
474: .frame(maxWidth: .infinity)
482: .frame(maxWidth: .infinity)
484: .buttonStyle(.borderedProminent)
487: .controlSize(.large)
489: .padding(20)
490: .frame(width: 360)
```

## ExcalidrawZ/Sidebar/GroupRowView.swift

100 lines. Check platform/build reachability at the call site.

```text
64: HStack(spacing: 6) {
66: Text(group.name ?? String(localizable: .generalUntitled)).lineLimit(1)
69: .contentShape(Rectangle())
75: HStack(spacing: 6) {
77: Text(group.name ?? String(localizable: .generalUntitled)).lineLimit(1)
80: .contentShape(Rectangle())
82: .buttonStyle(.excalidrawSidebarRow(isSelected: isSelected, isMultiSelected: false))
98: .frame(width: 20, alignment: .center)
```

## ExcalidrawZ/Sidebar/GroupsView.swift

288 lines. Check platform/build reachability at the call site.

```text
82: .animation(.smooth, value: folderStructStyle)
161: LazyVStack(alignment: .leading, spacing: 0) {
177: .overlay(alignment: .top) {
216: .foregroundStyle(
221: .background {
223: RoundedRectangle(cornerRadius: 12)
226: UnevenRoundedRectangle(
246: .background {
248: RoundedRectangle(cornerRadius: 12)
249: .fill(Color.accentColor.opacity(0.2))
256: TreeStructureView(children: children, paddingLeading: 6) {
272: .foregroundStyle(
277: .background {
279: RoundedRectangle(cornerRadius: 12)
```

## ExcalidrawZ/Sidebar/LinkedStorageAddMenu.swift

271 lines. Check platform/build reachability at the call site.

```text
49: .transition(.opacity)
52: .transition(.opacity)
55: .animation(.smooth, value: isLoading)
215: .foregroundColor(.yellow)
223: .foregroundColor(.green)
249: .frame(width: size, height: size)
262: .frame(width: size, height: size)
263: .foregroundStyle(.secondary)
```

## ExcalidrawZ/Sidebar/LinkedStorageSidebarSection.swift

286 lines. Check platform/build reachability at the call site.

```text
45: VStack(alignment: .leading, spacing: 0) {
71: .background {
73: RoundedRectangle(cornerRadius: 6)
75: RoundedRectangle(cornerRadius: 6)
76: .stroke(NavigationShellTheme.border(for: colorScheme), lineWidth: 1)
79: .padding(.vertical, 10)
80: .transition(.scale(scale: 0, anchor: .topTrailing).combined(with: .opacity))
83: .frame(maxWidth: .infinity, alignment: .leading)
84: .contentShape(Rectangle())
85: .onHover { isHovered = $0 }
86: .animation(.smooth, value: showEmptyPlaceholder)
110: .foregroundStyle(.secondary)
118: .controlSize(.mini)
129: .buttonStyle(.borderless)
131: .opacity(isHovered || isLoading ? 1 : 0.4)
133: .controlSize(.small)
134: .padding(.trailing, 2)
137: .frame(maxWidth: .infinity)
138: .font(.caption2.weight(.semibold))
139: .padding(.top, 14)
140: .padding(.bottom, 5)
141: .animation(.smooth, value: isHovered)
149: VStack(spacing: 12) {
150: HStack(spacing: 10) {
152: .frame(width: 32, height: 32)
156: .frame(width: 32, height: 32)
164: .font(.caption)
165: .foregroundStyle(.secondary)
167: .padding(.horizontal)
169: VStack(spacing: 6) {
173: .controlSize(.small)
184: .font(.footnote)
186: .buttonStyle(NavigationShellButtonStyle(accent: true, bordered: true))
188: .editorChromeButtonStyle(style: .glassProminent, shape: .modern)
195: HStack(spacing: 4) {
200: .font(.footnote)
202: .buttonStyle(NavigationShellButtonStyle(bordered: true))
204: .editorChromeButtonStyle(style: .glass, shape: .modern)
209: .padding(.vertical, 24)
210: .frame(maxWidth: .infinity)
211: .overlay(alignment: .topLeading) {
217: .foregroundStyle(.secondary)
219: .editorChromeButtonStyle(style: .borderless)
220: .padding()
```

## ExcalidrawZ/Sidebar/Local/LocalFileContextMenu.swift

542 lines. Check platform/build reachability at the call site.

```text
203: animation: .default
375: .foregroundStyle(.red)
```

## ExcalidrawZ/Sidebar/Local/LocalFileRow+DragMove.swift

35 lines. Check platform/build reachability at the call site.

```text
23: .opacity(sidebarDragState.currentDragItem == .localFile(file) ? 0.3 : 1)
```

## ExcalidrawZ/Sidebar/Local/LocalFileRowView.swift

186 lines. Check platform/build reachability at the call site.

```text
108: .controlSize(.mini)
111: .foregroundStyle(.secondary)
112: .font(.footnote)
116: .foregroundStyle(.secondary)
117: .font(.footnote)
121: .foregroundStyle(.secondary)
122: .font(.footnote)
126: .foregroundStyle(.secondary)
127: .font(.footnote)
```

## ExcalidrawZ/Sidebar/Local/LocalFilesListView.swift

84 lines. Check platform/build reachability at the call site.

```text
35: .padding(.horizontal, 8)
36: .padding(.vertical, 12)
38: .background {
40: .contentShape(Rectangle())
69: LazyVStack(alignment: .leading, spacing: 0) {
80: .animation(.default, value: files)
```

## ExcalidrawZ/Sidebar/Local/LocalFolderAvailabilityIndicator.swift

89 lines. Check platform/build reachability at the call site.

```text
29: .controlSize(.mini)
30: .frame(width: 16, height: 16)
48: .foregroundStyle(.secondary)
49: .font(.footnote)
50: .frame(width: 16, height: 16)
```

## ExcalidrawZ/Sidebar/Local/LocalFolderContextMenu.swift

404 lines. Check platform/build reachability at the call site.

```text
191: .tint(.red)
232: animation: .default
279: .foregroundStyle(.red)
286: .foregroundStyle(.red)
```

## ExcalidrawZ/Sidebar/Local/LocalFolderRowView+DragMove.swift

442 lines. Check platform/build reachability at the call site.

```text
40: .opacity(sidebarDragState.currentDragItem == .localFolder(folder.objectID) ? 0.3 : 1)
```

## ExcalidrawZ/Sidebar/Local/LocalFolderRowView.swift

100 lines. Check platform/build reachability at the call site.

```text
83: .buttonStyle(.excalidrawSidebarRow(isSelected: isSelected, isMultiSelected: false))
88: HStack(spacing: 6) {
90: .foregroundStyle(NavigationShellTheme.primary(for: colorScheme))
95: .lineLimit(1)
96: .truncationMode(.middle)
97: .contentShape(Rectangle())
```

## ExcalidrawZ/Sidebar/Local/LocalFoldersListView.swift

160 lines. Check platform/build reachability at the call site.

```text
49: LazyVStack(alignment: .leading, spacing: 0) {
67: .background {
69: RoundedRectangle(cornerRadius: 20)
71: RoundedRectangle(cornerRadius: 20)
72: .stroke(.secondary, lineWidth: 0.5)
75: .padding(.vertical, 10)
76: .transition(.scale(scale: 0, anchor: .topTrailing).combined(with: .opacity))
79: .animation(.smooth, value: showLocalFolderEmptyPlaceholder)
115: VStack(spacing: 12) {
117: .font(.system(size: 30))
118: .foregroundStyle(.secondary)
121: .font(.caption)
122: .foregroundStyle(.secondary)
124: .padding(.horizontal)
126: VStack(spacing: 6) {
128: .font(.footnote)
129: .editorChromeButtonStyle(style: .glassProminent, shape: .modern)
135: HStack(spacing: 4) {
140: .font(.footnote)
141: .editorChromeButtonStyle(style: .glass, shape: .modern)
145: .padding(.vertical, 24)
146: .frame(maxWidth: .infinity)
147: .overlay(alignment: .topLeading) {
153: .foregroundStyle(.secondary)
155: .editorChromeButtonStyle(style: .borderless)
156: .padding()
```

## ExcalidrawZ/Sidebar/Local/LocalFoldersView.swift

276 lines. Check platform/build reachability at the call site.

```text
45: animation: .default
51: let paddingBase: CGFloat = 14
88: .animation(.smooth, value: folderStructStyle)
177: .foregroundStyle(
182: .background {
184: RoundedRectangle(cornerRadius: 12)
187: UnevenRoundedRectangle(
207: .background {
209: RoundedRectangle(cornerRadius: 12)
210: .fill(Color.accentColor.opacity(0.2))
219: paddingLeading: 6
```

## ExcalidrawZ/Sidebar/SidebarView.swift

62 lines. Check platform/build reachability at the call site.

```text
31: .frame(width: 210)
38: .background(NavigationShellTheme.surface(for: colorScheme))
39: .overlay(alignment: .top) {
42: .frame(height: 1)
45: .background {
50: .background {
51: Color.clear.contentShape(Rectangle())
```

## ExcalidrawZ/Sidebar/Temporary/TemporaryFileListView.swift

49 lines. Check platform/build reachability at the call site.

```text
22: LazyVStack(alignment: .leading) {
27: .animation(.default, value: fileState.temporaryFiles)
28: .padding(.horizontal, 8)
29: .padding(.vertical, 12)
31: .background {
33: .contentShape(Rectangle())
```

## ExcalidrawZ/Sidebar/Temporary/TemporaryFileMenu.swift

360 lines. Check platform/build reachability at the call site.

```text
90: animation: .default
98: animation: .default
```

## ExcalidrawZ/Sidebar/Temporary/TemporaryGroupContextMenu.swift

232 lines. Check platform/build reachability at the call site.

```text
23: animation: .default
30: animation: .default
```

## ExcalidrawZ/Sidebar/Temporary/TemporaryGroupRowView.swift

49 lines. Check platform/build reachability at the call site.

```text
27: .frame(width: 30, alignment: .leading)
31: .contentShape(Rectangle())
33: .buttonStyle(
```

## ExcalidrawZ/Sidebar/components/CreateFolderSheetView.swift

97 lines. Check platform/build reachability at the call site.

```text
38: .presentationDetents([.height(140)])
39: .presentationDragIndicator(.visible)
43: .scrollDisabled(true)
44: .frame(width: 400, height: 140)
46: .presentationSizing(.fitted)
95: .controlSize(.large)
```

## ExcalidrawZ/Sidebar/components/CreateGroupSheetView.swift

250 lines. Check platform/build reachability at the call site.

```text
35: animation: .smooth
48: .scrollDisabled(true)
50: .frame(width: 400, height: 160)
51: .presentationSizing(.fitted)
53: .frame(width: 400, height: 140)
80: animation: .smooth
88: .controlSize(.large)
154: .frame(width: 400)
159: .buttonStyle(.automatic)
170: .frame(width: 40, alignment: .trailing)
173: .focused($isFieldFocused)
194: .fontWeight(.bold)
213: .padding()
```

## ExcalidrawZ/Sidebar/components/FileContextMenu.swift

516 lines. Check platform/build reachability at the call site.

```text
233: animation: .default
334: .foregroundStyle(.red)
378: .foregroundStyle(.red)
```

## ExcalidrawZ/Sidebar/components/FileRowButton.swift

69 lines. Check platform/build reachability at the call site.

```text
61: .animation(.easeOut(duration: 0.1), value: isMultiSelected)
```

## ExcalidrawZ/Sidebar/components/FileRowLabel.swift

415 lines. Check platform/build reachability at the call site.

```text
61: HStack(spacing: 10) {
69: .frame(width: 18, height: 16)
77: .lineLimit(1)
78: .truncationMode(.middle)
79: .padding(.leading, 2 + CGFloat(depth+1) * 12)
89: .foregroundStyle(Color.accentColor)
94: .foregroundStyle(Color.accentColor)
97: .opacity(isInTrash ? 0.3 : 1.0)
115: .font(.system(size: 8.5, weight: .bold))
116: .foregroundStyle(.secondary)
121: .padding(1.5)
122: .background(editorChromeSurface(), in: Circle())
123: .offset(x: 5, y: 4)
124: .animation(.smooth(duration: 0.18), value: lockBadgeSystemName)
127: .padding(1.5)
128: .background(editorChromeSurface(), in: Circle())
129: .offset(x: 5, y: 4)
130: .animation(.easeInOut(duration: 0.18), value: lockBadgeSystemName)
413: .scaleEffect(1.5, anchor: .bottomTrailing)
```

## ExcalidrawZ/Sidebar/components/GroupContextMenu.swift

606 lines. Check platform/build reachability at the call site.

```text
88: animation: .default
253: .tint(.red)
374: animation: .default
381: animation: .default
```

## ExcalidrawZ/Sidebar/components/LockedFileAccessSheet.swift

804 lines. Check platform/build reachability at the call site.

```text
55: private let recoveryKeyControlHeight: CGFloat = 44
87: VStack(spacing: 0) {
88: VStack(alignment: .leading, spacing: 18) {
100: .padding(24)
102: HStack(spacing: 10) {
106: .padding(.horizontal, 24)
107: .padding(.top, 10)
108: .padding(.bottom, 22)
150: .frame(width: 560)
156: HStack(alignment: .center, spacing: 14) {
159: VStack(alignment: .leading, spacing: 5) {
161: .font(.title2.weight(.semibold))
164: .font(.callout)
165: .foregroundStyle(.secondary)
166: .lineLimit(2)
169: .frame(maxWidth: .infinity, alignment: .leading)
177: .font(.system(size: 20, weight: .semibold))
178: .foregroundStyle(tint)
179: .frame(width: 46, height: 46)
185: VStack(alignment: .leading, spacing: 18) {
193: .opacity(0)
194: .accessibilityHidden(true)
207: .font(.callout)
208: .foregroundStyle(.secondary)
217: .font(.callout)
218: .foregroundStyle(.secondary)
226: .opacity(0)
227: .accessibilityHidden(true)
230: .font(.callout)
231: .foregroundStyle(.secondary)
238: HStack(spacing: 10) {
239: HStack(spacing: 10) {
241: .controlSize(.small)
243: .font(.system(.callout, design: .monospaced).weight(.semibold))
244: .foregroundStyle(.secondary)
246: .padding(.horizontal, 16)
247: .frame(height: recoveryKeyControlHeight)
248: .frame(maxWidth: .infinity, alignment: .leading)
260: .font(.callout.weight(.medium))
272: iconFrame: CGSize(width: recoveryKeyControlHeight, height: recoveryKeyControlHeight),
276: .editorChromeButtonStyle(style: .glass, size: .regular, shape: .circle)
278: .opacity(isHidden ? 0 : 1)
279: .accessibilityHidden(isHidden)
288: .frame(width: recoveryKeyControlHeight, height: recoveryKeyControlHeight)
290: .editorChromeButtonStyle(style: .glass, size: .regular, shape: .circle)
292: .opacity(isHidden ? 0 : 1)
293: .accessibilityHidden(isHidden)
294: .help(String(localizable: .lockedContentSaveRecoveryKeyHelp))
299: VStack(alignment: .leading, spacing: 12) {
319: .padding(.horizontal, 14)
320: .padding(.vertical, 13)
326: HStack(alignment: .top, spacing: 12) {
328: .font(.system(size: 14, weight: .semibold))
329: .foregroundStyle(tint)
330: .frame(width: 24, height: 24)
331: .background(tint.opacity(0.15), in: Circle())
333: VStack(alignment: .leading, spacing: 2) {
335: .font(.subheadline.weight(.semibold))
337: .font(.caption)
338: .foregroundStyle(.secondary)
342: .frame(maxWidth: .infinity, alignment: .leading)
348: VStack(alignment: .leading, spacing: 8) {
350: .font(.callout)
351: .foregroundStyle(.red)
359: .font(.callout.weight(.medium))
361: .buttonStyle(.plain)
362: .foregroundStyle(.red)
371: VStack(alignment: .leading, spacing: 12) {
373: .font(.callout)
374: .foregroundStyle(.secondary)
387: .editorChromeButtonStyle(style: .glass, size: .large, shape: .capsule)
397: HStack(spacing: 10) {
399: .font(.system(.callout, design: .monospaced).weight(.semibold))
401: .lineLimit(1)
403: .padding(.horizontal, 16)
404: .frame(height: recoveryKeyControlHeight)
405: .frame(maxWidth: .infinity, alignment: .leading)
417: .font(.system(.body, design: .monospaced))
419: .padding(.horizontal, 16)
420: .frame(height: recoveryKeyControlHeight)
440: HStack(spacing: 10) {
444: .keyboardShortcut(.cancelAction)
445: .editorChromeButtonStyle(style: .glass, size: .large, shape: .capsule)
455: .keyboardShortcut(.defaultAction)
456: .editorChromeButtonStyle(style: .glassProminent, size: .large, shape: .capsule)
719: .background(.quaternary, in: Capsule())
720: .overlay {
721: Capsule()
722: .stroke(.primary.opacity(0.06), lineWidth: 1)
726: .background(.quaternary, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
727: .overlay {
728: RoundedRectangle(cornerRadius: 8, style: .continuous)
729: .stroke(.primary.opacity(0.06), lineWidth: 1)
747: .background {
748: Circle()
750: .editorChromeGlassEffect(
751: Glass.regular.tint(tint.opacity(0.14)),
752: in: Circle()
757: .background(tint.opacity(0.16), in: Circle())
772: let shape = RoundedRectangle(cornerRadius: 24, style: .continuous)
776: .background {
779: .editorChromeGlassEffect(
780: Glass.regular.tint(tint.opacity(0.045)),
784: .overlay {
786: .stroke(tint.opacity(0.08), lineWidth: 1)
790: .background(editorChromeSurface(), in: shape)
791: .background(tint.opacity(0.035), in: shape)
792: .overlay {
794: .stroke(tint.opacity(0.08), lineWidth: 1)
```

## ExcalidrawZ/Sidebar/components/MissingFileMenu.swift

529 lines. Check platform/build reachability at the call site.

```text
285: .foregroundStyle(.red)
307: VStack(spacing: 0) {
309: VStack(alignment: .leading, spacing: 8) {
311: .font(.title2)
312: .fontWeight(.bold)
315: .font(.body)
316: .foregroundStyle(.secondary)
318: .padding()
319: .frame(maxWidth: .infinity, alignment: .leading)
325: VStack(spacing: 0) {
331: .contentShape(Rectangle())
351: .keyboardShortcut(.cancelAction)
352: .editorChromeButtonStyle(style: .glass, shape: .modern)
358: .padding()
361: .frame(
401: .keyboardShortcut(.defaultAction)
403: .editorChromeButtonStyle(style: .glassProminent, shape: .modern)
441: @State private var fileSize: Int = 0
445: HStack(spacing: 12) {
451: .background(Color.gray.opacity(0.1))
452: .clipShape(RoundedRectangle(cornerRadius: 6))
457: .controlSize(.small)
460: .foregroundStyle(.secondary)
463: .frame(width: 80, height: 60)
464: .background(Color.gray.opacity(0.1))
465: .clipShape(RoundedRectangle(cornerRadius: 6))
469: VStack(alignment: .leading, spacing: 4) {
472: .font(.headline)
475: .font(.headline)
476: .foregroundStyle(.secondary)
479: HStack(spacing: 8) {
481: .font(.caption)
482: .foregroundStyle(.secondary)
485: .foregroundStyle(.secondary)
488: .font(.caption)
489: .foregroundStyle(.secondary)
498: .foregroundStyle(.blue)
501: .padding(.horizontal, 12)
502: .padding(.vertical, 8)
503: .background(isSelected ? Color.accentColor.opacity(0.1) : Color.clear)
```

## ExcalidrawZ/Sidebar/components/MoveToGroupMenu.swift

131 lines. Check platform/build reachability at the call site.

```text
84: animation: .default
```

## ExcalidrawZ/Sidebar/components/NavigationShellTheme.swift

79 lines. Check platform/build reachability at the call site.

```text
37: var height: CGFloat = 32
38: var cornerRadius: CGFloat = 6
42: NavigationShellButtonBody(configuration: configuration, accent: accent, bordered: bordered, height: height, cornerRadius: cornerRadius, circular: circular)
52: let bordered: Bool
53: let height: CGFloat
59: .font(.system(size: 13, weight: .medium))
60: .padding(.horizontal, circular ? 0 : 10)
61: .frame(width: circular ? height : nil, height: height)
62: .foregroundStyle(configuration.role == .destructive ? Color.red :
64: .background {
65: RoundedRectangle(cornerRadius: cornerRadius)
69: .overlay {
71: RoundedRectangle(cornerRadius: cornerRadius)
72: .strokeBorder(NavigationShellTheme.border(for: colorScheme), lineWidth: 1)
75: .opacity(isEnabled ? (configuration.isPressed ? 0.7 : 1) : 0.4)
76: .contentShape(RoundedRectangle(cornerRadius: cornerRadius))
77: .onHover { isHovered = $0 }
```

## ExcalidrawZ/Sidebar/components/SidebarRowModifier.swift

90 lines. Check platform/build reachability at the call site.

```text
24: private let cornerRadius: CGFloat = 6
27: HStack(spacing: 0) {
31: .padding(.horizontal, 8)
32: .padding(.vertical, 6)
33: .foregroundStyle(
38: .contentShape(Rectangle())
39: .onHover { hovering in
42: .background(rowBackground)
43: .padding(.vertical, 1)
44: .overlay {
46: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
47: .stroke(NavigationShellTheme.primary(for: colorScheme), lineWidth: 1.5)
50: .animation(.easeInOut(duration: 0.16), value: isActive)
55: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
61: .opacity(isActive ? (isPressed ? 0.82 : 1) : 0)
```

## ExcalidrawZ/Sidebar/components/SidebarSectionAddIcon.swift

18 lines. Check platform/build reachability at the call site.

```text
13: .font(.caption.weight(.semibold))
14: .foregroundStyle(.secondary)
15: .frame(width: 18, height: 18)
16: .accessibilityLabel(accessibilityLabel)
```

## ExcalidrawZ/Sidebar/components/TreeStructureView.swift

178 lines. Check platform/build reachability at the call site.

```text
42: var paddingLeading: CGFloat
50: paddingLeading: CGFloat = 0,
67: paddingLeading: CGFloat = 0,
82: var paddingBase: CGFloat { 14 }
83: @State private var height: CGFloat = .zero
91: VStack(alignment: .leading, spacing: 0) {
96: .overlay(alignment: .leading) {
100: .frame(width: 1)
101: .offset(x: -8 + paddingLeading)
110: LazyVStack(alignment: .leading, spacing: 0) {
114: VStack(alignment: .leading, spacing: 0) {
128: .padding(.leading, paddingBase)
129: .overlay(alignment: .topLeading) {
130: HStack(spacing: 0) {
131: VStack(spacing: 0) {
134: .frame(width: 1, height: height / 2)
138: .frame(width: 1, height: height / 2)
139: .opacity(isLast ? 0 : 1)
144: .frame(width: 5, height: 1)
146: .padding(.leading, 6 + paddingLeading)
160: TreeStructureView(children: children, paddingLeading: 10) {
162: Image(systemSymbol: .folder).font(.footnote)
166: TreeStructureView(children: child.children, paddingLeading: 10) {
168: Image(systemSymbol: .folder).font(.footnote)
176: .padding(40)
```

## ExcalidrawZ/SidebarTrailing/AIChat/AIChatIslandProposal.swift

213 lines. Check platform/build reachability at the call site.

```text
82: CollapsibleSpacingVStack(spacing: 10) {
93: .animation(.easeInOut(duration: 0.22), value: activeProposal?.messageID)
193: width: islandWidth,
200: let width: CGFloat?
206: content.frame(width: width)
209: .frame(maxWidth: .infinity)
210: .padding(.horizontal, horizontalPadding)
```

## ExcalidrawZ/SidebarTrailing/AIChat/AIChatIslandView.swift

977 lines. Check platform/build reachability at the call site.

```text
39: @State private var measuredHeight: CGFloat = 0
47: private let previewMaxHeight: CGFloat = 200
54: private let bottomPadding: CGFloat = 24
66: var islandWidth: CGFloat {
133: CollapsibleSpacingVStack(spacing: 10) {
164: .offset(
165: x: isDraggable ? layoutState.aiChatIslandOffset.width + dragDelta.width : 0,
166: y: isDraggable ? layoutState.aiChatIslandOffset.height + dragDelta.height : 0
197: .transition(.opacity)
200: .font(.body)
201: .transition(.opacity)
204: .background {
205: islandBackground(shape: Capsule())
206: .contentShape(Rectangle())
209: .frame(height: 36, alignment: .bottom)
223: .frame(width: islandWidth)
228: VStack(alignment: .leading, spacing: 10) {
233: .transition(.opacity)
248: .padding(layoutConfiguration.contentPadding)
253: .animation(
257: .animation(
261: .frame(width: islandWidth)
262: .background {
264: shape: RoundedRectangle(cornerRadius: layoutConfiguration.cornerRadius),
265: fallbackShape: RoundedRectangle(cornerRadius: layoutConfiguration.fallbackCornerRadius)
267: .contentShape(Rectangle())
274: .overlay(
275: RoundedRectangle(cornerRadius: layoutConfiguration.cornerRadius)
276: .stroke(.separator, lineWidth: 0.5)
284: HStack(spacing: 4) {
286: .foregroundStyle(.secondary)
287: .font(.caption)
289: .foregroundStyle(.secondary)
290: .font(.caption)
299: .font(.system(size: 14))
300: .foregroundStyle(.secondary)
301: .frame(width: 30, height: 30)
304: .font(.system(size: 14))
305: .foregroundStyle(.secondary)
306: .frame(width: 30, height: 30)
309: .buttonStyle(.plain)
310: .contentShape(Rectangle())
314: .help(.localizable(.aiChatButtonInspectMode))
316: .hoverCursor(.grabIdle, forceAppKit: true)
326: width: layoutState.aiChatIslandOffset.width + value.translation.width,
327: height: layoutState.aiChatIslandOffset.height + value.translation.height
353: let islandSize = CGSize(width: islandWidth, height: measuredHeight)
393: return CGSize(width: clampedDX, height: clampedDY)
403: .font(.callout)
404: .frame(maxWidth: .infinity, alignment: .leading)
405: .padding(8)
407: .frame(maxHeight: previewMaxHeight)
408: .background(
409: RoundedRectangle(cornerRadius: 10)
410: .fill(Color.gray.opacity(0.12))
440: let width: CGFloat
454: width: max(260, min(420, availableWidth)),
464: width: 420,
520: private let tickerDuration: Duration = .seconds(3)
800: private let revealDuration: TimeInterval = 1.0
806: private let eraseDuration: TimeInterval = 0.6
827: HStack(spacing: 6) {
829: .foregroundStyle(progressGradient)
832: .lineLimit(1)
833: .truncationMode(.tail)
834: .foregroundStyle(.primary)
837: .font(.body)
838: .padding(.horizontal, 14)
839: .padding(.vertical, 6)
840: .frame(maxWidth: .infinity, alignment: .leading)
842: .background { progressGlow }
920: TimelineView(.animation) { ctx in
922: LinearGradient(
924: .init(color: .black, location: 0),
925: .init(color: .black, location: max(0, min(1, p - 0.08))),
926: .init(color: .clear, location: max(0, min(1, p))),
927: .init(color: .clear, location: 1)
970: Capsule()
973: .blur(radius: 20)
974: .opacity(0.55)
```

## ExcalidrawZ/SidebarTrailing/AIChat/AIImagePayloadOptimizer.swift

228 lines. Check platform/build reachability at the call site.

```text
119: width: targetWidth,
120: height: targetHeight,
132: context.fill(CGRect(x: 0, y: 0, width: targetWidth, height: targetHeight))
134: context.draw(sourceImage, in: CGRect(x: 0, y: 0, width: targetWidth, height: targetHeight))
184: width: max(1, (sourcePixelSize.width * scale).rounded()),
185: height: max(1, (sourcePixelSize.height * scale).rounded())
204: width: image.size.width * image.scale,
205: height: image.size.height * image.scale
209: let size = CGSize(width: cgImage.width, height: cgImage.height)
212: return CGSize(width: size.height, height: size.width)
```

## ExcalidrawZ/SidebarTrailing/AIChat/AIProposalSandbox.swift

145 lines. Check platform/build reachability at the call site.

```text
116: core.webView.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
```

## ExcalidrawZ/SidebarTrailing/AIChat/Tools/AICameraDirector.swift

361 lines. Check platform/build reachability at the call site.

```text
353: width: abs(width),
354: height: abs(height)
```

## ExcalidrawZ/SidebarTrailing/AIChat/Tools/AdjustElementsTool/AdjustElementsTool+AddLabeledShapeOperation.swift

120 lines. Check platform/build reachability at the call site.

```text
35: height: height,
52: backgroundColor: style.backgroundColor ?? "transparent",
58: opacity: style.opacity ?? 100,
59: width: width,
60: height: height,
83: backgroundColor: "transparent",
89: opacity: style.opacity ?? 100,
90: width: textWidth,
91: height: textHeight,
```

## ExcalidrawZ/SidebarTrailing/AIChat/Tools/AdjustElementsTool/AdjustElementsTool+FrameOperation.swift

92 lines. Check platform/build reachability at the call site.

```text
17: let padding = op.padding ?? 16
19: throw AdjustmentError(message: "createFrame.padding must be a finite number greater than or equal to zero.")
27: padding: padding,
56: frameElement.type == .frame else {
```

## ExcalidrawZ/SidebarTrailing/AIChat/Tools/AdjustElementsTool/AdjustElementsTool+MermaidOperation.swift

75 lines. Check platform/build reachability at the call site.

```text
28: canvasActions.append(.insertLatex(LatexOp(op: op.op, latex: latex, color: color)))
31: private func normalizedMathColor(_ color: String?) throws -> String? {
```

## ExcalidrawZ/SidebarTrailing/AIChat/Tools/AdjustElementsTool/AdjustElementsTool+UpdateOperation.swift

334 lines. Check platform/build reachability at the call site.

```text
50: backgroundColor: &item.backgroundColor,
53: opacity: &item.opacity,
124: backgroundColor: &item.backgroundColor,
127: opacity: &item.opacity,
172: backgroundColor: &item.backgroundColor,
175: opacity: &item.opacity,
194: backgroundColor: &item.backgroundColor,
197: opacity: &item.opacity,
217: backgroundColor: &item.backgroundColor,
220: opacity: &item.opacity,
```

## ExcalidrawZ/SidebarTrailing/AIChat/Tools/AdjustElementsTool/AdjustElementsTool+WrapOperation.swift

166 lines. Check platform/build reachability at the call site.

```text
38: let padding = max(0, op.padding ?? 24)
57: backgroundColor: style.backgroundColor ?? "transparent",
63: opacity: style.opacity ?? 100,
64: width: wrapperWidth,
65: height: wrapperHeight,
96: backgroundInsertIndex: targetIndexes.min() ?? existingElements.count
132: backgroundColor: "transparent",
138: opacity: style.opacity ?? 100,
139: width: width,
140: height: height,
```

## ExcalidrawZ/SidebarTrailing/AIChat/Tools/AdjustElementsTool/AdjustElementsTool.swift

1560 lines. Check platform/build reachability at the call site.

```text
649: let width: Double?
650: let height: Double?
671: let width: Double?
672: let height: Double?
687: let padding: Double?
698: let padding: Double?
722: let color: String?
756: let width: Double?
757: let height: Double?
774: let gap: Double?
792: let width: Double?
793: let height: Double?
798: let backgroundColor: String?
801: let opacity: Double?
884: let backgroundInsertIndex: Int
1193: height: Double,
1213: backgroundColor: "#dbeafe",
1216: opacity: 100,
1225: backgroundColor: "#fef3c7",
1228: opacity: 100,
1237: backgroundColor: nil,
1240: opacity: 100,
1267: var width: Double = 0
1323: _ width: inout Double,
1324: _ height: inout Double,
1344: backgroundColor: inout String,
1347: opacity: inout Double,
1363: if let value = style.opacity {
1392: backgroundColor: override.backgroundColor ?? backgroundColor,
1395: opacity: override.opacity ?? opacity,
1410: backgroundColor: String,
1416: opacity: Double,
1417: width: Double,
1418: height: Double,
1454: self.opacity = opacity
1491: backgroundColor: String,
1497: opacity: Double,
1498: width: Double,
1499: height: Double,
1534: self.opacity = opacity
```

## ExcalidrawZ/SidebarTrailing/AIChat/Tools/AdjustElementsTool/ExcalidrawCanvasActionApplier.swift

314 lines. Check platform/build reachability at the call site.

```text
178: padding: op.padding,
255: width: bounds.width,
256: height: bounds.height
```

## ExcalidrawZ/SidebarTrailing/AIChat/Tools/InsertMathTool/InsertMathTool.swift

391 lines. Check platform/build reachability at the call site.

```text
78: width: insertResult.width ?? renderedSVG.width,
79: height: insertResult.height ?? renderedSVG.height,
156: var color: String?
158: init(expression: String, color: String?) {
180: var color: String?
183: var width: Double?
184: var height: Double?
192: var backgroundColor: String?
273: width: clampedDimension(width, fallback: 520),
274: height: clampedDimension(height, fallback: 520),
282: backgroundColor: normalizedBackgroundColor,
296: inputExpressions = [FunctionExpression(expression: expression, color: nil)]
380: var width: Double?
381: var height: Double?
```

## ExcalidrawZ/SidebarTrailing/AIChat/Tools/NavigateCanvasTool/NavigateCanvasTool.swift

413 lines. Check platform/build reachability at the call site.

```text
219: case .scrollToCenter:
221: try await coordinator.scrollToCenter()
235: case .scrollToElement:
242: try await coordinator.scrollToElement(
389: if let scrollX = patch.scrollX, !approximatelyEqual(camera.scrollX, scrollX) {
392: if let scrollY = patch.scrollY, !approximatelyEqual(camera.scrollY, scrollY) {
405: approximatelyEqual(lhs.scrollX, rhs.scrollX) &&
406: approximatelyEqual(lhs.scrollY, rhs.scrollY) &&
```

## ExcalidrawZ/SidebarTrailing/AIChat/Tools/ReadCanvasImageTool.swift

273 lines. Check platform/build reachability at the call site.

```text
184: "size=\(Self.sizeDescription(width: export.width, height: export.height)).",
220: private static func sizeDescription(width: Double?, height: Double?) -> String {
```

## ExcalidrawZ/SidebarTrailing/AIChat/Tools/ReadFileTool/ReadFileTool.swift

875 lines. Check platform/build reachability at the call site.

```text
172: let offset = max(0, params.offset ?? 0)
308: let width: Double
309: let height: Double
323: let gap: Double?
335: let width: Double
336: let height: Double
702: bounds: Bounds(x: item.x, y: item.y, width: item.width, height: item.height),
712: bounds: Bounds(x: item.x, y: item.y, width: item.width, height: item.height),
722: bounds: Bounds(x: item.x, y: item.y, width: item.width, height: item.height),
732: bounds: Bounds(x: item.x, y: item.y, width: item.width, height: item.height),
742: bounds: Bounds(x: item.x, y: item.y, width: item.width, height: item.height),
752: bounds: Bounds(x: item.x, y: item.y, width: item.width, height: item.height),
762: bounds: Bounds(x: item.x, y: item.y, width: item.width, height: item.height),
772: bounds: Bounds(x: item.x, y: item.y, width: item.width, height: item.height),
782: bounds: Bounds(x: item.x, y: item.y, width: item.width, height: item.height),
792: bounds: Bounds(x: item.x, y: item.y, width: item.width, height: item.height),
839: gap: nil
848: gap: legacy.gap
869: width: crop.width,
870: height: crop.height,
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/AIChatView/AIChatView+Actions.swift

638 lines. Check platform/build reachability at the call site.

```text
609: try? await Task.sleep(for: .seconds(ChatScrollAnimation.scrollDuration + 0.12))
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/AIChatView/AIChatView+MessagePlaceholders.swift

48 lines. Check platform/build reachability at the call site.

```text
12: VStack(spacing: 12) {
15: .controlSize(.small)
17: .font(.caption)
18: .foregroundStyle(.secondary)
21: .frame(maxWidth: .infinity, maxHeight: .infinity)
26: VStack(spacing: 20) {
31: .frame(height: 40)
32: .foregroundStyle(.secondary)
34: VStack(spacing: 10) {
36: .foregroundStyle(.secondary)
37: .font(.title3)
39: .font(.caption)
40: .foregroundStyle(.secondary)
42: .padding(.horizontal, 20)
46: .frame(maxWidth: .infinity, maxHeight: .infinity)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/AIChatView/AIChatView+MessageScrollState.swift

123 lines. Check platform/build reachability at the call site.

```text
112: for: .seconds(ChatScrollAnimation.scrollDuration + 0.5)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/AIChatView/AIChatView+Messages.swift

177 lines. Check platform/build reachability at the call site.

```text
133: .overlay(alignment: .bottom) {
141: .modernButtonStyle(style: .glass, shape: .circle)
142: .transition(.opacity)
143: .padding()
144: .padding(.bottom, bottomContentPadding)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/AIChatView/AIChatView+SupportViews.swift

121 lines. Check platform/build reachability at the call site.

```text
63: HStack(spacing: 8) {
66: .controlSize(.small)
67: .scaleEffect(0.55)
68: .frame(width: 12, height: 12)
71: .font(.caption2.weight(.semibold))
78: .font(.caption2)
80: .foregroundStyle(.secondary)
81: .frame(maxWidth: .infinity)
82: .padding(.vertical, 6)
103: HStack(spacing: 8) {
105: .foregroundStyle(AIAppearancePalette.foregroundGradient)
107: .font(.caption)
108: .foregroundStyle(.secondary)
112: .font(.caption)
114: .buttonStyle(.plain)
115: .keyboardShortcut(.cancelAction)
116: .help(.generalButtonCancel)
118: .padding(.horizontal, 10)
119: .padding(.vertical, 7)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/AIChatView/AIChatView+Toolbar.swift

161 lines. Check platform/build reachability at the call site.

```text
139: .help(String(localizable: .aiChatButtonIslandModeHelp))
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/AIChatView/AIChatView.swift

499 lines. Check platform/build reachability at the call site.

```text
52: @State var chatInputControlsHeight: CGFloat = 0
161: .transition(.opacity)
164: .transition(.opacity)
167: .frame(maxWidth: .infinity, maxHeight: .infinity)
186: .background {
259: .presentationContentInteraction(.scrolls)
272: .frame(width: 0, height: 0)
279: .frame(width: 0, height: 0)
315: VStack(spacing: 0) {
319: .padding(.bottom, 10)
322: .frame(maxWidth: .infinity, maxHeight: .infinity)
354: .opacity(isMessageListInitiallySettled || shouldShowConversationLoadingPlaceholder ? 1 : 0)
355: .animation(.easeOut(duration: 0.12), value: isMessageListInitiallySettled)
365: .frame(maxWidth: .infinity, maxHeight: .infinity)
370: VStack(spacing: 6) {
382: .transition(.opacity)
385: VStack(spacing: 0) {
388: .padding(.horizontal, 10)
389: .font(.caption)
390: .offset(y: 18)
409: .transition(.move(edge: .bottom).combined(with: .opacity))
423: .padding(.horizontal, 10)
430: .animation(
434: .animation(
438: .animation(
492: .frame(width: 250, height: 600)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/AIChatWelcomeView.swift

559 lines. Check platform/build reachability at the call site.

```text
50: VStack(spacing: 0) {
54: .padding(.bottom, 18)
57: .padding(.horizontal, 16)
58: .padding(.bottom, 18)
61: .padding(.horizontal, 16)
62: .padding(.bottom, 20)
65: .padding(.horizontal, 16)
66: .padding(.bottom, 24)
71: .background {
116: TimelineView(.animation(minimumInterval: 1 / 24, paused: false)) { context in
128: VStack(spacing: 0) {
129: LinearGradient(
131: Color(hue: topHueA, saturation: 0.62, brightness: 0.98).opacity(0.28),
132: Color(hue: topHueB, saturation: 0.48, brightness: 0.96).opacity(0.14),
138: .frame(height: proxy.size.height * 0.4)
139: .blur(radius: 26)
140: .offset(x: 0, y: (isBackgroundPresented ? -12 : -140) + topDrift)
141: .opacity(isBackgroundPresented ? 1 : 0)
145: LinearGradient(
148: Color(hue: bottomHueB, saturation: 0.5, brightness: 0.92).opacity(0.14),
149: Color(hue: bottomHueA, saturation: 0.56, brightness: 0.94).opacity(0.28)
154: .frame(height: proxy.size.height * 0.44)
155: .blur(radius: 28)
156: .offset(x: 0, y: (isBackgroundPresented ? 14 : 170) + bottomDrift)
157: .opacity(isBackgroundPresented ? 1 : 0)
160: Circle()
161: .fill(Color(hue: topHueA, saturation: 0.62, brightness: 1).opacity(0.1))
162: .frame(width: 220, height: 220)
163: .blur(radius: 48)
164: .offset(x: orbit * 0.8, y: -90 + topDrift * 0.35)
165: .opacity(isBackgroundPresented ? (isDismissing ? 0.24 : 1) : 0)
167: Circle()
168: .fill(Color(hue: bottomHueA, saturation: 0.58, brightness: 0.98).opacity(0.08))
169: .frame(width: 240, height: 240)
170: .blur(radius: 54)
171: .offset(x: -orbit * 0.9, y: 190 + bottomDrift * 0.35)
172: .opacity(isBackgroundPresented ? (isDismissing ? 0.18 : 0.95) : 0)
174: .overlay {
177: Color.white.opacity(0.12),
178: Color(hue: topHueA, saturation: 0.5, brightness: 1).opacity(0.06),
185: .offset(x: 0, y: -24)
186: .opacity(isBackgroundPresented ? (isDismissing ? 0.14 : 1) : 0)
188: .frame(maxWidth: .infinity, maxHeight: .infinity)
192: .opacity(isDismissing ? 0.7 : 1)
199: VStack(spacing: 14) {
202: VStack(spacing: 6) {
204: .font(.caption.weight(.semibold))
206: .tracking(1.4)
207: .foregroundStyle(.secondary)
210: .font(.title2.weight(.semibold))
211: .tracking(-0.3)
215: .font(.callout)
216: .foregroundStyle(.secondary)
218: .padding(.horizontal, 16)
220: .offset(y: isHeroTextPresented ? 0 : 16)
221: .opacity(isHeroTextPresented ? 1 : 0)
223: .padding(.horizontal, 12)
224: .blur(radius: isDismissing ? 2 : 0)
235: .scaleEffect(heroIconScale)
236: .opacity(heroIconOpacity)
241: HStack(spacing: 10) {
244: LinearGradient(
245: colors: [.clear, Color.secondary.opacity(0.22)],
250: .frame(height: 1)
253: .font(.caption.weight(.semibold))
254: .foregroundStyle(.secondary)
255: .padding(8)
259: LinearGradient(
260: colors: [Color.secondary.opacity(0.22), .clear],
265: .frame(height: 1)
267: .offset(y: breakpointOffset)
268: .opacity(breakpointOpacity)
269: .blur(radius: isDismissing ? 2 : 0)
276: VStack(alignment: .leading, spacing: 10) {
302: .offset(y: featureListOffset)
303: .opacity(featureListOpacity)
304: .blur(radius: isDismissing ? 4 : 0)
311: VStack(spacing: 8) {
316: .modernButtonStyle(style: .glassProminent, size: .extraLarge, shape: .modern)
317: .keyboardShortcut(.defaultAction)
331: .modernButtonStyle(style: .glassProminent, size: .extraLarge, shape: .modern)
332: .keyboardShortcut(.defaultAction)
338: .offset(y: ctaOffset)
339: .opacity(ctaOpacity)
340: .blur(radius: isDismissing ? 4 : 0)
347: .font(.caption.weight(.medium))
348: .foregroundStyle(.primary)
350: .padding(.horizontal, 10)
351: .padding(.vertical, 8)
352: .frame(maxWidth: .infinity)
353: .background {
354: RoundedRectangle(cornerRadius: 10, style: .continuous)
355: .fill(Color.yellow.opacity(0.16))
356: .overlay {
357: RoundedRectangle(cornerRadius: 10, style: .continuous)
358: .stroke(Color.orange.opacity(0.55), lineWidth: 1)
363: .font(.caption2)
364: .foregroundStyle(.tertiary)
370: HStack(spacing: 6) {
372: .fontWeight(.semibold)
374: .font(.callout.weight(.semibold))
376: .frame(maxWidth: .infinity)
382: RoundedRectangle(cornerRadius: 22, style: .continuous)
383: .fill(Color.textBackgroundColor.opacity(0.8))
384: .glassEffect(in: RoundedRectangle(cornerRadius: 22, style: .continuous))
385: .overlay {
386: RoundedRectangle(cornerRadius: 22, style: .continuous)
387: .stroke(Color.white.opacity(0.14), lineWidth: 0.6)
390: RoundedRectangle(cornerRadius: 22, style: .continuous)
392: .overlay {
393: RoundedRectangle(cornerRadius: 22, style: .continuous)
394: .stroke(Color.white.opacity(0.14), lineWidth: 0.6)
502: HStack(alignment: .center, spacing: 12) {
504: Circle()
505: .fill(tint.opacity(0.15))
507: .font(.callout.weight(.semibold))
508: .foregroundStyle(tint)
510: .frame(width: 32, height: 32)
512: VStack(alignment: .leading, spacing: 2) {
514: .font(.callout.weight(.semibold))
516: .font(.caption)
517: .foregroundStyle(.secondary)
521: .padding(.vertical, 12)
522: .padding(.horizontal, 16)
523: .background {
525: Capsule()
527: .glassEffect(.clear.interactive(), in: Capsule())
528: Capsule()
529: .stroke(
530: LinearGradient(
532: Color.white.opacity(0.48),
533: Color.white.opacity(0.08)
542: Capsule()
544: Capsule()
545: .stroke(.separator, lineWidth: 0.5)
549: .padding(1)
556: .frame(width: 280, height: 600)
557: .padding()
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/AIEnableConsentSheet.swift

275 lines. Check platform/build reachability at the call site.

```text
27: .frame(width: 640)
32: VStack(spacing: 0) {
33: VStack(alignment: .leading, spacing: 22) {
36: .padding(24)
38: HStack(spacing: 10) {
43: .padding(.horizontal, 24)
44: .padding(.top, 10)
45: .padding(.bottom, 22)
51: VStack(spacing: 0) {
52: VStack(alignment: .leading, spacing: contentSpacing) {
55: .frame(maxWidth: .infinity, alignment: .leading)
56: .padding(.horizontal, horizontalPadding)
57: .padding(.top, topPadding)
58: .padding(.bottom, 12)
63: .padding(.horizontal, horizontalPadding)
64: .padding(.bottom, bottomPadding)
77: private var contentSpacing: CGFloat {
81: private var rowSpacing: CGFloat {
85: private var horizontalPadding: CGFloat {
89: private var topPadding: CGFloat {
93: private var bottomPadding: CGFloat {
97: private var identityIconSize: CGFloat {
118: .keyboardShortcut(.cancelAction)
122: VStack(alignment: .leading, spacing: 10) {
124: .padding(.bottom, 2)
127: .font(.title2.weight(.semibold))
130: .font(.callout)
131: .foregroundStyle(.secondary)
137: VStack(alignment: .leading, spacing: rowSpacing) {
167: .font(.callout.weight(.medium))
176: VStack(spacing: 10) {
193: .frame(maxWidth: isCompactIOS ? .infinity : nil)
195: .keyboardShortcut(.defaultAction)
196: .modernButtonStyle(style: .glassProminent, size: .large, shape: .capsule)
197: .frame(maxWidth: isCompactIOS ? .infinity : nil)
213: HStack(spacing: 10) {
217: .keyboardShortcut(.cancelAction)
218: .modernButtonStyle(style: .glass, size: .large, shape: .capsule)
226: .keyboardShortcut(.defaultAction)
227: .modernButtonStyle(style: .glassProminent, size: .large, shape: .capsule)
237: HStack(alignment: .top, spacing: 12) {
239: .font(.body.weight(.semibold))
240: .foregroundStyle(Color.accentColor)
241: .frame(width: 22)
243: VStack(alignment: .leading, spacing: 4) {
245: .font(.body.weight(.semibold))
248: .font(.callout)
249: .foregroundStyle(.secondary)
253: .frame(maxWidth: .infinity, alignment: .leading)
257: HStack(spacing: 14) {
268: .font(.callout.weight(.semibold))
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/AIIdentityIcon.swift

75 lines. Check platform/build reachability at the call site.

```text
14: Circle()
16: LinearGradient(
18: Color.accentColor.opacity(0.36),
19: Color.purple.opacity(0.24),
20: Color.pink.opacity(0.16)
26: .frame(width: glowSize, height: glowSize)
27: .blur(radius: glowBlur)
30: Circle()
33: Circle()
34: .stroke(
35: LinearGradient(
37: Color.white.opacity(0.68),
38: Color.white.opacity(0.08)
47: .font(.system(size: symbolSize, weight: .semibold))
48: .foregroundStyle(AIAppearancePalette.foregroundGradient)
50: .frame(width: size, height: size)
52: .shadow(color: .accentColor.opacity(0.12), radius: shadowRadius, y: shadowYOffset)
53: .accessibilityLabel(Text(verbatim: "AI"))
56: private var glowSize: CGFloat {
64: private var symbolSize: CGFloat {
68: private var shadowRadius: CGFloat {
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/ChatScrollView/ChatScrollEnvironment.swift

26 lines. Check platform/build reachability at the call site.

```text
17: var aiChatTableRowWidth: CGFloat? {
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/ChatScrollView/ChatScrollRowModel.swift

184 lines. Check platform/build reachability at the call site.

```text
35: var pageSize: Int = 20
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/ChatScrollView/ChatScrollView.swift

180 lines. Check platform/build reachability at the call site.

```text
16: static let revealDuration: Double = 0.6
17: static let scrollDuration: Double = 0.6
28: private let bottomContentPadding: CGFloat
29: private let topContentPadding: CGFloat
159: Color.clear.frame(height: topContentPadding)
176: .padding(.vertical, 6)
177: .padding(.horizontal, 12)
178: .frame(maxWidth: .infinity, alignment: .leading)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/ChatScrollView/NativeChatScrollView.swift

836 lines. Check platform/build reachability at the call site.

```text
48: private let bottomContentPadding: CGFloat
113: VStack(spacing: 0) {
115: Color.clear.frame(height: 20 + bottomContentPadding)
117: .padding(.horizontal, 10)
154: var lastDocumentHeight: CGFloat = 0
158: var lastClipWidth: CGFloat = 0
199: self.scrollToBottomRequest = scrollToBottomRequest
241: let newHeight = documentContainer.frame.height
295: guard documentContainer.frame.height > visibleHeight + topLoadThreshold else {
316: let maxY = max(0, documentContainer.frame.height - scrollView.contentView.bounds.height)
336: let docHeight = documentContainer.frame.height
354: y: max(0, documentContainer.frame.height - visibleHeight)
366: ctx.duration = ChatScrollAnimation.scrollDuration
393: self?.scrollToBottom(animated: animated)
426: scrollView.scrollerStyle = .overlay
471: coordinator.scrollView = scrollView
502: context.coordinator.scrollToBottomRequest = $scrollToBottomRequest
519: coordinator.scrollToBottom(animated: animated)
569: var lastContentHeight: CGFloat = 0
602: self.scrollToBottomRequest = scrollToBottomRequest
667: DispatchQueue.main.asyncAfter(deadline: .now() + (animated ? ChatScrollAnimation.scrollDuration + 0.1 : 0.05)) { [weak self] in
737: self?.scrollToBottom(animated: animated)
786: context.coordinator.scrollView = scrollView
797: context.coordinator.scrollToBottomRequest = $scrollToBottomRequest
812: coordinator.scrollToBottom(animated: animated)
827: override var contentSize: CGSize {
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/ChatScrollView/NativeChatStackView.swift

467 lines. Check platform/build reachability at the call site.

```text
47: var lastClipWidth: CGFloat = 0
48: var lastDocumentHeight: CGFloat = 0
73: self.scrollToBottomRequest = scrollToBottomRequest
212: .frame(width: rowWidth, alignment: .topLeading)
261: let newHeight = stackView.frame.height
300: guard stackView.frame.height > visibleHeight + topLoadThreshold else {
321: let docHeight = stackView.frame.height
339: y: max(0, stackView.frame.height - visibleHeight)
345: ctx.duration = ChatScrollAnimation.scrollDuration
385: scrollView.scrollerStyle = .overlay
388: scrollView.scrollerInsets = .init()
416: context.coordinator.scrollView = scrollView
441: context.coordinator.scrollToBottomRequest = $scrollToBottomRequest
454: coordinator.scrollToBottom(animated: animated)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/ChatScrollView/NativeChatTableView.swift

521 lines. Check platform/build reachability at the call site.

```text
48: var lastDocumentHeight: CGFloat = 0
49: var lastClipWidth: CGFloat = 0
77: self.scrollToBottomRequest = scrollToBottomRequest
222: if abs(tableView.frame.width - width) > 0.5 {
224: NSSize(width: width, height: tableView.frame.height)
327: ctx.duration = ChatScrollAnimation.scrollDuration
352: self?.scrollToBottom(animated: animated)
392: scrollView.scrollerStyle = .overlay
395: scrollView.scrollerInsets = .init()
424: context.coordinator.scrollView = scrollView
448: context.coordinator.scrollToBottomRequest = $scrollToBottomRequest
464: coordinator.scrollToBottom(animated: false)
515: subview.frame = bounds
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/ChatScrollView/SwiftUIChatScrollView.swift

209 lines. Check platform/build reachability at the call site.

```text
31: private let bottomContentPadding: CGFloat
68: private let bottomContentPadding: CGFloat
108: LazyVStack(spacing: 0) {
111: Color.clear.frame(height: 20)
113: Color.clear.frame(height: bottomContentPadding)
116: .frame(height: 20)
121: .padding(.horizontal, 10)
145: proxy.scrollTo(bottomAnchorID, anchor: .bottom)
178: proxy.scrollTo(bottomAnchorID, anchor: .bottom)
181: withAnimation(.easeOut(duration: ChatScrollAnimation.scrollDuration)) {
194: self.scrollClipDisabled()
203: self.scrollDismissesKeyboard(.interactively)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/CompactingIndicatorView.swift

47 lines. Check platform/build reachability at the call site.

```text
28: HStack(spacing: 8) {
30: .controlSize(.small)
32: .font(.caption)
33: .foregroundStyle(.secondary)
36: .padding(.horizontal, 12)
37: .padding(.vertical, 8)
38: .background {
39: RoundedRectangle(cornerRadius: 10)
42: .overlay {
43: RoundedRectangle(cornerRadius: 10)
44: .stroke(.separator, lineWidth: 0.5)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/LowCreditsBanner.swift

186 lines. Check platform/build reachability at the call site.

```text
74: .transition(.opacity.combined(with: .move(edge: .bottom)))
76: compactCapsule(balance: balance)
77: .transition(.opacity.combined(with: .scale(scale: 0.92)))
81: .animation(.easeInOut(duration: 0.25), value: shouldShow)
91: HStack(spacing: 6) {
93: .foregroundStyle(.orange)
95: .foregroundStyle(Color.primary.opacity(0.78))
98: .foregroundStyle(Color.primary.opacity(0.62))
100: .padding(.horizontal, 14)
101: .padding(.vertical, 6)
105: .padding(.bottom, peekBottom)
106: .frame(maxWidth: .infinity, alignment: .leading)
108: .tint(Color.yellow.opacity(0.1))
109: .modernButtonStyle(style: .glass, shape: .modern)
113: private func compactCapsule(balance: Double) -> some View {
119: HStack(spacing: 5) {
121: .font(.system(size: 10, weight: .semibold))
122: .foregroundStyle(.orange)
125: .lineLimit(1)
128: .font(.caption2.weight(.semibold))
129: .foregroundStyle(.secondary)
131: .modernButtonStyle(style: .glass, size: .regular, shape: .capsule)
158: HStack(spacing: 4) {
164: .foregroundStyle(AIAppearancePalette.foregroundGradient)
172: .padding()
173: .frame(width: 320)
177: VStack(spacing: -18) {
179: RoundedRectangle(cornerRadius: 20)
181: .frame(height: 60)
183: .padding()
184: .frame(width: 320)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/Messages/AssistantRoundTableRows.swift

332 lines. Check platform/build reachability at the call site.

```text
43: .padding(.bottom, 6)
76: @Environment(\.aiChatTableRowWidth) private var tableRowWidth
83: @State private var measuredHeight: CGFloat?
101: .background(heightReader)
103: .frame(
104: height: measuredHeight ?? AssistantContentHeightCache.shared.height(
161: _ height: CGFloat,
184: HStack(spacing: 0) {
190: Image(systemName: "arrow.clockwise").font(.caption)
192: .foregroundStyle(.secondary)
193: .help("Regenerate response")
196: HStack(spacing: 4) {
200: .font(.footnote)
201: .padding(.horizontal, 4)
202: .padding(.vertical, 2)
203: .background {
204: Capsule().fill(.regularMaterial)
208: .buttonStyle(.text(size: .normal, square: true))
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/Messages/AssistantRoundView.swift

614 lines. Check platform/build reachability at the call site.

```text
85: private static let revealDuration: Double = 0.3
147: VStack(alignment: .leading, spacing: 10) {
152: .transition(.opacity)
168: .opacity(showsActionBar ? 1 : 0)
172: .animation(.easeOut(duration: 0.25), value: showsActionBar)
173: .animation(.easeOut(duration: 0.2), value: showsLoadingRow)
187: VStack(alignment: .leading, spacing: 10) {
219: .padding(.bottom, 6)
538: HStack(spacing: 0) {
544: Image(systemName: "arrow.clockwise").font(.caption)
546: .foregroundStyle(.secondary)
547: .help("Regenerate response")
551: HStack(spacing: 4) {
555: .font(.footnote)
556: .padding(.horizontal, 4)
557: .padding(.vertical, 2)
558: .background {
559: Capsule().fill(.regularMaterial)
563: .buttonStyle(.text(size: .normal, square: true))
604: iconFrame: CGSize(width: 14, height: 14),
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/Messages/ChatTopDownRevealTransition.swift

122 lines. Check platform/build reachability at the call site.

```text
22: .opacity(clamped)
23: .offset(y: (1 - clamped) * -14)
26: VStack(spacing: 0) {
29: .frame(height: proxy.size.height * clamped)
32: .overlay(alignment: .top) {
33: LinearGradient(
35: Color.white.opacity(0.92),
36: Color.white.opacity(0.52),
42: .frame(height: min(28, proxy.size.height * max(clamped, 0.01)))
43: .offset(y: max(0, proxy.size.height * clamped - 28))
44: .opacity(clamped == 0 ? 0 : 1)
61: @State private var measuredHeight: CGFloat = 0
83: .background {
96: .frame(height: targetHeight, alignment: .top)
119: removal: .opacity
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/Messages/CompactRows.swift

147 lines. Check platform/build reachability at the call site.

```text
49: @State private var contentHeight: CGFloat = .zero
52: VStack(alignment: .leading, spacing: 8) {
57: .font(.caption)
58: .foregroundStyle(.secondary)
64: CompactSummaryRowHeightModifier(height: isExpanded ? contentHeight : 80)
67: VStack(spacing: 0) {
72: SmoothLinearGradient(
79: LinearGradient(
86: .frame(height: isExpanded ? 0 : 30)
92: .padding(12)
93: .background {
95: RoundedRectangle(cornerRadius: 20)
97: .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
99: RoundedRectangle(cornerRadius: 12)
101: .overlay {
102: RoundedRectangle(cornerRadius: 12)
103: .stroke(.separator, lineWidth: 0.5)
116: HStack(spacing: 6) {
118: .font(.caption)
120: .font(.caption.weight(.semibold))
123: .font(.caption2)
125: .animation(.easeInOut(duration: 0.15), value: isExpanded)
127: .foregroundStyle(.secondary)
128: .contentShape(Rectangle())
130: .buttonStyle(.plain)
136: init(height: CGFloat) {
145: .frame(height: animatableData, alignment: .top)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/Messages/ErrorMessageRow.swift

67 lines. Check platform/build reachability at the call site.

```text
18: VStack(alignment: .leading, spacing: 10) {
19: HStack(alignment: .top, spacing: 8) {
21: .font(.caption)
22: .foregroundStyle(.red)
23: .padding(.top, 2)
26: .font(.callout)
27: .foregroundStyle(.primary)
28: .lineLimit(5)
29: .truncationMode(.middle)
30: .frame(maxWidth: .infinity, alignment: .leading)
34: HStack(spacing: 6) {
42: .font(.caption)
44: .help(.generalButtonRetry)
47: .buttonStyle(.text(size: .small, square: false))
49: .padding(.horizontal, 14)
50: .padding(.vertical, 12)
51: .frame(maxWidth: .infinity, alignment: .leading)
52: .background {
54: RoundedRectangle(cornerRadius: 18)
56: .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 18))
58: RoundedRectangle(cornerRadius: 14)
62: .overlay {
63: RoundedRectangle(cornerRadius: 18)
64: .stroke(Color.red.opacity(0.18), lineWidth: 0.5)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/Messages/LoadingMessageRow.swift

141 lines. Check platform/build reachability at the call site.

```text
16: private let dotSize: CGFloat = 8
17: private let dotSpacing: CGFloat = 6
18: private let cycleDuration: Double = 1.0
22: TimelineView(.animation) { context in
23: HStack(spacing: dotSpacing) {
25: Circle()
27: .frame(width: dotSize, height: dotSize)
28: .opacity(dotOpacity(index: index, at: context.date))
31: .padding(.horizontal, 14)
32: .padding(.vertical, 12)
33: .background(Color.gray.opacity(0.2), in: Capsule())
49: private static let collapseDuration = 0.22
50: private static let defaultExpandedHeight: CGFloat = 44
53: @State private var measuredHeight: CGFloat = Self.defaultExpandedHeight
67: .padding(.vertical, 6)
68: .padding(.horizontal, 12)
69: .frame(maxWidth: .infinity, alignment: .leading)
70: .background(heightReader)
71: .opacity(Double(expansion))
73: .accessibilityHidden(!isVisible)
76: .frame(height: measuredHeight * expansion, alignment: .top)
77: .frame(maxWidth: .infinity, alignment: .leading)
134: VStack(alignment: .leading, spacing: 16) {
139: .padding()
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/Messages/MessageImageView.swift

57 lines. Check platform/build reachability at the call site.

```text
25: .aspectRatio(contentMode: .fit)
26: .frame(maxWidth: 200, maxHeight: 200)
27: .cornerRadius(8)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/Messages/SmoothStreamingText.swift

195 lines. Check platform/build reachability at the call site.

```text
18: @State private var revealHeight: CGFloat = 0
27: .background {
35: .modifier(RevealHeightModifier(height: revealHeight))
36: .animation(
71: VStack(spacing: 0) {
73: LinearGradient(
78: .frame(height: isStreaming ? 24 : 0, alignment: .bottom)
79: .animation(.smooth, value: isStreaming)
124: var height: CGFloat
133: .frame(
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/Messages/UserMessageBubble.swift

195 lines. Check platform/build reachability at the call site.

```text
56: VStack(alignment: .trailing, spacing: 4) {
62: .opacity(showsAction ? 1 : 0)
64: .animation(.smooth, value: showsAction)
84: HStack(spacing: 4) {
96: .font(.caption)
98: .buttonStyle(.text(size: .small, square: true))
99: .foregroundStyle(.secondary)
101: .opacity(isActionDisabled ? 0 : 1)
102: .animation(.smooth, value: isActionDisabled)
117: HStack(spacing: 6) {
122: .frame(height: 160)
158: .background {
159: RoundedRectangle(cornerRadius: 20)
164: .background {
165: RoundedRectangle(cornerRadius: 20)
173: VStack(alignment: .trailing, spacing: 6) {
180: .foregroundStyle(.secondary)
181: .buttonStyle(.text(size: .small))
182: .foregroundStyle(.secondary)
185: .padding(10)
189: .padding(12)
190: .frame(maxWidth: .infinity, alignment: .leading)
192: .frame(minWidth: 360, idealWidth: 480, maxWidth: 560, minHeight: 180, idealHeight: 360, maxHeight: 520)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/PendingQueueView.swift

115 lines. Check platform/build reachability at the call site.

```text
58: VStack(alignment: .leading, spacing: 4) {
61: .transition(.asymmetric(
65: insertion: .opacity.combined(with: .move(edge: .bottom)),
66: removal: .opacity.combined(with: .move(edge: .top))
74: .padding(.horizontal, 14)
75: .padding(.vertical, 6)
77: .animation(.smooth, value: messages)
78: .background {
80: RoundedRectangle(cornerRadius: 24)
82: .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 24))
84: RoundedRectangle(cornerRadius: 12)
93: HStack(spacing: 8) {
95: .font(.caption)
96: .foregroundStyle(.secondary)
98: .font(.caption)
99: .foregroundStyle(.secondary)
100: .lineLimit(2)
106: .font(.caption2)
107: .foregroundStyle(.tertiary)
108: .padding(4)
109: .contentShape(Rectangle())
111: .buttonStyle(.plain)
112: .help(.localizable(.aiChatPendingQueueButtonRemove))
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/PromptInput/AIChatAttachmentMenu.swift

269 lines. Check platform/build reachability at the call site.

```text
100: .frame(width: 0, height: 0)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/PromptInput/ApprovalPromptView.swift

234 lines. Check platform/build reachability at the call site.

```text
44: .transition(.opacity)
65: VStack(alignment: .leading, spacing: 10) {
72: .padding(16)
73: .background(background)
80: HStack(spacing: 6) {
82: .foregroundStyle(.orange)
84: .font(.callout.weight(.semibold))
87: .font(.caption.weight(.medium))
88: .padding(.horizontal, 6)
89: .padding(.vertical, 2)
90: .background(Capsule().fill(.regularMaterial))
91: .foregroundStyle(.secondary)
100: .font(.caption.monospaced())
102: .frame(maxWidth: .infinity, alignment: .leading)
103: .padding(8)
104: .font(.caption)
106: .frame(maxHeight: 120)
107: .background(RoundedRectangle(cornerRadius: 6).fill(.regularMaterial))
115: VStack(spacing: 6) {
120: .frame(maxWidth: .infinity, alignment: .leading)
122: .modernButtonStyle(style: .glass, size: .regular, shape: .modern)
123: .overlay {
124: Capsule().stroke(.separator, lineWidth: 0.5)
131: .frame(maxWidth: .infinity, alignment: .leading)
133: .modernButtonStyle(style: .glassProminent, size: .regular, shape: .modern)
134: .overlay {
135: Capsule().stroke(.separator, lineWidth: 0.5)
142: .frame(maxWidth: .infinity, alignment: .leading)
144: .modernButtonStyle(style: .glass, size: .regular, shape: .modern)
145: .overlay {
146: Capsule().stroke(.separator, lineWidth: 0.5)
148: .keyboardShortcut(.escape)
151: .focused($isFocused)
153: .padding(.horizontal, 12)
154: .padding(.vertical, 6)
155: .background {
156: Capsule().fill(Color.controlBackgroundColor)
157: Capsule().stroke(.separator, lineWidth: 0.5)
171: Text(localizable: .aiChatApprovalPanelCancelTips).font(.caption)
172: .foregroundStyle(.secondary)
181: private var background: some View {
183: RoundedRectangle(cornerRadius: 20)
185: .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
186: .overlay {
187: RoundedRectangle(cornerRadius: 20)
188: .stroke(.separator, lineWidth: 0.5)
191: RoundedRectangle(cornerRadius: 14)
193: .overlay {
194: RoundedRectangle(cornerRadius: 14)
195: .stroke(.separator, lineWidth: 0.5)
201: private var borderOverlay: some View {
202: RoundedRectangle(cornerRadius: 14)
203: .stroke(Color.orange.opacity(0.5), lineWidth: 1)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/PromptInput/ContextUsageRing.swift

92 lines. Check platform/build reachability at the call site.

```text
56: Circle()
57: .stroke(.secondary.opacity(0.25), lineWidth: 2)
58: Circle()
60: .stroke(ringColor, style: StrokeStyle(lineWidth: 2, lineCap: .round))
62: .animation(.easeOut(duration: 0.25), value: fraction)
64: .frame(width: 12, height: 12)
65: .contentShape(Rectangle())
67: .frame(width: 18, height: 18)
68: .help(helpText)
69: .accessibilityLabel(
74: .accessibilityValue(Text(helpText))
76: .frame(minWidth: 32, minHeight: 32)
77: .contentShape(Rectangle())
82: .animation(.smooth, value: fraction < 0.5)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/PromptInput/PromptInputStyle.swift

155 lines. Check platform/build reachability at the call site.

```text
38: var cornerRadius: CGFloat
44: var border: BorderSpec?
56: var background: Background
62: shadow: ShadowSpec? = ShadowSpec(opacity: 0.2, radius: 4),
63: border: BorderSpec? = BorderSpec(lineWidth: 0.5),
65: @ViewBuilder background: () -> Background
68: self.cornerRadius = cornerRadius
69: self.shadow = shadow
72: self.background = background()
76: var color: Color = .black
77: var opacity: Double = 0.2
80: init(color: Color = .black, opacity: Double = 0.2, radius: CGFloat = 4) {
82: self.opacity = opacity
88: var lineWidth: CGFloat = 0.5
102: shadow: ShadowSpec? = ShadowSpec(opacity: 0.2, radius: 4),
103: border: BorderSpec? = BorderSpec(lineWidth: 0.5),
110: border: border,
112: background: {
131: border: nil,
147: RoundedRectangle(cornerRadius: cornerRadius)
149: .glassEffect(in: RoundedRectangle(cornerRadius: cornerRadius))
151: RoundedRectangle(cornerRadius: cornerRadius)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/PromptInput/PromptInputView+ActionBar.swift

354 lines. Check platform/build reachability at the call site.

```text
24: private var actionBarLeadingControlSpacing: CGFloat { 4 }
25: private var primaryActionButtonSize: ModernButtonStyleModifier.Size? {
41: HStack(spacing: actionBarLeadingControlSpacing) {
69: .font(.caption)
70: .frame(width: actionBarIconFrameLength, height: actionBarIconFrameLength)
74: .font(.caption)
75: .frame(width: actionBarIconFrameLength, height: actionBarIconFrameLength)
79: .foregroundStyle(activeFileAccessAllowsAI ? .primary : .secondary)
80: .tint(activeFileAccessAllowsAI ? .accentColor : .secondary.opacity(0.75))
82: .help(fileAccessHelpText)
144: .font(.caption)
145: .frame(width: actionBarIconFrameLength, height: actionBarIconFrameLength)
157: .font(.caption)
158: .frame(width: actionBarIconFrameLength, height: actionBarIconFrameLength)
190: HStack(spacing: 4) {
192: .font(.caption)
193: .foregroundStyle(.secondary)
195: .frame(height: actionBarIconFrameLength)
196: .contentShape(Rectangle())
329: .frame(width: 16, height: 16)
333: .frame(width: 16, height: 16)
336: .modernButtonStyle(style: .glass, size: primaryActionButtonSize, shape: .circle)
347: .frame(minWidth: 32, minHeight: 32)
348: .contentShape(Rectangle())
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/PromptInput/PromptInputView+CompactIOSFloatingInput.swift

576 lines. Check platform/build reachability at the call site.

```text
18: private var compactIOSFloatingInlineControlSymbolSize: CGFloat { 13 }
21: private var compactIOSFloatingPrimaryActionTrailingPadding: CGFloat { 2 }
22: private var compactIOSFloatingInlineActionTrailingPadding: CGFloat {
26: private var compactIOSFloatingExpandedInputMinHeight: CGFloat { 44 }
27: private var compactIOSFloatingInputMaxHeight: CGFloat { 168 }
28: private var compactIOSFloatingFullscreenInputMinHeight: CGFloat { 220 }
29: private var compactIOSFloatingFullscreenInputMaxHeight: CGFloat { 520 }
48: VStack(alignment: .trailing, spacing: 5) {
50: HStack(spacing: 0) {
57: .transition(.opacity.combined(with: .move(edge: .top)))
60: HStack(alignment: .bottom, spacing: 7) {
62: VStack(spacing: 7) {
65: .transition(.opacity.combined(with: .scale))
70: .transition(.opacity.combined(with: .scale))
87: .frame(maxWidth: .infinity, alignment: .trailing)
88: .animation(.smooth(duration: 0.25), value: isCompactIOSFloatingFullscreenInputPresented)
126: transaction.animation = nil
128: .frame(
133: .background(alignment: .bottom) {
136: .clipShape(compactIOSFloatingTextInputShape(isExpanded: isExpanded))
137: .overlay(alignment: isExpanded ? .bottomTrailing : .trailing) {
139: .padding(.trailing, compactIOSFloatingPrimaryActionTrailingPadding)
140: .padding(
147: .overlay(alignment: .topTrailing) {
150: .padding(.top, 6)
151: .padding(.trailing, compactIOSFloatingInlineActionTrailingPadding)
152: .transition(.opacity.combined(with: .scale))
155: .padding(.top, 6)
156: .padding(.trailing, compactIOSFloatingInlineActionTrailingPadding)
157: .transition(.opacity.combined(with: .scale))
160: .contentShape(compactIOSFloatingTextInputShape(isExpanded: isExpanded))
198: .font(.system(size: compactIOSFloatingInlineControlSymbolSize, weight: .semibold))
199: .frame(
200: width: compactIOSFloatingInlineControlLabelLength,
201: height: compactIOSFloatingInlineControlLabelLength
204: .modernButtonStyle(style: .glass, size: .regular, shape: .circle)
216: .font(.system(size: compactIOSFloatingInlineControlSymbolSize, weight: .semibold))
217: .frame(
218: width: compactIOSFloatingInlineControlLabelLength,
219: height: compactIOSFloatingInlineControlLabelLength
222: .modernButtonStyle(style: .glass, size: .regular, shape: .circle)
264: AnyShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
266: AnyShape(Capsule())
294: .font(.system(size: 16, weight: .semibold))
295: .frame(
296: width: compactIOSFloatingInlineControlLabelLength,
297: height: compactIOSFloatingInlineControlLabelLength
299: .padding(7)
301: .modernButtonStyle(style: .glass, size: .regular, shape: .circle)
306: HStack(spacing: 0) {
317: .transition(.opacity.combined(with: .scale))
320: .animation(.smooth(duration: 0.18), value: isInputFocused)
334: .font(.system(size: 15, weight: .semibold))
335: .frame(
336: width: compactIOSFloatingPrimaryActionIconLength,
337: height: compactIOSFloatingPrimaryActionIconLength
342: .font(.system(size: 15, weight: .semibold))
343: .frame(
344: width: compactIOSFloatingPrimaryActionIconLength,
345: height: compactIOSFloatingPrimaryActionIconLength
349: .modernButtonStyle(
354: .frame(
355: width: compactIOSFloatingPrimaryActionLength,
356: height: compactIOSFloatingPrimaryActionLength
358: .clipShape(Circle())
359: .contentShape(Circle())
370: .font(.system(size: compactIOSFloatingInlineControlSymbolSize, weight: .semibold))
371: .frame(
372: width: compactIOSFloatingInlineControlLabelLength,
373: height: compactIOSFloatingInlineControlLabelLength
378: .font(.system(size: compactIOSFloatingInlineControlSymbolSize, weight: .semibold))
379: .frame(
380: width: compactIOSFloatingInlineControlLabelLength,
381: height: compactIOSFloatingInlineControlLabelLength
385: .foregroundStyle(activeFileAccessAllowsAI ? .primary : .secondary)
386: .tint(activeFileAccessAllowsAI ? .accentColor : .secondary.opacity(0.75))
387: .modernButtonStyle(style: .glass, size: .regular, shape: .circle)
388: .animation(.smooth(duration: 0.18), value: activeFileAccessAllowsAI)
402: .font(.system(size: 11, weight: .semibold))
404: .lineLimit(1)
406: .frame(
407: width: compactIOSFloatingInlineControlLabelLength,
408: height: compactIOSFloatingInlineControlLabelLength
413: .modernButtonStyle(style: .glass, size: .regular, shape: .circle)
428: .font(.system(size: compactIOSFloatingInlineControlSymbolSize, weight: .semibold))
429: .frame(
430: width: compactIOSFloatingInlineControlLabelLength,
431: height: compactIOSFloatingInlineControlLabelLength
433: .contentShape(Circle())
435: .modernButtonStyle(style: .glass, size: .regular, shape: .circle)
436: .help(.localizable(.aiChatButtonFullscreen))
437: .accessibilityLabel(Text(localizable: .aiChatButtonFullscreen))
446: .font(.system(size: compactIOSFloatingInlineControlSymbolSize, weight: .semibold))
447: .frame(
448: width: compactIOSFloatingInlineControlLabelLength,
449: height: compactIOSFloatingInlineControlLabelLength
451: .contentShape(Circle())
453: .modernButtonStyle(style: .glass, size: .regular, shape: .circle)
497: .help(fileAccessHelpText)
523: .font(.system(size: 16, weight: .semibold))
524: .frame(
525: width: compactIOSFloatingInlineControlLabelLength,
526: height: compactIOSFloatingInlineControlLabelLength
528: .padding(7)
533: .modernButtonStyle(style: .glass, size: .regular, shape: .circle)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/PromptInput/PromptInputView+DebugContext.swift

225 lines. Check platform/build reachability at the call site.

```text
19: .controlSize(.small)
20: .frame(width: 18, height: 18)
23: .font(.caption)
24: .frame(width: 18, height: 18)
28: .help(String(localizable: .debugChatContextHelp))
30: .frame(minWidth: 32, minHeight: 32)
31: .contentShape(Rectangle())
37: VStack(alignment: .leading, spacing: 16) {
38: HStack(alignment: .top, spacing: 12) {
40: .font(.title2)
41: .foregroundStyle(.accent)
42: .frame(width: 40, height: 40)
43: .background(.thinMaterial, in: Circle())
45: VStack(alignment: .leading, spacing: 4) {
47: .font(.headline)
49: .font(.caption)
50: .foregroundStyle(.secondary)
59: iconFrame: CGSize(width: 16, height: 16),
62: .buttonStyle(.plain)
69: .font(.caption.weight(.semibold))
70: .frame(width: 16, height: 16)
72: .buttonStyle(.plain)
73: .foregroundStyle(.secondary)
74: .help(String(localizable: .generalButtonClose))
79: .padding(20)
80: .frame(minWidth: 620, minHeight: 480)
86: VStack(spacing: 12) {
88: .controlSize(.regular)
90: .font(.caption)
91: .foregroundStyle(.secondary)
93: .frame(maxWidth: .infinity, maxHeight: .infinity)
96: .font(.callout)
97: .foregroundStyle(.red)
99: .frame(maxWidth: .infinity, alignment: .leading)
100: .padding(14)
101: .background(.red.opacity(0.08), in: RoundedRectangle(cornerRadius: 14))
105: .font(.system(.caption, design: .monospaced))
106: .foregroundStyle(.primary)
107: .frame(maxWidth: .infinity, alignment: .leading)
109: .padding(14)
111: .frame(maxWidth: .infinity, maxHeight: .infinity)
112: .background(.black.opacity(0.05), in: RoundedRectangle(cornerRadius: 14))
113: .overlay {
114: RoundedRectangle(cornerRadius: 14)
115: .stroke(.quaternary)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/PromptInput/PromptInputView+ImagePaste.swift

432 lines. Check platform/build reachability at the call site.

```text
304: HStack(spacing: 8) {
315: .padding(.horizontal, 12)
317: .scrollIndicators(.hidden)
318: .padding(.top, 10)
321: .padding(.bottom, 6)
343: private let tileSize: CGFloat = 56
356: .frame(width: tileSize, height: tileSize)
357: .clipShape(RoundedRectangle(cornerRadius: 8))
362: .frame(width: tileSize, height: tileSize)
363: .clipShape(RoundedRectangle(cornerRadius: 8))
373: .font(.system(size: 16))
375: .foregroundStyle(.white, .black.opacity(0.55))
378: .buttonStyle(.plain)
379: .frame(width: removeButtonHitLength, height: removeButtonHitLength)
380: .offset(removeButtonOffset)
381: .opacity(removeButtonIsVisible ? 1 : 0)
383: .animation(.easeInOut(duration: 0.12), value: isHovering)
384: .help(.localizable(.aiChatButtonRemoveAttachment))
386: .padding(.top, 6)
387: .padding(removeButtonHorizontalPaddingEdge, 6)
388: .onHover { hovering in
411: CGSize(width: -6, height: -6)
413: CGSize(width: 6, height: -6)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/PromptInput/PromptInputView+InputField.swift

598 lines. Check platform/build reachability at the call site.

```text
37: let radius = style.cornerRadius
39: .overlay {
41: RoundedRectangle(cornerRadius: radius)
42: .stroke(.separator, lineWidth: border.lineWidth)
45: .overlay {
55: .transition(.asymmetric(
57: removal: .opacity
61: .animation(.easeInOut(duration: 0.25), value: isGenerating)
63: if let shadow = style.shadow {
66: .shadow(
67: color: shadow.color.opacity(shadow.opacity),
96: .padding(8)
97: .background { style.background }
104: VStack(spacing: 0) {
127: .background { style.background }
224: VStack(spacing: 0) {
483: .focused(focus)
536: private static let fadeInDuration: TimeInterval = 0.55
539: TimelineView(.animation) { context in
550: let gradient = AngularGradient(
556: RoundedRectangle(cornerRadius: cornerRadius)
557: .strokeBorder(gradient, lineWidth: 0.9)
558: .opacity(palette.borderOpacity)
559: .overlay {
560: RoundedRectangle(cornerRadius: cornerRadius)
561: .stroke(gradient, lineWidth: 12)
562: .blur(radius: 8)
563: .opacity(palette.innerGlowBase + pulse * palette.innerGlowPulse)
565: .overlay {
566: RoundedRectangle(cornerRadius: cornerRadius)
567: .stroke(gradient, lineWidth: 24)
568: .blur(radius: 20)
569: .opacity(palette.midGlowBase + pulse * palette.midGlowPulse)
571: .overlay {
579: RoundedRectangle(cornerRadius: cornerRadius)
580: .stroke(palette.haloColor.opacity(palette.haloBase + pulse * palette.haloPulse), lineWidth: 34)
581: .blur(radius: 34)
583: .opacity(fadeIn)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/PromptInput/PromptInputView.swift

653 lines. Check platform/build reachability at the call site.

```text
538: .padding(8)
557: VStack(spacing: 6) {
571: .buttonStyle(.accessoryBar)
574: .buttonStyle(.plain)
578: .buttonStyle(.plain)
585: .controlSize(.large)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/ToolCards/AIProposalToolResultCard.swift

381 lines. Check platform/build reachability at the call site.

```text
38: VStack(spacing: 0) {
43: .frame(maxWidth: .infinity)
50: VStack(alignment: .leading, spacing: 10) {
52: HStack(spacing: 8) {
54: .font(.caption2)
55: .foregroundStyle(.secondary)
63: .modernButtonStyle(style: .glass, size: .regular, shape: .capsule)
71: .controlSize(.small)
81: .modernButtonStyle(style: .glassProminent, size: .regular, shape: .capsule)
85: .padding(.horizontal, 12)
86: .padding(.vertical, 10)
87: .background(.purple.opacity(0.10))
89: .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
90: .overlay {
91: RoundedRectangle(cornerRadius: 16, style: .continuous)
92: .stroke(.purple.opacity(0.16), lineWidth: 1)
97: HStack(spacing: 6) {
99: .font(.caption.weight(.semibold))
101: .font(.caption.weight(.semibold))
104: .foregroundStyle(.purple)
212: .frame(maxWidth: .infinity)
213: .frame(height: 200)
218: .aspectRatio(contentMode: .fit)
219: .frame(maxWidth: .infinity, maxHeight: 200)
222: .controlSize(.small)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/ToolCards/ToolCallCard.swift

118 lines. Check platform/build reachability at the call site.

```text
63: HStack(spacing: 3) {
67: .font(.caption2.weight(.medium))
68: .foregroundStyle(.red)
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/ToolCards/ToolResultCard.swift

63 lines. Check platform/build reachability at the call site.

```text
46: VStack(alignment: .leading, spacing: 4) {
52: HStack(spacing: 6) {
```

## ExcalidrawZ/SidebarTrailing/AIChat/components/ToolCards/_ToolEventCard.swift

192 lines. Check platform/build reachability at the call site.

```text
67: @State private var contentHeight: CGFloat = 0
68: @State private var hasMeasuredContentHeight = false
71: VStack(alignment: .leading, spacing: 0) {
75: .padding(.horizontal, 12)
76: .padding(.vertical, 8)
78: .background {
79: RoundedRectangle(cornerRadius: 24)
80: .fill(accent.opacity(0.1))
95: .modifier(ToolEventBodyHeightModifier(height: contentHeight))
96: .animation(hasMeasuredContentHeight ? .smooth : nil, value: contentHeight)
107: .font(.caption2)
108: .foregroundStyle(.secondary)
110: .padding(.leading, 22)
113: .padding(.top, isExpanded ? 4 : 0)
125: HStack(spacing: 6) {
128: .controlSize(.small)
129: .tint(accent)
130: .scaleEffect(0.55)
131: .frame(width: 10, height: 10)
134: .font(.caption)
136: .animation(.easeInOut(duration: 0.15), value: isExpanded)
137: .frame(width: 10, height: 10)
140: .font(.caption)
142: .font(.caption)
143: .fontWeight(.semibold)
148: .foregroundStyle(accent)
149: .contentShape(Rectangle())
151: .buttonStyle(.plain)
158: init(height: CGFloat) {
163: content.frame(height: animatableData, alignment: .top)
```

## ExcalidrawZ/SidebarTrailing/CanvasSettings/CanvasSettingsInspectorContent.swift

329 lines. Check platform/build reachability at the call site.

```text
38: private var contentSpacing: CGFloat {
42: private var rowSpacing: CGFloat {
46: private var horizontalPadding: CGFloat {
50: private var verticalPadding: CGFloat {
75: VStack(alignment: .leading, spacing: contentSpacing) {
94: .padding(.horizontal, horizontalPadding)
95: .padding(.vertical, verticalPadding)
106: VStack(alignment: .leading, spacing: rowSpacing) {
120: VStack(alignment: .leading, spacing: rowSpacing) {
123: .frame(maxWidth: .infinity, alignment: .leading)
150: .editorChromeButtonStyle(style: .glass, size: .regular, shape: .capsule)
155: VStack(alignment: .leading, spacing: rowSpacing) {
191: VStack(alignment: .leading, spacing: rowSpacing) {
209: VStack(alignment: .leading, spacing: rowSpacing) {
212: .font(.headline)
218: .controlSize(.mini)
223: .font(.caption)
224: .foregroundStyle(.secondary)
226: .frame(maxWidth: .infinity, alignment: .leading)
233: .opacity(isCustomizingDrawingSettings ? 1 : 0.55)
234: .padding(.top, isCompactIOS ? 6 : 4)
294: .foregroundStyle(.secondary)
298: .foregroundStyle(.secondary)
```

## ExcalidrawZ/SidebarTrailing/DebugPanel/DebugPanelView+Diagnostics.swift

287 lines. Check platform/build reachability at the call site.

```text
21: VStack(alignment: .leading, spacing: 12) {
23: .font(.caption)
24: .foregroundStyle(.secondary)
37: .font(.caption)
38: .foregroundStyle(.secondary)
51: .font(.caption)
52: .foregroundStyle(.secondary)
63: .aspectRatio(
64: Self.aspectRatio(for: viewportCaptureImage),
67: .frame(maxWidth: .infinity)
68: .background(.black.opacity(0.08), in: RoundedRectangle(cornerRadius: 8))
69: .clipShape(RoundedRectangle(cornerRadius: 8))
75: .font(.system(.caption, design: .monospaced))
76: .frame(maxWidth: .infinity, alignment: .leading)
79: .frame(minHeight: 80, maxHeight: 180)
80: .padding(8)
81: .background(.quaternary.opacity(0.4), in: RoundedRectangle(cornerRadius: 8))
87: .font(.headline)
192: width: appState?.width,
193: height: appState?.height,
194: scrollX: appState?.scrollX,
195: scrollY: appState?.scrollY,
201: width: containerRect.width,
202: height: containerRect.height
241: width: CGFloat(cgImage.width),
242: height: CGFloat(cgImage.height)
246: width: image.size.width * image.scale,
247: height: image.size.height * image.scale
253: width: CGFloat(cgImage.width),
254: height: CGFloat(cgImage.height)
```

## ExcalidrawZ/SidebarTrailing/DebugPanel/DebugPanelView.swift

763 lines. Check platform/build reachability at the call site.

```text
18: GridItem(.flexible(minimum: 100), spacing: 8),
19: GridItem(.flexible(minimum: 100), spacing: 8)
55: VStack(alignment: .leading, spacing: 16) {
62: .padding(12)
64: .scrollIndicators(.hidden)
108: VStack(alignment: .leading, spacing: 12) {
112: LazyVGrid(columns: actionColumns, spacing: 8) {
117: cameraScrollXText = camera.scrollX.formatted()
118: cameraScrollYText = camera.scrollY.formatted()
127: try await requireCoordinator().scrollToCenter()
159: .font(.caption)
160: .foregroundStyle(.secondary)
163: HStack(spacing: 8) {
209: HStack(spacing: 8) {
225: HStack(spacing: 8) {
259: HStack(spacing: 8) {
267: try await requireCoordinator().scrollToElement(
300: .font(.headline)
307: VStack(alignment: .leading, spacing: 12) {
313: .font(.system(.caption, design: .monospaced))
314: .frame(minHeight: 220)
315: .padding(6)
316: .background {
317: RoundedRectangle(cornerRadius: 10)
318: .fill(.quaternary.opacity(0.12))
320: .overlay {
321: RoundedRectangle(cornerRadius: 10)
322: .stroke(.quaternary)
325: HStack(spacing: 10) {
333: .controlSize(.small)
339: .font(.headline)
346: VStack(alignment: .leading, spacing: 10) {
350: .font(.system(.caption, design: .monospaced))
351: .foregroundStyle(.red)
352: .frame(maxWidth: .infinity, alignment: .leading)
355: .frame(minHeight: 80, maxHeight: 140)
356: .padding(8)
357: .background(.red.opacity(0.08))
358: .clipShape(RoundedRectangle(cornerRadius: 8))
364: .font(.system(.caption, design: .monospaced))
365: .frame(maxWidth: .infinity, alignment: .leading)
368: .frame(minHeight: 80, maxHeight: 180)
369: .padding(8)
370: .background(.quaternary.opacity(0.4))
371: .clipShape(RoundedRectangle(cornerRadius: 8))
376: .font(.headline)
382: VStack(alignment: .leading, spacing: 6) {
384: .font(.title3.weight(.semibold))
386: .font(.caption)
387: .foregroundStyle(.secondary)
395: .buttonStyle(.borderedProminent)
396: .controlSize(.small)
397: .frame(maxWidth: .infinity)
398: .lineLimit(1)
404: VStack(alignment: .leading, spacing: 4) {
406: .font(.caption2)
407: .foregroundStyle(.secondary)
419: VStack(alignment: .leading, spacing: 10) {
421: .font(.subheadline.weight(.medium))
424: .padding(12)
425: .frame(maxWidth: .infinity, alignment: .leading)
426: .background(.quaternary.opacity(0.18), in: RoundedRectangle(cornerRadius: 12))
432: .font(.caption.weight(.medium))
433: .foregroundStyle(.secondary)
434: .padding(.horizontal, 10)
435: .padding(.vertical, 6)
436: .background(.quaternary.opacity(0.18), in: Capsule())
437: .lineLimit(1)
668: width: excalidrawZHelper._api?.getAppState()?.width,
669: height: excalidrawZHelper._api?.getAppState()?.height,
```

## ExcalidrawZ/SidebarTrailing/ExcalidrawTrailingControls.swift

326 lines. Check platform/build reachability at the call site.

```text
23: @AppStorage(FloatingInspectorMetrics.widthStorageKey) private var floatingInspectorWidth = FloatingInspectorMetrics.defaultWidth
59: private var topPadding: CGFloat {
70: private var trailingPadding: CGFloat {
119: private var controlSpacing: CGFloat {
156: VStack(alignment: .trailing, spacing: controlSpacing) {
170: .keyboardShortcut("f", modifiers: .command)
189: title: String(localizable: .presentationTitle),
212: .padding(.top, topPadding)
213: .padding(.trailing, trailingPadding + effectiveHorizontalOffset)
229: .animation(.easeOut, value: topPadding)
283: private var buttonStyleSize: ModernButtonStyleModifier.Size {
291: private var iconSize: CGFloat {
313: .font(.system(size: iconSize))
314: .frame(width: iconFrame, height: iconFrame)
317: .editorChromeButtonStyle(
322: .help(title)
323: .opacity(isDisabled && !isActive ? 0.55 : 1)
```

## ExcalidrawZ/SidebarTrailing/FileHistory/FileCheckpointDetailView.swift

193 lines. Check platform/build reachability at the call site.

```text
28: VStack(spacing: 0) {
42: .frame(width: 400, height: 300)
43: .clipShape(RoundedRectangle(cornerRadius: 8))
46: VStack(alignment: .leading, spacing: 2) {
48: .font(.title2.bold())
49: .lineLimit(2)
52: .font(.footnote)
64: .foregroundStyle(.red)
67: .editorChromeButtonStyle(style: .glass)
75: .editorChromeButtonStyle(style: .glassProminent)
77: .controlSize(.extraLarge)
85: .foregroundStyle(.red)
93: .buttonStyle(.borderedProminent)
95: .controlSize(.large)
100: .padding(20)
```

## ExcalidrawZ/SidebarTrailing/FileHistory/FileCheckpointListView.swift

190 lines. Check platform/build reachability at the call site.

```text
154: LazyVStack(spacing: 8) {
159: .padding(.horizontal, 10)
160: .padding(.vertical, 8)
```

## ExcalidrawZ/SidebarTrailing/FileHistory/FileCheckpointRowView.swift

315 lines. Check platform/build reachability at the call site.

```text
20: @State private var fileSize: Int = 0
24: .task(id: checkpointMetadataLoadID, priority: .background) {
53: .buttonStyle(.plain)
60: .buttonStyle(.fileCheckpointRow)
67: HStack(alignment: .top, spacing: 10) {
70: VStack(alignment: .leading, spacing: 6) {
71: HStack(alignment: .top, spacing: 6) {
73: .font(.headline)
74: .lineLimit(2)
83: VStack(alignment: .leading, spacing: 2) {
84: HStack(spacing: 0) {
97: .font(.footnote)
98: .foregroundStyle(.secondary)
99: .lineLimit(1)
102: .font(.footnote)
103: .foregroundStyle(.secondary)
104: .lineLimit(1)
108: .padding(.horizontal, 6)
109: .padding(.vertical, 6)
110: .frame(maxWidth: .infinity, alignment: .leading)
158: static let size = CGSize(width: 82, height: 52)
159: static let cornerRadius: CGFloat = 7
186: RoundedRectangle(cornerRadius: FileCheckpointPreviewMetrics.cornerRadius, style: .continuous)
187: .fill(Color.secondary.opacity(colorScheme == .dark ? 0.10 : 0.07))
190: .frame(
191: width: FileCheckpointPreviewMetrics.size.width,
192: height: FileCheckpointPreviewMetrics.size.height
196: .clipShape(RoundedRectangle(
197: cornerRadius: FileCheckpointPreviewMetrics.cornerRadius,
200: .overlay {
201: RoundedRectangle(cornerRadius: FileCheckpointPreviewMetrics.cornerRadius, style: .continuous)
202: .strokeBorder(Color.primary.opacity(0.08), lineWidth: 0.5)
204: .task(id: previewLoadID, priority: .background) {
222: .frame(
223: width: FileCheckpointPreviewMetrics.size.width,
224: height: FileCheckpointPreviewMetrics.size.height
244: priority: .background
260: HStack(spacing: 3) {
262: .font(.caption2)
264: .font(.caption2.weight(.medium))
266: .padding(.horizontal, 6)
267: .padding(.vertical, 2)
268: .foregroundStyle(tint)
269: .background(
270: Capsule()
271: .fill(tint.opacity(0.12))
273: .overlay(
274: Capsule()
275: .stroke(tint.opacity(0.3), lineWidth: 0.5)
281: private var cornerRadius: CGFloat {
293: HStack(spacing: 0) {
297: .contentShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
298: .opacity(isPressed ? 0.72 : 1)
```

## ExcalidrawZ/SidebarTrailing/InspectorPresentation.swift

552 lines. Check platform/build reachability at the call site.

```text
18: static let defaultWidth: Double = 300
19: static let minWidth: CGFloat = 260
20: static let maxWidth: CGFloat = 440
22: static let horizontalPadding: CGFloat = 8
24: static let controlsTopPadding: CGFloat = 6
26: static let horizontalPadding: CGFloat = 10
28: static let controlsTopPadding: CGFloat = 16
31: static func clampedWidth(_ width: CGFloat) -> CGFloat {
35: static func controlsInset(for width: CGFloat) -> CGFloat {
48: @AppStorage(FloatingInspectorMetrics.widthStorageKey) private var floatingInspectorWidth = FloatingInspectorMetrics.defaultWidth
97: private var floatingInspectorTopPadding: CGFloat {
105: private var floatingInspectorHorizontalPadding: CGFloat {
109: private var resolvedFloatingInspectorWidth: CGFloat {
223: String(localizable: .presentationTitle)
245: .frame(minWidth: 240, idealWidth: 250, maxWidth: 300)
248: .frame(width: resolvedFloatingInspectorWidth)
249: .overlay(alignment: .leading) {
250: FloatingInspectorResizeHandle(width: $floatingInspectorWidth)
251: .offset(x: -6)
255: .clipShape(
256: RoundedRectangle(
261: .background {
263: RoundedRectangle(
267: .fill(.background)
268: .editorChromeGlassEffect(
270: in: RoundedRectangle(
276: .shadow(radius: 4)
279: RoundedRectangle(cornerRadius: 12, style: .continuous)
281: .shadow(radius: 4)
284: .transition(.move(edge: .trailing))
287: .animation(.easeOut, value: shouldShowInspectorPresentation)
288: .padding(.top, floatingInspectorTopPadding)
290: .padding(.bottom, 40)
292: .padding(.bottom, 10)
294: .padding(.horizontal, floatingInspectorHorizontalPadding)
297: .overlay(alignment: .topTrailing) {
301: .transition(.opacity)
305: .animation(.easeOut, value: shouldShowInspectorPresentation)
308: private var floatingInspectorCornerRadius: CGFloat {
328: VStack(spacing: 0) {
374: .frame(maxWidth: .infinity)
375: .padding(.top, 8)
376: .padding(.bottom, 7)
377: .padding(.horizontal, 10)
389: .foregroundStyle(.secondary)
390: .frame(maxWidth: .infinity)
391: .padding(.vertical, 10)
392: .padding(.horizontal, 4)
424: .foregroundStyle(.secondary)
425: .font(.headline)
426: .padding(.horizontal, 8)
431: @Binding var width: Double
433: @State private var dragStartWidth: CGFloat?
439: .frame(width: 30)
441: Capsule()
442: .fill(Color.secondary.opacity(isDragging ? 0.42 : 0.22))
443: .frame(width: 6, height: 34)
445: .contentShape(Rectangle())
446: .hoverCursor(.columnResize(directions: .both))
499: .accessibilityLabel(Text(localizable: .generalButtonClose))
507: .accessibilityLabel(Text(localizable: .generalButtonDone))
512: .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
545: .frame(width: 1)
```

## ExcalidrawZ/SidebarTrailing/Library/LibraryBrowserSheet.swift

228 lines. Check platform/build reachability at the call site.

```text
32: VStack(spacing: 0) {
43: .controlSize(.small)
48: .frame(minWidth: 720, minHeight: 540)
54: HStack(spacing: 12) {
55: VStack(alignment: .leading, spacing: 2) {
57: .font(.headline)
61: .font(.caption)
62: .foregroundStyle(.secondary)
63: .lineLimit(1)
64: .truncationMode(.tail)
69: .controlSize(.small)
78: .editorChromeButtonStyle(style: .glass, shape: .capsule)
85: .keyboardShortcut(.cancelAction)
86: .editorChromeButtonStyle(style: .glass, shape: .capsule)
88: .padding(.horizontal, 16)
89: .padding(.vertical, 10)
```

## ExcalidrawZ/SidebarTrailing/Library/LibraryImportSheetView.swift

372 lines. Check platform/build reachability at the call site.

```text
39: .frame(minWidth: 700)
129: VStack(spacing: 10) {
130: HStack(alignment: .lastTextBaseline) {
132: .opacity(0)
135: .font(.largeTitle)
160: LazyVGrid(columns: [
161: GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())
173: HStack(spacing: 6) {
185: VStack(alignment: .leading) {
188: .font(.footnote)
189: .foregroundStyle(.secondary)
191: .lineLimit(1)
192: .truncationMode(.middle)
200: Circle().fill(.green)
201: Circle().stroke(.green)
203: Circle().stroke(.primary)
209: .font(.body.bold())
210: .padding(3)
211: .foregroundStyle(isSelected ? AnyShapeStyle(.white) : AnyShapeStyle(.primary))
213: .animation(.easeOut(duration: 0.15), value: isSelected)
214: .padding(2)
215: .frame(width: size, height: size)
217: .contentShape(Rectangle())
219: .buttonStyle(.plain)
222: VStack(spacing: 0) {
227: .foregroundStyle(.secondary)
228: .font(.footnote)
231: .foregroundStyle(.secondary)
232: .font(.footnote)
259: .padding(.top, 12)
260: .background(editorChromeSurface())
264: .padding(.horizontal)
265: .padding(.bottom)
267: .frame(minHeight: 300, maxHeight: 600)
268: .background {
269: let roundedRectangle = RoundedRectangle(cornerRadius: 12)
270: roundedRectangle.stroke(.separator, lineWidth: 0.5)
278: .font(.footnote)
279: .foregroundStyle(.secondary)
282: .font(.footnote)
283: .foregroundStyle(.secondary)
293: .frame(width: 80)
295: .buttonStyle(.borderless)
301: .frame(width: 80)
303: .buttonStyle(.borderedProminent)
306: .controlSize(.large)
308: .padding(.vertical, 20)
309: .padding(.horizontal, 40)
369: .frame(width: 600)
```

## ExcalidrawZ/SidebarTrailing/Library/LibraryItemPreviewCoordinator.swift

272 lines. Check platform/build reachability at the call site.

```text
65: private let thumbnailMaxPixelSize: CGFloat = 180
266: width: CGFloat(cgThumb.width),
267: height: CGFloat(cgThumb.height)
```

## ExcalidrawZ/SidebarTrailing/Library/LibraryItemView.swift

473 lines. Check platform/build reachability at the call site.

```text
95: .buttonStyle(.borderless)
134: .font(.footnote)
135: .lineLimit(1)
136: .truncationMode(.middle)
175: .foregroundStyle(.red)
290: VStack(alignment: .leading, spacing: 16) {
292: .font(.headline)
294: VStack(alignment: .leading, spacing: 4) {
296: .font(.caption)
297: .foregroundStyle(.secondary)
309: .editorChromeButtonStyle(style: .glass, shape: .capsule)
317: .keyboardShortcut(.defaultAction)
318: .editorChromeButtonStyle(style: .glassProminent, shape: .capsule)
321: .padding(20)
323: .frame(minWidth: 360)
402: .frame(height: size)
403: .aspectRatio(1, contentMode: .fit)
404: .contentShape(Rectangle())
457: .background {
464: RoundedRectangle(cornerRadius: radius)
465: .stroke(.separator, lineWidth: 1)
467: RoundedRectangle(cornerRadius: radius)
```

## ExcalidrawZ/SidebarTrailing/Library/LibrarySection.swift

148 lines. Check platform/build reachability at the call site.

```text
41: animation: .default
46: private let itemSpacing: CGFloat = 8
77: VStack(spacing: itemSpacing) {
79: HStack(spacing: itemSpacing) {
86: .frame(height: 0)
87: .frame(maxWidth: .infinity)
94: .padding(.leading, 10)
99: .animation(.default, value: selections != nil)
111: .overlay(alignment: .bottomTrailing) {
117: Circle().fill(.green)
118: Circle().stroke(.green)
120: Circle().stroke(.primary)
126: .font(.body.bold())
127: .padding(3)
128: .foregroundStyle(isSelected ? AnyShapeStyle(.white) : AnyShapeStyle(.primary))
130: .padding(2)
131: .frame(width: size, height: size)
132: .padding(4)
141: .frame(maxWidth: .infinity)
```

## ExcalidrawZ/SidebarTrailing/Library/LibrarySectionHeader.swift

192 lines. Check platform/build reachability at the call site.

```text
30: .font(.title3.bold())
31: .foregroundStyle(.secondary)
32: .lineLimit(1)
33: .truncationMode(.middle)
39: .buttonStyle(.borderless)
40: .contentShape(Rectangle())
44: .contentShape(Rectangle())
```

## ExcalidrawZ/SidebarTrailing/Library/LibraryView.swift

724 lines. Check platform/build reachability at the call site.

```text
25: @FetchRequest(sortDescriptors: [SortDescriptor(\.id)], animation: .smooth)
50: private let searchHeaderReservedHeight: CGFloat = 52
71: .presentationDetents([.medium])
73: VStack(spacing: 0) {
265: VStack(spacing: 0) {
273: .padding(.vertical, 8)
274: .padding(.horizontal, 16)
275: .frame(height: 56, alignment: .top)
277: .padding(.vertical, 2)
278: .padding(.horizontal, 8)
279: .frame(height: 32)
289: HStack(spacing: 8) {
291: .foregroundStyle(.secondary)
303: .foregroundStyle(.secondary)
305: .buttonStyle(.plain)
308: .padding(.horizontal, 12)
309: .padding(.vertical, 6)
310: .background {
317: Capsule()
319: .background {
321: Capsule()
323: .editorChromeGlassEffect(.regular.interactive(), in: Capsule())
325: Capsule()
329: .overlay {
330: Capsule()
331: .strokeBorder(Color.primary.opacity(0.10), lineWidth: 0.5)
339: VStack(spacing: 0) {
367: VStack(spacing: 20) {
372: .frame(height: 40)
373: .foregroundStyle(.secondary)
374: VStack(spacing: 10) {
376: .foregroundStyle(.secondary)
377: .font(.title)
379: .font(.caption)
380: .foregroundStyle(.secondary)
382: .padding(.horizontal, 10)
384: VStack(spacing: 8) {
386: .editorChromeButtonStyle(size: .large, shape: .modern)
389: .font(.callout)
391: .hoverCursor(.link)
396: .frame(maxWidth: .infinity, maxHeight: .infinity)
402: VStack(spacing: 16) {
410: .padding(.horizontal, 10)
413: Color.clear.frame(height: 100)
415: .padding(.top, searchHeaderReservedHeight)
417: .overlay(alignment: .top) {
425: .padding(.horizontal, 10)
426: .padding(.top, 8)
427: .padding(.bottom, 4)
428: .frame(height: searchHeaderReservedHeight, alignment: .top)
436: .overlay(alignment: .leading) {
443: .buttonStyle(.borderless)
451: .overlay(alignment: .center) {
455: .foregroundStyle(.secondary)
458: .foregroundStyle(.secondary)
463: .foregroundStyle(.secondary)
466: .foregroundStyle(.secondary)
472: .overlay(alignment: .trailing) {
482: .buttonStyle(.borderless)
492: .buttonStyle(.borderless)
517: .contentShape(Rectangle())
```

## ExcalidrawZ/SidebarTrailing/Presentation/ExcalidrawPresentationConfiguration.swift

145 lines. Check platform/build reachability at the call site.

```text
56: var transition: Transition
57: var transitionDuration: TimeInterval
67: transition: Transition = .none,
73: self.transition = transition
95: forKey: .transition
114: try container.encode(transition, forKey: .transition)
```

## ExcalidrawZ/SidebarTrailing/Presentation/ExcalidrawPresentationController.swift

105 lines. Check platform/build reachability at the call site.

```text
74: contentRect: screen?.frame ?? .zero,
```

## ExcalidrawZ/SidebarTrailing/Presentation/ExcalidrawPresentationModel.swift

427 lines. Check platform/build reachability at the call site.

```text
164: let frames = Self.presentationFrames(in: file)
182: id: framePage.frame.id,
183: title: Self.title(for: framePage.frame, index: index),
185: transition: framePage.page.transition,
188: image: existingImages[framePage.frame.id]
199: let frame = framePage.frame
265: _ transition: ExcalidrawPresentationConfiguration.Transition,
273: configuration.pages[pageIndex].transition = transition
280: slides[slideIndex].transition = transition
311: .presentationConfigurationRepository
349: frame.type == .frame,
379: .presentationConfigurationRepository
404: return String(localizable: .presentationUntitledSlide(Int(index + 1)))
425: String(localizable: .presentationLoadFailed)
```

## ExcalidrawZ/SidebarTrailing/Presentation/ExcalidrawPresentationTypes.swift

25 lines. Check platform/build reachability at the call site.

```text
14: var transition: ExcalidrawPresentationConfiguration.Transition
15: var transitionDuration: TimeInterval
```

## ExcalidrawZ/SidebarTrailing/Presentation/ExcalidrawPresentationView.swift

202 lines. Check platform/build reachability at the call site.

```text
50: .focusable()
51: .focused($isFocused)
80: transition: activeTransition,
95: .transition(.opacity)
98: .contentShape(Rectangle())
129: transition: sourceSlide.transition,
143: transition: targetSlide.transition,
151: transition: ExcalidrawPresentationConfiguration.Transition,
```

## ExcalidrawZ/SidebarTrailing/Presentation/PresentationControls.swift

121 lines. Check platform/build reachability at the call site.

```text
26: HStack(spacing: 12) {
35: .editorChromeButtonStyle(style: .glass, size: .regular, shape: .circle)
38: .font(.callout.monospacedDigit())
39: .foregroundStyle(.white)
40: .frame(minWidth: 72)
46: .editorChromeButtonStyle(style: .glass, size: .regular, shape: .circle)
53: .editorChromeButtonStyle(style: .glass, size: .regular, shape: .circle)
55: .padding(8)
56: .background {
59: .shadow(
60: color: .black.opacity(0.45),
64: .padding(.bottom, 24)
66: .foregroundStyle(.white)
71: VStack(alignment: .leading, spacing: 2) {
73: .font(.headline)
74: .lineLimit(1)
76: .font(.subheadline)
77: .foregroundStyle(.secondary)
78: .lineLimit(1)
80: .frame(maxWidth: 240, alignment: .leading)
81: .padding(.leading, 8)
86: .frame(height: 28)
87: .overlay(Color.white.opacity(0.2))
92: let shape = Capsule()
97: .editorChromeGlassEffect(
98: .regular.tint(Color.black.opacity(0.62)),
101: .overlay {
102: shape.stroke(
103: Color.white.opacity(0.2),
110: .overlay {
111: shape.fill(Color.black.opacity(0.58))
113: .overlay {
114: shape.stroke(
115: Color.white.opacity(0.2),
```

## ExcalidrawZ/SidebarTrailing/Presentation/PresentationInspectorContent.swift

318 lines. Check platform/build reachability at the call site.

```text
44: fileState.currentActiveFile?.name ?? String(localizable: .presentationTitle)
78: .transition(.opacity)
83: .transition(.opacity)
86: .frame(maxWidth: .infinity, maxHeight: .infinity)
91: title: String(localizable: .presentationTitle),
112: .overlay {
138: String(localizable: .presentationStart),
143: .help(String(localizable: .presentationStart))
146: model.presentationSlides.isEmpty ||
148: model.presentationSlides.contains { $0.image == nil }
286: slides: model.presentationSlides,
312: .frame(width: 0, height: 0)
```

## ExcalidrawZ/SidebarTrailing/Presentation/PresentationInspectorPlaceholder.swift

68 lines. Check platform/build reachability at the call site.

```text
23: VStack(spacing: spacing) {
27: .controlSize(.small)
28: Text(localizable: .presentationLoading)
29: .foregroundStyle(.secondary)
33: .font(.system(size: 28))
34: .foregroundStyle(.secondary)
35: Text(localizable: .presentationNoFramesTitle)
36: .font(.headline)
37: Text(localizable: .presentationNoFramesMessage)
38: .foregroundStyle(.secondary)
43: .font(.system(size: 28))
44: .foregroundStyle(.secondary)
45: Text(localizable: .presentationLoadFailed)
46: .font(.headline)
48: .foregroundStyle(.secondary)
52: String(localizable: .presentationRefresh),
58: .frame(maxWidth: .infinity, maxHeight: .infinity)
59: .padding(24)
```

## ExcalidrawZ/SidebarTrailing/Presentation/PresentationSlideList.swift

210 lines. Check platform/build reachability at the call site.

```text
19: _ transition: ExcalidrawPresentationConfiguration.Transition
29: LazyVStack(spacing: 0) {
49: .contentShape(Rectangle())
59: .frame(width: 240)
72: .padding(.horizontal, 12)
73: .padding(.bottom, 12)
93: VStack(spacing: 0) {
95: transition: slide.transition,
110: .opacity(isDragging ? 0.45 : 1)
111: .onHover { isHovered in
133: VStack(alignment: .leading, spacing: 7) {
134: Color.secondary.opacity(0.08)
135: .aspectRatio(16 / 10, contentMode: .fit)
136: .overlay {
141: .padding(4)
144: .controlSize(.small)
147: .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
149: HStack(spacing: 6) {
151: .font(.caption.monospacedDigit())
152: .foregroundStyle(.secondary)
153: .frame(minWidth: 18, alignment: .leading)
156: .font(.callout)
157: .lineLimit(1)
162: .padding(8)
163: .background {
164: RoundedRectangle(cornerRadius: 8, style: .continuous)
165: .fill(isSelected ? Color.accentColor.opacity(0.12) : Color.clear)
167: .overlay {
168: RoundedRectangle(cornerRadius: 8, style: .continuous)
169: .stroke(
170: isSelected ? Color.accentColor : Color.secondary.opacity(0.18),
```

## ExcalidrawZ/SidebarTrailing/Presentation/PresentationSlideTransitionControl.swift

169 lines. Check platform/build reachability at the call site.

```text
14: let transition: ExcalidrawPresentationConfiguration.Transition
30: .font(.caption.weight(.semibold))
33: .editorChromeButtonStyle(
38: .opacity(isAddControlVisible ? 1 : 0)
39: .scaleEffect(isAddControlVisible ? 1 : 0.8)
45: .frame(height: 34)
49: HStack(spacing: 6) {
51: PresentationTransitionLabel(transition: transition)
52: .font(.caption)
54: .editorChromeButtonStyle(
64: .font(.caption.monospacedDigit())
66: .editorChromeButtonStyle(
82: localizable: .presentationTransitionDurationSeconds(
89: VStack(alignment: .leading, spacing: 12) {
91: Text(localizable: .presentationTransitionDuration)
92: .font(.headline)
97: .font(.callout.monospacedDigit())
98: .foregroundStyle(.secondary)
115: .padding(14)
116: .frame(width: 240)
130: PresentationTransitionLabel(transition: transition)
138: .help(String(localizable: .presentationAddTransition))
143: let transition: ExcalidrawPresentationConfiguration.Transition
149: String(localizable: .presentationTransitionNone),
154: String(localizable: .presentationTransitionFade),
159: String(localizable: .presentationTransitionSlide),
164: String(localizable: .presentationTransitionZoom),
```

## ExcalidrawZ/SidebarTrailing/Presentation/PresentationStage.swift

133 lines. Check platform/build reachability at the call site.

```text
14: let transition: ExcalidrawPresentationConfiguration.Transition
23: .opacity(opacity(for: .outgoing))
24: .scaleEffect(scale(for: .outgoing))
25: .offset(
28: width: geometry.size.width
35: .opacity(opacity(for: .incoming))
36: .scaleEffect(scale(for: .incoming))
37: .offset(
40: width: geometry.size.width
45: .frame(
46: width: geometry.size.width,
47: height: geometry.size.height,
59: .padding(24)
62: .controlSize(.large)
63: .tint(.white)
109: width: CGFloat
```

## ExcalidrawZ/SidebarTrailing/Presentation/PresentationWelcomeView.swift

88 lines. Check platform/build reachability at the call site.

```text
17: VStack(spacing: 0) {
21: .padding(.horizontal, 20)
22: .padding(.bottom, 24)
25: Text(localizable: .presentationWelcomeButton)
26: .frame(maxWidth: .infinity)
28: .editorChromeButtonStyle(
33: .padding(.horizontal, 20)
35: Text(localizable: .presentationWelcomeButtonCaption)
36: .font(.caption)
37: .foregroundStyle(.secondary)
39: .padding(.horizontal, 24)
40: .padding(.top, 8)
44: .background {
50: VStack(spacing: 14) {
52: .font(.system(size: 30, weight: .medium))
53: .foregroundStyle(.tint)
54: .frame(width: 64, height: 64)
55: .background(.tint.opacity(0.12), in: Circle())
57: VStack(spacing: 7) {
58: Text(localizable: .presentationWelcomeCaption)
59: .font(.caption.weight(.semibold))
61: .foregroundStyle(.secondary)
63: Text(localizable: .presentationWelcomeTitle)
64: .font(.title2.weight(.semibold))
67: Text(localizable: .presentationWelcomeMessage)
68: .font(.callout)
69: .foregroundStyle(.secondary)
75: private var background: some View {
76: LinearGradient(
78: Color.accentColor.opacity(0.12),
80: Color.pink.opacity(0.08)
```

## ExcalidrawZ/SidebarTrailing/Search/SearchInspectorContent.swift

419 lines. Check platform/build reachability at the call site.

```text
38: private var contentSpacing: CGFloat {
42: private var horizontalPadding: CGFloat {
46: private var verticalPadding: CGFloat {
50: private var searchFieldVerticalPadding: CGFloat {
54: private var navigationSpacing: CGFloat {
58: private var caseToggleSize: CGSize {
59: isCompactIOS ? CGSize(width: 32, height: 24) : CGSize(width: 22, height: 18)
62: private var caseToggleCornerRadius: CGFloat {
66: private var resultRowHorizontalPadding: CGFloat {
70: private var resultRowVerticalPadding: CGFloat {
74: private var resultRowCornerRadius: CGFloat {
98: VStack(alignment: .leading, spacing: contentSpacing) {
103: .padding(.horizontal, horizontalPadding)
104: .padding(.vertical, verticalPadding)
105: .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
119: HStack(spacing: 8) {
121: .foregroundStyle(.secondary)
132: .foregroundStyle(.secondary)
134: .buttonStyle(.plain)
137: .padding(.horizontal, 12)
138: .padding(.vertical, searchFieldVerticalPadding)
139: .background {
140: Capsule()
149: HStack(spacing: navigationSpacing) {
155: .font(.caption)
156: .foregroundStyle(.secondary)
164: .buttonStyle(.plain)
172: .buttonStyle(.plain)
175: .opacity(results.isEmpty && query.isEmpty ? 0 : 1)
176: .controlSize(.small)
181: let shape = RoundedRectangle(cornerRadius: caseToggleCornerRadius)
190: .font(.system(size: 11, weight: .semibold))
191: .frame(width: caseToggleSize.width, height: caseToggleSize.height)
192: .background(
194: .fill(caseSensitive ? Color.accentColor.opacity(0.2) : Color.clear)
196: .overlay(
198: .strokeBorder(
199: caseSensitive ? Color.accentColor.opacity(0.6) : Color.secondary.opacity(0.3),
203: .foregroundStyle(caseSensitive ? Color.primary : Color.secondary)
204: .contentShape(Rectangle())
206: .buttonStyle(.plain)
207: .help(
218: .font(.caption.weight(.semibold))
219: .frame(width: 28, height: 28)
220: .contentShape(Circle())
223: .contentShape(Rectangle())
246: LazyVStack(alignment: .leading, spacing: 6) {
257: proxy.scrollTo(id, anchor: .center)
268: .foregroundStyle(.secondary)
271: .frame(maxWidth: .infinity, alignment: .center)
272: .padding(.top, 24)
281: HStack(alignment: .top, spacing: 8) {
282: Image(systemSymbol: result.elementType == .frame ? .squareDashed : .character)
283: .foregroundStyle(.secondary)
284: .font(.callout)
285: .frame(width: 16, alignment: .center)
286: .padding(.top, 2)
289: .lineLimit(2)
291: .frame(maxWidth: .infinity, alignment: .leading)
293: .padding(.horizontal, resultRowHorizontalPadding)
294: .padding(.vertical, resultRowVerticalPadding)
295: .contentShape(RoundedRectangle(cornerRadius: resultRowCornerRadius))
296: .background(
297: RoundedRectangle(cornerRadius: resultRowCornerRadius)
298: .fill(isSelected ? Color.accentColor.opacity(0.18) : Color.secondary.opacity(0.08))
300: .overlay(
301: RoundedRectangle(cornerRadius: resultRowCornerRadius)
302: .strokeBorder(isSelected ? Color.accentColor.opacity(0.6) : .clear, lineWidth: 1)
305: .buttonStyle(.plain)
412: matchAttr.backgroundColor = Color.yellow.opacity(0.4)
413: matchAttr.foregroundColor = .primary
```

## ExcalidrawZ/Store/FileState.swift

2554 lines. Check platform/build reachability at the call site.

```text
1270: animation: Animation? = nil,
```

## ExcalidrawZ/Store/LockedContentAutoRelockModifier.swift

223 lines. Check platform/build reachability at the call site.

```text
58: case .background:
201: .scrollWheel
```

## ExcalidrawZ/Store/ToolState.swift

603 lines. Check platform/build reachability at the call site.

```text
66: case .frame:
67: self = .frame
84: case .cursor:
102: case .frame:
138: self = .frame
156: case .cursor:
176: case .frame:
204: case .cursor:
226: case .frame:
261: case .cursor:
281: case .frame:
302: .font(.body.weight(.semibold))
307: .font(.body.weight(.semibold))
309: case .cursor:
311: .stroke(.primary, lineWidth: strokeLineWidth)
312: .aspectRatio(1, contentMode: .fit)
315: RoundedRectangle(cornerRadius: 3)
316: .stroke(.primary, lineWidth: strokeLineWidth)
317: .padding(1)
319: RoundedRectangle(cornerRadius: 3)
320: .stroke(.primary, lineWidth: strokeLineWidth)
322: .padding(2)
324: Circle()
325: .stroke(.primary, lineWidth: strokeLineWidth)
330: .font(.body.weight(.semibold))
332: Capsule()
333: .stroke(.primary, lineWidth: strokeLineWidth)
334: .frame(height: 1)
339: .font(.body.weight(.semibold))
344: .font(.body.weight(.semibold))
349: .font(.body.weight(.semibold))
354: .font(.body.weight(.semibold))
355: case .frame:
359: .font(.body.weight(.semibold))
364: .font(.body.weight(.semibold))
369: .font(.body.weight(.semibold))
374: .font(.body.weight(.semibold))
379: .font(.body.weight(.semibold))
444: func setActivedTool(_ tool: ExcalidrawTool?, animation: Animation? = .smooth) {
450: func setActiveToolFromWeb(_ tool: ExcalidrawTool, animation: Animation? = .smooth) {
451: setActiveToolMirror(tool, animation: animation)
454: private func setActiveToolMirror(_ tool: ExcalidrawTool, animation: Animation? = .smooth) {
457: setActivedTool(tool, animation: animation)
```

## ExcalidrawZ/Subscription/Paywall+CompactIOS.swift

161 lines. Check platform/build reachability at the call site.

```text
25: .background {
45: VStack(alignment: .leading, spacing: 20) {
46: VStack(alignment: .leading, spacing: 8) {
48: .font(.system(size: 34, weight: .semibold, design: .rounded))
49: .foregroundStyle(.primary)
53: .font(.callout)
54: .foregroundStyle(.secondary)
55: .lineSpacing(2)
82: .padding(.horizontal, 16)
83: .padding(.top, 24)
84: .padding(.bottom, 96)
86: .scrollIndicators(.hidden)
98: .keyboardShortcut(.cancelAction)
103: .frame(maxWidth: .infinity)
109: VStack(alignment: .leading, spacing: 12) {
114: .padding(.top, 2)
119: VStack(spacing: 12) {
121: HStack(spacing: 12) {
133: VStack(spacing: 8) {
134: HStack(spacing: 12) {
144: .frame(maxWidth: .infinity)
146: .font(.caption)
149: .font(.caption2)
150: .foregroundStyle(.secondary)
154: .frame(maxWidth: .infinity)
156: .padding(.top, 4)
```

## ExcalidrawZ/Subscription/Paywall+Regular.swift

270 lines. Check platform/build reachability at the call site.

```text
19: .frame(width: horizontalSizeClass == .compact ? 630 : 1040)
28: .padding(50)
29: .background {
35: LinearGradient(
37: .init(color: .accent, location: 0),
41: color: colorScheme == .dark
47: .init(color: colorScheme == .dark ? .black : .white, location: 0.4)
55: .scaleEffect(1.1)
73: HStack(alignment: .center, spacing: 52) {
75: .frame(maxWidth: .infinity, alignment: .leading)
77: VStack(spacing: 16) {
97: HStack(spacing: 4) {
105: .modernButtonStyle(
110: .opacity(0)
120: .modernButtonStyle(
125: .keyboardShortcut(.cancelAction)
128: VStack(alignment: .trailing, spacing: 4) {
136: .font(.footnote)
139: .font(.caption2)
140: .foregroundStyle(.secondary)
143: .font(.footnote)
146: .frame(width: 390)
149: .frame(height: 550)
154: VStack(alignment: .leading, spacing: 26) {
155: VStack(alignment: .leading, spacing: 12) {
157: .font(.system(size: 44, weight: .semibold, design: .rounded))
158: .tracking(-1.0)
159: .foregroundStyle(.primary)
162: .font(.title3)
163: .foregroundStyle(.secondary)
164: .lineSpacing(3)
168: VStack(alignment: .leading, spacing: 14) {
185: .overlay(alignment: .leading) {
197: HStack(spacing: 8) {
199: .font(.caption.weight(.medium))
200: .foregroundStyle(.secondary)
211: .frame(width: 140)
227: VStack(alignment: .leading, spacing: 18) {
236: .animation(.smooth(duration: 0.22), value: selectedSubscriptionItem?.id)
237: .animation(.smooth(duration: 0.22), value: activeSubscriptionItem?.id)
238: .animation(.smooth(duration: 0.22), value: maxCreditTier)
243: VStack(alignment: .leading, spacing: 12) {
244: HStack(spacing: 10) {
247: LinearGradient(
248: colors: [.clear, Color.secondary.opacity(0.24)],
253: .frame(width: 54, height: 1)
256: .font(.caption.weight(.semibold))
258: .tracking(1.2)
259: .foregroundStyle(.secondary)
262: VStack(alignment: .leading, spacing: 12) {
265: .transition(.opacity.combined(with: .move(edge: .top)))
```

## ExcalidrawZ/Subscription/Paywall.swift

718 lines. Check platform/build reachability at the call site.

```text
16: private static let minimumRegularIOSWidth: CGFloat = 760
231: HStack(spacing: 6) {
239: .font(.caption.weight(.semibold))
240: .padding(.horizontal, 14)
241: .padding(.vertical, 7)
242: .frame(maxWidth: .infinity)
243: .contentShape(Rectangle())
245: .buttonStyle(.plain)
246: .foregroundStyle(billingPeriod == period ? .primary : .secondary)
247: .background {
249: Capsule()
250: .fill(Color.white.opacity(colorScheme == .dark ? 0.16 : 0.74))
251: .shadow(color: .accentColor.opacity(0.16), radius: 10, y: 4)
256: .padding(4)
257: .background {
258: Capsule()
259: .fill(Color.white.opacity(colorScheme == .dark ? 0.08 : 0.38))
260: .background {
262: Capsule()
264: .glassEffect(.regular.interactive(), in: Capsule())
266: Capsule()
277: .foregroundStyle(.red)
278: .font(.footnote)
279: .padding(.horizontal, 12)
280: .padding(.vertical, 4)
281: .background {
282: Capsule().fill(Color.red.opacity(0.5))
283: Capsule().fill(.ultraThickMaterial)
291: HStack(alignment: .top, spacing: 12) {
293: .font(.system(size: 15, weight: .semibold))
294: .foregroundStyle(AIAppearancePalette.foregroundGradient)
295: .frame(width: 24, height: 24)
297: VStack(alignment: .leading, spacing: 2) {
298: HStack(spacing: 8) {
300: .font(.callout.weight(.semibold))
311: .font(.caption2.weight(.semibold))
312: .foregroundStyle(.secondary)
313: .padding(.horizontal, 7)
314: .padding(.vertical, 3)
315: .background {
316: Capsule()
317: .fill(Color.orange.opacity(colorScheme == .dark ? 0.18 : 0.12))
323: .font(.footnote)
324: .foregroundStyle(.secondary)
339: .font(.caption.weight(.semibold))
340: .foregroundStyle(.secondary)
341: .frame(width: 18, height: 18)
342: .contentShape(Circle())
344: .buttonStyle(.plain)
358: .help(String(localizable: .settingsAIMCPServiceModeHelp))
379: Text(" \(selectedBillingProduct.displayPrice) \(period)").font(.footnote)
383: .padding(.horizontal)
384: .frame(maxWidth: isCompactIOSPaywall ? .infinity : nil)
386: .controlSize({
393: .buttonStyle(.borderedProminent)
405: .buttonStyle(.borderless)
428: .modernButtonStyle(style: .glassProminent, size: .extraLarge, shape: .capsule)
435: VStack(spacing: 3) {
446: .foregroundStyle(.secondary)
447: .buttonStyle(.borderless)
482: .buttonStyle(.borderless)
612: TimelineView(.animation(minimumInterval: 1 / 24, paused: false)) { context in
626: LinearGradient(
628: Color(hue: topHueA, saturation: 0.58, brightness: 1).opacity(colorScheme == .dark ? 0.30 : 0.42),
629: Color(hue: topHueB, saturation: 0.44, brightness: 1).opacity(colorScheme == .dark ? 0.16 : 0.24),
635: .frame(height: proxy.size.height * 0.55)
636: .blur(radius: 42)
637: .offset(x: driftX * 0.45, y: -proxy.size.height * 0.18 + driftY)
639: LinearGradient(
642: Color(hue: bottomHueB, saturation: 0.48, brightness: 1).opacity(colorScheme == .dark ? 0.15 : 0.22),
643: Color(hue: bottomHueA, saturation: 0.52, brightness: 1).opacity(colorScheme == .dark ? 0.26 : 0.34)
648: .frame(height: proxy.size.height * 0.62)
649: .blur(radius: 48)
650: .offset(x: -driftX * 0.65, y: proxy.size.height * 0.22 - driftY)
652: Circle()
653: .fill(Color(hue: topHueA, saturation: 0.62, brightness: 1).opacity(colorScheme == .dark ? 0.16 : 0.20))
654: .frame(width: 360, height: 360)
655: .blur(radius: 72)
656: .offset(x: -proxy.size.width * 0.34 + driftX, y: -proxy.size.height * 0.18)
658: Circle()
659: .fill(Color(hue: bottomHueA, saturation: 0.58, brightness: 1).opacity(colorScheme == .dark ? 0.14 : 0.18))
660: .frame(width: 430, height: 430)
661: .blur(radius: 88)
662: .offset(x: proxy.size.width * 0.30 - driftX * 0.55, y: proxy.size.height * 0.30 + driftY)
664: .overlay {
667: Color.white.opacity(colorScheme == .dark ? 0.08 : 0.24),
668: Color(hue: topHueB, saturation: 0.30, brightness: 1).opacity(colorScheme == .dark ? 0.05 : 0.14),
676: .overlay {
677: LinearGradient(
679: base.opacity(colorScheme == .dark ? 0.72 : 0.96),
680: base.opacity(colorScheme == .dark ? 0.42 : 0.76),
687: .frame(maxWidth: .infinity, maxHeight: .infinity)
710: .buttonStyle(.accessoryBar)
```

## ExcalidrawZ/Subscription/components/CompactPlansView.swift

134 lines. Check platform/build reachability at the call site.

```text
19: VStack(spacing: 10) {
20: VStack(alignment: .leading, spacing: 6) {
26: .foregroundStyle(.green)
31: .frame(maxWidth: .infinity, alignment: .leading)
32: .padding()
45: HStack(spacing: 10) {
56: .font(.headline)
59: .font(.footnote)
60: .foregroundStyle(.secondary)
64: .font(.headline)
66: .font(.footnote)
67: .foregroundStyle(.secondary)
70: .frame(width: 100, height: 100)
71: .background {
72: let roundedRectangle = RoundedRectangle(cornerRadius: 14)
76: .fill(.background)
77: .opacity(0.08)
81: .tint(accent.opacity(colorScheme == .dark ? 0.18 : 0.12))
88: .fill(accent.opacity(colorScheme == .dark ? 0.13 : 0.08))
90: .stroke(accent.opacity(0.95), lineWidth: 1.2)
93: .stroke(Color.white.opacity(colorScheme == .dark ? 0.10 : 0.42), lineWidth: 0.6)
96: .shadow(color: accent.opacity(isSelected ? 0.26 : 0.10), radius: isSelected ? 16 : 8, y: isSelected ? 8 : 4)
108: .stroke(Color.accentColor)
```

## ExcalidrawZ/Subscription/components/RegularPlansView.swift

353 lines. Check platform/build reachability at the call site.

```text
54: VStack(spacing: 12) {
65: .contentShape(Rectangle())
138: .padding(.horizontal, 18)
139: .padding(.vertical, 14)
140: .frame(maxWidth: .infinity)
141: .frame(height: 112, alignment: .center)
142: .background {
144: let roundedRectangle = RoundedRectangle(cornerRadius: 22)
150: .tint(accent.opacity(colorScheme == .dark ? 0.18 : 0.12))
158: accent.opacity(colorScheme == .dark ? 0.12 : 0.08)
161: .stroke(
162: LinearGradient(
164: Color.white.opacity(colorScheme == .dark ? 0.55 : 0.90),
165: accent.opacity(0.92),
166: Color.pink.opacity(0.55)
175: .stroke(Color.white.opacity(colorScheme == .dark ? 0.10 : 0.42), lineWidth: 0.7)
179: .shadow(color: accent.opacity(isSelected ? 0.30 : 0.12), radius: isSelected ? 24 : 12, y: isSelected ? 12 : 6)
180: .animation(.easeIn(duration: 0.2), value: isSelected)
182: let roundedRectangle = RoundedRectangle(cornerRadius: 12)
187: roundedRectangle.stroke(.accent)
189: roundedRectangle.stroke(.separator)
192: .shadow(color: .accent, radius: isSelected ? 4 : 0)
193: .animation(.easeIn(duration: 0.2), value: isSelected)
196: .scaleEffect(isSelected ? 1.015 : 1, anchor: .center)
197: .overlay(alignment: .topTrailing) {
200: .padding(.top, 10)
201: .padding(.trailing, 12)
209: HStack(spacing: 16) {
210: VStack(alignment: .leading, spacing: 6) {
211: HStack(spacing: 8) {
213: .font(.title3.weight(.semibold))
221: .font(.footnote)
222: .foregroundStyle(.secondary)
223: .lineLimit(2)
229: VStack(alignment: .trailing, spacing: 2) {
232: .font(.title3.bold())
235: .font(.footnote)
236: .foregroundStyle(.secondary)
240: .font(.title3.bold())
243: .font(.footnote)
244: .foregroundStyle(.secondary)
305: .font(.caption2.weight(.semibold))
306: .foregroundStyle(colorScheme == .dark ? Color.white : accent)
307: .padding(.horizontal, 7)
308: .padding(.vertical, 3)
309: .background {
310: Capsule()
311: .fill(accent.opacity(colorScheme == .dark ? 0.42 : 0.12))
313: .overlay {
315: Capsule()
316: .stroke(Color.white.opacity(0.20), lineWidth: 0.6)
323: HStack(spacing: 3) {
332: .font(.caption2.weight(.bold))
333: .padding(.horizontal, 7)
334: .padding(.vertical, 3)
335: .contentShape(Capsule())
337: .buttonStyle(.plain)
338: .foregroundStyle(selection.wrappedValue == tier ? Color.white : accent)
339: .background {
341: Capsule()
347: .padding(2)
348: .background {
349: Capsule()
350: .fill(accent.opacity(colorScheme == .dark ? 0.14 : 0.10))
```

## ExcalidrawZ/Subscription/components/SwitchAppStoreVersionView.swift

192 lines. Check platform/build reachability at the call site.

```text
21: .padding(40)
22: .frame(width: 660, height: 540)
38: .padding(.horizontal)
39: .font(.title)
45: Text("❗️❗️❗️\(String(localizable: .migrationAttentionTitle))❗️❗️❗️").font(.headline)
49: .padding(.vertical)
50: .padding(.horizontal, 40)
51: .background {
52: RoundedRectangle(cornerRadius: 8)
53: .fill(Color(hexString: "#f57c00").opacity(0.6))
54: RoundedRectangle(cornerRadius: 8)
55: .stroke(Color(hexString: "#ffb74d"))
60: HStack(spacing: spacing) {
62: VStack(spacing: 20) {
66: .frame(height: 30)
67: VStack(spacing: 10) {
69: .font(.headline)
71: .foregroundStyle(.secondary)
73: .frame(maxHeight: .infinity, alignment: .top)
92: .padding()
93: .frame(width: (geometry.size.width - spacing) / 2, height: geometry.size.height)
94: .overlay(alignment: .topLeading) {
98: .frame(height: 100)
100: .offset(x: -30, y: -30)
101: .foregroundStyle(.quaternary)
103: .clipShape(RoundedRectangle(cornerRadius: 12))
104: .background {
106: RoundedRectangle(cornerRadius: 12)
108: .stroke(.separator, lineWidth: 0.5)
111: RoundedRectangle(cornerRadius: 12)
114: RoundedRectangle(cornerRadius: 12)
115: .stroke(.separator, lineWidth: 0.5)
121: VStack(spacing: 20) {
125: .frame(height: 30)
126: VStack(spacing: 10) {
128: .font(.headline)
131: .foregroundStyle(.secondary)
133: .frame(maxHeight: .infinity, alignment: .top)
145: .padding()
146: .frame(width: (geometry.size.width - spacing) / 2, height: geometry.size.height)
147: .overlay(alignment: .topLeading) {
151: .frame(height: 100)
153: .offset(x: -30, y: -30)
154: .foregroundStyle(.quaternary)
156: .clipShape(RoundedRectangle(cornerRadius: 12))
157: .background {
160: RoundedRectangle(cornerRadius: 12)
162: .stroke(.separator, lineWidth: 0.5)
165: RoundedRectangle(cornerRadius: 12)
168: RoundedRectangle(cornerRadius: 12)
169: .stroke(.separator, lineWidth: 0.5)
175: .buttonStyle(.borderedProminent)
176: .controlSize(.large)
184: .buttonStyle(.borderless)
```

## ExcalidrawZ/Utils/ActivityView.swift

80 lines. Check platform/build reachability at the call site.

```text
58: .presentationDetents([.medium, .large])
```

## ExcalidrawZ/Utils/CursorHoverView/CursorHoverView.swift

138 lines. Check platform/build reachability at the call site.

```text
14: var cursor: NSCursor
17: init(cursor: NSCursor, rootView: Content) {
82: var cursor: NSCursor
86: cursor: NSCursor,
95: cursor: cursor,
107: var cursor: NSCursor
110: HoverCursorContainer(cursor: cursor) {
130: modifier(HoverCursorModifier(cursor: style.asNSCursor))
```

## ExcalidrawZ/Utils/FileSyncCoordinator/FileSyncCoordinator.swift

380 lines. Check platform/build reachability at the call site.

```text
376: case .background: return 45.0
```

## ExcalidrawZ/Utils/FileSyncCoordinator/ICloudStatusMonitor.swift

297 lines. Check platform/build reachability at the call site.

```text
25: private var backgroundPollingTask: Task<Void, Never>?
222: backgroundPollingTask = startPollingTask(for: .background)
```

## ExcalidrawZ/Utils/MCP/Bridge/ExcalidrawMCPAppBridge.swift

1703 lines. Check platform/build reachability at the call site.

```text
1354: width: viewportUpdate.width,
1355: height: viewportUpdate.height
```

## ExcalidrawZ/Utils/MCP/UpstreamCompat/ExcalidrawMCPUpstreamElementResolver.swift

200 lines. Check platform/build reachability at the call site.

```text
21: let width: Double
22: let height: Double
113: width: width,
114: height: height
```

## ExcalidrawZ/Utils/MCP/UpstreamCompat/ExcalidrawMCPUpstreamRecall.swift

386 lines. Check platform/build reachability at the call site.

```text
42: ### Background Zones (use with opacity: 30 for layered diagrams)
64: - `backgroundColor: "#a5d8ff"`, `fillStyle: "solid"` for filled
95: - width, height: size of the visible area — MUST be 4:3 ratio (400×300, 600×450, 800×600, 1200×900, 1600×1200)
152: - Leave padding: don't match camera size to content size exactly (e.g., 500px content in 800x600 camera)
357: Then use these colors on the dark background:
```

## ExcalidrawZ/Utils/MCP/UpstreamCompat/ExcalidrawMCPUpstreamToolHandler.swift

201 lines. Check platform/build reachability at the call site.

```text
16: let width: Double
17: let height: Double
180: return CameraSize(width: width, height: height)
```

## ExcalidrawZ/Utils/MathRendering/LatexMathWebRenderer.swift

374 lines. Check platform/build reachability at the call site.

```text
35: foregroundColor: request.foregroundColor
51: let svg = request.foregroundColor.map {
59: width: number(from: result["width"]),
60: height: number(from: result["height"])
86: let webView = WKWebView(frame: .init(x: 0, y: 0, width: 1, height: 1), configuration: configuration)
145: private static func applyForegroundColor(_ color: String, to svg: String) -> String {
169: tag.replaceSubrange(styleRange, with: #"style="color: \#(color); fill: \#(color);\#(separator)\#(style)""#)
171: tag.insert(contentsOf: #" style="color: \#(color); fill: \#(color);""#, at: tag.index(before: tag.endIndex))
193: width: 100%;
194: height: 100%;
195: margin: 0;
196: padding: 0;
198: background: transparent;
```

## ExcalidrawZ/Utils/MathRendering/MathFunctionPlotWebRenderer.swift

363 lines. Check platform/build reachability at the call site.

```text
45: width: number(from: result["width"]) ?? request.width,
46: height: number(from: result["height"]) ?? request.height
72: let webView = WKWebView(frame: .init(x: 0, y: 0, width: 1, height: 1), configuration: configuration)
149: width: 100%;
150: height: 100%;
151: margin: 0;
152: padding: 0;
154: background: transparent;
157: width: 1px;
158: height: 1px;
186: color: expression.colorHex,
258: text { fill: ${textColor}; font-family: -apple-system, BlinkMacSystemFont, "SF Pro Text", sans-serif; font-size: ${tickFontSize}px; font-weight: 500; }
259: .axis path, .axis line { stroke: ${axisColor}; stroke-width: ${axisStrokeWidth}; fill: none; }
260: .grid line { stroke: ${gridColor}; stroke-width: ${gridStrokeWidth}; stroke-opacity: 0.92; }
261: .graph path { fill: none; stroke-width: ${graphStrokeWidth}; }
```

## ExcalidrawZ/Utils/MathRendering/MathRenderService.swift

154 lines. Check platform/build reachability at the call site.

```text
57: var width: Double
58: var height: Double
66: var backgroundColor: String?
```

## ExcalidrawZ/Utils/MathRendering/MathRenderedSVG.swift

30 lines. Check platform/build reachability at the call site.

```text
14: let width: Double?
15: let height: Double?
26: width: width,
27: height: height
```

## ExcalidrawZ/Utils/Migration/MigrateToNewVersion.swift

203 lines. Check platform/build reachability at the call site.

```text
45: VStack(spacing: 20) {
47: .font(.largeTitle)
52: Text("❗️❗️❗️\(String(localizable: .migrationAttentionTitle))❗️❗️❗️").font(.headline)
55: .padding(.vertical)
56: .padding(.horizontal, 40)
57: .background {
58: RoundedRectangle(cornerRadius: 8)
60: RoundedRectangle(cornerRadius: 8)
61: .stroke(Color(hexString: "#ffb74d"))
66: HStack(spacing: spacing) {
67: VStack(spacing: 20) {
71: .frame(height: 30)
72: VStack(spacing: 10) {
74: .font(.headline)
76: .foregroundStyle(.secondary)
78: .frame(maxHeight: .infinity, alignment: .top)
86: .padding()
87: .frame(width: (geometry.size.width - spacing) / 2, height: geometry.size.height)
88: .background {
90: RoundedRectangle(cornerRadius: 12)
92: .stroke(.separator, lineWidth: 0.5)
95: RoundedRectangle(cornerRadius: 12)
98: RoundedRectangle(cornerRadius: 12)
99: .stroke(.separator, lineWidth: 0.5)
104: VStack(spacing: 20) {
108: .frame(height: 30)
109: VStack(spacing: 10) {
111: .font(.headline)
114: .foregroundStyle(.secondary)
116: .frame(maxHeight: .infinity, alignment: .top)
129: .padding()
130: .frame(width: (geometry.size.width - spacing) / 2, height: geometry.size.height)
131: .background {
134: RoundedRectangle(cornerRadius: 12)
136: .stroke(.separator, lineWidth: 0.5)
139: RoundedRectangle(cornerRadius: 12)
142: RoundedRectangle(cornerRadius: 12)
143: .stroke(.separator, lineWidth: 0.5)
149: .buttonStyle(.borderedProminent)
150: .controlSize(.large)
153: .padding(.horizontal, 40)
159: .opacity(0)
166: .controlSize(.large)
167: .buttonStyle(.borderless)
173: .padding(.horizontal, 20)
176: .padding()
177: .frame(width: 600, height: 500)
190: .background(Color.accentColor.gradient)
194: .background(Color.accentColor)
```

## ExcalidrawZ/Utils/PrinterWebView/PrinterWebView.swift

226 lines. Check platform/build reachability at the call site.

```text
58: width: printInfo.paperSize.width,
59: height: printInfo.paperSize.height
65: size: CGSize(width: 595, height: 842) // standard A4
137: printOperation.view?.frame = webView.frame // important
```

## ExcalidrawZ/Utils/Utils.swift

834 lines. Check platform/build reachability at the call site.

```text
617: imageView.frame.size.width = printInfo.paperSize.width
618: imageView.frame.size.height = printInfo.paperSize.width / printImage.width * printImage.size.height
651: let pageSize = CGSize(width: 595.2, height: 841.8) // A4 尺寸，单位为点 (1 point = 1/72 inch)
661: let scaledImageSize = CGSize(width: image.size.width * scale, height: image.size.height * scale)
674: width: image.size.width,
675: height: isLastPage ? image.size.height - CGFloat(page) * pageSize.height / scale // 剩余高度
686: width: pageSize.width,
687: height: remainingHeight
694: width: pageSize.width,
695: height: pageSize.height
```

## ExcalidrawZ/components/AnimatedPresence.swift

1089 lines. Check platform/build reachability at the call site.

```text
71: let snapshot = currentSnapshot(subviews: subviews, width: proposal.width)
90: return CGSize(width: width, height: height)
99: let snapshot = currentSnapshot(subviews: subviews, width: bounds.width)
107: proposal: ProposedViewSize(width: bounds.width, height: item.size.height)
140: width: CGFloat?
143: sanitized(subview.sizeThatFits(ProposedViewSize(width: width, height: nil)))
281: forHeight height: CGFloat,
294: width: size.width.isFinite ? max(0, size.width) : 0,
295: height: size.height.isFinite ? max(0, size.height) : 0
420: private let animation: Animation?
434: @State private var visibleHeight: CGFloat = 0
437: @State private var measuredHeight: CGFloat = 0
441: @State private var targetHeight: CGFloat = 0
487: animation: Animation? = .easeInOut(duration: 0.22),
494: self.animation = animation
506: animation: Animation = .easeInOut(duration: 0.22),
515: self.animation = animation
539: .animation(animation, value: displayValue)
540: .opacity(renderedContentOpacity)
541: .background {
790: var visibleHeight: CGFloat
810: ProposedViewSize(width: proposal.width, height: nil)
813: width: intrinsic.width.isFinite ? intrinsic.width : 0,
816: height: max(0, visibleHeight)
828: ProposedViewSize(width: bounds.width, height: nil)
837: proposal: ProposedViewSize(width: intrinsic.width, height: intrinsic.height)
873: let animation: Animation
878: animation: Animation = .smooth
882: self.animation = animation
886: CollapsibleSpacingVStack(alignment: .leading, spacing: 4) {
888: .lineLimit(1)
889: .font(.headline)
893: animation: animation,
894: contentTransition: .opacity
897: .font(.caption)
898: .foregroundStyle(.secondary)
899: .lineLimit(3)
905: .frame(maxWidth: .infinity, alignment: .leading)
924: animation: .smooth
953: VStack(alignment: .leading) {
955: .lineLimit(1)
956: .font(.headline)
960: .font(.caption)
961: .foregroundStyle(.secondary)
962: .lineLimit(3)
963: .transition(.opacity)
968: .font(.caption)
969: .foregroundStyle(.secondary)
971: .frame(maxWidth: .infinity, alignment: .leading)
973: VStack(alignment: .leading) {
975: .lineLimit(1)
976: .font(.headline)
979: .font(.caption)
980: .foregroundStyle(.secondary)
981: .lineLimit(3)
982: .contentTransition(.opacity)
983: .animation(.smooth, value: sampleIndex)
986: .font(.caption)
987: .foregroundStyle(.secondary)
989: .frame(maxWidth: .infinity, alignment: .leading)
1019: VStack(alignment: .leading, spacing: 4) {
1021: .lineLimit(1)
1022: .font(.headline)
1026: animation: .smooth,
1030: .font(.title2.monospacedDigit())
1031: .foregroundStyle(.secondary)
1032: .lineLimit(1)
1035: .frame(maxWidth: .infinity, alignment: .leading)
1049: CollapsibleSpacingVStack(alignment: .leading) {
1051: .font(.headline)
1062: .font(.caption)
1063: .foregroundStyle(.secondary)
1069: .padding()
```

## ExcalidrawZ/components/AutoContainVideoPlayer.swift

162 lines. Check platform/build reachability at the call site.

```text
37: .overlay {
39: .font(.footnote.italic())
40: .foregroundStyle(.red)
41: .padding(40)
46: .frame(height: 300)
70: self.videoDimension = CGSize(width: width, height: height)
85: var orginSize: () -> CGSize?
106: @State private var width: CGFloat?
107: @State private var height: CGFloat?
108: @State private var displayWidth: CGFloat?
109: @State private var displayHeight: CGFloat?
113: .readSize(width: $width, height: $height)
114: .frame(width: displayWidth, height: displayHeight)
```

## ExcalidrawZ/components/BeforeAfterSlider/BeforeAfterSlider.swift

243 lines. Check platform/build reachability at the call site.

```text
22: var autoplayDuration: Double = 10.0
73: .frame(width: geo.size.width, height: geo.size.height)
79: .frame(
80: width: geo.size.width * (1 - sliderPercentage),
81: height: geo.size.height
88: .frame(width: geo.size.width, height: geo.size.height)
93: .frame(
94: width: geo.size.width * sliderPercentage,
95: height: geo.size.height
103: .fill(LinearGradient(colors: [.clear, .blue, .clear],
105: .frame(width: 2)
112: Circle()
114: .blur(radius: 2)
115: .frame(width: 6)
118: .offset(x: geo.size.width * (sliderPercentage - 0.5))
123: .frame(width: 30, height: 30)
124: .background(Color.white)
125: .clipShape(Circle())
126: .shadow(radius: 2)
134: updatePercentage(x: value.location.x, width: geo.size.width)
140: .contentShape(Rectangle())
141: .onHover { inside in
156: updatePercentage(x: value.location.x, width: geo.size.width)
172: private func updatePercentage(x: CGFloat, width: CGFloat) {
202: system.shape = .box(width: 0, height: 1) // 垂直发射区域
240: .foregroundColor(.black)
```

## ExcalidrawZ/components/Button+/ToolbarDoneButton.swift

22 lines. Check platform/build reachability at the call site.

```text
20: .editorChromeButtonStyle(style: .glassProminent)
```

## ExcalidrawZ/components/CircularProgressIndicator.swift

63 lines. Check platform/build reachability at the call site.

```text
15: var lineWidth: CGFloat = 4
20: Circle()
22: .frame(width: size, height: size)
25: Circle()
27: .stroke(
28: AngularGradient(
37: .frame(width: size - lineWidth, height: size - lineWidth)
45: .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
59: .transition(.scale.combined(with: .opacity))
```

## ExcalidrawZ/components/CloudStorageDocumentSyncIndicator.swift

328 lines. Check platform/build reachability at the call site.

```text
36: .buttonStyle(.plain)
40: transition: visibilityTransition
47: transition: visibilityTransition
52: .animation(.smooth(duration: 0.22), value: state)
61: insertion: .move(edge: .trailing).combined(with: .opacity),
62: removal: .opacity
72: .font(.caption2)
73: .frame(width: 12, height: 12)
77: .frame(width: 16, height: 16)
81: .frame(width: 20, height: 20)
84: HStack(spacing: state.showsExpandedStatus ? 7 : 0) {
86: .frame(width: 20, height: 20)
90: .font(.callout)
91: .lineLimit(1)
92: .transition(.opacity.combined(with: .scale(scale: 0.98)))
95: .padding(.horizontal, 8)
96: .frame(height: 32)
97: .background {
99: Capsule()
101: .editorChromeGlassEffect(.regular, in: Capsule())
103: Capsule()
122: .controlSize(.mini)
126: .controlSize(.mini)
185: : state.tint
213: transition: AnyTransition
216: .help(text)
217: .accessibilityLabel(text)
218: .transition(transition)
```

## ExcalidrawZ/components/CloudStorageProviderIcon.swift

59 lines. Check platform/build reachability at the call site.

```text
18: .frame(width: size, height: size)
21: .font(.system(size: size, weight: .medium))
22: .foregroundStyle(.secondary)
```

## ExcalidrawZ/components/ColorPicker/SpectrumColorPicker.swift

493 lines. Check platform/build reachability at the call site.

```text
26: @State private var color: HSBAColor
46: VStack(spacing: 12) {
48: .frame(height: 156)
51: .frame(height: 16)
55: .frame(height: 16)
60: .frame(minWidth: 220, idealWidth: 260)
82: .overlay {
83: LinearGradient(
84: colors: [.white, .white.opacity(0)],
89: .overlay {
90: LinearGradient(
104: .clipShape(RoundedRectangle(cornerRadius: 8))
105: .overlay {
106: RoundedRectangle(cornerRadius: 8)
107: .strokeBorder(.primary.opacity(0.16))
109: .contentShape(Rectangle())
130: LinearGradient(
145: .clipShape(Capsule())
146: .overlay {
147: Capsule()
148: .strokeBorder(.primary.opacity(0.16))
150: .contentShape(Rectangle())
169: LinearGradient(
171: color.opaqueSwiftUIColor.opacity(0),
184: .clipShape(Capsule())
185: .overlay {
186: Capsule()
187: .strokeBorder(.primary.opacity(0.16))
189: .contentShape(Rectangle())
204: HStack(spacing: 8) {
209: .frame(width: 30, height: 30)
210: .clipShape(Circle())
211: .overlay {
212: Circle()
213: .strokeBorder(.primary.opacity(0.16))
218: .font(.system(.body, design: .monospaced))
219: .padding(.horizontal, 9)
220: .frame(height: 30)
221: .background(.quaternary, in: RoundedRectangle(cornerRadius: 6))
232: .editorChromeButtonStyle(style: .glass, size: .small, shape: .circle)
240: .editorChromeButtonStyle(style: .glass, size: .small, shape: .circle)
246: Circle()
248: .frame(width: 16, height: 16)
249: .overlay {
250: Circle()
251: .strokeBorder(.white, lineWidth: 2)
253: .shadow(color: .black.opacity(0.45), radius: 1.5)
257: Capsule()
259: .frame(width: 5, height: 20)
260: .overlay {
261: Capsule()
262: .strokeBorder(.black.opacity(0.35))
264: .shadow(color: .black.opacity(0.25), radius: 1)
327: width: cellLength,
328: height: cellLength
345: init(_ color: Color) {
443: opacity: alpha
```

## ExcalidrawZ/components/CopyFeedbackButton.swift

93 lines. Check platform/build reachability at the call site.

```text
19: var iconFrame: CGSize = CGSize(width: 14, height: 14)
45: .frame(width: iconFrame.width, height: iconFrame.height)
46: .font(iconFont)
48: .foregroundStyle(copied ? copiedColor : normalColor)
49: .help(help)
```

## ExcalidrawZ/components/DebugNotifyModifier.swift

57 lines. Check platform/build reachability at the call site.

```text
31: .overlay {
```

## ExcalidrawZ/components/DesktopAppMenu.swift

194 lines. Check platform/build reachability at the call site.

```text
28: VStack(alignment: .leading, spacing: 2) {
29: Text("DRAWING").font(.system(size: 10, weight: .semibold))
30: .foregroundStyle(.secondary).padding(8)
42: Divider().padding(.vertical, 4)
60: Divider().padding(.vertical, 4)
74: .buttonStyle(NavigationShellButtonStyle())
82: .padding(6)
83: .frame(width: 266)
84: .background(NavigationShellTheme.surface(for: colorScheme), in: RoundedRectangle(cornerRadius: 8))
85: .overlay {
86: RoundedRectangle(cornerRadius: 8)
87: .strokeBorder(NavigationShellTheme.border(for: colorScheme), lineWidth: 1)
89: .shadow(color: .black.opacity(0.12), radius: 12, y: 5)
117: .focusable()
118: .focused($focusedItem, equals: title)
126: HStack(spacing: 10) {
127: Image(systemName: icon).frame(width: 17)
130: if let shortcut { Text(shortcut).font(.system(size: 11)).foregroundStyle(.secondary) }
132: .frame(maxWidth: .infinity, alignment: .leading)
153: .keyboardShortcut(isFocused ? KeyboardShortcut(.return, modifiers: []) : nil)
154: .background {
157: .keyboardShortcut(.space, modifiers: [])
158: .hidden().frame(width: 0, height: 0)
178: .focusable()
179: .focused(focusedItem, equals: "Settings…")
```

## ExcalidrawZ/components/DesktopDrawingMenu.swift

279 lines. Check platform/build reachability at the call site.

```text
49: VStack(alignment: .leading, spacing: 2) {
55: .font(.system(size: 10))
56: .accessibilityHidden(true)
59: .buttonStyle(FlatFileMenuActionStyle(dismiss: {}))
60: .accessibilityValue(isExpanded ? "Expanded" : "Collapsed")
62: VStack(alignment: .leading, spacing: 2) { content() }
63: .padding(.leading, 12)
133: Color.clear.frame(width: 0, height: 0)
147: @State private var contentHeight: CGFloat = 220
153: Color.clear.frame(width: 1, height: 1)
154: .allowsHitTesting(false).accessibilityHidden(true)
157: VStack(alignment: .leading, spacing: 2) { content() }
158: .padding(6)
159: .background(GeometryReader { geometry in
162: .buttonStyle(FlatFileMenuActionStyle(dismiss: { isPresented = false }))
172: .frame(width: 260, height: min(contentHeight, 360), alignment: .top)
174: .background(NavigationShellTheme.surface(for: colorScheme), in: RoundedRectangle(cornerRadius: 8))
175: .overlay {
176: RoundedRectangle(cornerRadius: 8)
177: .strokeBorder(NavigationShellTheme.border(for: colorScheme), lineWidth: 1)
215: button.focusable().focused(focusedRow, equals: id)
226: .font(.system(size: 13, weight: .medium))
227: .frame(maxWidth: .infinity, alignment: .leading)
228: .padding(.horizontal, 10)
229: .frame(height: 32)
230: .foregroundStyle(configuration.role == .destructive ? Color.red
232: .background {
233: RoundedRectangle(cornerRadius: 6)
237: .opacity(isEnabled ? 1 : 0.4)
238: .contentShape(Rectangle())
239: .onHover { isHovered = $0 }
241: .accessibilityRepresentation {
265: content.background {
268: .keyboardShortcut(.return, modifiers: [])
269: .hidden().frame(width: 0, height: 0)
271: .keyboardShortcut(.space, modifiers: [])
272: .hidden().frame(width: 0, height: 0)
```

## ExcalidrawZ/components/DesktopNavigationHeader.swift

147 lines. Check platform/build reachability at the call site.

```text
29: HStack(spacing: 6) {
33: Color.clear.frame(width: 80)
38: .help("Toggle sidebar")
42: .help("App menu")
43: .focusable()
44: .focused($isMenuButtonFocused)
48: .accessibilityValue(isMenuPresented ? "Expanded" : "Collapsed")
50: .frame(width: 1, height: 20).padding(.horizontal, 4)
52: NavigationBackButton().help("Back to files")
55: .font(.system(size: 14, weight: .semibold))
56: .lineLimit(1)
57: .truncationMode(.middle)
58: .frame(minWidth: 40, maxWidth: .infinity, alignment: .leading)
60: .background(DesktopHeaderDragRegion())
67: .frame(maxWidth: 150)
71: .help("Present drawing frames")
81: .buttonStyle(NavigationShellButtonStyle())
82: .padding(.horizontal, 10)
83: .frame(height: 52)
84: .background(NavigationShellTheme.surface(for: colorScheme))
85: .background(DesktopHeaderDragRegion())
86: .overlay(alignment: .bottom) {
87: Rectangle().fill(NavigationShellTheme.border(for: colorScheme)).frame(height: 1)
139: .font(.system(size: 11))
140: .foregroundStyle(warning ? Color.orange : Color.secondary)
141: .lineLimit(1)
142: .help(help)
143: .accessibilityLabel(text + ". " + help)
144: .padding(.horizontal, 6)
```

## ExcalidrawZ/components/DesktopSidebarHeading.swift

127 lines. Check platform/build reachability at the call site.

```text
10: VStack(alignment: .leading, spacing: 0) {
11: HStack(spacing: 6) {
13: .resizable().scaledToFit().frame(width: 20, height: 20)
14: .foregroundStyle(NavigationShellTheme.primary(for: colorScheme))
16: .resizable().scaledToFit().frame(width: 130, height: 18)
17: Text("Desktop").font(.system(size: 10)).foregroundStyle(.secondary)
19: .accessibilityElement(children: .ignore)
20: .accessibilityLabel("Excalidraw Desktop")
21: .padding(.horizontal, 16)
22: .frame(height: 52)
23: .frame(maxWidth: .infinity, alignment: .leading)
24: .overlay(alignment: .bottom) {
25: Rectangle().fill(NavigationShellTheme.border(for: colorScheme)).frame(height: 1)
27: VStack(spacing: 9) {
32: .frame(maxWidth: .infinity, alignment: .leading)
34: .buttonStyle(NavigationShellButtonStyle(accent: true, bordered: true))
37: HStack(spacing: 8) {
41: Text("⇧ ⌘ F").font(.system(size: 10))
43: .foregroundStyle(.secondary)
45: .buttonStyle(NavigationShellButtonStyle(bordered: true))
47: .padding(.horizontal, 12)
48: .padding(.top, 14)
49: .padding(.bottom, 6)
81: VStack(spacing: 0) {
84: Image(systemName: "clock").frame(width: 30, alignment: .leading)
88: .font(.system(size: 9))
91: .buttonStyle(.excalidrawSidebarRow(isSelected: false, isMultiSelected: false))
92: .accessibilityValue(isExpanded ? "Expanded" : "Collapsed")
107: VStack(spacing: 0) {
111: .lineLimit(1)
112: .frame(maxWidth: .infinity, alignment: .leading)
114: .buttonStyle(.excalidrawSidebarRow(
118: .help(file.name ?? "Untitled")
121: Text("No recent drawings").font(.caption).foregroundStyle(.secondary).padding(8)
124: .padding(.leading, 16)
```

## ExcalidrawZ/components/DisclosureGroup+/LeadingChevronDisclosureGroupStyle.swift

99 lines. Check platform/build reachability at the call site.

```text
53: VStack(alignment: .leading, spacing: 0) {
54: HStack(alignment: .center) {
56: .frame(width: CGFloat(depth * 8), height: 1)
59: .lineLimit(1)
60: .truncationMode(.middle)
64: .contentShape(Rectangle())
74: .overlay(alignment: .leading) {
76: .font(.footnote)
78: .contentShape(Rectangle())
```

## ExcalidrawZ/components/DisclosureGroup+/SelectableDisclosureGroup.swift

213 lines. Check platform/build reachability at the call site.

```text
89: HStack(spacing: 0) {
91: .frame(width: CGFloat(depth) * depthPaddingBase, height: 1)
94: Color.clear.frame(width: 6, height: 1)
96: Color.clear.frame(width: 4, height: 1)
100: .contentShape(Rectangle())
102: .buttonStyle(.excalidrawSidebarRow(isSelected: isSelected, isMultiSelected: false))
103: .overlay(alignment: .leading) {
105: HStack(spacing: 0) {
107: .frame(width: CGFloat(depth) * depthPaddingBase, height: 1)
110: .font(.footnote)
112: .padding(4)
113: .contentShape(Rectangle())
137: .foregroundStyle(config.labelForegroundStyle)
176: VStack(alignment: .leading, spacing: 0) {
```

## ExcalidrawZ/components/EditorChromeStyle.swift

93 lines. Check platform/build reachability at the call site.

```text
22: case .glass, .bordered:
24: case .glassProminent, .borderedProminent:
51: .background(NavigationShellTheme.surface(for: colorScheme), in: shape)
52: .overlay {
54: .stroke(NavigationShellTheme.border(for: colorScheme), lineWidth: 1)
91: return NavigationShellButtonStyle(accent: accent, bordered: true, height: height,
```

## ExcalidrawZ/components/ExcalidrawFileBrowser/ExcalidrawFileBrowser.swift

375 lines. Check platform/build reachability at the call site.

```text
30: HStack(spacing: 0) {
32: .frame(width: horizontalSizeClass == .compact ? nil : 200)
36: .frame(width: horizontalSizeClass == .compact ? nil : 460)
39: .frame(height: 400)
54: .background {
65: VStack(spacing: 0) {
67: LazyVGrid(columns: [GridItem(.adaptive(minimum: 100, maximum: 100))], spacing: 0) {
84: .padding()
85: .background {
87: .contentShape(Rectangle())
102: .padding(.horizontal)
104: .editorChromeButtonStyle(style: .glass, shape: .modern)
115: .padding(.horizontal)
117: .editorChromeButtonStyle(style: .glassProminent, shape: .modern)
120: .padding()
138: self._files = FetchRequest(fetchRequest: fileFetchRequest, animation: .default)
262: VStack(spacing: 6) {
266: .padding(4)
267: .frame(height: 60)
268: .background {
269: RoundedRectangle(cornerRadius: 4)
274: .foregroundStyle(isSelected ? AnyShapeStyle(Color.white) : AnyShapeStyle(.primary))
275: .font(.callout)
276: .padding(2)
277: .background {
278: RoundedRectangle(cornerRadius: 4)
281: .lineLimit(2)
282: .truncationMode(.middle)
284: .frame(height: 40, alignment: .top)
287: .contentShape(Rectangle())
301: .opacity(fileIcon != nil ? 1 : 0)
```

## ExcalidrawZ/components/ExcalidrawFileBrowser/ExcalidrawGroupBrowser.swift

52 lines. Check platform/build reachability at the call site.

```text
24: LazyVStack(spacing: 8) {
28: VStack(alignment: .leading, spacing: spacing) {
30: .font(.headline)
31: LazyVStack(alignment: .leading, spacing: 0) {
39: VStack(alignment: .leading, spacing: spacing) {
41: .font(.headline)
45: .padding()
```

## ExcalidrawZ/components/FlexibleSplitView/FlexibleSplitLayout.swift

231 lines. Check platform/build reachability at the call site.

```text
93: proposal: .init(width: bounds.width, height: bounds.height)
102: proposal: .init(width: w1, height: bounds.height)
106: proposal: .init(width: w2, height: bounds.height)
115: proposal: .init(width: bounds.width, height: h1)
119: proposal: .init(width: bounds.width, height: h2)
134: proposal: .init(width: bounds.width, height: topH)
138: proposal: .init(width: w1,          height: botH)
142: proposal: .init(width: w2,          height: botH)
156: proposal: .init(width: w1,      height: topH)
160: proposal: .init(width: w2,      height: topH)
164: proposal: .init(width: bounds.width, height: botH)
179: proposal: .init(width: leftW, height: bounds.height)
183: proposal: .init(width: rightW, height: topH)
187: proposal: .init(width: rightW, height: botH)
202: proposal: .init(width: leftW, height: topH)
206: proposal: .init(width: leftW, height: botH)
210: proposal: .init(width: rightW, height: bounds.height)
225: proposal: .init(width: w, height: h)
```

## ExcalidrawZ/components/FlexibleSplitView/FlexibleSplitView.swift

408 lines. Check platform/build reachability at the call site.

```text
71: Hover(animation: .smooth) { isHovered in
74: HStack(spacing: 8) {
99: .font(.headline)
100: .buttonStyle(.borderless)
101: .padding(6)
102: .background {
157: .frame(width: 24, height: 24)
158: .overlay {
160: .foregroundStyle(.primary)
162: .contentShape(Rectangle())
166: .font(.largeTitle)
167: .padding(40)
168: .background(editorChromeSurface(material: .ultraThin), in: RoundedRectangle(cornerRadius: 12))
224: .overlay {
327: @State private var height: CGFloat = .zero
332: .overlay {
339: .overlay(alignment: .top) {
342: .transition(.move(edge: .top))
345: .clipShape(Rectangle())
```

## ExcalidrawZ/components/FlexibleSplitView/components/EdgeHoverView.swift

97 lines. Check platform/build reachability at the call site.

```text
24: view.onHover = onHover
31: nsView.onHover = onHover
56: width: w,
57: height: h * percentage)
61: width: w,
62: height: h * percentage)
66: width: w * percentage,
67: height: h)
71: width: w * percentage,
72: height: h)
```

## ExcalidrawZ/components/LoadingView.swift

192 lines. Check platform/build reachability at the call site.

```text
16: var lineWidth: CGFloat
36: strokeColor: LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)), Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))]),
57: strokeColor: LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)), Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))]),
74: var animationDuration: Double = 0.8
89: Circle()
91: .stroke(
95: .frame(width: size, height: size)
107: Circle()
108: .stroke(
109: Color.gray.opacity(0.5),
113: Circle()
115: .stroke(
122: .animation(.linear(duration: 0.5), value: progress)
123: .frame(width: size, height: size)
174: strokeColor: LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)), Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))]),
181: strokeColor: LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)), Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))]),
```

## ExcalidrawZ/components/NewFileButton.swift

361 lines. Check platform/build reachability at the call site.

```text
69: .keyboardShortcut("n", modifiers: [.command])
77: .keyboardShortcut("n", modifiers: [.command, .option, .shift])
81: .opacity(isCreatingFile ? 0.0 : 1.0)
86: .controlSize(.small)
94: .help(.localizable(.generalButtonCreateNewFile))
153: .help(.localizable(.toolbarButtonCollaborationNewRoom))
```

## ExcalidrawZ/components/NewGroupButton.swift

201 lines. Check platform/build reachability at the call site.

```text
138: .opacity(isCreatingCloudFolder ? 0 : 1)
142: .controlSize(.small)
195: .controlSize(.large)
197: .frame(width: 400, height: 140)
```

## ExcalidrawZ/components/PDFViewer/PDFViewerSheet.swift

238 lines. Check platform/build reachability at the call site.

```text
24: VStack(spacing: 0) {
28: .frame(maxWidth: .infinity, maxHeight: .infinity)
63: .font(.headline)
109: .animation(.smooth, value: currentPage)
110: .animation(.smooth, value: totalPages)
111: .font(.subheadline)
112: .foregroundStyle(.secondary)
114: .frame(minWidth: 140)
117: .font(.subheadline)
118: .foregroundStyle(.secondary)
119: .frame(minWidth: 140)
```

## ExcalidrawZ/components/RecoveryKeyInputSheet.swift

223 lines. Check platform/build reachability at the call site.

```text
25: let width: CGFloat
39: width: CGFloat = 560,
52: VStack(spacing: 0) {
53: VStack(alignment: .leading, spacing: 18) {
58: .font(.callout)
59: .foregroundStyle(.secondary)
66: .padding(24)
68: HStack(spacing: 10) {
72: .padding(.horizontal, 24)
73: .padding(.top, 10)
74: .padding(.bottom, 22)
80: .frame(width: width)
96: VStack(alignment: .leading, spacing: 8) {
98: .font(.system(size: 38, weight: .semibold))
100: .foregroundStyle(Color.accentColor)
103: .font(.title2.weight(.semibold))
107: .font(.callout)
108: .foregroundStyle(.secondary)
109: .lineLimit(2)
116: HStack(alignment: .center, spacing: 14) {
118: .font(.system(size: 20, weight: .semibold))
119: .foregroundStyle(Color.accentColor)
120: .frame(width: 46, height: 46)
121: .background(Color.accentColor.opacity(0.16), in: Circle())
123: VStack(alignment: .leading, spacing: 5) {
125: .font(.title2.weight(.semibold))
129: .font(.callout)
130: .foregroundStyle(.secondary)
131: .lineLimit(2)
135: .frame(maxWidth: .infinity, alignment: .leading)
142: .font(.system(.body, design: .monospaced))
143: .focused($isRecoveryKeyFocused)
160: .font(.callout)
161: .foregroundStyle(.red)
178: HStack(spacing: 10) {
182: .keyboardShortcut(.cancelAction)
183: .editorChromeButtonStyle(style: .glass, size: .large, shape: .capsule)
193: .controlSize(.small)
198: .keyboardShortcut(.defaultAction)
199: .editorChromeButtonStyle(style: .glassProminent, size: .large, shape: .capsule)
```

## ExcalidrawZ/components/RenameSheetView.swift

161 lines. Check platform/build reachability at the call site.

```text
32: .frame(width: 300, height: 140)
33: .scrollDisabled(true)
35: .presentationSizing(.fitted)
36: .presentationDragIndicator(.hidden)
37: .presentationCompactAdaptation(.sheet)
44: .presentationDetents([.height(180)])
45: .presentationDragIndicator(containerHorizontalSizeClass == .compact ? .visible : .hidden)
47: .frame(width: 300)
74: .formStyle(.grouped)
111: .focused($isFocused)
126: .font(.headline)
136: .frame(width: 64)
143: .frame(width: 64)
146: .editorChromeButtonStyle(style: .glassProminent)
148: .editorChromeButtonStyle(shape: .modern)
```

## ExcalidrawZ/components/SVGPreviewWebView/SVGPreviewWebView.swift

383 lines. Check platform/build reachability at the call site.

```text
29: @State private var webViewSize: CGSize = .zero
41: .frame(width: max(webViewSize.width, 1), height: max(webViewSize.height, 1))
47: var padding: CGFloat
49: var backgroundColor: String?
50: var backgroundFilter: String?
54: padding: CGFloat = 16,
56: backgroundColor: String? = nil,
57: backgroundFilter: String? = nil
60: self.padding = padding
72: padding: padding,
74: backgroundColor: backgroundColor,
75: backgroundFilter: backgroundFilter
77: .frame(width: proxy.size.width, height: proxy.size.height)
86: var padding: CGFloat
88: var backgroundColor: String?
89: var backgroundFilter: String?
90: @Binding private var contentSize: CGSize
95: self.padding = 0
106: padding: CGFloat = 0,
108: backgroundColor: String? = nil,
109: backgroundFilter: String? = nil
113: self.padding = padding
154: return "\(sourceSignature)|fits:\(fitsContainer)|padding:\(padding)|filter:\(cssFilter ?? "none")|background:\(backgroundColor ?? "none")|backgroundFilter:\(backgroundFilter ?? "none")"
192: document.body.style.padding = "\(padding)px";
200: background.style.background = \(backgroundColorLiteral);
250: width: 100%;
251: height: 100%;
252: margin: 0;
253: padding: 0;
255: background: transparent;
259: padding: \(padding)px;
265: background: \(backgroundColor);
267: z-index: 0;
271: width: 100%;
272: height: 100%;
276: z-index: 1;
320: @Binding var contentSize: CGSize
344: self.contentSize = CGSize(width: arr[0], height: arr[1])
361: webView.scrollView.backgroundColor = .clear
370: webView.scrollView.isScrollEnabled = false
371: webView.scrollView.bounces = false
372: webView.scrollView.showsHorizontalScrollIndicator = false
373: webView.scrollView.showsVerticalScrollIndicator = false
```

## ExcalidrawZ/components/SegmentedPicker/SegmentedPicker.swift

238 lines. Check platform/build reachability at the call site.

```text
58: RoundedRectangle(cornerRadius: 10)
64: .editorChromeGlassEffect(
69: RoundedRectangle(cornerRadius: 6)
70: .fill(.background)
71: .shadow(radius: 1, y: 2)
74: .frame(width: rect.width, height: rect.height)
75: .offset(x: rect.minX, y: rect.minY)
76: .animation(canAnimateSelectionBackground ? .bouncy : nil, value: rect)
123: @State private var height: CGFloat = .zero
133: .frame(height: height == 0 ? 10 : height)
161: .buttonStyle(
170: .buttonStyle(.borderless)
181: .foregroundStyle(
186: .background {
208: .frame(width: 26, height: 26)
209: .padding(4)
217: .frame(width: 26, height: 26)
218: .padding(4)
221: .background {
223: RoundedRectangle(cornerRadius: 12)
225: .stroke(.separator, lineWidth: 0.5)
227: RoundedRectangle(cornerRadius: 12)
231: .padding()
```

## ExcalidrawZ/components/SyncStatusIndicator.swift

68 lines. Check platform/build reachability at the call site.

```text
19: HStack(spacing: 4) {
22: .font(.caption)
24: .padding(.horizontal, 10)
25: .padding(.vertical, 5)
26: .background {
27: Capsule().fill(editorChromeSurface())
29: .padding()
41: .foregroundStyle(.green)
44: .controlSize(.small)
47: .controlSize(.small)
50: .foregroundStyle(.orange)
53: .foregroundStyle(.blue)
56: .foregroundStyle(.secondary)
59: .foregroundStyle(.red)
62: .foregroundStyle(.secondary)
65: .foregroundStyle(.red)
```

## ExcalidrawZ/components/SyncStatusPopover.swift

194 lines. Check platform/build reachability at the call site.

```text
70: .padding(.vertical, 16)
71: .frame(maxWidth: .infinity)
72: .background {
74: RoundedRectangle(cornerRadius: 24)
75: .fill(.background)
76: .editorChromeGlassEffect(.regular, in: RoundedRectangle(cornerRadius: 24))
78: RoundedRectangle(cornerRadius: 12)
80: .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
83: .padding(7)
84: .transition(.move(edge: .trailing).combined(with: .opacity))
97: HStack(spacing: 12) {
100: .frame(width: 20)
103: VStack(alignment: .leading, spacing: 2) {
105: .font(.callout.weight(.medium))
108: .font(.caption2)
109: .foregroundStyle(.secondary)
120: .animation(.smooth, value: Double(progress.current) / Double(progress.total) * 100)
128: .animation(.smooth, value: Double(progress.current) / Double(progress.total) * 100)
134: .font(.caption)
135: .foregroundStyle(.secondary)
137: .padding(.horizontal, 16)
153: .animation(.smooth, value: progress.current)
161: .animation(.smooth, value: progress.current)
```

## ExcalidrawZ/components/WhatsNew/WhatsNewSheetView+allFeatures.swift

677 lines. Check platform/build reachability at the call site.

```text
43: VStack(spacing: 0) {
45: LazyVStack(alignment: .leading, spacing: 20) {
55: VStack(alignment: .leading, spacing: 4) {
57: .font(.headline)
59: .font(.caption)
60: .foregroundStyle(.secondary)
67: VStack(alignment: .leading, spacing: 4) {
69: .font(.headline)
71: .font(.caption)
72: .foregroundStyle(.secondary)
79: VStack(alignment: .leading, spacing: 4) {
80: HStack(spacing: 6) {
82: .font(.headline)
84: .font(.caption2.bold())
85: .foregroundStyle(.orange)
88: .font(.caption)
89: .foregroundStyle(.secondary)
96: description: .localizable(.presentationWelcomeMessage),
244: .foregroundStyle(AIAppearancePalette.foregroundGradient)
297: .frame(height: 36)
353: .frame(height: 36)
454: .padding(.leading, 2)
505: .buttonStyle(.borderless)
512: .buttonStyle(.borderless)
608: .padding(.top, 20)
609: .padding(.bottom, 40)
617: .padding(.horizontal, 40)
618: .padding(.bottom, 24)
622: .frame(maxWidth: .infinity, maxHeight: .infinity)
635: HStack(spacing: 2) {
640: .hoverCursor(.link)
659: VStack(alignment: .leading, spacing: 10) {
662: .padding(.horizontal, containerHorizontalSizeClass == .compact ? 10 : 40)
664: VStack(alignment: .leading, spacing: 4) {
666: .font(.headline)
667: .padding(.horizontal, containerHorizontalSizeClass == .compact ? 10 : 20)
```

## ExcalidrawZ/components/WhatsNew/WhatsNewSheetView.swift

572 lines. Check platform/build reachability at the call site.

```text
92: private var contentHorizontalPadding: CGFloat {
99: @State private var sheetContentHeight: CGFloat = 640
101: private var preferredSheetHeight: CGFloat {
105: private var maximumSheetContentHeight: CGFloat {
110: let contentRect = window.contentRect(forFrameRect: window.frame)
111: let chromeHeight = window.frame.height - contentRect.height
113: let currentTop = min(window.frame.maxY, screen.visibleFrame.maxY - 20)
150: let currentContentRect = window.contentRect(forFrameRect: window.frame)
154: width: currentContentRect.width,
155: height: targetHeight
159: let heightDelta = targetFrameRect.height - window.frame.height
161: var nextFrame = window.frame
203: .frame(width: 720, height: activeRoute == nil ? nil : sheetContentHeight)
204: .frame(maxHeight: maximumSheetContentHeight)
222: .frame(width: 720)
235: .overlay(alignment: .topLeading) {
240: .editorChromeButtonStyle(style: .glass)
241: .controlSize(.extraLarge)
244: .buttonStyle(.borderless)
245: .controlSize(.large)
248: .padding(20)
278: .frame(maxHeight: maximumSheetContentHeight)
300: .padding(.horizontal, 40)
306: VStack(spacing: 0) {
308: VStack(spacing: 6) {
309: Text(.localizable(.whatsNewTitle)).font(.largeTitle)
312: VStack(spacing: 6) {
313: VStack(alignment: .leading, spacing: 22) {
348: .padding(.vertical)
359: .buttonStyle(.linkStyle)
369: .buttonStyle(.linkStyle)
385: .buttonStyle(.link)
392: .buttonStyle(.link)
399: .padding(.top, 40)
401: .padding(.horizontal, contentHorizontalPadding)
402: .padding(.bottom, 40)
408: .frame(height: 340)
409: .frame(maxWidth: .infinity)
410: .overlay(alignment: .top) {
412: .padding(.horizontal, -contentHorizontalPadding)
413: .offset(y: -16)
423: .frame(maxWidth: .infinity)
424: .frame(height: 400, alignment: .top)
426: VStack(spacing: 0) {
427: Color.black.frame(height: 100)
429: SmoothLinearGradient(
431: to: .black.opacity(0),
436: LinearGradient(
437: colors: [.black, .black.opacity(0)],
445: HStack(spacing: 0) {
447: SmoothLinearGradient(
448: from: .black.opacity(0),
453: .frame(width: 200)
455: LinearGradient(
456: colors: [.black.opacity(0), .black],
460: .frame(width: 200)
478: .font(.callout)
479: .padding()
481: .background {
482: let roundRect = RoundedRectangle(cornerRadius: 12)
489: .stroke(colorScheme == .dark ? Color(red: 1, green: 181/255.0, blue: 15/255.0) : Color(red: 158/255.0, green: 103/255.0, blue: 0))
503: .frame(height: 16)
510: .foregroundStyle(.white)
514: .buttonStyle(.plain)
515: .padding(.vertical, 4)
516: .padding(.horizontal, 10)
517: .background {
519: RoundedRectangle(cornerRadius: 6)
522: RoundedRectangle(cornerRadius: 6)
535: .keyboardShortcut("w", modifiers: .command)
562: .frame(width: 600, height: 800)
569: .frame(width: 600, height: 800)
```

## ExcalidrawZ/components/WhatsNew/components/FeatureRow.swift

82 lines. Check platform/build reachability at the call site.

```text
19: @ViewBuilder trailing: () -> Trailing = { EmptyView().frame(width: 0, height: 0) }
30: @ViewBuilder trailing: () -> Trailing = { EmptyView().frame(width: 0, height: 0) }
35: VStack(alignment: .leading, spacing: 4) {
36: Text(title).font(.headline)
37: Text(description).font(.caption).foregroundStyle(.secondary)
48: @ViewBuilder trailing: @escaping () -> Trailing = { EmptyView().frame(width: 0, height: 0) }
60: @State private var overlayTrailingWidth: CGFloat = .zero
63: HStack(alignment: .center, spacing: 8) {
66: .frame(width: 68, height: 40, alignment: .center)
72: .frame(width: overlayTrailingWidth, height: 1)
73: .opacity(0)
76: .overlay(alignment: .trailing) {
```

## ExcalidrawZ/components/WhatsNew/components/WhatsNewRowMediaPreviewView.swift

66 lines. Check platform/build reachability at the call site.

```text
30: .frame(width: 120)
31: .frame(maxHeight: 120)
32: .overlay {
36: .frame(maxWidth: 60, maxHeight: 60)
37: .padding(10)
40: .clipShape(RoundedRectangle(cornerRadius: 4))
41: .contentShape(Rectangle())
```

## ExcalidrawZ/components/styles/AIAppearancePalette.swift

111 lines. Check platform/build reachability at the call site.

```text
28: static let thinkingGradient = LinearGradient(
34: static let foregroundGradient = LinearGradient(
62: Color(hue: Hue.cyan, saturation: 0.55, brightness: 1.00).opacity(0.42),
63: Color(hue: Hue.blue, saturation: 0.50, brightness: 1.00).opacity(0.80),
64: Color(hue: Hue.violet, saturation: 0.55, brightness: 1.00).opacity(0.74),
65: Color(hue: Hue.purple, saturation: 0.55, brightness: 1.00).opacity(0.66),
66: Color(hue: Hue.magenta, saturation: 0.55, brightness: 1.00).opacity(0.50),
67: Color(hue: Hue.cyan, saturation: 0.55, brightness: 1.00).opacity(0.42)
69: borderOpacity: 0.85,
81: Color(hue: Hue.cyan, saturation: 0.22, brightness: 1.00).opacity(0.55),
82: Color(hue: Hue.blue, saturation: 0.20, brightness: 1.00).opacity(0.98),
83: Color(hue: Hue.violet, saturation: 0.24, brightness: 1.00).opacity(0.94),
84: Color(hue: Hue.purple, saturation: 0.24, brightness: 1.00).opacity(0.86),
85: Color(hue: Hue.magenta, saturation: 0.22, brightness: 1.00).opacity(0.68),
86: Color(hue: Hue.cyan, saturation: 0.22, brightness: 1.00).opacity(0.55)
88: borderOpacity: 0.95,
102: let borderOpacity: Double
```

## QuickLookPreviewExtension/QuickLookView.swift

35 lines. Check platform/build reachability at the call site.

```text
27: .overlay {
33: .clipShape(RoundedRectangle(cornerRadius: 6))
```

## editor/excalidraw-app/App.tsx

1616 lines. Check platform/build reachability at the call site.

```text
233: color: "danger",
302: scene.scrollToContent = true;
439: border: "var(--color-primary-hover)",
912: appState.scrollX +
916: appState.scrollY +
1010: animation: { duration: 300 },
1261: height: "100%",
1273: icon: <div style={{ width: 14 }}>{ExcalLogo}</div>,
1288: icon: <div style={{ width: 14 }}>{ExcalLogo}</div>,
1310: style={{ height: "100%" }}
1367: animation: true,
```

## editor/excalidraw-app/CustomStats.tsx

91 lines. Check platform/build reachability at the call site.

```text
64: style={{ textAlign: "center", cursor: "pointer" }}
```

## editor/excalidraw-app/collab/CollabError.scss

35 lines. Check platform/build reachability at the call site.

```text
5: width: 26px;
6: height: 26px;
7: margin-inline-end: 1rem;
9: color: var(--color-danger);
15: animation: strong-shake 0.15s 6;
```

## editor/excalidraw-app/components/AI.tsx

174 lines. Check platform/build reachability at the call site.

```text
82: <body style="margin: 0; text-align: center">
83: <div style="display: flex; align-items: center; justify-content: center; flex-direction: column; height: 100vh; padding: 0 60px">
84: <div style="color:red">Too many requests today,</br>please try again tomorrow!</div>
```

## editor/excalidraw-app/components/AppFooter.tsx

26 lines. Check platform/build reachability at the call site.

```text
16: gap: ".5rem",
```

## editor/excalidraw-app/components/AppMainMenu.tsx

70 lines. Check platform/build reachability at the call site.

```text
65: <LanguageList style={{ width: "100%" }} />
```

## editor/excalidraw-app/components/AppSidebar.scss

92 lines. Check platform/build reachability at the call site.

```text
3: padding: 0.75rem;
7: gap: 1.5rem;
11: margin: 0 auto !important;
12: width: 100%;
14: width: 100%;
20: margin: 1rem 0;
22: height: 295px;
23: background-size: contain;
24: background-position: center;
25: background-repeat: no-repeat;
26: background-size: calc(
30: background-image: radial-gradient(
41: padding: 0 2rem;
45: margin: 0 auto;
49: padding: 0 0.5rem;
50: font-size: 0.875rem;
51: font-weight: 700;
52: line-height: 1.4;
57: min-height: 7rem;
61: padding-top: 0.125rem;
64: width: 46px;
66: height: auto;
74: font-size: 1rem;
75: line-height: 1.15;
76: color: var(--color-primary);
85: width: 4.5rem;
86: height: 3rem;
88: color: var(--color-primary);
```

## editor/excalidraw-app/components/AppSidebar.tsx

131 lines. Check platform/build reachability at the call site.

```text
76: style={{ opacity: openSidebar?.tab === "comments" ? 1 : 0.4 }}
82: style={{ opacity: openSidebar?.tab === "presentation" ? 1 : 0.4 }}
95: opacity: 0.9,
116: opacity: 0.7,
```

## editor/excalidraw-app/components/DebugCanvas.tsx

566 lines. Check platform/build reachability at the call site.

```text
48: color: string,
55: context.stroke();
63: color: string,
77: context.stroke();
85: color: string,
112: context.stroke();
127: context.stroke();
136: width: number,
137: height: number,
138: color: string,
167: context.stroke();
176: width: number,
177: height: number,
178: color: string,
207: context.stroke();
355: appState.scrollX * appState.zoom.value,
356: appState.scrollY * appState.zoom.value,
```

## editor/excalidraw-app/components/ExportToExcalidrawPlus.tsx

135 lines. Check platform/build reachability at the call site.

```text
105: width: "2.8rem",
106: height: "2.8rem",
```

## editor/excalidraw-app/excalidrawZ/aiCameraSession.js

682 lines. Check platform/build reachability at the call site.

```text
20: return { scrollX: s.scrollX, scrollY: s.scrollY, zoom: s.zoom.value };
115: scrollX: appState.scrollX,
116: scrollY: appState.scrollY,
266: Math.abs(current.scrollX - desired.scrollX) < CLOSE_ENOUGH_PX &&
267: Math.abs(current.scrollY - desired.scrollY) < CLOSE_ENOUGH_PX &&
304: scrollX: appState.scrollX,
305: scrollY: appState.scrollY,
331: current.scrollX + (desired.scrollX - current.scrollX) * panAlpha;
333: current.scrollY + (desired.scrollY - current.scrollY) * panAlpha;
```

## editor/excalidraw-app/excalidrawZ/camera.js

317 lines. Check platform/build reachability at the call site.

```text
36: scrollX: appState.scrollX,
37: scrollY: appState.scrollY,
53: update.scrollX = scrollX;
56: update.scrollY = scrollY;
79: animation: { duration: 300 },
126: animation: getViewportAnimation(animate, duration),
161: animation: getViewportAnimation(animate, duration),
205: animation: getViewportAnimation(animate, duration),
212: animation: getViewportAnimation(animate, duration),
219: animation: getViewportAnimation(animate, duration),
251: const sceneCenterX = centerX / currentZoom - appState.scrollX;
252: const sceneCenterY = centerY / currentZoom - appState.scrollY;
301: if (last && camera.scrollX === last.scrollX &&
302: camera.scrollY === last.scrollY && camera.zoom === last.zoom) return;
```

## editor/excalidraw-app/excalidrawZ/collab.js

87 lines. Check platform/build reachability at the call site.

```text
54: nameField.blur();
```

## editor/excalidraw-app/excalidrawZ/connect.js

262 lines. Check platform/build reachability at the call site.

```text
125: width: Math.abs(dx),
126: height: Math.abs(dy),
```

## editor/excalidraw-app/excalidrawZ/creators.js

701 lines. Check platform/build reachability at the call site.

```text
83: width: nextWidth,
84: height: height ?? element.height,
101: width: nextWidth,
102: height: height ?? metrics.height,
154: width: skel.width ?? AUTO_POSITION_FALLBACK_DIMENSION,
155: height: skel.height ?? AUTO_POSITION_FALLBACK_DIMENSION,
258: return { width: 100, height: 50 };
266: width: Math.ceil(metrics.width) + LAYOUT_NODE_PADDING * 2,
267: height: Math.ceil(metrics.height) + LAYOUT_NODE_PADDING * 2,
321: dims.set(node.id, { width: node.width, height: node.height });
374: return { ...skel, x: pos.x, y: pos.y, width: dim.width, height: dim.height };
```

## editor/excalidraw-app/excalidrawZ/export.js

410 lines. Check platform/build reachability at the call site.

```text
188: width: width * actualScale,
189: height: height * actualScale,
271: const scrollX = appState.scrollX ?? 0;
272: const scrollY = appState.scrollY ?? 0;
279: marginPx: 0,
```

## editor/excalidraw-app/excalidrawZ/export.test.js

52 lines. Test source; not runtime UI.

```text
24: width: 640,
25: height: 480,
```

## editor/excalidraw-app/excalidrawZ/eyeDropper.js

125 lines. Check platform/build reachability at the call site.

```text
120: color: color.toLowerCase(),
```

## editor/excalidraw-app/excalidrawZ/eyeDropper.test.js

132 lines. Test source; not runtime UI.

```text
60: color: "#FF3B30",
65: color: "#ff3b30",
82: color: "#ffffff",
88: color: "red",
```

## editor/excalidraw-app/excalidrawZ/load+save.js

615 lines. Check platform/build reachability at the call site.

```text
253: scrollX: appState.scrollX,
254: scrollY: appState.scrollY,
```

## editor/excalidraw-app/excalidrawZ/math.js

308 lines. Check platform/build reachability at the call site.

```text
67: return { width: parts[2], height: parts[3] };
85: return { width, height: width * (viewBox.height / viewBox.width) };
88: return { width: height * (viewBox.width / viewBox.height), height };
188: width: resolvedWidth,
189: height: resolvedHeight,
280: width: updateParams.width ?? element.width,
281: height: updateParams.height ?? element.height,
283: opacity: updateParams.opacity ?? element.opacity,
294: width: nextElement.width,
295: height: nextElement.height,
297: opacity: nextElement.opacity,
```

## editor/excalidraw-app/excalidrawZ/placement.js

251 lines. Check platform/build reachability at the call site.

```text
186: bounds: { x: 0, y: 0, width: 0, height: 0 },
247: width: iMaxX - iMinX,
248: height: iMaxY - iMinY,
```

## editor/excalidraw-app/excalidrawZ/screenAnnotation.js

580 lines. Check platform/build reachability at the call site.

```text
97: width: frameRect.width,
98: height: frameRect.height,
106: width: imageRect.width,
107: height: imageRect.height,
133: width: viewportRect.width,
134: height: viewportRect.height,
199: width: sceneRect.width,
200: height: sceneRect.height,
212: width: sceneRect.width,
213: height: sceneRect.height,
248: scrollX: appState.scrollX + sceneRect.x,
249: scrollY: appState.scrollY + sceneRect.y,
263: width: sceneRect.width,
264: height: sceneRect.height,
284: scrollX: appState.scrollX + sceneRect.x,
285: scrollY: appState.scrollY + sceneRect.y,
576: width: insertedFrame.width,
577: height: insertedFrame.height,
```

## editor/excalidraw-app/excalidrawZ/screenAnnotation.test.js

532 lines. Test source; not runtime UI.

```text
16: width: 800,
17: height: 400,
23: width: 1000,
24: height: 800,
37: width: 40,
38: height: 30,
45: width: 40,
46: height: 30,
53: width: 250,
54: height: 0,
63: gap: 1,
95: viewportRect: { x: 210, y: 220, width: 400, height: 200 },
106: width: 400,
107: height: 200,
120: width: 400,
121: height: 200,
134: ).toMatchObject({ x: 20, y: 10, width: 40, height: 30 });
163: viewportRect: { x: 210, y: 220, width: 400, height: 200 },
176: width: 100,
177: height: 50,
199: gap: 40,
226: bounds: { x: 140, y: 10, width: 400, height: 200 },
260: image: { ...IMAGE, width: 3600, height: 2338 },
261: selectionRect: { x: 10, y: 20, width: 1800, height: 1169 },
268: expect(frame).toMatchObject({ x: 0, y: 0, width: 1800, height: 1169 });
272: width: 1800,
273: height: 1169,
285: width: 100,
286: height: 80,
309: viewportRect: { x: 20, y: 30, width: 400, height: 200 },
325: width: 400,
326: height: 200,
335: width: 400,
336: height: 200,
365: width: 2400,
366: height: 1600,
373: viewportRect: { x: 0, y: 0, width: 1000, height: 700 },
374: selectionRect: { x: 40, y: 60, width: 600, height: 400 },
383: expect(frame).toMatchObject({ x: 0, y: 0, width: 600, height: 400 });
387: width: 600,
388: height: 400,
407: selectionRect: { x: 10, y: 20, width: 600, height: 400 },
434: bounds: { width: 600, height: 400 },
477: selectionRect: { x: 10, y: 20, width: 600, height: 400 },
510: gap: 40,
516: bounds: { x: 100, y: 260, width: 600, height: 400 },
528: viewportRect: { x: 0, y: 0, width: 100, height: 100 },
```

## editor/excalidraw-app/excalidrawZ/search.js

209 lines. Check platform/build reachability at the call site.

```text
176: helper.scrollToElement?.(elementId, {
```

## editor/excalidraw-app/index.html

195 lines. Check platform/build reachability at the call site.

```text
90: background-color: #121212;
91: color: #fff;
146: margin: 0;
149: width: 100%;
150: height: 100%;
156: height: 1px;
157: width: 1px;
165: height: 100%;
174: @media screen and (min-width: 1200px) {
```

## editor/excalidraw-app/index.scss

141 lines. Check platform/build reachability at the call site.

```text
9: background: transparent !important;
10: background-color: transparent !important;
15: --color-primary-contrast-offset: #625ee0; // to offset Chubb illusion
18: --color-primary-contrast-offset: #726dff; // to offset Chubb illusion
23: margin-top: auto;
24: margin-bottom: auto;
25: margin-inline-start: auto;
29: border-radius: var(--space-factor);
30: color: var(--color-primary);
31: margin-top: auto;
32: margin-bottom: auto;
33: margin-inline-start: auto;
34: margin-inline-end: 0.6em;
35: z-index: var(--zIndex-layerUI);
38: width: 1.2rem;
39: height: 1.2rem;
46: background-color: #ecfdf5;
47: color: #064e3c;
50: color: var(--color-promo);
51: font-weight: 700;
53: stroke-width: 2;
62: background-color: #064e3c;
63: color: #ecfdf5;
74: padding: 0.5rem 1rem;
75: font-size: 0.875rem;
77: line-height: 1.5;
78: border-radius: var(--border-radius-md);
79: z-index: 6;
83: background-color: var(--color-warning);
84: color: var(--color-text-warning);
88: background-color: var(--color-danger-dark);
89: color: var(--color-danger-text);
103: cursor: pointer;
105: border: 1px solid var(--color-primary);
106: padding: 0.5rem 0.875rem;
107: border-radius: var(--border-radius-lg);
108: background-color: var(--island-bg-color);
111: font-family: var(--ui-font);
112: font-size: 0.8333rem;
114: height: var(--lg-button-size);
116: border: none;
117: box-shadow: 0 0 0 1px var(--color-surface-lowest);
118: background-color: var(--color-surface-low);
119: color: var(--button-color, var(--color-on-surface)) !important;
122: box-shadow: 0 0 0 1px var(--color-brand-active);
126: background-color: var(--color-primary);
127: color: white !important;
131: background-color: var(--color-primary-darker);
138: color: black !important;
```

## editor/excalidraw-app/share/ShareDialog.scss

191 lines. Check platform/build reachability at the call site.

```text
7: gap: 1.5rem;
10: height: calc(100vh - 5rem);
14: border-top: 1px solid var(--dialog-border-color);
19: margin-top: 1em;
22: background: var(--island-bg-color);
23: padding: 0px 0.75rem;
26: line-height: 1;
33: opacity: 0;
36: opacity: 1;
41: z-index: 100;
47: padding: 0.125rem 0.5rem;
48: gap: 0.125rem;
50: height: 1.125rem;
52: border: none;
53: border-radius: 0.6875rem;
55: font-family: "Assistant";
56: font-style: normal;
57: font-weight: 600;
58: font-size: 0.75rem;
59: line-height: 110%;
61: background: var(--color-success);
62: color: var(--color-success-text);
65: width: 0.875rem;
66: height: 0.875rem;
70: animation: ShareDialog__popover__scaleIn 150ms ease-out;
74: font-family: "Assistant";
78: width: 100%;
89: width: 100%;
93: font-weight: 700;
94: font-size: 1.3125rem;
95: line-height: 130%;
97: color: var(--color-primary);
101: font-weight: 400;
102: font-size: 0.875rem;
103: line-height: 150%;
107: color: var(--text-primary-color);
111: font-weight: 700;
133: margin: 0;
140: gap: 0.75rem;
148: padding: 1rem;
149: background: #fff;
150: border-radius: 0.5rem;
151: border: 1px solid #e0e0e0;
154: width: $size;
155: height: $size;
158: width: $size;
159: height: $size;
163: background: var(--island-bg-color);
164: border: 1px solid var(--dialog-border-color);
169: border-top: 1px solid var(--color-gray-20);
171: padding: 0.5rem 0.5rem 0;
172: font-weight: 400;
173: font-size: 0.75rem;
174: line-height: 150%;
177: margin: 0;
181: margin-top: 1em;
```

## editor/excalidraw-app/share/ShareDialog.tsx

293 lines. Check platform/build reachability at the call site.

```text
193: <div style={{ marginBottom: "1em" }}>{t("roomDialog.desc_intro")}</div>
```

## editor/excalidraw-app/tests/MobileMenu.test.tsx

39 lines. Test source; not runtime UI.

```text
11: const dimensions = { height: 400, width: 800 };
```

## editor/excalidraw-app/tests/collab.test.tsx

252 lines. Test source; not runtime UI.

```text
94: height: 200,
95: width: 100,
150: height: 200,
151: width: 100,
157: width: 100,
158: height: 200,
```

## editor/packages/common/debug.ts

220 lines. Check platform/build reachability at the call site.

```text
40: console.info("%c(starting perf recording)", "color: lime");
89: console.info("%c(stopping perf recording)", "color: red");
```

## editor/packages/common/src/colors.ts

441 lines. Check platform/build reachability at the call site.

```text
71: const invertComponent = (color: number): number => {
86: export const applyDarkModeFilter = (color: string, enable = true): string => {
140: const restore = (color: number) =>
150: export const removeDarkModeFilter = (color: string): string => {
360: export const colorToHex = (color: string): string | null => {
369: export const isTransparent = (color: string) => {
380: export const isOpaqueColor = (color: string) => {
396: export const isColorDark = (color: string, threshold = 160): boolean => {
424: export const normalizeInputColor = (color: string): string | null => {
```

## editor/packages/common/src/constants.ts

562 lines. Check platform/build reachability at the call site.

```text
203: backgroundColor: "transparent" as ExcalidrawElement["backgroundColor"],
456: backgroundColor: ExcalidrawElement["backgroundColor"];
461: opacity: ExcalidrawElement["opacity"];
465: backgroundColor: COLOR_PALETTE.transparent,
470: opacity: 100,
558: background: "var(--mobile-action-button-bg)",
```

## editor/packages/common/src/editorInterface.ts

222 lines. Check platform/build reachability at the call site.

```text
64: export const isMobileBreakpoint = (width: number, height: number) => {
```

## editor/packages/common/src/points.ts

81 lines. Check platform/build reachability at the call site.

```text
16: width: Math.max(...xs) - Math.min(...xs),
17: height: Math.max(...ys) - Math.min(...ys),
```

## editor/packages/common/src/utils.ts

1239 lines. Check platform/build reachability at the call site.

```text
503: ctx.font = "32px Arial";
521: const hasScrollableContent = parent.scrollHeight > parent.clientHeight;
777: "color: #8B4000",
794: "color: #8B4000",
817: "color: #8B4000",
```

## editor/packages/element/src/__tests__/transform.test.ts

968 lines. Test source; not runtime UI.

```text
57: width: 200,
58: height: 100,
59: backgroundColor: "#c0eb75",
66: width: 200,
67: height: 100,
68: backgroundColor: "#ffc9c9",
77: width: 200,
78: height: 100,
79: backgroundColor: "#a5d8ff",
188: width: 200,
197: width: 280,
206: width: 300,
207: backgroundColor: "#fff3bf",
219: width: 200,
233: backgroundColor: "#ffec99",
234: width: 200,
328: backgroundColor: "#fff3bf",
370: width: 800,
371: height: 100,
573: width: 300,
574: height: 300,
575: backgroundColor: "#d8f5a2",
581: width: 140,
589: width: 395,
590: height: 35,
594: width: 300,
595: height: 300,
605: width: 400,
699: width: 100,
700: height: 200,
701: backgroundColor: "#bac8ff",
765: width: 100,
766: height: 200,
767: backgroundColor: "#bac8ff",
800: width: 100,
801: height: 200,
809: width: 100,
810: height: 200,
854: width: 166.03125,
855: height: 163,
869: width: 120.265625,
870: height: 114,
884: width: 70.265625,
885: height: 44,
900: width: 56.4921875,
901: height: 44,
```

## editor/packages/element/src/binding.ts

3198 lines. Check platform/build reachability at the call site.

```text
1386: newSize?: { width: number; height: number };
1863: outlinePoint: GlobalPoint,
```

## editor/packages/element/src/bounds.ts

1570 lines. Check platform/build reachability at the call site.

```text
71: width: number;
72: height: number;
681: padding: number = 0,
1123: width: number;
1124: height: number;
1138: width: maxX - minX,
1139: height: maxY - minY,
```

## editor/packages/element/src/bucketFill.ts

1918 lines. Check platform/build reachability at the call site.

```text
417: margin: number,
556: element.opacity < 100 ||
588: element.opacity <= 0;
```

## editor/packages/element/src/containerCache.ts

33 lines. Check platform/build reachability at the call site.

```text
6: height: ExcalidrawTextContainer["height"];
13: height: ExcalidrawTextContainer["height"],
```

## editor/packages/element/src/convertToShape.ts

817 lines. Check platform/build reachability at the call site.

```text
576: width: recognizedShape.boundingBox[2] - recognizedShape.boundingBox[0],
577: height: recognizedShape.boundingBox[3] - recognizedShape.boundingBox[1],
583: backgroundColor: appState.currentItemBackgroundColor,
586: opacity: appState.currentItemOpacity,
628: backgroundColor: appState.currentItemBackgroundColor,
631: opacity: appState.currentItemOpacity,
666: backgroundColor: appState.currentItemBackgroundColor,
669: opacity: appState.currentItemOpacity,
706: backgroundColor: appState.currentItemBackgroundColor,
709: opacity: appState.currentItemOpacity,
801: opacity: ELEMENT_PENDING_DRAW_SHAPE_OPACITY,
```

## editor/packages/element/src/cropElement.ts

628 lines. Check platform/build reachability at the call site.

```text
43: const { width: uncroppedWidth, height: uncroppedHeight } =
78: width: naturalWidth,
79: height: naturalHeight,
401: width: nextWidth,
402: height: nextHeight,
410: width: number,
411: height: number,
563: width: element.width,
564: height: element.height,
```

## editor/packages/element/src/dragElements.ts

409 lines. Check platform/build reachability at the call site.

```text
320: width: number;
321: height: number;
346: x < originX ? -width : width,
352: y < originY ? -height : height,
378: let newX = x < originX ? originX - width : originX;
379: let newY = y < originY ? originY - height : originY;
```

## editor/packages/element/src/elbowArrow.ts

2309 lines. Check platform/build reachability at the call site.

```text
528: (startIsHorizontal ? padding : 0),
530: (!startIsHorizontal ? padding : 0),
554: (endIsHorizontal ? padding : 0),
556: (!endIsHorizontal ? padding : 0),
```

## editor/packages/element/src/embeddable.ts

535 lines. Check platform/build reachability at the call site.

```text
377: table, .gist { height: 100%; }
378: .gist .gist-file { height: calc(100vh - 2px); padding: 0px; display: grid; grid-template-rows: 1fr auto; }
429: backgroundColor: "transparent",
```

## editor/packages/element/src/flowchart.ts

748 lines. Check platform/build reachability at the call site.

```text
166: const nodePrimarySize = horizontal ? parent.width : parent.height;
167: const nodeCrossSize = horizontal ? parent.height : parent.width;
237: width: template.width,
238: height: template.height,
241: backgroundColor: template.backgroundColor,
244: opacity: template.opacity,
365: opacity: startBindingElement.opacity,
```

## editor/packages/element/src/newElement.ts

600 lines. Check platform/build reachability at the call site.

```text
91: opacity = DEFAULT_ELEMENT_PROPS.opacity,
248: width: number;
249: height: number;
298: width: metrics.width,
299: height: metrics.height,
321: width: number;
322: height: number;
324: let { width: nextWidth, height: nextHeight } = measureText(
350: width: nextWidth - prevMetrics.width,
351: height: nextHeight - prevMetrics.height,
396: width: nextWidth,
397: height: nextHeight,
```

## editor/packages/element/src/positionElementsOnGrid.ts

112 lines. Check platform/build reachability at the call site.

```text
49: width: maxX - minX,
50: height: maxY - minY,
68: width: rowWidth,
82: const { unitBounds, width: rowWidth, maxHeight: rowMaxHeight } = rowProp;
```

## editor/packages/element/src/renderElement.ts

1114 lines. Check platform/build reachability at the call site.

```text
120: (((containingFrame?.opacity ?? 100) * element.opacity) / 10000) *
153: width: number;
154: height: number;
268: getContainingFrame(element, elementsMap)?.opacity || 100,
325: width: number;
326: height: number;
476: width: img.naturalWidth,
477: height: img.naturalHeight,
530: context.font = "14px sans-serif";
552: context.font = getFontString(element);
622: getContainingFrame(element, elementsMap)?.opacity || 100;
659: const cx = ((x1 + x2) / 2 + appState.scrollX) * window.devicePixelRatio;
660: const cy = ((y1 + y2) / 2 + appState.scrollY) * window.devicePixelRatio;
686: appState.scrollX) *
691: appState.scrollY) *
722: (x1 + appState.scrollX) * window.devicePixelRatio -
724: (y1 + appState.scrollY) * window.devicePixelRatio -
743: (coords.x + appState.scrollX) * window.devicePixelRatio,
744: (coords.y + appState.scrollY) * window.devicePixelRatio,
761: context.translate(element.x + appState.scrollX, element.y + appState.scrollY);
806: element.x + appState.scrollX,
807: element.y + appState.scrollY,
834: context.stroke();
847: const cx = (x1 + x2) / 2 + appState.scrollX;
848: const cy = (y1 + y2) / 2 + appState.scrollY;
893: const cx = centerX + appState.scrollX;
894: const cy = centerY + appState.scrollY;
```

## editor/packages/element/src/resizeElements.ts

1511 lines. Check platform/build reachability at the call site.

```text
270: width: number,
271: height: number,
345: width: metricsWidth,
346: height: nextHeight,
392: width: Math.abs(newWidth),
393: height: Math.abs(metrics.height),
768: width: nextWidth,
769: height: nextHeight,
883: width: Math.abs(nextWidth),
884: height: Math.abs(nextHeight),
1366: const shiftX = flipByX && !isLinearOrFreeDraw ? width : 0;
1367: const shiftY = flipByY && !isLinearOrFreeDraw ? height : 0;
```

## editor/packages/element/src/resizeTest.ts

294 lines. Check platform/build reachability at the call site.

```text
220: const rotateResizeCursor = (cursor: string, angle: number) => {
```

## editor/packages/element/src/shape.ts

1315 lines. Check platform/build reachability at the call site.

```text
282: backgroundColor: "#d3d3d3",
291: backgroundColor: isTransparent(element.backgroundColor)
400: return generateArrowheadOutlineCircle(
405: arrowhead === "circle_outline" ? backgroundFillColor : strokeColor,
425: arrowhead === "triangle_outline" ? backgroundFillColor : strokeColor,
462: arrowhead === "diamond_outline" ? backgroundFillColor : strokeColor,
537: ...generateArrowheadOutlineCircle(
561: ...generateArrowheadOutlineCircle(
```

## editor/packages/element/src/sizeHelpers.ts

253 lines. Check platform/build reachability at the call site.

```text
51: width: number,
52: height: number,
88: width: number,
89: height: number,
129: width: number,
130: height: number,
131: ): { width: number; height: number } => {
228: width: ExcalidrawElement["width"];
229: height: ExcalidrawElement["height"];
234: width: element.width,
235: height: element.height,
```

## editor/packages/element/src/textElement.ts

533 lines. Check platform/build reachability at the call site.

```text
66: width: textElement.width,
67: height: textElement.height,
112: scene.mutateElement(container, { height: nextHeight });
121: scene.mutateElement(container, { width: nextWidth });
209: height: containerHeight,
216: width: nextWidth,
217: height: nextHeight,
```

## editor/packages/element/src/textMeasurements.ts

227 lines. Check platform/build reachability at the call site.

```text
137: context.font = fontString;
```

## editor/packages/element/src/transform.ts

816 lines. Check platform/build reachability at the call site.

```text
215: width: 100,
216: height: 0,
598: width: metrics.width,
599: height: metrics.height,
608: width: element?.width || DEFAULT_DIMENSION,
609: height: element?.height || DEFAULT_DIMENSION,
801: width: frameWidth,
802: height: frameHeight,
```

## editor/packages/element/src/transformHandles.ts

354 lines. Check platform/build reachability at the call site.

```text
98: width: number,
99: height: number,
```

## editor/packages/element/src/types.ts

481 lines. Check platform/build reachability at the call site.

```text
45: backgroundColor: string;
51: opacity: number;
52: width: number;
53: height: number;
141: width: number;
142: height: number;
```

## editor/packages/element/src/visualdebug.ts

257 lines. Check platform/build reachability at the call site.

```text
33: color: string;
87: color: options?.color ?? "orange",
105: color: opts?.color ?? "purple",
124: color: opts?.color ?? "red",
145: color: opts?.color ?? "orange",
173: color: opts?.color ?? "cyan",
183: color: opts?.color ?? "cyan",
217: color: opts?.color ?? "green",
```

## editor/packages/element/tests/align.test.tsx

1097 lines. Test source; not runtime UI.

```text
1022: width: 100,
1023: height: 100,
1033: width: 60,
1034: height: 20,
1044: width: 100,
1045: height: 100,
1054: width: 100,
1055: height: 100,
```

## editor/packages/element/tests/binding.test.tsx

814 lines. Test source; not runtime UI.

```text
126: width: 100,
127: height: 100,
134: width: 100,
135: height: 100,
143: width: 200,
144: height: 0,
198: width: 200,
199: height: 200,
308: backgroundColor: "#a5d8ff",
450: width: 200,
451: height: 500,
455: width: 200,
456: height: 500,
494: width: 200,
495: height: 500,
499: width: 200,
500: height: 500,
540: width: 200,
541: height: 500,
546: width: 200,
547: height: 500,
552: width: 217,
553: height: 1,
598: width: 100,
599: height: 100,
693: width: 100,
694: height: 100,
730: width: 100,
731: height: 100,
783: width: 0.00005,
784: height: 0.00005,
791: width: 195,
792: height: 0,
806: h.scene.mutateElement(rect, { width: 300, height: 200 });
```

## editor/packages/element/tests/bounds.test.ts

209 lines. Test source; not runtime UI.

```text
33: backgroundColor: "#000",
38: opacity: 1,
41: width: w,
42: height: h,
149: const makeElement = (x: number, y: number, width: number, height: number) =>
```

## editor/packages/element/tests/bucketFill.test.ts

2272 lines. Test source; not runtime UI.

```text
44: width: maxX - minX,
45: height: maxY - minY,
50: backgroundColor: "#ffc9c9",
67: width: 100,
68: height: 100,
99: width: 100,
100: height: 100,
125: width: 100,
126: height: 100,
164: width: 100,
165: height: 100,
207: width: 200,
208: height: 150,
261: width: 100,
262: height: 100,
310: width: 100,
311: height: 100,
335: width: 100,
336: height: 100,
366: width: 100,
367: height: 100,
374: width: 100,
375: height: 100,
410: width: 100,
411: height: 100,
418: width: 100,
419: height: 100,
447: width: 100,
448: height: 100,
455: width: 100,
456: height: 100,
458: backgroundColor: "#ffd43b",
486: width: 100,
487: height: 100,
494: width: 100,
495: height: 100,
497: backgroundColor: "transparent",
524: width: 100,
525: height: 100,
532: width: 60,
533: height: 25,
534: backgroundColor: "#ffec99",
558: width: 100,
559: height: 100,
566: width: 100,
567: height: 100,
569: backgroundColor: "#ffd43b",
594: width: 100,
595: height: 100,
602: width: 100,
603: height: 100,
605: backgroundColor: "#ffd43b",
606: opacity: 50,
638: width: 100,
639: height: 100,
646: width: 100,
647: height: 100,
676: width: 100,
677: height: 100,
679: backgroundColor: "#ffd43b",
685: width: 100,
686: height: 100,
688: backgroundColor: "#ffd43b",
721: width: 240,
722: height: 195,
724: backgroundColor: "#ffd43b",
730: width: 230,
731: height: 160,
733: backgroundColor: "#ffd43b",
741: width: 245,
742: height: 145,
744: backgroundColor: "#a5d8ff",
768: width: 100,
769: height: 100,
815: width: 100,
816: height: 100,
852: width: 100,
853: height: 100,
860: width: 60,
861: height: 60,
892: width: 100,
893: height: 100,
925: width: 100,
926: height: 100,
934: width: 200,
935: height: 0,
963: width: 100,
964: height: 100,
1022: width: 100,
1023: height: 100,
1030: width: 88,
1031: height: 0,
1056: width: 100,
1057: height: 100,
1065: width: 88,
1066: height: 0,
1076: width: 1_000_000,
1077: height: 0,
1182: width: 100,
1183: height: 100,
1186: backgroundColor: "transparent",
1214: width: 50,
1215: height: 50,
1232: width: 100,
1233: height: 100,
1251: width: 100,
1252: height: 100,
1263: width: 120,
1264: height: 0,
1288: width: 100,
1289: height: 100,
1300: width: 100,
1301: height: 100,
1310: backgroundColor: "#b2f2bb",
1344: width: 100,
1345: height: 100,
1347: backgroundColor: "transparent",
1379: width: 100,
1380: height: 100,
1382: backgroundColor: "transparent",
1410: width: 100,
1411: height: 100,
1420: backgroundColor: "#b2f2bb",
1428: width: 100,
1429: height: 100,
1431: backgroundColor: "transparent",
1474: width: 100,
1475: height: 60,
1477: backgroundColor: "#ffc9c9",
1485: width: 200,
1486: height: 200,
1488: backgroundColor: "transparent",
1526: width: 110,
1527: height: 60,
1529: backgroundColor: "#a5d8ff",
1537: width: 200,
1538: height: 200,
1540: backgroundColor: "transparent",
1574: width: 100,
1575: height: 100,
1584: backgroundColor: "#b2f2bb",
1592: width: 100,
1593: height: 100,
1595: backgroundColor: "transparent",
1626: width: 100,
1627: height: 100,
1629: backgroundColor: "#ffd43b",
1636: width: 100,
1637: height: 100,
1639: backgroundColor: "transparent",
1679: width: 100,
1680: height: 100,
1682: backgroundColor: "transparent",
1688: width: 100,
1689: height: 100,
1691: backgroundColor: "#ffd43b",
1731: width: 100,
1732: height: 100,
1734: backgroundColor: "transparent",
1764: backgroundColor: "#b2f2bb",
1816: width: 100,
1817: height: 100,
1826: backgroundColor: "#b2f2bb",
1834: width: 200,
1835: height: 200,
1837: backgroundColor: "transparent",
1880: width: 240,
1881: height: 240,
1946: width: 252,
1947: height: 138,
1973: width: size,
1974: height: size,
1976: backgroundColor: "transparent",
2171: width: 120,
2172: height: 80,
2174: backgroundColor: "transparent",
```

## editor/packages/element/tests/collision.test.tsx

220 lines. Test source; not runtime UI.

```text
23: width: 124,
24: height: 302,
51: width: 100,
52: height: 100,
53: backgroundColor: "#ffffff",
69: width: 100,
70: height: 100,
71: backgroundColor: "#ffffff",
108: width: 100,
109: height: 100,
110: backgroundColor: "transparent",
146: width: 100,
147: height: 100,
148: backgroundColor: "#ffffff",
190: width: 100,
191: height: 100,
192: backgroundColor: "transparent",
```

## editor/packages/element/tests/cropElement.test.tsx

363 lines. Test source; not runtime UI.

```text
56: const image = API.createElement({ type: "image", width: 200, height: 100 });
197: image = API.createElement({ type: "image", width: 200, height: 100 });
```

## editor/packages/element/tests/delta.test.tsx

573 lines. Test source; not runtime UI.

```text
49: backgroundColor: "#ffffff",
```

## editor/packages/element/tests/duplicate.test.tsx

842 lines. Test source; not runtime UI.

```text
52: backgroundColor: "transparent",
58: opacity: 100,
98: backgroundColor: "transparent",
104: opacity: 100,
471: width: 100,
472: height: 100,
478: width: 50,
479: height: 50,
487: width: 50,
488: height: 50,
810: width: 100,
811: height: 100,
817: width: 115,
818: height: 0,
```

## editor/packages/element/tests/elbowArrow.test.tsx

416 lines. Test source; not runtime UI.

```text
43: width: 100,
44: height: 100,
49: width: 100,
50: height: 100,
170: width: 100,
171: height: 100,
177: width: 100,
178: height: 100,
185: width: 90,
186: height: 200,
228: width: 100,
229: height: 100,
234: width: 100,
235: height: 100,
267: width: 100,
268: height: 100,
273: width: 100,
274: height: 100,
311: width: 100,
312: height: 100,
317: width: 100,
318: height: 100,
369: width: 100,
370: height: 100,
375: width: 100,
376: height: 100,
```

## editor/packages/element/tests/flowchart.test.tsx

683 lines. Test source; not runtime UI.

```text
40: width: 200,
41: height: 100,
165: width: 400,
166: height: 300,
203: width: 400,
204: height: 300,
247: width: 200,
248: height: 100,
322: width: 200,
323: height: 100,
340: width: 200,
341: height: 100,
370: width: 200,
371: height: 100,
400: width: 200,
401: height: 100,
444: width: 200,
445: height: 100,
512: width: 200,
513: height: 100,
603: width: 200,
604: height: 100,
```

## editor/packages/element/tests/frame.test.tsx

1185 lines. Test source; not runtime UI.

```text
102: frame = API.createElement({ id: "id0", type: "frame", x: 0, width: 150 });
112: width: 50,
118: width: 50,
124: width: 50,
144: width: 250,
145: height: 250,
165: width: 80,
166: height: 80,
167: backgroundColor: "#ffc9c9",
195: width: 80,
196: height: 80,
197: backgroundColor: "#ffc9c9",
247: width: 150,
248: height: 150,
276: width: 80,
277: height: 80,
301: width: 80,
302: height: 80,
303: backgroundColor: "#ffc9c9",
311: width: 20,
312: height: 20,
345: width: 80,
346: height: 80,
347: backgroundColor: "#ffc9c9",
355: width: 20,
356: height: 20,
528: height: 10,
678: width: 300,
679: height: 300,
703: width: 150,
704: height: 150,
711: width: 20,
712: height: 20,
731: width: 20,
732: height: 20,
756: width: 20,
757: height: 20,
778: height: 1000,
779: width: 1000,
818: width: 20,
819: height: 20,
827: width: 20,
828: height: 20,
842: height: 1000,
843: width: 1000,
865: width: 20,
866: height: 20,
875: width: 20,
876: height: 20,
885: width: 20,
886: height: 20,
894: width: 20,
895: height: 20,
932: width: 20,
933: height: 20,
941: width: 20,
942: height: 20,
970: width: 80,
971: height: 80,
972: backgroundColor: "#ffc9c9",
990: width: 80,
991: height: 80,
992: backgroundColor: "#ffc9c9",
1010: width: 80,
1011: height: 80,
1012: backgroundColor: "#ffc9c9",
1019: width: 20,
1020: height: 20,
1074: width: 100,
1075: height: 100,
1081: width: 100,
1082: height: 100,
1088: width: 100,
1089: height: 100,
1096: width: 50,
1097: height: 50,
1104: width: 50,
1105: height: 50,
1112: width: 50,
1113: height: 50,
1120: width: 50,
1121: height: 50,
1149: width: 100,
1150: height: 100,
1156: width: 100,
1157: height: 100,
1163: width: 50,
1164: height: 50,
1171: width: 50,
1172: height: 50,
```

## editor/packages/element/tests/linearElementEditor.test.tsx

1670 lines. Test source; not runtime UI.

```text
56: const font = "20px Cascadia, width: Segoe UI Emoji" as FontString;
89: width: p2[0] - p1[0],
90: height: 0,
112: width: p3[0] - p1[0],
113: height: 0,
319: width: 30,
320: height: 20,
437: width: p2[0] - p1[0],
438: height: 0,
1052: width: 100,
1053: height: 100,
1054: backgroundColor: "red",
1096: width: 30,
1097: height: 20,
1325: expect({ width: container.width, height: container.height })
1392: expect({ width: container.width, height: container.height })
1425: width: 200,
1426: height: 500,
1431: width: 410,
1432: height: 1,
1549: width: 160,
1550: height: 25,
```

## editor/packages/element/tests/resize.test.tsx

1397 lines. Test source; not runtime UI.

```text
92: width: 200,
93: height: 100,
121: width: 200,
122: height: 100,
137: width: 200,
138: height: 100,
159: width: 200,
160: height: 100,
205: width: 200,
206: height: 100,
239: width: 200,
240: height: 100, // height not enough for label fit, so it will be resized
355: width: prevWidth,
356: height: prevHeight,
390: width: prevWidth,
391: height: prevHeight,
421: const { width: prevWidth, height: prevHeight } = element;
446: width: prevWidth,
447: height: prevHeight,
530: width: 95,
531: height: 100,
558: width: 95,
559: height: 100,
780: const image = API.createElement({ type: "image", width: 100, height: 100 });
793: const image = API.createElement({ type: "image", width: 100, height: 100 });
806: const image = API.createElement({ type: "image", width: 100, height: 100 });
824: const image = API.createElement({ type: "image", width: 100, height: 100 });
872: width: 100,
873: height: 80,
884: width: 80,
885: height: 60,
987: width: 120,
988: height: 0,
993: width: 0,
994: height: 80,
1111: width: 220,
1112: height: 0,
1121: width: 220,
1122: height: 0,
1218: width: 200,
1219: height: 100,
1225: width: 120,
1226: height: 80,
1259: width: 120,
1260: height: 100,
1264: width: 140,
1265: height: 80,
1296: width: 100,
1297: height: 100,
1319: width: 160,
1320: height: 80,
1328: width: -60,
1329: height: -80,
```

## editor/packages/element/tests/sizeHelpers.test.ts

58 lines. Test source; not runtime UI.

```text
18: it("should return height:0 if `elementType` is line and locked angle is 0", () => {
24: it("should return width:0 if `elementType` is line and locked angle is 90 deg (Math.PI/2)", () => {
30: it("should return height:0 if `elementType` is arrow and locked angle is 0", () => {
35: it("should return width:0 if `elementType` is arrow and locked angle is 90 deg (Math.PI/2)", () => {
53: it("should return height:0 and width:0 when width and height are 0", () => {
```

## editor/packages/element/tests/textElement.test.ts

379 lines. Test source; not runtime UI.

```text
19: const params = { width: 200, height: 100, x: 10, y: 20 };
57: width: 178,
58: height: 194,
94: width: 178,
95: height: 194,
116: width: 178,
117: height: 194,
126: width: 154,
127: height: 175,
163: height: 70,
179: height: 175,
224: width: 200,
225: height: 100,
231: width: 80,
232: height: 40,
```

## editor/packages/element/tests/textWrapping.test.ts

703 lines. Test source; not runtime UI.

```text
373: width: 70,
378: width: 15,
384: width: 130,
390: width: 240,
395: width: 50,
411: width: 70,
416: width: 15,
421: width: 140,
437: width: 160,
443: width: 120,
449: width: 590,
```

## editor/packages/excalidraw/actions/actionBoundText.tsx

343 lines. Check platform/build reachability at the call site.

```text
96: height: originalContainerHeight
244: backgroundColor: appState.currentItemBackgroundColor,
266: opacity: 100,
270: width: computeContainerDimensionForBoundText(
274: height: computeContainerDimensionForBoundText(
```

## editor/packages/excalidraw/actions/actionCanvas.tsx

450 lines. Check platform/build reachability at the call site.

```text
234: const nextZoom = appState.scrollConstraints?.lockZoom
235: ? appState.scrollConstraints.zoom
256: <Tooltip label={t("buttons.resetZoom")} style={{ height: "100%" }}>
308: : appState.scrollConstraints
309: ? getScrollConstraintsBounds(appState.scrollConstraints)
351: : appState.scrollConstraints
352: ? getScrollConstraintsBounds(appState.scrollConstraints)
388: const bounds = appState.scrollConstraints
389: ? getScrollConstraintsBounds(appState.scrollConstraints)
```

## editor/packages/excalidraw/actions/actionDeleteSelected.test.tsx

213 lines. Test source; not runtime UI.

```text
52: width: 200,
53: height: 100,
90: width: 200,
91: height: 100,
128: width: 200,
129: height: 100,
166: width: 200,
167: height: 100,
```

## editor/packages/excalidraw/actions/actionElementLock.test.tsx

70 lines. Test source; not runtime UI.

```text
30: width: 100,
31: height: 100,
37: width: 100,
38: height: 100,
44: width: 100,
45: height: 100,
```

## editor/packages/excalidraw/actions/actionExport.tsx

462 lines. Check platform/build reachability at the call site.

```text
449: marginTop: "-45px",
450: marginBottom: "10px",
```

## editor/packages/excalidraw/actions/actionFlip.test.tsx

211 lines. Test source; not runtime UI.

```text
19: width: 100,
20: height: 100,
28: width: 100,
29: height: 100,
37: width: 156,
38: height: 239.9,
```

## editor/packages/excalidraw/actions/actionFrame.ts

180 lines. Check platform/build reachability at the call site.

```text
146: width: x2 - x1 + PADDING * 2,
147: height: y2 - y1 + PADDING * 2,
```

## editor/packages/excalidraw/actions/actionLinearEditor.tsx

212 lines. Check platform/build reachability at the call site.

```text
160: backgroundColor: nextPolygonState
208: style={{ marginLeft: "auto" }}
```

## editor/packages/excalidraw/actions/actionProperties.test.tsx

230 lines. Test source; not runtime UI.

```text
90: backgroundColor: "red",
103: backgroundColor: COLOR_PALETTE.transparent,
```

## editor/packages/excalidraw/actions/actionProperties.tsx

2225 lines. Check platform/build reachability at the call site.

```text
347: label: "labels.stroke",
380: <h3 aria-hidden="true">{t("labels.stroke")}</h3>
387: label={t("labels.stroke")}
437: backgroundColor: value.currentItemBackgroundColor,
446: backgroundColor: value.currentItemBackgroundColor,
466: <h3 aria-hidden="true">{t("labels.background")}</h3>
473: label={t("labels.background")}
518: <h3 aria-hidden="true">{t("labels.background")}</h3>
531: label={t("labels.background")}
896: label: "labels.opacity",
905: opacity: value,
917: (element) => element.opacity,
924: label={t("labels.opacity")}
```

## editor/packages/excalidraw/actions/actionStyles.ts

172 lines. Check platform/build reachability at the call site.

```text
100: backgroundColor: elementStylesToCopyFrom?.backgroundColor,
105: opacity: elementStylesToCopyFrom?.opacity,
159: backgroundColor: "transparent",
```

## editor/packages/excalidraw/actions/actionTextAutoResize.ts

88 lines. Check platform/build reachability at the call site.

```text
64: width: metrics.width,
65: height: metrics.height,
```

## editor/packages/excalidraw/animatedTrail.ts

222 lines. Check platform/build reachability at the call site.

```text
192: (this.options.stroke ?? (() => "black"))(this),
```

## editor/packages/excalidraw/appState.ts

323 lines. Check platform/build reachability at the call site.

```text
36: currentItemOpacity: DEFAULT_ELEMENT_PROPS.opacity,
107: frameRendering: { enabled: true, clip: true, name: true, outline: true },
207: height: { browser: false, export: false, server: false },
256: width: { browser: false, export: false, server: false },
```

## editor/packages/excalidraw/charts.test.ts

1166 lines. Test source; not runtime UI.

```text
343: element.opacity === 100 &&
393: element.opacity === 100 &&
441: element.opacity === 100 &&
```

## editor/packages/excalidraw/charts/charts.bar.ts

103 lines. Check platform/build reachability at the call site.

```text
60: backgroundColor: barColor,
72: width: barWidth,
73: height: barHeight,
```

## editor/packages/excalidraw/charts/charts.constants.ts

63 lines. Check platform/build reachability at the call site.

```text
46: opacity: 100,
60: gap: number;
```

## editor/packages/excalidraw/charts/charts.helpers.ts

865 lines. Check platform/build reachability at the call site.

```text
119: gap: CARTESIAN_GAP,
132: gap: CARTESIAN_GAP,
283: backgroundColor: string,
372: backgroundColor: string,
391: color: seriesColors[index],
392: width: itemWidth,
393: height: metrics.height,
419: backgroundColor: "transparent",
425: width: pillWidth,
426: height: pillHeight,
439: backgroundColor: item.color,
443: width: RADAR_LEGEND_SWATCH_SIZE,
444: height: RADAR_LEGEND_SWATCH_SIZE,
527: width: number,
528: height: number,
534: width: width * cos + height * sin,
535: height: width * sin + height * cos,
692: backgroundColor: string,
749: backgroundColor: string,
778: backgroundColor: string,
788: width: chartWidth,
798: height: chartHeight,
809: width: chartWidth,
810: opacity: GRID_OPACITY,
822: backgroundColor: string,
850: width: chartWidth,
851: height: chartHeight,
854: opacity: 6,
```

## editor/packages/excalidraw/charts/charts.line.ts

130 lines. Check platform/build reachability at the call site.

```text
51: backgroundColor: "transparent",
56: height: maxY - minY,
57: width: maxX - minX,
69: backgroundColor: seriesColors[seriesIndex],
77: width: layout.gap,
78: height: layout.gap,
98: height: cy,
100: opacity: GRID_OPACITY,
```

## editor/packages/excalidraw/charts/charts.radar.ts

199 lines. Check platform/build reachability at the call site.

```text
122: backgroundColor: "transparent",
127: width: levelRadius * 2,
128: height: levelRadius * 2,
131: opacity: GRID_OPACITY,
142: backgroundColor: "transparent",
147: width: Math.abs(px),
148: height: Math.abs(py),
151: opacity: GRID_OPACITY,
168: backgroundColor: "transparent",
173: width: radius * 2,
174: height: radius * 2,
```

## editor/packages/excalidraw/clients.ts

261 lines. Check platform/build reachability at the call site.

```text
114: context.stroke();
121: context.stroke();
143: context.stroke();
158: context.stroke();
181: context.stroke();
187: context.font = "600 12px sans-serif"; // font has to be set before context.measureText()
208: context.stroke();
214: context.stroke();
```

## editor/packages/excalidraw/clipboard.ts

691 lines. Check platform/build reachability at the call site.

```text
652: textarea.style.padding = "0";
656: const yPosition = window.pageYOffset || document.documentElement.scrollTop;
```

## editor/packages/excalidraw/components/Actions.scss

208 lines. Check platform/build reachability at the call site.

```text
3: background-color: var(--island-bg-color);
4: border-radius: var(--border-radius-lg);
5: box-shadow: 0 0 0 1px var(--color-surface-lowest);
10: border-radius: 0 !important;
11: background-color: var(--color-surface-low) !important;
12: font-size: 0.875rem !important;
13: width: var(--lg-button-size);
14: height: var(--lg-button-size);
17: width: var(--lg-icon-size) !important;
18: height: var(--lg-icon-size) !important;
22: width: 100%;
23: height: 100%;
28: border-left: 0 !important;
29: border-right: 0 !important;
30: padding: 0 0.625rem !important;
31: width: 3.75rem !important;
33: color: var(--text-primary-color);
37: border-top-left-radius: var(--border-radius-lg) !important;
38: border-bottom-left-radius: var(--border-radius-lg) !important;
45: border-top-right-radius: 0 !important;
46: border-bottom-right-radius: 0 !important;
51: border-top-right-radius: var(--border-radius-lg) !important;
52: border-bottom-right-radius: var(--border-radius-lg) !important;
59: border-top-left-radius: 0 !important;
60: border-bottom-left-radius: 0 !important;
66: border-top-left-radius: var(--border-radius-lg) !important;
67: border-bottom-left-radius: var(--border-radius-lg) !important;
68: border-right: 0 !important;
75: border-top-right-radius: 0 !important;
76: border-bottom-right-radius: 0 !important;
81: border-top-right-radius: var(--border-radius-lg) !important;
82: border-bottom-right-radius: var(--border-radius-lg) !important;
89: border-top-left-radius: 0 !important;
90: border-bottom-left-radius: 0 !important;
98: gap: 0.5rem;
99: max-height: calc(100vh - 200px);
101: padding: 0.5rem;
108: min-height: 2.5rem;
111: --default-button-size: 2rem;
114: width: var(--mobile-action-button-size);
115: height: var(--mobile-action-button-size);
116: border: none;
117: border-radius: var(--border-radius-lg);
118: color: var(--color-on-surface);
119: cursor: pointer;
123: transition: all 0.2s ease;
125: background: var(--mobile-action-button-bg);
128: width: 1rem;
129: height: 1rem;
134: background: var(
143: margin-bottom: 1rem;
146: margin-bottom: 0;
150: font-size: 0.75rem;
151: font-weight: 600;
152: color: var(--color-text-secondary);
153: margin-bottom: 0.5rem;
161: gap: 0.25rem;
169: width: var(--mobile-action-button-size);
170: height: var(--mobile-action-button-size);
172: background: var(--mobile-action-button-bg);
175: background-color: transparent;
182: width: fit-content;
187: z-index: 999;
191: width: 100%;
192: background: transparent;
193: border-radius: var(--border-radius-lg);
194: box-shadow: none;
196: scrollbar-width: none;
201: --button-border: transparent;
202: --button-bg: var(--color-surface-mid);
206: --button-hover-bg: #363541;
207: --button-bg: var(--color-surface-high);
```

## editor/packages/excalidraw/components/Actions.tsx

945 lines. Check platform/build reachability at the call site.

```text
113: <div style={{ flexBasis: "100%", height: 0 }} />
118: gap: ".5rem",
119: marginTop: "-0.5rem",
198: {predicates.opacity && renderAction("changeOpacity")}
270: title={t("labels.stroke")}
305: {predicates.opacity && renderAction("changeOpacity")}
777: padding: 0,
779: backgroundColor: "transparent",
780: height: WIDTH * 1.35,
781: marginBottom: 4,
783: gap: GAP,
792: gap: GAP,
864: gap: GAP,
```

## editor/packages/excalidraw/components/App.bucketFill.ts

301 lines. Check platform/build reachability at the call site.

```text
139: element.opacity === this.app.state.currentItemOpacity
146: opacity: this.app.state.currentItemOpacity,
260: opacity: this.app.state.currentItemOpacity,
294: backgroundColor: string,
```

## editor/packages/excalidraw/components/App.cursor.ts

203 lines. Check platform/build reachability at the call site.

```text
25: const createBucketFillCursorDataURL = (color: string) => {
65: set = (cursor: string) => {
191: context.stroke();
```

## editor/packages/excalidraw/components/App.drawshape.ts

265 lines. Check platform/build reachability at the call site.

```text
200: width: line.width,
201: height: line.height,
210: backgroundColor: line.backgroundColor,
213: opacity: line.opacity,
248: opacity: app.state.currentItemOpacity,
```

## editor/packages/excalidraw/components/App.tsx

14361 lines. Check platform/build reachability at the call site.

```text
559: width: 0,
560: height: 0,
723: public cursor: AppCursor = new AppCursor(this);
886: width: this.ownerWindow.innerWidth,
887: height: this.ownerWindow.innerHeight,
1882: width: 100%;
1883: height: 100%;
1884: margin: 0;
1938: height: 100%;
1945: color: ${COLOR_PALETTE.red[3]};
1948: margin-top: 0;
1949: margin-bottom: 0.5rem;
1994: opacity: getRenderOpacity(
2017: const sh = container.scrollHeight;
2028: width: isVisible ? `${el.width}px` : 0,
2029: height: isVisible ? `${el.height}px` : 0,
2045: padding: `${el.strokeWidth}px`,
2051: width: `${embeddableViewportScale * 100}%`,
2052: height: `${embeddableViewportScale * 100}%`,
2203: width: "100%",
2204: height: "100%",
2205: backgroundColor: "#525659",
2213: width: "100%",
2214: height: "100%",
2215: border: "none",
2231: padding: "8px",
2232: backgroundColor: "rgba(255, 255, 255, 0.95)",
2233: border: "none",
2234: borderRadius: "999px",
2238: color: "#333",
2240: cursor: "pointer",
2261: <div style={{ width: "20px", height: "20px" }}>
2300: width: boxSceneBottomRight.x - boxSceneTopLeft.x,
2301: height: boxSceneBottomRight.y - boxSceneTopLeft.y,
2358: scrollX: this.state.scrollX,
2359: scrollY: this.state.scrollY,
2406: background: applyDarkModeFilter(
2411: border: "none",
2413: padding: `${FRAME_NAME_EDIT_PADDING}px`,
2414: borderRadius: 4,
2419: color: isDarkTheme
2461: color: isDarkTheme
2465: width: "max-content",
2473: cursor: CURSOR_TYPE.MOVE,
2517: scrollX: this.state.scrollX,
2518: scrollY: this.state.scrollY,
2519: height: this.state.height,
2520: width: this.state.width,
3051: width: magicFrame.width,
3052: height: magicFrame.height,
3192: width: maxX - minX + padding * 2,
3193: height: maxY - minY + padding * 2,
3194: opacity: 100,
3408: (event.shiftKey ? this.state.width : this.state.height) /
3415: scrollX: state.scrollX + offset,
3419: scrollY: state.scrollY + offset,
3792: width: this.state.width,
3793: height: this.state.height,
3819: } else if (initialData?.scrollToContent) {
3848: animation: false,
3866: const { width: editorWidth, height: editorHeight } =
4415: prevState.scrollX !== this.state.scrollX ||
4416: prevState.scrollY !== this.state.scrollY
4419: this.state.scrollX,
4420: this.state.scrollY,
4424: this.state.scrollX,
4425: this.state.scrollY,
4557: if (this.state.scrolledOutside !== scrolledOutside) {
5082: animation: false,
5154: backgroundColor: this.state.currentItemBackgroundColor,
5160: opacity: this.state.currentItemOpacity,
5311: this.state.scrollConstraints
5357: outline: next?.outline ?? prevState.frameRendering.outline,
5388: scrollX: this.state.scrollX,
5389: scrollY: this.state.scrollY,
5402: animation: { duration: 300 },
7110: height: newHeight,
7111: width: newWidth,
7170: backgroundColor: this.state.currentItemBackgroundColor,
7175: opacity: this.state.currentItemOpacity,
9064: this.state.activeTool.type === TOOL_TYPE.frame ||
9329: scrollX: this.state.scrollX - deltaX / this.state.zoom.value,
9330: scrollY: this.state.scrollY - deltaY / this.state.zoom.value,
9436: scrollX: zoomedViewport.scrollX + (2 * deltaX) / zoomValue,
9437: scrollY: zoomedViewport.scrollY + (2 * deltaY) / zoomValue,
9531: !(pointerDownState.scrollbars.isOverEither && !this.state.multiElement)
9646: pointerDownState.resize.offset = tupleToCoors(
10144: backgroundColor: this.state.currentItemBackgroundColor,
10149: opacity: this.state.currentItemOpacity,
10196: width: number;
10197: height: number;
10212: backgroundColor: "transparent",
10218: opacity: this.state.currentItemOpacity,
10265: backgroundColor: "transparent",
10271: opacity: this.state.currentItemOpacity,
10273: width: embedLink.intrinsicSize.w,
10274: height: embedLink.intrinsicSize.h,
10312: backgroundColor: this.state.currentItemBackgroundColor,
10318: opacity: this.state.currentItemOpacity,
10323: width: placeholderSize,
10324: height: placeholderSize,
10490: backgroundColor: this.state.currentItemBackgroundColor,
10495: opacity: this.state.currentItemOpacity,
10517: backgroundColor: this.state.currentItemBackgroundColor,
10522: opacity: this.state.currentItemOpacity,
10683: backgroundColor: this.state.currentItemBackgroundColor,
10688: opacity: this.state.currentItemOpacity,
10735: opacity: this.state.currentItemOpacity,
10900: if (pointerDownState.drag.offset === null) {
10901: pointerDownState.drag.offset = tupleToCoors(
11725: if (pointerDownState.scrollbars.isOverHorizontal) {
11730: this.state.scrollX -
11738: if (pointerDownState.scrollbars.isOverVertical) {
11743: this.state.scrollY -
13638: width: distance(pointerDownState.origin.x, pointerCoords.x),
13639: height: distance(pointerDownState.origin.y, pointerCoords.y),
13668: image && !(image instanceof Promise) ? image.width / image.height : null;
13706: width: distance(pointerDownState.originInGrid.x, gridX),
13707: height: distance(pointerDownState.originInGrid.y, gridY),
13726: this.state.activeTool.type === TOOL_TYPE.frame ||
13752: pointerCoords.x - pointerDownState.resize.offset.x,
13753: pointerCoords.y - pointerDownState.resize.offset.y,
13862: pointerCoords.x - pointerDownState.resize.offset.x,
13863: pointerCoords.y - pointerDownState.resize.offset.y,
14122: const minZoom = this.state.scrollConstraints?.lockZoom
14123: ? this.state.scrollConstraints.zoom
14252: width: currentWidth,
14253: height: currentHeight,
```

## editor/packages/excalidraw/components/App.viewport.ts

828 lines. Check platform/build reachability at the call site.

```text
202: scrollX: appState.scrollX,
203: scrollY: appState.scrollY,
231: width: x2 - x1,
232: height: y2 - y1,
292: ((1 - m) * from.scrollX * from.zoom.value +
293: m * target.scrollX * target.zoom.value) /
296: ((1 - m) * from.scrollY * from.zoom.value +
297: m * target.scrollY * target.zoom.value) /
310: animation: SetViewportOptions["animation"],
387: target.scrollX === state.scrollX &&
388: target.scrollY === state.scrollY &&
403: const overscrollX = (state.scrollX - target.scrollX) * state.zoom.value;
404: const overscrollY = (state.scrollY - target.scrollY) * state.zoom.value;
414: if (!currentState.scrollConstraints) {
421: scrollX: restingViewport.scrollX + (overscrollX * remaining) / zoom,
422: scrollY: restingViewport.scrollY + (overscrollY * remaining) / zoom,
464: return !!this.activeTransition?.target.scrollConstraints;
529: width: domRect.width,
599: const padding = opts?.padding ?? 24;
602: (isRTL ? opts?.paddingLeft : opts?.paddingRight) ?? padding;
605: (isRTL ? opts?.paddingRight : opts?.paddingLeft) ?? padding;
687: scrollX: this.app.state.scrollX,
688: scrollY: this.app.state.scrollY,
714: if (this.app.state.scrollConstraints) {
734: ...transition.target,
771: if (!prevState.scrollConstraints) {
776: const overscroll = zoomed ? 0 : prevState.scrollConstraints.overscroll;
789: prevState.scrollConstraints
797: if (!this.app.state.scrollConstraints) {
```

## editor/packages/excalidraw/components/Avatar.tsx

42 lines. Check platform/build reachability at the call site.

```text
10: color: string;
26: const style = loadImg ? undefined : { background: color };
```

## editor/packages/excalidraw/components/ButtonSeparator.tsx

10 lines. Check platform/build reachability at the call site.

```text
4: width: 1,
5: height: "1rem",
6: backgroundColor: "var(--default-border-color)",
7: margin: "0 auto",
```

## editor/packages/excalidraw/components/Card.scss

57 lines. Check platform/build reachability at the call site.

```text
9: max-width: 290px;
11: margin: 1em;
16: font-size: 2.6em;
19: padding: 1.4rem;
20: border-radius: 50%;
21: background: var(--card-color);
22: color: #fff;
25: width: 2.8rem;
26: height: 2.8rem;
31: font-size: 0.96em;
32: min-height: 90px;
33: padding: 0 1em;
34: margin-bottom: auto;
38: height: 2.5rem;
39: margin-top: 1em;
40: margin-bottom: 0.3em;
41: background-color: var(--card-color);
43: background-color: var(--card-color-darker);
46: background-color: var(--card-color-darkest);
49: color: #fff;
53: --spinner-color: #fff;
```

## editor/packages/excalidraw/components/Card.tsx

38 lines. Check platform/build reachability at the call site.

```text
23: color: "primary" | "lime" | "pink";
```

## editor/packages/excalidraw/components/CheckboxItem.scss

92 lines. Check platform/build reachability at the call site.

```text
6: margin: 4px 0.3em;
10: cursor: pointer;
13: -webkit-tap-highlight-color: transparent;
16: box-shadow: 0 0 0 2px #{$color-blue-4};
22: opacity: 0.3;
28: box-shadow: 0 0 2px 1px inset #{$color-blue-7} !important;
34: background-color: color.adjust($color-blue-1, $alpha: -0.8);
40: background-color: #{$color-blue-1};
46: background-color: #{$color-blue-2};
51: width: 22px;
52: height: 22px;
53: padding: 0;
56: margin: 0 1em;
62: box-shadow: 0 0 0 2px #{$color-blue-7};
63: background-color: transparent;
64: border-radius: 4px;
66: color: #{$color-blue-7};
68: border: 0;
71: box-shadow: 0 0 0 3px #{$color-blue-7};
76: width: 16px;
77: height: 16px;
78: stroke-width: 3px;
88: width: 1em;
89: height: 1em;
```

## editor/packages/excalidraw/components/ColorPicker/ColorInput.tsx

155 lines. Check platform/build reachability at the call site.

```text
24: color: string;
25: onChange: (color: string) => void;
88: style={{ border: 0, padding: 0 }}
118: width: "1px",
119: height: "1.25rem",
120: backgroundColor: "var(--default-border-color)",
```

## editor/packages/excalidraw/components/ColorPicker/ColorPicker.scss

598 lines. Check platform/build reachability at the call site.

```text
5: --color-outline: var(--color-gray-20);
7: --color-outline: var(--color-gray-80);
12: outline: none !important;
17: padding: 0 0.5rem;
18: font-size: 0.875rem;
23: padding: 0 0.5rem;
24: font-size: 0.75rem;
29: background: var(--popup-bg-color);
30: border-radius: var(--border-radius-lg);
31: box-shadow: var(--shadow-island);
32: padding: 0.25rem;
36: font-size: 0.75rem;
37: padding: 0.375rem 0.625rem;
38: border-radius: var(--border-radius-md);
39: color: var(--text-primary-color);
40: cursor: pointer;
41: outline: none;
49: background: var(--button-hover-bg);
53: opacity: 0.5;
59: padding: 0 0.5rem;
60: font-size: 0.6875rem;
61: line-height: 1.4;
63: color: var(--color-gray-60);
69: padding: 0.25rem 0px;
73: max-width: 11rem;
90: --radius: 4px;
91: --size: 1.375rem;
94: box-shadow: 0 0 0 1px var(--color-outline);
97: padding: 0;
98: margin: 0;
99: width: var(--size);
100: height: var(--size);
101: border: 0;
102: border-radius: var(--radius);
103: background-color: var(--swatch-color);
104: background-position: left center;
106: font-family: inherit;
110: box-shadow: inset 0 0 0 1px var(--color-primary);
113: box-shadow: 0 0 0 1px var(--color-primary) !important;
116: box-shadow: none !important;
118: box-shadow: 0 0 0 1px var(--color-outline) !important;
127: color: var(--color-gray-60);
128: width: 1.25rem;
129: height: 1.25rem;
138: width: 100%;
139: height: 100%;
146: --offset: -1px;
151: box-shadow: 0 0 0 1px var(--color-primary-darkest);
152: z-index: 1; // due hover state so this has preference
153: border-radius: var(--radius);
158: outline: none;
167: border: 3px solid var(--focus-highlight-color);
168: border-radius: calc(var(--radius) + 1px);
179: --radius: 6px;
180: width: 1.875rem;
181: height: 1.875rem;
185: background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAMUlEQVQ4T2NkYGAQYcAP3uCTZhw1gGGYhAGBZIA/nYDCgBDAm9BGDWAAJyRCgLaBCAAgXwixzAS0pgAAAABJRU5ErkJggg==");
189: border: 0;
194: outline: none !important;
199: border-radius: calc(var(--radius) + 1px);
200: width: 1.625rem;
201: height: 1.625rem;
205: width: var(--mobile-action-button-size);
206: height: var(--mobile-action-button-size);
210: border: 1px solid var(--mobile-color-border);
218: font-size: 10px;
219: font-family: monospace;
220: font-weight: 500;
224: background: var(--popup-bg-color);
225: border: 0 solid color.adjust(#fff, $alpha: -0.75);
226: box-shadow: color.adjust(#000, $alpha: -0.75) 0 1px 4px;
227: border-radius: 4px;
243: column-gap: 0.5rem;
251: margin-top: -0.25rem;
254: margin-left: 0.5rem;
258: margin-left: -3rem;
263: width: 0;
264: height: 0;
265: border-style: solid;
266: border-width: 0 9px 10px;
267: border-color: transparent transparent var(--popup-bg-color);
283: border-color: transparent transparent color.adjust(#000, $alpha: -0.9);
297: gap: 0.75rem;
298: outline: none;
302: padding: 0.5rem;
305: grid-gap: 0.25rem;
306: border-radius: 4px;
309: outline: none;
310: box-shadow: 0 0 0 2px var(--focus-highlight-color);
317: padding: 0.25rem;
320: color: $color-gray-6;
321: font-size: 12px;
322: padding: 0 0.25rem;
326: padding: 0.5rem 0;
335: height: var(--default-button-size);
337: padding: 0.5rem 0.5rem 0.5rem 0.75rem;
338: border: 1px solid var(--default-border-color);
339: border-right: 0;
343: border-radius: var(--border-radius-lg) 0 0 var(--border-radius-lg);
347: border-radius: 0 var(--border-radius-lg) var(--border-radius-lg) 0;
348: border-right: 1px solid var(--default-border-color);
349: border-left: 0;
352: color: var(--input-label-color);
363: box-shadow: 0 0 0 1px var(--color-primary-darkest);
364: border-radius: var(--border-radius-lg);
371: gap: 4px;
377: gap: 8px;
379: border: 1px solid var(--default-border-color);
380: border-radius: 8px;
381: padding: 0 12px;
382: margin: 8px;
386: box-shadow: 0 0 0 1px var(--color-primary-darkest);
387: border-radius: var(--border-radius-lg);
391: border-color: var(--color-danger, #e03131);
394: box-shadow: 0 0 0 1px var(--color-danger, #e03131);
400: padding: 0 0.25rem;
404: color: var(--color-danger, #e03131);
405: font-size: 0.75rem;
406: padding: 0 8px 4px 8px;
408: line-height: 1.3;
413: width: 100%;
414: margin: 0;
415: font-size: 0.875rem;
416: font-family: inherit;
417: background-color: transparent;
418: color: var(--text-primary-color);
419: border: 0;
420: outline: none;
421: height: var(--default-button-size);
422: border: 1px solid var(--default-border-color);
423: border-left: 0;
427: border-radius: 0 var(--border-radius-lg) var(--border-radius-lg) 0;
431: border-radius: var(--border-radius-lg) 0 0 var(--border-radius-lg);
432: border-left: 1px solid var(--default-border-color);
433: border-right: 0;
436: padding: 0.5rem;
437: padding-left: 0.25rem;
441: box-shadow: none;
463: transition: transform 0.14s ease, opacity 0.14s ease,
474: width: calc(100% + 10px);
475: height: calc(100% + 10px);
483: width: calc(100% - 1px);
484: height: calc(100% - 1px);
487: stroke-width: 1;
489: animation: excalidraw-color-dnd-march 0.8s linear infinite;
492: animation: none;
506: opacity: 0.3;
512: box-shadow: 0 0 0 1px var(--color-primary-darkest);
517: animation: excalidraw-color-dnd-duplicate 0.45s ease-in-out infinite
523: box-shadow: 0 0 0 2px var(--color-danger, #e03131);
527: box-shadow: 0 0 0 3px var(--color-danger, #e03131);
539: z-index: 10000;
544: transition: width 0.15s ease, height 0.15s ease;
547: width: 100%;
548: height: 100%;
549: border-radius: 4px;
550: box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.08);
551: transition: transform 0.15s ease, opacity 0.15s ease, box-shadow 0.15s ease;
554: background-color: #fff;
555: background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAMUlEQVQ4T2NkYGAQYcAP3uCTZhw1gGGYhAGBZIA/nYDCgBDAm9BGDWAAJyRCgLaBCAAgXwixzAS0pgAAAABJRU5ErkJggg==");
556: background-position: left center;
562: box-shadow: 0 6px 16px rgba(0, 0, 0, 0.25), 0 0 0 1px rgba(0, 0, 0, 0.08);
567: box-shadow: 0 3px 8px rgba(0, 0, 0, 0.2), 0 0 0 1px rgba(0, 0, 0, 0.08);
571: opacity: 0.4;
576: transition: transform 0.18s cubic-bezier(0.2, 0.8, 0.3, 1), width 0.18s ease,
582: box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.08);
586: opacity: 0;
596: cursor: grabbing !important;
```

## editor/packages/excalidraw/components/ColorPicker/ColorPicker.tsx

539 lines. Check platform/build reachability at the call site.

```text
56: color: string | null;
57: onChange: (color: string) => void;
272: color: string | null;
331: color:
```

## editor/packages/excalidraw/components/ColorPicker/CustomColorList.tsx

77 lines. Check platform/build reachability at the call site.

```text
17: color: string | null;
18: onChange: (color: string) => void;
```

## editor/packages/excalidraw/components/ColorPicker/HotkeyLabel.tsx

27 lines. Check platform/build reachability at the call site.

```text
5: color: string;
18: color: isColorDark(color) ? "#fff" : "#000",
```

## editor/packages/excalidraw/components/ColorPicker/Picker.tsx

227 lines. Check platform/build reachability at the call site.

```text
35: color: string | null;
36: onChange: (color: string) => void;
70: ? t("labels.stroke")
72: ? t("labels.background")
```

## editor/packages/excalidraw/components/ColorPicker/PickerColorList.tsx

132 lines. Check platform/build reachability at the call site.

```text
29: color: string | null;
30: onChange: (color: string) => void;
```

## editor/packages/excalidraw/components/ColorPicker/ShadeList.tsx

137 lines. Check platform/build reachability at the call site.

```text
24: color: string | null;
25: onChange: (color: string) => void;
38: color: color || "transparent",
```

## editor/packages/excalidraw/components/ColorPicker/TopPicks.tsx

184 lines. Check platform/build reachability at the call site.

```text
25: onChange: (color: string) => void;
116: {colors.map((color: string, index: number) => {
```

## editor/packages/excalidraw/components/ColorPicker/colorPickerUtils.ts

107 lines. Check platform/build reachability at the call site.

```text
17: color: string | null;
48: color: string;
```

## editor/packages/excalidraw/components/ColorPicker/keyboardNavHandlers.ts

318 lines. Check platform/build reachability at the call site.

```text
51: onChange: (color: string) => void;
122: color: string | null;
123: onChange: (color: string) => void;
```

## editor/packages/excalidraw/components/ColorPicker/topPicksDnD.tsx

572 lines. Check platform/build reachability at the call site.

```text
46: color: string;
67: color: string;
84: startSwatchDrag: (event: React.PointerEvent, color: string | null) => void;
88: color: string,
118: color: session.color,
169: width: number,
170: height: number,
331: button.style.transition = "none";
338: button.style.transition = "";
508: color: string | null,
```

## editor/packages/excalidraw/components/CommandPalette/CommandPalette.scss

159 lines. Check platform/build reachability at the call site.

```text
10: height: auto;
11: max-height: 100%;
13: @media screen and (min-width: $verticalBreakpoint) {
14: max-height: 750px;
15: height: 100%;
19: height: 100%;
20: padding: 1.5rem;
24: height: 100%;
34: margin-top: 12px;
35: gap: 1.5rem;
42: height: 16px;
43: font-size: 10px;
44: gap: 0.25rem;
51: margin: 0px 4px;
55: padding: 0px 4px;
56: height: 16px;
57: border-radius: 4px;
61: background-color: var(--color-primary-light);
65: margin-left: 4px;
66: color: var(--color-gray-50);
73: margin-top: 12px;
74: color: var(--popup-text-color);
80: padding: 12px 0px;
81: margin-right: 0.25rem;
85: font-size: 1rem;
86: font-weight: 600;
87: margin-bottom: 6px;
93: color: var(--popup-text-color);
94: height: 2.5rem;
99: padding: 0 0.5rem;
100: border-radius: var(--border-radius-lg);
101: cursor: pointer;
103: --icon-size: 1rem;
106: height: 2.75rem;
107: --icon-size: 1.5rem;
110: width: var(--icon-size);
111: height: var(--icon-size);
112: margin-right: 0.625rem;
117: background-color: var(--color-surface-low);
123: gap: 0.25rem;
129: background-color: var(--color-surface-mid);
133: opacity: 0.3;
134: cursor: not-allowed;
141: margin-top: 36px;
146: width: var(--icon-size, 1rem);
147: height: var(--icon-size, 1rem);
148: margin-right: 0.375rem;
154: height: 100%;
155: width: 100%;
```

## editor/packages/excalidraw/components/CommandPalette/CommandPalette.tsx

1038 lines. Check platform/build reachability at the call site.

```text
917: marginLeft: "6px",
1010: ref?.scrollIntoView?.({
```

## editor/packages/excalidraw/components/ConfirmDialog.scss

11 lines. Check platform/build reachability at the call site.

```text
7: column-gap: 0.5rem;
```

## editor/packages/excalidraw/components/ContextMenu.scss

102 lines. Check platform/build reachability at the call site.

```text
6: z-index: var(--zIndex-ui-context-menu);
11: border-radius: 4px;
12: box-shadow: 0 3px 10px color.adjust(#000, $alpha: -0.8);
15: margin: 0;
16: padding: 0.5rem 0;
17: background-color: var(--popup-secondary-bg-color);
18: border: 1px solid var(--button-gray-3);
19: cursor: default;
23: color: var(--popup-text-color);
28: width: 100%;
29: min-width: 9.5rem;
30: margin: 0;
31: padding: 0.25rem 1rem 0.25rem 1.25rem;
33: border-radius: 0;
34: background-color: transparent;
35: border: none;
37: font-family: inherit;
46: margin-bottom: 1px;
52: color: $color-red-7;
58: margin-inline-end: 20px;
62: opacity: 0.6;
63: font-family: inherit;
64: font-size: 0.7rem;
69: color: var(--popup-bg-color);
70: background-color: var(--select-highlight-color);
74: color: var(--popup-bg-color);
76: background-color: $color-red-6;
81: z-index: 1;
89: margin-inline-end: 0;
99: border: none;
100: border-top: 1px solid $color-gray-5;
```

## editor/packages/excalidraw/components/ConvertElementTypePopup.scss

18 lines. Check platform/build reachability at the call site.

```text
8: gap: 0.2rem;
9: border-radius: 0.5rem;
10: background: var(--island-bg-color);
11: box-shadow: var(--shadow-island);
12: padding: 0.5rem;
15: outline: none;
```

## editor/packages/excalidraw/components/ConvertElementTypePopup.tsx

954 lines. Check platform/build reachability at the call site.

```text
232: ${app.state.scrollX}${app.state.scrollY}${app.state.offsetTop}${
405: width: metrics.width,
406: height: metrics.height,
```

## editor/packages/excalidraw/components/CursorHint.scss

43 lines. Check platform/build reachability at the call site.

```text
6: z-index: var(--zIndex-cursorHint);
12: padding: 0.375rem;
16: background-color: #232329;
17: color: #e3e3e8;
18: box-shadow: var(--shadow-island);
19: border-radius: var(--border-radius-md);
21: animation: CursorHint-fade-in 100ms ease-out;
23: transition: opacity 100ms ease-out;
26: opacity: 0;
30: width: 1rem;
31: height: 1rem;
37: opacity: 0;
40: opacity: 1;
```

## editor/packages/excalidraw/components/CursorHint.tsx

209 lines. Check platform/build reachability at the call site.

```text
131: cursor: { x: clientX, y: clientY },
133: width: element.offsetWidth,
134: height: element.offsetHeight,
137: gap: CURSOR_HINT_GAP,
```

## editor/packages/excalidraw/components/DefaultSidebar.test.tsx

147 lines. Test source; not runtime UI.

```text
98: { width: 1920, height: 1080 },
```

## editor/packages/excalidraw/components/Dialog.scss

54 lines. Check platform/build reachability at the call site.

```text
6: cursor: auto;
10: margin: 0;
12: font-size: 1.25rem;
13: border-bottom: 1px solid var(--dialog-border-color);
14: padding: 0 0 0.75rem;
15: margin-bottom: 1.5rem;
19: color: var(--color-gray-40);
20: margin: 0;
24: border: 0;
25: background-color: transparent;
26: line-height: 0;
27: cursor: pointer;
30: color: var(--color-gray-60);
33: color: var(--color-gray-40);
37: width: 1.5rem;
38: height: 1.5rem;
42: --offset: 28px;
43: height: calc(100% - var(--offset)) !important;
44: margin-top: var(--offset) !important;
```

## editor/packages/excalidraw/components/DialogActionButton.scss

47 lines. Check platform/build reachability at the call site.

```text
5: column-gap: 0.5rem;
7: padding: 0.5rem 1.5rem;
8: border: 1px solid var(--default-border-color);
9: background-color: transparent;
10: height: 3rem;
11: border-radius: var(--border-radius-lg);
13: color: inherit;
14: font-family: inherit;
15: font-size: 0.875rem;
16: font-weight: 600;
21: width: 1rem;
22: height: 1rem;
26: background-color: var(--color-danger);
27: border-color: var(--color-danger);
28: color: #fff;
32: background-color: var(--color-primary);
33: border-color: var(--color-primary);
34: color: #fff;
40: color: var(--color-gray-100);
44: color: var(--color-gray-100);
```

## editor/packages/excalidraw/components/ElementCanvasButtons.scss

14 lines. Check platform/build reachability at the call site.

```text
5: box-shadow: 0px 2px 4px 0 rgb(0 0 0 / 30%);
6: z-index: var(--zIndex-canvasButtons);
7: background: var(--island-bg-color);
8: border-radius: var(--border-radius-lg);
12: gap: 0.375rem;
```

## editor/packages/excalidraw/components/ElementCanvasButtons.tsx

69 lines. Check platform/build reachability at the call site.

```text
63: padding: CONTAINER_PADDING,
```

## editor/packages/excalidraw/components/ElementHoverActions.tsx

156 lines. Check platform/build reachability at the call site.

```text
54: width: element.width,
55: height: element.height,
```

## editor/packages/excalidraw/components/ElementLinkDialog.scss

87 lines. Check platform/build reachability at the call site.

```text
9: z-index: var(--zIndex-modal);
11: border-radius: 10px;
12: padding: 1.5rem;
17: box-shadow: var(--shadow-island);
18: background-color: var(--island-bg-color);
22: margin-left: 0.5rem;
23: margin-right: 0.5rem;
24: width: calc(100% - 1rem);
26: z-index: 5;
31: margin-top: 0;
32: margin-bottom: 0.5rem;
35: font-size: 1.25rem;
40: margin: 0;
43: font-size: 0.875rem;
47: margin-bottom: 1.5rem;
50: margin-bottom: 1rem;
62: color: $color-red-9;
63: margin-left: 1rem;
66: width: 2rem;
67: height: 2rem;
71: color: $color-red-6;
79: margin-top: 1.5rem;
82: font-size: 0.875rem;
83: margin-top: 1rem;
```

## editor/packages/excalidraw/components/ElementLinkDialog.tsx

180 lines. Check platform/build reachability at the call site.

```text
166: marginRight: 10,
```

## editor/packages/excalidraw/components/ExcalidrawLogo.scss

87 lines. Check platform/build reachability at the call site.

```text
3: --logo-icon--mobile: 1rem;
4: --logo-text--mobile: 0.75rem;
6: --logo-icon--xs: 2rem;
7: --logo-text--xs: 1.5rem;
9: --logo-icon--small: 2.5rem;
10: --logo-text--small: 1.75rem;
12: --logo-icon--normal: 3rem;
13: --logo-text--normal: 2.2rem;
15: --logo-icon--large: 90px;
16: --logo-text--large: 65px;
26: width: auto;
27: color: var(--color-logo-icon);
31: margin-left: 0.75rem;
32: width: auto;
33: color: var(--color-logo-text);
38: height: var(--logo-icon--mobile);
42: height: var(--logo-text--mobile);
43: margin-left: 0.5rem;
49: height: var(--logo-icon--xs);
53: height: var(--logo-text--xs);
59: height: var(--logo-icon--small);
63: height: var(--logo-text--small);
69: height: var(--logo-icon--normal);
73: height: var(--logo-text--normal);
79: height: var(--logo-icon--large);
83: height: var(--logo-text--large);
```

## editor/packages/excalidraw/components/ExportDialog.scss

129 lines. Check platform/build reachability at the call site.

```text
5: --preview-padding: calc(var(--space-factor) * 4);
7: background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAMUlEQVQ4T2NkYGAQYcAP3uCTZhw1gGGYhAGBZIA/nYDCgBDAm9BGDWAAJyRCgLaBCAAgXwixzAS0pgAAAABJRU5ErkJggg==")
10: padding: var(--preview-padding);
11: margin-bottom: calc(var(--space-factor) * 3);
19: max-width: calc(100% - var(--preview-padding) * 2);
20: max-height: 25rem;
28: width: 100%;
30: grid-gap: calc(var(--space-factor) * 2);
47: margin-bottom: calc(var(--space-factor) * 3);
51: max-height: 30vh;
56: height: 100%;
70: row-gap: 2em;
72: @media (max-width: 460px) {
75: min-height: 40px;
80: width: fit-content;
81: margin: 1em auto;
86: width: auto;
91: margin: 0.625em 0;
92: font-weight: bold;
98: border: 0;
100: width: 5rem;
101: height: 5rem;
102: margin: 0 0.2em;
103: padding: 0;
108: border-radius: 1rem;
109: background-color: var(--button-color);
110: box-shadow: 0 3px 5px -1px rgba(0, 0, 0, 0.28),
113: font-family: Cascadia;
114: font-size: 1.8em;
115: color: #fff;
118: background-color: var(--button-color-darker);
121: background-color: var(--button-color-darkest);
122: box-shadow: none;
126: width: 0.9em;
```

## editor/packages/excalidraw/components/EyeDropper.scss

50 lines. Check platform/build reachability at the call site.

```text
7: width: 100%;
8: height: 100%;
9: z-index: var(--zIndex-eyeDropperBackdrop);
23: width: 2rem;
24: height: 2rem;
26: z-index: var(--zIndex-eyeDropperPreview);
27: border-radius: 50%;
28: border: 1px solid var(--eye-dropper-preview-border-color, #222);
29: box-shadow: 2px 2px 0 0 #4949497c;
33: width: 1.25rem;
34: height: 1.25rem;
35: cursor: pointer;
36: padding: 4px;
37: margin-right: -4px;
38: margin-left: -2px;
39: border-radius: 0.5rem;
40: color: var(--icon-fill-color);
43: background: var(--button-hover-bg);
46: color: var(--color-primary);
47: background: var(--color-primary-light);
```

## editor/packages/excalidraw/components/EyeDropper.tsx

320 lines. Check platform/build reachability at the call site.

```text
42: onSelect: (color: string, event: PointerEvent) => void;
59: color: string,
103: const getColorToApply = (color: string) =>
173: cursor: { x: clientX, y: clientY },
175: width: colorPreviewDiv.offsetWidth,
176: height: colorPreviewDiv.offsetHeight,
179: gap: 7,
196: colorPreviewDiv.style.background = currentColor;
```

## editor/packages/excalidraw/components/FilledButton.scss

330 lines. Check platform/build reachability at the call site.

```text
19: --text-color: transparent;
20: --border-color: transparent;
21: --back-color: transparent;
23: color: var(--text-color);
24: background-color: var(--back-color);
25: border-color: var(--border-color);
27: border-radius: 0.5rem;
28: border-width: 1px;
29: border-style: solid;
31: font-family: var(--font-family);
36: transition: all 150ms ease-out;
40: --spinner-color: var(--color-surface-lowest);
47: width: 1.2rem;
48: height: 1.2rem;
50: animation: successStatusAnimation 0.5s cubic-bezier(0.3, 1, 0.6, 1);
56: background-color: var(--color-success);
64: cursor: not-allowed;
68: --back-color: var(--color-surface-low) !important;
69: --text-color: var(--color-on-surface-variant) !important;
74: --text-color: var(--color-on-surface-variant);
75: --border-color: var(--color-surface-high);
92: --text-color: var(--color-surface-lowest);
93: --back-color: var(--color-primary);
96: --spinner-color: var(--text-color);
100: --back-color: var(--color-brand-hover);
104: --back-color: var(--color-brand-active);
110: --text-color: var(--color-primary);
111: --border-color: var(--color-primary);
112: --back-color: transparent;
115: --spinner-color: var(--text-color);
119: --text-color: var(--color-brand-hover);
120: --border-color: var(--color-brand-hover);
124: --text-color: var(--color-brand-active);
125: --border-color: var(--color-brand-active);
132: --text-color: var(--color-danger-text);
133: --back-color: var(--color-danger-dark);
136: --spinner-color: var(--text-color);
140: --back-color: var(--color-danger-darker);
144: --back-color: var(--color-danger-darkest);
150: --text-color: var(--color-danger);
151: --border-color: var(--color-danger);
152: --back-color: transparent;
155: --spinner-color: var(--text-color);
159: --text-color: var(--color-danger-darkest);
160: --border-color: var(--color-danger-darkest);
164: --text-color: var(--color-danger-darker);
165: --border-color: var(--color-danger-darker);
172: --text-color: var(--color-success-text);
173: --back-color: var(--color-success);
176: --spinner-color: var(--color-success);
180: --back-color: var(--color-success-darker);
184: --back-color: var(--color-success-darkest);
190: --text-color: var(--color-success-contrast);
191: --border-color: var(--color-success-contrast);
192: --back-color: transparent;
195: --spinner-color: var(--color-success-contrast);
199: --text-color: var(--color-success-contrast-hover);
200: --border-color: var(--color-success-contrast-hover);
204: --text-color: var(--color-success-contrast-active);
205: --border-color: var(--color-success-contrast-active);
212: --text-color: var(--island-bg-color);
213: --back-color: var(--color-gray-50);
216: --spinner-color: var(--text-color);
220: --back-color: var(--color-gray-60);
224: --back-color: var(--color-gray-80);
230: --text-color: var(--color-muted-background);
231: --border-color: var(--color-muted);
232: --back-color: var(--island-bg-color);
235: --spinner-color: var(--text-color);
239: --text-color: var(--color-muted-background-darker);
240: --border-color: var(--color-muted-darker);
244: --text-color: var(--color-muted-background-darker);
245: --border-color: var(--color-muted-darkest);
252: --text-color: black;
253: --back-color: var(--color-warning-dark);
256: --spinner-color: var(--text-color);
260: --back-color: var(--color-warning-darker);
264: --back-color: var(--color-warning-darkest);
270: --text-color: var(--color-warning-dark);
271: --border-color: var(--color-warning-dark);
272: --back-color: var(--input-bg-color);
275: --spinner-color: var(--text-color);
279: --text-color: var(--color-warning-darker);
280: --border-color: var(--color-warning-darker);
284: --text-color: var(--color-warning-darkest);
285: --border-color: var(--color-warning-darkest);
291: font-weight: 600;
292: font-size: 0.875rem;
293: min-height: 3rem;
294: padding: 0.5rem 1.5rem;
299: gap: 0.75rem;
304: font-weight: 600;
305: font-size: 0.75rem;
306: min-height: 2.5rem;
307: padding: 0.5rem 1rem;
312: gap: 0.5rem;
317: padding: 0.5rem 0.75rem;
318: width: 3rem;
322: width: 100%;
326: width: 1.25rem;
327: height: 1.25rem;
```

## editor/packages/excalidraw/components/FixedSideContainer.scss

39 lines. Check platform/build reachability at the call site.

```text
30: z-index: 1;
37: z-index: 3;
```

## editor/packages/excalidraw/components/FontPicker/FontPicker.scss

20 lines. Check platform/build reachability at the call site.

```text
10: max-width: calc(
```

## editor/packages/excalidraw/components/FontPicker/FontPickerList.tsx

430 lines. Check platform/build reachability at the call site.

```text
313: ref.current?.scrollIntoView?.({ block: "end" });
315: ref.current?.scrollIntoView?.({ block: "nearest" });
391: style={{ width: "15rem" }}
```

## editor/packages/excalidraw/components/FontPicker/FontPickerTrigger.tsx

59 lines. Check platform/build reachability at the call site.

```text
29: width: "2rem",
30: height: "2rem",
52: border: "none",
```

## editor/packages/excalidraw/components/HelpDialog.scss

131 lines. Check platform/build reachability at the call site.

```text
6: max-width: 960px;
10: margin: 1.5rem 0;
11: font-weight: 700;
12: font-size: 1.125rem;
18: gap: 0.75rem;
22: --background: var(--color-surface-mid);
25: column-gap: 0.5rem;
27: background-color: var(--background);
28: padding: 0.625rem 1rem;
29: border: 1px solid var(--background);
30: border-radius: var(--border-radius-lg);
31: color: var(--text-primary-color);
32: font-weight: 600;
33: font-size: 0.75rem;
37: --background: var(--color-surface-high);
39: --background: #363541;
44: --background: var(--color-surface-high);
49: border-color: var(--color-primary);
54: line-height: 0;
56: width: 1rem;
57: height: 1rem;
63: grid-column-gap: 1.5rem;
64: grid-row-gap: 2rem;
66: @media screen and (min-width: 1024px) {
71: @media screen and (min-width: 1024px) {
85: font-size: 1rem;
86: font-weight: 700;
87: margin: 0;
88: margin-bottom: 0.625rem;
92: border: 1px solid var(--dialog-border-color);
93: border-radius: var(--border-radius-lg);
98: border-bottom: 1px solid var(--dialog-border-color);
99: padding: 0.375rem 0.75rem;
103: font-size: 0.875rem;
104: column-gap: 0.5rem;
107: border-bottom: none;
114: column-gap: 0.25rem;
121: font-size: 0.625rem;
122: background-color: var(--color-primary-light);
123: border-radius: var(--border-radius-md);
124: padding: 0.5rem;
127: font-family: inherit;
128: line-height: 1;
```

## editor/packages/excalidraw/components/HelpDialog.tsx

520 lines. Check platform/build reachability at the call site.

```text
187: <Shortcut label={t("toolBar.frame")} shortcuts={[KEYS.F]} />
```

## editor/packages/excalidraw/components/HintViewer.scss

51 lines. Check platform/build reachability at the call site.

```text
4: $wide-viewport-width: 1000px;
16: max-width: 100%;
17: width: 100%;
18: margin-top: 0.5rem;
20: color: var(--color-gray-40);
21: font-size: 0.75rem;
25: padding-right: 2rem;
29: padding: 0.25rem;
34: margin: 0 1px;
35: font-family: monospace;
36: border: 1px solid var(--color-gray-40);
37: border-radius: 4px;
38: padding: 1px 3px;
39: font-size: 10px;
45: color: var(--color-gray-60);
47: border-color: var(--color-gray-60);
```

## editor/packages/excalidraw/components/IconPicker.scss

122 lines. Check platform/build reachability at the call site.

```text
6: padding: 0.5rem;
7: background: var(--popup-bg-color);
8: border: 0 solid color.adjust(#fff, $alpha: -0.75);
9: box-shadow: var(--shadow-island-stronger);
10: border-radius: 4px;
12: padding: 0.4rem;
20: gap: 0.5rem;
31: outline: transparent;
32: background-color: var(--button-gray-2);
34: opacity: 1;
39: background-color: var(--button-gray-2);
43: background-color: var(--button-gray-3);
47: cursor: not-allowed;
51: margin: 0;
52: width: 36px;
53: height: 18px;
59: padding: 0.25rem 0.28rem 0.35rem 0.25rem;
65: grid-gap: 0.5rem;
66: border-radius: 4px;
70: font-size: 0.75rem;
71: padding: 0;
72: color: var(--text-primary-color);
76: font-size: 0.75rem;
77: color: var(--text-primary-color);
83: font-size: 0.7em;
84: color: var(--keybinding-color);
99: color: #aaa;
103: color: #fff;
107: color: #aaa;
111: color: #d4d4d4;
116: color: #000;
119: color: #000;
```

## editor/packages/excalidraw/components/ImageExportDialog.scss

175 lines. Check platform/build reachability at the call site.

```text
4: --ImageExportModal-preview-border: #d6d6d6;
7: --ImageExportModal-preview-border: #5c5c5c;
18: font-family: "Assistant";
19: font-style: normal;
20: font-weight: 700;
21: font-size: 1.313rem;
22: line-height: 130%;
23: padding: 0;
24: margin: 0;
41: height: calc(100vh - 5rem);
49: height: 360px;
50: width: 55%;
52: margin-right: 1.5rem;
55: max-width: unset;
56: margin-right: unset;
58: width: 100%;
59: height: unset;
65: margin-top: 1rem;
71: width: 100%;
72: height: 100%;
78: background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAMUlEQVQ4T2NkYGAQYcAP3uCTZhw1gGGYhAGBZIA/nYDCgBDAm9BGDWAAJyRCgLaBCAAgXwixzAS0pgAAAABJRU5ErkJggg==")
81: border: 1px solid var(--ImageExportModal-preview-border);
82: border-radius: 12px;
85: padding: 1rem;
88: max-width: calc(100% - 2rem);
89: max-height: calc(100% - 2rem);
94: max-height: 100%;
99: margin-top: 24px;
100: max-width: unset;
109: gap: 18px;
112: margin-left: unset;
113: margin-top: 1rem;
115: gap: 6px 34px;
130: height: 52px;
138: font-family: "Assistant";
139: font-weight: 600;
140: font-size: 1rem;
141: line-height: 150%;
144: width: 20px;
145: height: 20px;
146: margin-left: 10px;
152: height: 100%;
162: gap: 11px;
168: padding-top: 32px;
```

## editor/packages/excalidraw/components/ImageExportDialog.tsx

426 lines. Check platform/build reachability at the call site.

```text
205: style={{ width: "30ch" }}
```

## editor/packages/excalidraw/components/InlineIcon.tsx

26 lines. Check platform/build reachability at the call site.

```text
14: width: size,
15: height: "100%",
16: margin: "0 0.5ex 0 0.5ex",
```

## editor/packages/excalidraw/components/Island.scss

15 lines. Check platform/build reachability at the call site.

```text
3: --padding: 0;
5: background-color: var(--island-bg-color);
6: box-shadow: var(--shadow-island);
7: border-radius: var(--border-radius-lg);
8: padding: calc(var(--padding) * var(--space-factor));
12: box-shadow: none;
```

## editor/packages/excalidraw/components/LayerUI.scss

195 lines. Check platform/build reachability at the call site.

```text
5: transition: width 0.1s ease-in-out;
14: width: 100%;
15: height: 100%;
17: z-index: var(--zIndex-layerUI);
21: width: 100%;
23: gap: 0.75rem;
27: gap: 0.5rem;
36: width: 100%;
39: z-index: 100;
45: transition: transform 0.5s ease-in-out;
47: :root[dir="ltr"] &.transition-left {
51: :root[dir="ltr"] &.transition-right {
55: :root[dir="rtl"] &.transition-left {
59: :root[dir="rtl"] &.transition-right {
69: padding: 10px;
78: opacity: 0;
80: transition: visibility 0s linear 0s, opacity 0.5s;
82: font-family: var(--ui-font);
83: font-size: 0.75rem;
84: font-weight: 500;
85: line-height: 1;
87: border-radius: var(--border-radius-lg);
88: border: 1px solid var(--default-border-color);
89: background-color: var(--island-bg-color);
90: color: var(--text-primary-color);
93: background-color: var(--button-hover-bg);
96: border-color: var(--color-primary);
100: opacity: 1;
102: transition: visibility 0s linear 300ms, opacity 0.5s;
118: margin-top: auto;
119: margin-bottom: auto;
132: margin-left: calc((48px - var(--lg-button-size)) / 2);
135: width: var(--lg-button-size);
136: height: var(--lg-button-size);
137: background-color: var(--island-bg-color);
138: box-shadow: var(--shadow-island);
143: box-shadow: none;
150: cursor: pointer;
152: border: 1px solid var(--color-primary);
153: padding: 0.5rem;
154: border-radius: var(--border-radius-lg);
155: background-color: var(--island-bg-color);
158: font-family: var(--ui-font);
159: font-size: 0.8333rem;
162: width: var(--mobile-action-button-size, var(--default-button-size));
163: height: var(--mobile-action-button-size, var(--default-button-size));
165: border: none;
166: box-shadow: 0 0 0 1px var(--color-surface-lowest);
167: background-color: var(--color-surface-low);
168: color: var(--button-color, var(--color-on-surface)) !important;
171: box-shadow: 0 0 0 1px var(--color-brand-active);
175: background-color: var(--color-primary);
176: color: white !important;
179: background-color: var(--color-primary-darker);
183: width: 20px;
184: height: 20px;
191: color: black !important;
```

## editor/packages/excalidraw/components/LayerUI.tsx

745 lines. Check platform/build reachability at the call site.

```text
374: marginLeft: spacing.collabMarginLeft,
376: height: "fit-content",
638: ? { width: `calc(100% - var(--right-sidebar-width))` }
653: (scrollBackToContentUIEnabled && appState.scrolledOutside) ||
666: appState.scrolledOutside && (
676: {t("buttons.scrollBackToContent")}
```

## editor/packages/excalidraw/components/LibraryMenu.scss

146 lines. Check platform/build reachability at the call site.

```text
12: background-color: var(--color-primary);
13: color: var(--color-primary-light);
14: font-weight: 700;
18: border-radius: 50%;
19: width: 1rem;
20: height: 1rem;
24: font-size: 0.625rem;
29: padding: 2rem;
30: min-width: 200px;
38: font-size: 0.8em;
49: background-color: $color-blue-6;
52: background-color: $color-blue-8;
55: width: auto;
56: font-size: 1rem;
57: color: #fff;
58: padding: 0 0.5rem;
67: gap: 0.625rem;
70: &--at-bottom::before {
72: width: calc(100% - 1.5rem);
73: height: 1px;
76: background: var(--sidebar-border-color);
83: height: var(--lg-button-size);
91: border-radius: var(--border-radius-lg);
92: background-color: var(--color-primary);
93: color: #fff;
98: font-weight: 600;
99: font-size: 0.75rem;
102: background-color: var(--color-brand-hover);
105: background-color: var(--color-brand-active);
111: color: var(--color-gray-100);
116: height: var(--default-button-size);
120: width: auto;
125: margin-bottom: 0.625rem;
128: width: 196px;
129: border-radius: var(--border-radius-lg);
130: padding: 0.25rem 0.5rem;
132: --box-shadow: var(--library-dropdown-shadow);
137: z-index: 1;
140: margin-left: auto;
```

## editor/packages/excalidraw/components/LibraryMenu.tsx

349 lines. Check platform/build reachability at the call site.

```text
164: style={{ padding: "16px 12px 0 12px" }}
```

## editor/packages/excalidraw/components/LibraryMenuItems.scss

154 lines. Check platform/build reachability at the call site.

```text
4: --container-padding-y: 1rem;
5: --container-padding-x: 0.75rem;
9: padding-top: 1rem;
10: padding-bottom: 0.5rem;
11: gap: 0.5rem;
16: color: var(--color-gray-70);
17: line-height: 1.5;
18: font-size: 0.875rem;
19: width: 100%;
20: min-height: 55px;
28: color: var(--color-primary);
29: font-weight: 700;
30: font-size: 1.125rem;
31: margin-bottom: 0.25rem;
36: color: var(--color-border-outline);
37: padding: 0.75rem 1rem;
42: color: var(--color-gray-40);
47: width: 100%;
54: height: 100%;
56: margin: 0;
61: padding-left: 0.75rem;
62: padding-right: 0.75rem;
68: gap: 1rem;
75: row-gap: 0.5rem;
76: padding: 1rem 0 var(--container-padding-y) 0;
87: color: var(--color-primary);
88: font-size: 1.125rem;
89: font-weight: 700;
90: margin-bottom: 0.75rem;
91: width: 100%;
95: margin-top: 2rem;
99: margin-left: auto;
100: font-size: 10px;
101: color: var(--color-border-outline);
102: font-weight: 400;
105: font-family: monospace;
106: border: 1px solid var(--color-border-outline);
107: border-radius: 4px;
108: padding: 1px 3px;
116: grid-gap: 1rem;
121: margin: 0;
124: height: var(--lg-button-size);
126: font-size: 0.875rem;
138: width: 100%;
141: font-weight: 500;
142: font-size: 0.9rem;
143: margin: 0.6em 0.2em;
144: color: var(--text-primary-color);
151: min-height: 3.75rem;
152: width: 100%;
```

## editor/packages/excalidraw/components/LibraryMenuItems.tsx

446 lines. Check platform/build reachability at the call site.

```text
85: libraryContainerRef.current?.scrollTo(0, scrollPosition);
310: style={{ marginTop: "0.75rem" }}
338: style={{ cursor: "pointer" }}
370: style={{ width: "auto", marginTop: "1rem" }}
387: : { borderBottom: 0 }
415: margin: IS_LIBRARY_EMPTY ? "auto" : 0,
437: style={{ padding: "16px 0", width: "100%" }}
```

## editor/packages/excalidraw/components/LibraryUnit.scss

185 lines. Check platform/build reachability at the call site.

```text
6: border: 1px solid transparent;
10: width: 55px;
11: height: 55px;
13: border-radius: var(--border-radius-lg);
21: background-color: var(--color-surface-mid);
26: background-color: var(--color-surface-high);
30: opacity: 0.5;
31: background: linear-gradient(
37: background-size: 200% 200%;
38: animation: library-unit__skeleton-opacity-animation 0.2s linear;
43: background-image: linear-gradient(
55: height: 100%;
56: width: 100%;
62: max-height: 100%;
63: max-width: 100%;
70: background: none;
71: border: none;
72: color: var(--icon-fill-color);
75: margin: 0;
76: padding: 0.5rem;
80: cursor: pointer;
83: cursor: pointer;
91: margin: 0;
94: margin: 0;
95: width: 1rem;
96: height: 1rem;
97: border-radius: 4px;
98: background-color: var(--color-primary-light);
99: border: 1px solid var(--color-primary);
100: box-shadow: none !important;
101: padding: 2px;
106: background-color: var(--color-primary-light);
112: background-color: var(--color-primary) !important;
115: color: var(--color-primary-light);
122: height: 16px;
123: width: 16px;
128: animation: library-unit__adder-animation 1s ease-in infinite;
131: width: 1.5rem;
132: height: 1.5rem;
133: background-color: var(--color-primary);
134: border-radius: var(--border-radius-md);
143: color: var(--color-primary-light);
144: width: 1rem;
145: height: 1rem;
150: animation: none;
155: cursor: pointer;
174: opacity: 0;
178: opacity: 0;
182: opacity: 0.5;
```

## editor/packages/excalidraw/components/MobileMenu.tsx

210 lines. Check platform/build reachability at the call site.

```text
110: opacity: 0,
125: scrollBackToContentUIEnabled && appState.scrolledOutside;
141: {t("buttons.scrollBackToContent")}
166: marginBottom: SCROLLBAR_WIDTH + SCROLLBAR_MARGIN,
186: style={{ opacity: "0", marginBottom: "20px" }}
```

## editor/packages/excalidraw/components/MobileToolbar.scss

77 lines. Check platform/build reachability at the call site.

```text
8: padding: 0px;
9: gap: 4px;
10: border-radius: var(--space-factor);
12: scrollbar-width: none;
22: min-width: 2rem;
23: min-height: 2rem;
24: border-radius: 4px;
31: width: 2.25rem;
32: height: 2.25rem;
37: background-color: transparent;
44: background-color: var(--color-surface-primary-container);
48: width: 1rem;
49: height: 1rem;
54: min-width: 160px;
55: z-index: var(--zIndex-layerUI);
59: width: 1px;
60: height: 24px;
61: background: var(--default-border-color);
62: margin: 0 2px;
72: min-width: 32px;
73: min-height: 32px;
74: width: 32px;
75: height: 32px;
```

## editor/packages/excalidraw/components/MobileToolbar.tsx

360 lines. Check platform/build reachability at the call site.

```text
242: width: WIDTH,
243: height: WIDTH,
290: {t("toolBar.frame")}
332: <div style={{ margin: "6px 0", fontSize: 14, fontWeight: 600 }}>
```

## editor/packages/excalidraw/components/Modal.scss

150 lines. Check platform/build reachability at the call site.

```text
6: z-index: var(--zIndex-modal);
19: padding: calc(var(--space-factor) * 10);
25: padding: 2.5rem;
26: border: 0;
27: box-shadow: none;
28: border-radius: 0;
33: animation: none;
37: animation: none;
38: opacity: 1;
49: z-index: 1;
50: background-color: rgba(#121212, 0.2);
52: animation: Modal__background__fade-in 0.1s linear forwards;
57: z-index: 2;
58: width: 100%;
59: max-width: var(--max-width);
60: max-height: 100%;
62: opacity: 0;
64: animation: Modal__content_fade-in 0.025s ease-out 0s forwards;
70: background: var(--island-bg-color);
72: border: 1px solid var(--dialog-border-color);
73: box-shadow: var(--modal-shadow);
74: border-radius: 0.75rem;
78: outline: none;
84: opacity: 0;
87: opacity: 1;
93: opacity: 0;
97: opacity: 1;
103: color: var(--icon-fill-color);
104: margin: 0;
105: padding: 0.375rem;
109: border: 0;
110: background-color: transparent;
111: line-height: 0;
112: cursor: pointer;
115: width: 1.5rem;
116: height: 1.5rem;
122: padding: 0;
131: max-width: 100%;
132: border: 0;
133: border-radius: 0;
138: @media (max-width: 600px) {
142: padding-bottom: 6rem;
146: max-height: calc(100% - 5rem) !important;
```

## editor/packages/excalidraw/components/OverwriteConfirm/OverwriteConfirm.scss

126 lines. Check platform/build reachability at the call site.

```text
8: gap: 0.75rem;
12: margin: 0;
14: font-weight: 700;
15: font-size: 1.3125rem;
16: line-height: 130%;
19: color: var(--text-primary-color);
28: width: 100%;
29: gap: 1rem;
36: padding: 2.5rem;
38: background: var(--color-danger-background);
39: border-radius: 0.5rem;
41: font-family: "Assistant";
42: font-style: normal;
43: font-weight: 400;
44: font-size: 1rem;
45: line-height: 150%;
47: color: var(--color-danger-color);
58: border-radius: 2.5rem;
59: background: var(--color-danger-icon-background);
60: width: 3.5rem;
61: height: 3.5rem;
63: padding: 0.75rem;
66: color: var(--color-danger-icon-color);
67: width: 1.5rem;
68: height: 1.5rem;
73: background: var(--color-warning-background);
74: color: var(--color-warning-color);
77: background: var(--color-warning-icon-background);
81: color: var(--color-warning-icon-color);
93: gap: 1.5rem;
103: padding: 1.5rem;
104: gap: 0.75rem;
109: height: 100%;
110: font-size: 0.875rem;
115: font-weight: 700;
116: font-size: 1.125rem;
117: line-height: 130%;
119: margin: 0;
121: color: var(--text-primary-color);
```

## editor/packages/excalidraw/components/OverwriteConfirm/OverwriteConfirmState.ts

46 lines. Check platform/build reachability at the call site.

```text
11: color: "danger" | "warning";
32: color: "danger" | "warning";
```

## editor/packages/excalidraw/components/PasteChartDialog.scss

106 lines. Check platform/build reachability at the call site.

```text
8: gap: 0.5rem;
12: min-width: 0;
16: margin-left: auto;
18: width: 1rem;
19: height: 1rem;
23: border-radius: 4px;
24: cursor: pointer;
25: color: var(--text-primary-color);
26: transition: transform 120ms ease, background-color 120ms ease,
31: color: $color-blue-6;
50: gap: 1rem;
58: width: 260px;
59: min-height: 190px;
60: border-radius: 8px;
61: padding: 10px;
62: border: 1px solid $color-gray-4;
67: gap: 10px;
68: background: transparent;
77: font-size: 0.875rem;
78: font-weight: 600;
79: line-height: 1;
81: color: var(--text-primary-color);
84: max-height: 144px;
85: max-width: 100%;
88: border-color: $color-blue-5;
91: border-color: $color-blue-5;
92: box-shadow: 0 0 0 1px $color-blue-5;
96: border-color: $color-blue-5;
97: box-shadow: 0 0 0 1px $color-blue-5;
101: width: 100%;
102: min-height: 200px;
```

## editor/packages/excalidraw/components/Popover.scss

7 lines. Check platform/build reachability at the call site.

```text
4: z-index: 10;
5: outline: none;
```

## editor/packages/excalidraw/components/Popover.test.tsx

75 lines. Test source; not runtime UI.

```text
7: const mockPopoverDimensions = (width: number, height: number) => {
```

## editor/packages/excalidraw/components/ProjectName.scss

25 lines. Check platform/build reachability at the call site.

```text
2: margin: auto;
7: height: calc(1rem - 3px);
8: width: 200px;
11: margin-left: 8px;
15: background: none;
16: border: none;
18: background: none;
20: width: auto;
21: max-width: 200px;
22: padding-left: 2px;
```

## editor/packages/excalidraw/components/ProjectName.tsx

57 lines. Check platform/build reachability at the call site.

```text
37: event.currentTarget.blur();
```

## editor/packages/excalidraw/components/PropertiesPopover.tsx

102 lines. Check platform/build reachability at the call site.

```text
59: marginLeft:
```

## editor/packages/excalidraw/components/PublishLibrary.scss

172 lines. Check platform/build reachability at the call site.

```text
10: padding: 1em 0;
15: font-weight: 500;
16: font-size: 1rem;
17: color: $color-gray-6;
21: width: 70%;
22: padding: 0.6em;
23: font-family: var(--ui-font);
27: color: $color-red-8;
28: margin: 0.2rem;
35: padding: 0.2rem 0;
37: gap: 0.5rem;
40: min-width: 2.5rem;
41: width: auto;
42: font-size: 1rem;
46: margin-left: 1rem;
47: padding: 0 0.5rem;
51: background-color: $color-blue-6;
54: background-color: $color-blue-8;
59: background-color: $color-gray-5;
61: background-color: $color-gray-6;
66: color: #fff;
68: --spinner-color: #fff;
70: padding: 0.5rem;
81: width: 9rem;
86: color: $color-red-6;
90: padding: 1em 0;
91: font-style: italic;
92: font-size: 14px;
104: font-size: 0.7rem;
105: color: $color-red-7;
106: background: rgba(255, 255, 255, 0.9);
107: padding: 0.1rem 0.2rem;
108: border-radius: 0.2rem;
112: background-color: #fff;
113: padding: 0.3rem;
114: width: 7.5rem;
115: height: 7.5rem;
116: border: 1px solid var(--button-gray-2);
118: width: 100%;
119: height: 100%;
124: background-color: #fff;
125: width: auto;
126: height: auto;
127: margin: 0 0.5rem;
131: background-color: white;
135: color: $color-red-8;
136: font-weight: 700;
137: font-size: 1rem;
138: margin: 0.2rem;
141: font-weight: 500;
142: margin: 0;
143: padding: 0.3em 0;
152: margin: 0;
155: background-color: $color-red-6;
157: background-color: $color-red-7;
160: background-color: $color-red-8;
164: color: #fff;
165: padding: 0.26rem;
166: border-radius: 0.3em;
167: width: 1rem;
168: height: 1rem;
```

## editor/packages/excalidraw/components/PublishLibrary.tsx

541 lines. Check platform/build reachability at the call site.

```text
162: margin: "0.8rem 0",
163: width: "100%",
176: <div style={{ padding: "0.5em 0" }}>
177: <span style={{ fontWeight: 500, color: "#868e96" }}>
187: style={{ width: "80%", padding: "0.2rem" }}
533: <p style={{ padding: "1em", textAlign: "center", fontWeight: 500 }}>
```

## editor/packages/excalidraw/components/QuickSearch.scss

48 lines. Check platform/build reachability at the call site.

```text
2: --list-border-color: var(--color-gray-20);
6: height: 2.6rem; // added +0.1 due to Safari
7: border-bottom: 1px solid var(--list-border-color);
14: width: 1.25rem;
15: height: 1.25rem;
16: color: var(--color-gray-40);
17: z-index: 1;
22: --list-border-color: var(--color-gray-80);
25: border-bottom: none;
33: width: 100%;
35: border: 0 !important;
36: font-size: 0.875rem;
37: padding-left: 2.5rem !important;
38: padding-right: 0.75rem !important;
41: color: var(--color-gray-40);
45: box-shadow: none !important;
```

## editor/packages/excalidraw/components/RadioGroup.scss

93 lines. Check platform/build reachability at the call site.

```text
4: --RadioGroup-background: var(--island-bg-color);
5: --RadioGroup-border: var(--color-surface-high);
7: --RadioGroup-choice-color-off: var(--color-primary);
8: --RadioGroup-choice-color-off-hover: var(--color-brand-hover);
9: --RadioGroup-choice-background-off: var(--island-bg-color);
10: --RadioGroup-choice-background-off-active: var(--color-surface-high);
12: --RadioGroup-choice-color-on: var(--color-surface-lowest);
13: --RadioGroup-choice-background-on: var(--color-primary);
14: --RadioGroup-choice-background-on-hover: var(--color-brand-hover);
15: --RadioGroup-choice-background-on-active: var(--color-brand-active);
23: padding: 3px;
24: border-radius: 10px;
26: background: var(--RadioGroup-background);
27: border: 1px solid var(--RadioGroup-border);
29: gap: 2px;
37: min-width: 20px;
38: height: 24px;
39: padding: 0 0.375rem;
41: color: var(--RadioGroup-choice-color-off);
42: background: var(--RadioGroup-choice-background-off);
44: border-radius: 8px;
46: font-family: "Assistant";
47: font-style: normal;
48: font-weight: 600;
49: font-size: 0.75rem;
50: line-height: 100%;
55: color: var(--RadioGroup-choice-color-off-hover);
59: background: var(--RadioGroup-choice-background-off-active);
63: color: var(--RadioGroup-choice-color-on);
64: background: var(--RadioGroup-choice-background-on);
67: background: var(--RadioGroup-choice-background-on-hover);
71: background: var(--RadioGroup-choice-background-on-active);
76: z-index: 1;
78: width: 100%;
79: height: 100%;
80: margin: 0;
81: padding: 0;
83: border-radius: 8px;
89: cursor: pointer;
```

## editor/packages/excalidraw/components/Range.scss

56 lines. Check platform/build reachability at the call site.

```text
4: --slider-thumb-size: 16px;
8: padding-top: 10px;
9: padding-bottom: 25px;
13: width: 100%;
14: height: 4px;
16: background: var(--color-slider-track);
17: border-radius: 2px;
18: outline: none;
24: width: var(--slider-thumb-size);
25: height: var(--slider-thumb-size);
26: background: var(--color-slider-thumb);
27: border-radius: 50%;
28: cursor: pointer;
29: border: none;
33: width: var(--slider-thumb-size);
34: height: var(--slider-thumb-size);
35: background: var(--color-slider-thumb);
36: border-radius: 50%;
37: cursor: pointer;
38: border: none;
45: font-size: 12px;
46: color: var(--text-primary-color);
53: font-size: 12px;
54: color: var(--text-primary-color);
```

## editor/packages/excalidraw/components/Range.tsx

79 lines. Check platform/build reachability at the call site.

```text
46: rangeElement.style.background = `linear-gradient(to right, var(--color-slider-track) 0%, var(--color-slider-track) ${progress}%, var(--button-bg) ${progress}%, var(--button-bg) 100%)`;
```

## editor/packages/excalidraw/components/SVGLayer.scss

24 lines. Check platform/build reachability at the call site.

```text
6: width: 100vw;
7: height: 100vh;
12: z-index: var(--zIndex-svgLayer);
18: width: 100%;
19: height: 100%;
```

## editor/packages/excalidraw/components/ScrollableList.scss

21 lines. Check platform/build reachability at the call site.

```text
4: border: none;
5: font-size: 0.875rem;
13: padding: 0.5rem;
14: font-size: 0.75rem;
15: color: var(--color-gray-60);
18: line-height: 150%;
```

## editor/packages/excalidraw/components/SearchMenu.scss

140 lines. Check platform/build reachability at the call site.

```text
8: padding: 8px 0 0 0;
15: padding: 0 0.75rem;
21: background-color: #f5f5f9;
23: background-color: #31303b;
26: border-radius: var(--border-radius-md);
27: border: 0;
30: font-size: 0.9rem;
39: padding: 8px 8px 0 8px;
40: margin: 0 0.75rem 0.25rem 0.75rem;
41: font-size: 0.8em;
47: width: 36px;
48: height: 36px;
49: --button-border: transparent;
52: background-color: var(--color-surface-high);
56: margin-right: 4px;
67: padding: 0 0.75rem;
69: gap: 0.125rem;
73: gap: 2px;
77: font-size: 0.875rem;
78: margin-bottom: 0.25rem;
81: gap: 0.25rem;
82: font-weight: 700;
85: width: 0.875rem;
86: height: 0.875rem;
87: margin-right: 0.25rem;
89: stroke-width: 1.25;
95: width: 100%;
96: margin-top: 0.25rem;
97: margin-bottom: 1rem;
104: min-height: 1.875rem;
106: padding: 0.25rem 0.75rem;
107: cursor: pointer;
108: border: 1px solid transparent;
109: outline: none;
110: font-size: 16px;
112: border-radius: var(--border-radius-md);
115: width: 1rem;
116: height: 1rem;
117: margin-right: 0.75rem;
122: max-height: 48px;
123: line-height: 24px;
130: background-color: var(--color-surface-high);
133: border-color: var(--color-primary);
137: background-color: var(--color-surface-high);
```

## editor/packages/excalidraw/components/SearchMenu.tsx

948 lines. Check platform/build reachability at the call site.

```text
206: width: match.matchedLines[0]?.width,
207: height: match.matchedLines[0]?.height,
230: scrollX: app.state.scrollX,
231: scrollY: app.state.scrollY,
249: animation: { duration: 300 },
420: <div style={{ margin: "1rem auto" }}>{t("search.noMatch")}</div>
462: ref?.scrollIntoView({ behavior: "auto", block: "nearest" });
772: height: matchedMetrics.height,
```

## editor/packages/excalidraw/components/ShareableLinkDialog.scss

91 lines. Check platform/build reachability at the call site.

```text
7: gap: 1.5rem;
9: color: var(--text-primary-color);
12: background: var(--color-primary-light-darker);
16: font-family: "Assistant";
17: font-weight: 700;
18: font-size: 1.313rem;
19: line-height: 130%;
21: margin: 0;
27: opacity: 0;
30: opacity: 1;
35: z-index: 100;
41: padding: 0.125rem 0.5rem;
42: gap: 0.125rem;
44: height: 1.125rem;
46: border: none;
47: border-radius: 0.6875rem;
49: font-family: "Assistant";
50: font-style: normal;
51: font-weight: 600;
52: font-size: 0.75rem;
53: line-height: 110%;
55: background: var(--color-success);
56: color: var(--color-success-text);
59: width: 0.875rem;
60: height: 0.875rem;
64: animation: ShareableLinkDialog__popover__scaleIn 150ms ease-out;
71: gap: 0.75rem;
75: border-top: 1px solid var(--color-gray-20);
77: padding: 0.5rem 0.5rem 0;
78: font-weight: 400;
79: font-size: 0.75rem;
80: line-height: 150%;
83: margin: 0;
87: margin-top: 1em;
```

## editor/packages/excalidraw/components/Sidebar/Sidebar.scss

175 lines. Check platform/build reachability at the call site.

```text
11: z-index: var(--zIndex-ui-library);
12: margin: 0;
13: padding: 0;
16: background-color: var(--sidebar-bg-color);
17: box-shadow: var(--sidebar-shadow);
22: border-radius: 0;
23: width: calc(var(--right-sidebar-width) - var(--space-factor) * 2);
25: border-left: 1px solid var(--sidebar-border-color);
33: box-shadow: none;
37: border-right: 1px solid var(--sidebar-border-color);
38: border-left: 0;
49: width: 100%;
50: padding: 1rem 0.75rem;
55: width: calc(100% - 1.5rem);
56: height: 1px;
57: background: var(--sidebar-border-color);
64: gap: 0;
67: margin-left: auto;
71: --button-bg: transparent;
72: border: 0 !important;
74: width: var(--lg-button-size);
75: height: var(--lg-button-size);
76: padding: 0;
79: width: var(--lg-icon-size);
80: height: var(--lg-icon-size);
84: background: var(--button-hover-bg, var(--island-bg-color));
102: padding: 1rem 0;
106: outline: none;
111: outline: none;
120: gap: 1rem;
126: padding-top: 0;
127: padding-bottom: 1rem;
131: --button-width: auto;
132: --button-bg: transparent;
133: --button-hover-bg: transparent;
134: --button-active-bg: var(--color-primary);
135: --button-hover-color: var(--color-primary);
136: --button-hover-border: var(--color-primary);
139: --button-bg: var(--color-primary);
140: --button-hover-bg: var(--color-primary-darker);
141: --button-hover-color: var(--color-icon-white);
142: --button-border: var(--color-primary);
143: color: var(--color-icon-white);
154: $padding: 2px;
155: $border: 1px;
157: gap: 0;
158: padding: $padding;
161: margin-top: -#{$padding + $border};
162: margin-bottom: -#{$padding + $border};
163: border: $border solid var(--sidebar-border-color);
164: background: var(--default-bg-color);
165: border-radius: 0.625rem;
168: height: var(--lg-button-size);
169: width: var(--lg-button-size);
171: border: none;
```

## editor/packages/excalidraw/components/Sidebar/Sidebar.test.tsx

396 lines. Test source; not runtime UI.

```text
295: { width: 1920, height: 1080 },
321: { width: 1920, height: 1080 },
345: { width: 1920, height: 1080 },
```

## editor/packages/excalidraw/components/Sidebar/SidebarTrigger.scss

48 lines. Check platform/build reachability at the call site.

```text
8: width: auto;
9: height: var(--lg-button-size);
13: gap: 0.5rem;
15: line-height: 0;
17: font-size: 0.75rem;
21: width: var(--lg-icon-size);
22: height: var(--lg-icon-size);
30: margin: 0;
31: padding: 0;
32: border: none;
33: background-color: transparent;
35: color: inherit;
```

## editor/packages/excalidraw/components/Sidebar/siderbar.test.helpers.tsx

43 lines. Test source; not runtime UI.

```text
42: await withExcalidrawDimensions({ width: 1920, height: 1080 }, test);
```

## editor/packages/excalidraw/components/Spinner.scss

49 lines. Check platform/build reachability at the call site.

```text
10: height: 100%;
11: margin-left: auto;
12: margin-right: auto;
14: --spinner-color: var(--icon-fill-color);
17: animation: rotate $duration linear infinite;
24: animation: dash $duration linear 0s infinite;
```

## editor/packages/excalidraw/components/Spinner.tsx

43 lines. Check platform/build reachability at the call site.

```text
24: width: size,
25: height: size,
```

## editor/packages/excalidraw/components/Stack.scss

19 lines. Check platform/build reachability at the call site.

```text
3: --gap: 0;
5: gap: calc(var(--space-factor) * var(--gap));
```

## editor/packages/excalidraw/components/Stats/Collapsible.tsx

50 lines. Check platform/build reachability at the call site.

```text
28: cursor: "pointer",
```

## editor/packages/excalidraw/components/Stats/Dimension.tsx

361 lines. Check platform/build reachability at the call site.

```text
80: const { width: uncroppedWidth, height: uncroppedHeight } =
110: width: nextCropWidth,
123: height: nextCropHeight,
130: width: nextCrop.width / (crop.naturalWidth / uncroppedWidth),
131: height: nextCrop.height / (crop.naturalHeight / uncroppedHeight),
155: width: nextCropWidth,
156: height: nextCropHeight,
161: width: nextCrop.width / (crop.naturalWidth / uncroppedWidth),
162: height: nextCrop.height / (crop.naturalHeight / uncroppedHeight),
326: let value = round(property === "width" ? element.width : element.height, 2);
334: const { width: uncroppedWidth, height: uncroppedHeight } =
```

## editor/packages/excalidraw/components/Stats/DragInput.scss

56 lines. Check platform/build reachability at the call site.

```text
4: width: 100%;
5: border-radius: var(--border-radius-lg);
8: box-shadow: 0 0 0 1px var(--color-primary-darkest);
9: border-radius: var(--border-radius-md);
10: background: transparent;
15: opacity: 0.5;
21: border: 0;
22: padding: 0 0.5rem 0 0.25rem;
23: min-width: 1rem;
24: width: 1.5rem;
25: height: 2rem;
27: color: var(--popup-text-color);
37: width: 100%;
38: margin: 0;
39: font-size: 0.875rem;
40: font-family: inherit;
41: background-color: transparent;
42: color: var(--text-primary-color);
43: border: 0;
44: outline: none;
45: height: 2rem;
48: padding: 0.5rem;
49: padding-left: 0.25rem;
53: box-shadow: none;
```

## editor/packages/excalidraw/components/Stats/MultiDimension.tsx

483 lines. Check platform/build reachability at the call site.

```text
66: width: nextWidth,
67: height: nextHeight,
456: (property === "width" ? el.latest.width : el.latest.height) * 100,
```

## editor/packages/excalidraw/components/Stats/Position.tsx

211 lines. Check platform/build reachability at the call site.

```text
65: const { width: uncroppedWidth, height: uncroppedHeight } =
```

## editor/packages/excalidraw/components/Stats/Stats.scss

78 lines. Check platform/build reachability at the call site.

```text
2: width: 204px;
6: margin-right: 36px;
7: font-size: 12px;
8: z-index: var(--zIndex-layerUI);
17: font-size: 1.5em;
18: margin-block-start: 0.83em;
19: margin-block-end: 0.83em;
20: font-weight: bold;
24: font-size: 1.17em;
25: margin: 0;
26: font-weight: bold;
32: gap: 0.3125rem;
41: gap: 4px;
54: font-weight: bold;
55: margin: 0.25rem 0;
62: margin-bottom: 12px;
65: margin: 0;
70: height: 16px;
71: width: 16px;
72: cursor: pointer;
74: width: 100%;
75: height: 100%;
```

## editor/packages/excalidraw/components/Stats/index.tsx

443 lines. Check platform/build reachability at the call site.

```text
149: width: number;
150: height: number;
152: width: 0,
153: height: 0,
161: width: Math.round(boundingBox[2]) - Math.round(boundingBox[0]),
162: height: Math.round(boundingBox[3]) - Math.round(boundingBox[1]),
245: marginTop: 12,
295: style={{ margin: "0.3125rem 0" }}
361: <StatsRow columns={2} style={{ margin: "0.3125rem 0" }}>
```

## editor/packages/excalidraw/components/Stats/stats.test.tsx

909 lines. Test source; not runtime UI.

```text
410: width: 150,
433: const image = API.createElement({ type: "image", width: 200, height: 100 });
458: width: 200,
459: height: 100,
463: width: 200,
464: height: 100,
569: editor.blur();
579: width: 150,
753: width: 100,
754: height: 103,
762: width: 50,
763: height: 50,
802: width: 200,
803: height: 100,
810: width: 50,
811: height: 50,
818: width: 40,
819: height: 40,
859: width: 100,
860: height: 100,
867: width: 30,
868: height: 30,
875: width: 30,
876: height: 30,
```

## editor/packages/excalidraw/components/Switch.scss

118 lines. Check platform/build reachability at the call site.

```text
4: --Switch-disabled-color: var(--color-border-outline);
5: --Switch-disabled-toggled-background: var(--color-border-outline-variant);
6: --Switch-disabled-border: var(--color-border-outline-variant);
7: --Switch-track-background: var(--island-bg-color);
8: --Switch-thumb-background: var(--color-on-surface);
9: --Switch-hover-background: var(--color-brand-hover);
10: --Switch-active-background: var(--color-brand-active);
16: width: 40px;
17: height: 20px;
18: border-radius: 12px;
24: background: var(--Switch-track-background);
25: border: 1px solid var(--Switch-disabled-color);
28: background: var(--Switch-track-background);
29: border: 1px solid var(--Switch-hover-background);
33: border: 1px solid var(--Switch-active-background);
37: background: var(--color-primary);
38: border: 1px solid var(--color-primary);
41: background: var(--color-primary-darker);
42: border: 1px solid var(--color-primary-darker);
47: background: var(--Switch-track-background);
48: border: 1px solid var(--Switch-disabled-border);
51: background: var(--Switch-disabled-toggled-background);
52: border: 1px solid var(--Switch-disabled-toggled-background);
63: border-radius: 100%;
64: transition: all 150ms ease-out;
66: width: 10px;
67: height: 10px;
71: background: var(--Switch-thumb-background);
75: width: 12px;
79: width: 14px;
80: height: 14px;
84: background: var(--Switch-track-background);
88: width: 16px;
93: background: var(--Switch-disabled-color);
97: background: var(--Switch-disabled-color);
101: width: 100%;
102: height: 100%;
103: margin: 0;
105: border-radius: 12px;
111: cursor: pointer;
114: cursor: unset;
```

## editor/packages/excalidraw/components/TTDDialog/Chat/Chat.scss

403 lines. Check platform/build reachability at the call site.

```text
10: background: var(--color-surface-lowest);
16: color: var(--color-surface-low);
25: height: 100%;
26: min-height: 0;
29: @media screen and (max-width: $verticalBreakpoint) {
30: min-height: 200px;
36: margin-bottom: 0.5rem;
37: padding: 1rem 0.5rem 0 0.5rem;
40: gap: 2rem;
41: min-height: 0;
42: border-top-left-radius: var(--border-radius-lg);
43: border-top-right-radius: var(--border-radius-lg);
45: @media screen and (max-width: $verticalBreakpoint) {
46: min-height: 100px;
47: padding: 0.75rem;
55: height: 100%;
56: min-height: 200px;
62: margin: 0 0 0.5rem 0;
63: font-size: 1.25rem;
64: font-weight: 600;
68: margin: 0 0 0.2rem 0;
69: font-size: 0.875rem;
70: color: var(--color-on-surface);
74: @media screen and (max-width: $verticalBreakpoint) {
75: min-height: 100px;
81: min-height: 71px;
98: gap: 0.5rem;
100: border: 1px solid var(--dialog-border-color);
101: border-radius: var(--border-radius-lg);
103: padding: 0.75rem;
104: background: var(--color-surface-lowest);
105: transition: border-color 0.2s ease;
108: border-color: var(--color-primary);
111: @media screen and (max-width: $verticalBreakpoint) {
112: padding: 0.5rem 0.75rem;
118: border: none;
119: outline: none;
120: font-size: 0.875rem;
121: line-height: 1.5;
122: min-height: 24px;
123: max-height: 120px;
125: border: none !important;
126: background: transparent !important;
127: color: var(--color-on-surface);
130: color: var(--color-gray-40);
133: @media screen and (max-width: $verticalBreakpoint) {
134: line-height: 1.4;
135: min-height: 20px;
136: max-height: 100px;
138: padding: 0;
141: opacity: 0.6;
150: width: 32px;
151: height: 32px;
152: border: none;
153: border-radius: 50%;
154: background: var(--color-primary);
155: color: var(--color-surface-lowest);
156: cursor: pointer;
157: margin-bottom: 8px;
160: opacity: 0.5;
161: cursor: not-allowed;
166: background-color: var(--color-primary-darker);
178: gap: 0.5rem;
184: background: var(--color-primary-light);
185: color: var(--text-primary-color);
186: border-radius: var(--border-radius-md);
187: min-width: 6rem;
197: background: var(--color-surface-low);
198: color: var(--color-on-surface);
199: border-radius: var(--border-radius-md);
200: min-width: 6rem;
203: font-family: monospace;
210: margin-bottom: 0;
213: background: var(--color-warning);
214: color: var(--color-on-surface);
215: border-radius: var(--border-radius-md);
216: min-width: 6rem;
219: font-family: monospace;
225: max-width: 80%;
226: padding: 0.75rem 1rem;
227: box-shadow: var(--chat-msg-shadow);
234: gap: 1rem;
235: margin-bottom: 0.5rem;
236: font-size: 0.75rem;
240: font-weight: 600;
244: font-size: 0.625rem;
250: gap: 0.5rem;
257: background: none;
258: border: none;
259: cursor: pointer;
260: padding: 0.25rem 0;
261: color: var(--color-gray-60);
262: transition: color 0.2s ease;
271: color: var(--color-primary);
275: width: 14px;
276: height: 14px;
282: color: var(--color-danger);
287: line-height: 1.5;
297: margin-left: 2px;
298: color: currentColor;
299: animation: blink 1s infinite;
305: gap: 0.5rem;
310: gap: 0.25rem;
313: width: 6px;
314: height: 6px;
315: border-radius: 50%;
316: background: currentColor;
317: opacity: 0.4;
318: animation: typing 1.4s infinite ease-in-out;
333: color: var(--color-danger);
334: font-weight: 500;
339: gap: 0.5rem;
343: background: var(--color-warning-background);
344: color: var(--color-warning-color);
346: padding: 0.5rem 0.75rem;
347: border-radius: var(--border-radius-md);
348: margin-top: 1rem;
349: font-size: 0.875rem;
355: background: none;
356: border: none;
357: cursor: pointer;
358: font-size: 0.875rem;
359: font-weight: 500;
360: padding: 0;
361: margin-top: 1rem;
363: font-family: inherit;
364: color: var(--link-color);
367: color: var(--link-color-hover);
370: color: var(--link-color-active);
374: cursor: not-allowed;
385: opacity: 0.4;
389: opacity: 1;
396: opacity: 1;
400: opacity: 0;
```

## editor/packages/excalidraw/components/TTDDialog/Chat/ChatInterface.tsx

191 lines. Check platform/build reachability at the call site.

```text
59: messagesEndRef.current?.scrollIntoView();
107: target.style.height = `${Math.min(target.scrollHeight, 120)}px`;
149: borderColor: isGenerating
```

## editor/packages/excalidraw/components/TTDDialog/Chat/ChatMessage.tsx

218 lines. Check platform/build reachability at the call site.

```text
83: <div style={{ marginTop: "10px" }}>
```

## editor/packages/excalidraw/components/TTDDialog/CodeMirrorEditor.tsx

239 lines. Check platform/build reachability at the call site.

```text
38: backgroundColor: "#1e1e1e",
39: color: "#d4d4d4",
42: ".cm-cursor": { borderLeftColor: "#fff" },
44: backgroundColor: "#1e1e1e",
45: color: "#858585",
46: border: "none",
48: ".cm-activeLineGutter": { backgroundColor: "#2a2a2a" },
49: ".cm-activeLine": { backgroundColor: "#2a2a2a" },
50: ".cm-errorLine": { backgroundColor: "rgba(255, 0, 0, 0.15)" },
56: { tag: tags.keyword, color: "#569cd6" },
57: { tag: tags.string, color: "#ce9178" },
58: { tag: tags.comment, color: "#6a9955" },
59: { tag: tags.number, color: "#b5cea8" },
60: { tag: tags.operator, color: "#d4d4d4" },
61: { tag: tags.punctuation, color: "#d4d4d4" },
62: { tag: tags.variableName, color: "#9cdcfe" },
63: { tag: tags.bracket, color: "#ffd700" },
70: backgroundColor: "#ffffff",
71: color: "#1e1e1e",
74: ".cm-cursor": { borderLeftColor: "#000" },
76: backgroundColor: "#fff",
77: color: "#999",
78: border: "none",
80: ".cm-activeLineGutter": { backgroundColor: "#e8e8e8" },
81: ".cm-activeLine": { backgroundColor: "#e8e8e8" },
82: ".cm-errorLine": { backgroundColor: "rgba(255, 0, 0, 0.1)" },
86: { tag: tags.keyword, color: "#0000ff" },
87: { tag: tags.string, color: "#a31515" },
88: { tag: tags.comment, color: "#008000" },
89: { tag: tags.number, color: "#098658" },
90: { tag: tags.operator, color: "#1e1e1e" },
91: { tag: tags.punctuation, color: "#1e1e1e" },
92: { tag: tags.variableName, color: "#001080" },
93: { tag: tags.bracket, color: "#af00db" },
```

## editor/packages/excalidraw/components/TTDDialog/MermaidToExcalidraw.scss

10 lines. Check platform/build reachability at the call site.

```text
4: margin-block: 0.25rem;
5: font-size: 1.25rem;
6: font-weight: 700;
7: padding-inline: 2.5rem;
```

## editor/packages/excalidraw/components/TTDDialog/TTDDialog.scss

743 lines. Check platform/build reachability at the call site.

```text
9: padding: 1.25rem;
12: margin-top: 0;
16: padding-inline: 0 !important;
17: min-height: 100%;
18: height: 100%;
25: max-height: 100%;
26: min-height: 95vh;
27: height: 100%;
29: @media screen and (min-width: $verticalBreakpoint) {
30: max-height: min(950px, calc(100vh - 4rem));
31: height: 100%;
32: min-height: unset;
39: @media screen and (max-width: $verticalBreakpoint) {
40: margin-top: 0 !important;
46: font-size: 15px;
47: font-style: italic;
48: font-weight: 500;
49: margin: 0.5rem 0 1.5rem 0;
53: width: 100%;
54: height: 100%;
60: color: var(--color-on-surface);
61: font-size: 0.875rem;
62: margin: 0;
63: padding: 0 1rem;
64: background-color: transparent;
65: border: 0;
66: height: 2.875rem;
67: font-weight: 600;
68: font-family: inherit;
72: border-bottom: 2px solid var(--color-primary);
84: padding: 1px 6px;
85: margin-left: 10px;
86: font-size: 10px;
87: border-radius: 12px;
88: background: var(--color-promo);
89: color: var(--color-surface-lowest);
94: border-bottom: 1px solid var(--color-surface-high);
95: margin-bottom: 1rem;
96: padding-inline: 2.5rem;
98: @media screen and (max-width: $verticalBreakpoint) {
99: margin-bottom: 1rem;
104: padding-inline: 2.5rem;
105: height: 100%;
109: outline: none;
115: @media screen and (max-width: $verticalBreakpoint) {
116: padding-inline: 1rem;
122: z-index: 2;
123: margin: 0;
126: min-width: 280px;
129: padding-inline: 0.5rem !important;
130: padding-top: 0.5rem;
131: padding-bottom: 0.5rem;
132: max-height: min(400px, 70vh);
133: height: fit-content;
135: box-shadow: var(--shadow-island);
136: border-radius: var(--border-radius-lg);
137: background-color: var(--island-bg-color-alt);
144: height: 100%;
147: gap: 2rem;
148: min-width: 0;
150: @media screen and (max-width: $verticalBreakpoint) {
153: grid-row-gap: 0;
157: min-width: 0;
159: @media screen and (max-width: $verticalBreakpoint) {
160: width: 100%;
162: height: auto;
163: min-height: 250px;
168: min-width: 0;
171: @media screen and (max-width: $verticalBreakpoint) {
172: width: 100%;
174: max-width: 100%;
175: min-height: 280px;
176: height: unset;
189: @media screen and (max-width: $verticalBreakpoint) {
190: height: unset;
194: @media screen and (max-width: $verticalBreakpoint) {
196: max-height: 100%;
199: max-height: unset;
207: width: auto;
208: height: 10rem;
210: border-radius: var(--border-radius-lg);
211: border: 1px solid var(--dialog-border-color);
213: padding: 0.85rem;
215: font-family: monospace;
217: @media screen and (min-width: $verticalBreakpoint) {
218: width: 100%;
219: height: 100%;
230: padding: 0;
234: height: 0;
236: min-height: 0;
239: height: 100%;
240: font-family: monospace;
243: outline: none;
248: padding: 0.85rem 0;
253: padding-left: 0.25rem;
257: padding: 0;
261: color: var(--color-gray-40);
262: font-style: italic;
275: max-width: 100%;
276: max-height: 100%;
278: background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAMUlEQVQ4T2NkYGAQYcAP3uCTZhw1gGGYhAGBZIA/nYDCgBDAm9BGDWAAJyRCgLaBCAAgXwixzAS0pgAAAABJRU5ErkJggg==")
280: border-radius: var(--border-radius-lg);
281: border: 1px solid var(--dialog-border-color);
283: height: 400px;
284: width: auto;
285: max-width: 100%;
287: @media screen and (max-width: $fullScreenModalBreakpoint) {
288: height: 200px;
291: @media screen and (max-width: $verticalBreakpoint) {
292: width: 100%;
293: max-width: 100%;
297: background: none;
298: border: 1px solid var(--dialog-border-color);
299: border-radius: var(--border-radius-lg);
303: max-width: 100%;
304: max-height: 100%;
305: width: auto;
306: height: auto;
313: width: 100%;
314: height: 100%;
329: width: 100%;
330: height: 100%;
342: z-index: 10;
346: padding: 2rem;
352: gap: 1rem;
353: padding: 2.5rem 2rem;
354: background: var(--color-surface-primary);
358: color: var(--color-danger);
364: width: 52px;
365: height: 52px;
366: stroke-width: 1.5;
371: font-size: 1.25rem;
372: font-weight: 600;
373: color: var(--color-danger);
375: margin-top: 0.25rem;
379: width: 100%;
380: max-width: 640px;
381: color: var(--color-gray-50);
382: font-size: 0.9rem;
386: font-weight: 600;
387: color: var(--color-gray-60);
391: margin-top: 0.35rem;
392: font-weight: 500;
396: margin: 0.35rem 0 0;
397: padding-left: 2rem;
403: font-weight: 400;
404: color: var(--color-gray-50);
407: max-width: 640px;
408: width: 100%;
409: font-family: monospace;
412: color: var(--color-danger);
418: margin-top: 0.35rem;
419: min-height: 2.5rem;
425: margin-top: 0;
431: height: 100%;
433: @media screen and (min-width: $verticalBreakpoint) {
436: gap: 2rem;
444: width: 100%;
445: height: 100%;
446: min-width: 0;
453: width: 100%;
454: height: 100%;
456: @media screen and (max-width: $verticalBreakpoint) {
457: height: 50%;
463: gap: 0.3rem;
464: height: 36px;
465: margin-top: 0.2rem;
466: margin-bottom: 0.5rem;
470: font-size: 14px;
471: line-height: 22px;
472: font-style: normal;
473: font-weight: 600;
481: width: 100%;
486: gap: 5px;
492: gap: 0.75rem;
496: font-size: 0.75rem;
497: font-weight: 500;
501: color: var(--color-danger);
509: height: 40px;
510: width: 40px;
514: margin-top: 0.375rem;
520: height: 100%;
522: border-radius: var(--border-radius-lg);
523: border: 1px solid var(--dialog-border-color);
525: padding: 0.85rem;
527: width: 100%;
528: font-family: monospace;
530: @media screen and (max-width: $verticalBreakpoint) {
531: width: auto;
540: height: 40px;
542: margin-top: 1rem;
543: margin-bottom: 0.5rem;
545: @media screen and (max-width: $verticalBreakpoint) {
546: margin-top: 0.5rem;
552: @media screen and (max-width: $verticalBreakpoint) {
560: font-family: inherit;
561: font-weight: 600;
562: height: 2.5rem;
564: font-size: 12px;
565: color: #fff;
566: background-color: var(--color-primary);
567: width: 100%;
570: background-color: var(--color-primary-darker);
573: background-color: var(--color-primary-darkest);
577: opacity: 0.5;
578: cursor: not-allowed;
581: background-color: var(--color-primary);
585: @media screen and (min-width: $verticalBreakpoint) {
586: width: auto;
587: min-width: 7.5rem;
591: color: var(--color-gray-100);
611: --spinner-color: white;
614: --spinner-color: var(--color-gray-100);
619: padding-left: 0.5rem;
626: margin-inline-start: 0.5rem;
627: font-size: 0.625rem;
628: opacity: 0.6;
630: gap: 0.125rem;
633: border: 1px solid gray;
634: padding: 2px 3px;
635: border-radius: 4px;
642: gap: 0.25rem;
643: background: none;
644: border: none;
645: color: var(--color-primary);
646: font-weight: 500;
647: font-family: inherit;
648: height: 40px;
655: width: 12px;
656: height: 12px;
660: @media screen and (max-width: $verticalBreakpoint) {
661: height: unset;
667: width: unset;
670: padding: 0.25rem 0.5rem;
671: cursor: pointer;
673: border: 1px solid transparent;
674: border-radius: var(--border-radius-md);
675: margin-top: 1px;
678: background-color: var(--button-hover-bg);
682: border: 1px solid var(--button-active-border);
686: background-color: var(--color-surface-primary-container);
703: border: none;
704: padding: 0.25rem;
705: cursor: pointer;
707: margin-left: 0.5rem;
711: background: transparent;
715: color: var(--color-danger);
720: color: var(--color-on-surface);
723: color: var(--color-danger);
728: width: 16px;
729: height: 16px;
740: gap: 1rem;
```

## editor/packages/excalidraw/components/TTDDialog/common.ts

170 lines. Check platform/build reachability at the call site.

```text
38: parent.style.background = "";
119: parent.style.background = "var(--default-bg-color)";
123: parent.style.background = "var(--default-bg-color)";
```

## editor/packages/excalidraw/components/TTDDialog/hooks/useMermaidRenderer.ts

213 lines. Check platform/build reachability at the call site.

```text
200: parent.style.background = "";
```

## editor/packages/excalidraw/components/TextField.scss

127 lines. Check platform/build reachability at the call site.

```text
4: --ExcTextField--color: var(--color-on-surface);
5: --ExcTextField--label-color: var(--color-on-surface);
6: --ExcTextField--background: var(--color-surface-low);
7: --ExcTextField--readonly--background: var(--color-surface-high);
8: --ExcTextField--readonly--color: var(--color-on-surface);
9: --ExcTextField--border: var(--color-gray-20);
10: --ExcTextField--readonly--border: var(--color-border-outline-variant);
11: --ExcTextField--border-hover: var(--color-brand-hover);
12: --ExcTextField--border-active: var(--color-brand-active);
13: --ExcTextField--placeholder: var(--color-border-outline-variant);
16: --ExcTextField--border: var(--color-border-outline-variant);
27: width: 1.25rem;
28: height: 1.25rem;
29: color: var(--color-gray-40);
30: z-index: 1;
34: width: 100%;
39: font-family: "Assistant";
40: font-style: normal;
41: font-weight: 600;
42: font-size: 0.875rem;
43: line-height: 150%;
45: color: var(--ExcTextField--label-color);
47: margin-bottom: 0.25rem;
58: height: 3rem;
60: background: var(--ExcTextField--background);
61: border: 1px solid var(--ExcTextField--border);
62: border-radius: 0.5rem;
64: padding: 0 0.75rem;
68: border-color: var(--ExcTextField--border-hover);
73: border-color: var(--ExcTextField--border-active);
81: border: none;
82: outline: none;
83: padding: 0;
84: margin: 0;
86: height: 1.5rem;
88: color: var(--ExcTextField--color);
90: font-family: "Assistant";
91: font-style: normal;
92: font-weight: 400;
93: font-size: 1rem;
94: line-height: 150%;
97: background: transparent;
99: width: 100%;
103: background-color: initial;
108: outline: initial;
109: box-shadow: initial;
114: background: var(--ExcTextField--readonly--background);
115: border-color: var(--ExcTextField--readonly--border);
118: color: var(--ExcTextField--readonly--color);
124: padding-left: 2.5rem;
```

## editor/packages/excalidraw/components/TextField.tsx

117 lines. Check platform/build reachability at the call site.

```text
108: style={{ border: 0, userSelect: "none" }}
```

## editor/packages/excalidraw/components/Toast.scss

65 lines. Check platform/build reachability at the call site.

```text
6: animation: Toast-fade-in 0.5s;
7: min-width: 220px;
8: max-width: min(360px, calc(100vw - 32px));
9: border-radius: var(--border-radius-lg);
10: border: 1px solid var(--default-border-color);
11: background-color: var(--island-bg-color);
12: color: var(--text-primary-color);
13: padding: 0.5rem 0.75rem;
14: box-shadow: 0 0 0 1px var(--color-surface-lowest);
16: cursor: default;
20: font-family: var(--ui-font);
21: font-size: 0.75rem;
22: line-height: 1.25rem;
24: padding: 0 $closeButtonSize + ($closeButtonPadding);
29: margin-top: 0.35rem;
30: width: 100%;
31: height: 4px;
32: border-radius: 999px;
33: background-color: var(--button-gray-2);
38: height: 100%;
39: border-radius: inherit;
40: background-color: var(--color-primary);
47: padding: $closeButtonPadding;
51: width: $closeButtonSize;
52: height: $closeButtonSize;
59: opacity: 0;
62: opacity: 1;
```

## editor/packages/excalidraw/components/Toast.tsx

80 lines. Check platform/build reachability at the call site.

```text
17: width: `${Math.min(5, Math.round(progress * 100))}%`,
```

## editor/packages/excalidraw/components/ToolIcon.scss

201 lines. Check platform/build reachability at the call site.

```text
5: border-radius: var(--border-radius-lg);
9: cursor: pointer;
10: -webkit-tap-highlight-color: transparent;
21: background-color: transparent;
23: width: 2rem;
24: height: 2rem;
33: margin: 0;
34: padding: 0;
35: border: none;
36: background-color: transparent;
38: color: inherit;
42: box-shadow: 0 0 0 2px var(--focus-highlight-color);
48: width: var(--default-button-size);
49: height: var(--default-button-size);
50: color: var(--icon-fill-color);
56: border-radius: var(--border-radius-lg);
59: margin-inline-start: 0;
64: width: var(--default-icon-size);
65: height: var(--default-icon-size);
66: color: var(--icon-fill-color);
73: color: var(--icon-fill-color);
74: font-family: var(--ui-font);
75: margin: 0 0.8em;
79: margin-left: 0.6em;
84: width: 2rem;
85: height: 2rem;
86: font-size: 0.8em;
91: padding: 0;
92: border: none;
93: margin: 0;
94: font-size: inherit;
95: background-color: initial;
98: box-shadow: 0 0 0 2px var(--focus-highlight-color);
102: background-color: var(--button-gray-3);
106: cursor: default;
111: background-color: initial;
112: border: none;
113: box-shadow: none;
117: color: var(--color-disabled);
131: background-color: transparent;
134: background-color: transparent;
138: background-color: transparent;
142: background-color: var(--button-gray-1);
144: background-color: var(--button-gray-2);
147: background-color: var(--button-gray-3);
150: width: 2rem;
151: height: 2rem;
159: font-size: 0.625rem;
160: color: var(--keybinding-color);
161: font-family: var(--ui-font);
177: width: var(--lg-button-size);
178: height: var(--lg-button-size);
180: @media screen and (max-width: 450px) {
181: width: 1.8rem;
182: height: 1.8rem;
184: @media screen and (max-width: 379px) {
185: width: 1.5rem;
186: height: 1.5rem;
190: width: var(--lg-icon-size);
191: height: var(--lg-icon-size);
197: width: var(--default-button-size);
198: height: var(--default-button-size);
```

## editor/packages/excalidraw/components/ToolPopover.scss

18 lines. Check platform/build reachability at the call site.

```text
7: gap: 0.25rem;
8: border-radius: 0.5rem;
9: background: var(--island-bg-color);
10: box-shadow: var(--shadow-island);
11: padding: 0.5rem;
12: z-index: var(--zIndex-layerUI);
16: outline: none;
```

## editor/packages/excalidraw/components/Toolbar.scss

55 lines. Check platform/build reachability at the call site.

```text
19: width: 1px;
20: height: 1.5rem;
22: background-color: var(--default-border-color);
27: box-shadow: none;
28: border: 0;
29: background-color: transparent;
32: background-color: var(--button-hover-bg);
33: box-shadow: 0 0 0 1px
38: background-color: transparent;
43: &--selected:hover {
44: background: var(--color-surface-primary-container);
45: color: var(--color-on-primary-container);
50: margin-top: 0.375rem;
52: min-width: 11.875rem;
53: z-index: 1;
```

## editor/packages/excalidraw/components/Toolbar.tsx

306 lines. Check platform/build reachability at the call site.

```text
124: {t("toolBar.frame")}
176: <div style={{ margin: "6px 0", fontSize: 14, fontWeight: 600 }}>
266: style={{ marginRight: "0.25rem" }}
295: style={{ marginLeft: "0.25rem" }}
```

## editor/packages/excalidraw/components/Tooltip.scss

47 lines. Check platform/build reachability at the call site.

```text
5: --ui-font: Assistant, system-ui, BlinkMacSystemFont, -apple-system, Segoe UI,
7: font-family: var(--ui-font);
9: z-index: var(--zIndex-popup);
11: padding: 8px;
12: border-radius: 6px;
17: background: #000;
19: line-height: 1.5;
21: font-size: 13px;
22: font-weight: 500;
23: color: #fff;
38: width: 0.9em;
39: height: 0.9em;
40: margin-left: 5px;
41: margin-top: 1px;
```

## editor/packages/excalidraw/components/Tooltip.tsx

119 lines. Check platform/build reachability at the call site.

```text
23: width: number;
24: height: number;
```

## editor/packages/excalidraw/components/UnlockPopup.scss

40 lines. Check platform/build reachability at the call site.

```text
6: z-index: var(--zIndex-interactiveCanvas);
10: gap: 0.5rem;
11: border-radius: 0.5rem;
12: background: var(--island-bg-color);
13: box-shadow: var(--shadow-island);
14: padding: 0.8rem;
15: cursor: pointer;
16: color: var(--color-gray-60);
19: outline: none;
24: width: 1.25rem;
25: height: 1.25rem;
26: color: var(--color-gray-60);
31: color: var(--color-primary);
```

## editor/packages/excalidraw/components/UserList.scss

221 lines. Check platform/build reachability at the call site.

```text
4: --avatar-size: 1.75rem;
5: --avatarList-gap: 0.625rem;
6: --userList-padding: var(--space-factor);
8: --userlist-hint-bg-color: var(--color-gray-10);
9: --userlist-hint-heading-color: var(--color-gray-80);
10: --userlist-hint-text-color: var(--color-gray-60);
11: --userlist-collaborators-border-color: var(--color-gray-20);
14: --userlist-hint-bg-color: var(--color-gray-90);
15: --userlist-hint-heading-color: var(--color-gray-30);
16: --userlist-hint-text-color: var(--color-gray-40);
17: --userlist-collaborators-border-color: var(--color-gray-80);
22: width: 100%;
30: padding: var(--userList-padding);
38: gap: var(--avatarList-gap);
42: --max-size: calc(
48: max-height: var(--max-size);
49: max-width: var(--max-size);
61: padding: 0;
63: margin: 0.5rem 0;
64: max-width: none;
65: max-height: none;
72: gap: var(--avatarList-gap);
88: padding: 0 0.25rem 0 0;
89: border-radius: 1.25rem;
90: background-color: var(--color-surface-low);
91: border: 1px solid var(--color-gray-20);
92: cursor: pointer;
96: background-color: var(--color-surface-high);
103: color: var(--color-gray-50);
104: width: 15px;
105: height: 15px;
108: width: 100%;
109: height: 100%;
118: --size: 14px;
124: width: var(--size);
125: height: var(--size);
128: width: var(--size);
129: height: var(--size);
135: margin-left: auto;
137: min-width: 2.25rem;
138: gap: 0.25rem;
151: color: var(--color-danger);
160: width: 1rem;
161: padding: 0 3px;
165: width: 0.125rem;
166: height: 0.4rem;
168: background-color: #a2f1a6;
172: animation: speaking-indicator-anim 1s -0.45s ease-in-out infinite;
176: animation: speaking-indicator-anim 1s -0.9s ease-in-out infinite;
180: animation: speaking-indicator-anim 1s -0.15s ease-in-out infinite;
199: max-height: 50vh;
204: padding: 2px;
217: height: 1px;
218: background-color: var(--userlist-collaborators-border-color);
219: margin: 0.25rem 0;
```

## editor/packages/excalidraw/components/UserList.tsx

360 lines. Check platform/build reachability at the call site.

```text
158: const updateWrapperWidth = (width: number) => {
235: width: "15rem",
```

## editor/packages/excalidraw/components/ViewportStatusFrame/ViewportStatusFrame.scss

106 lines. Check platform/build reachability at the call site.

```text
9: border: 4px solid;
10: z-index: var(--zIndex-viewportStatusFrame);
18: z-index: var(--zIndex-viewportStatusFrame);
21: background-color: var(--viewport-status-frame-badge-background);
22: color: var(--color-primary-light);
23: border-radius: 0.5rem;
24: font-size: 0.75rem;
32: background: linear-gradient(
41: cursor: pointer;
51: margin: 0;
52: border: 0;
53: padding: 0;
54: background: transparent;
55: cursor: inherit;
58: outline: 2px solid currentColor;
59: outline-offset: -2px;
60: border-radius: 0.5rem;
68: gap: 0.25rem;
69: padding: 0.25rem 0.5rem;
71: line-height: 1;
80: width: 1rem;
81: height: 1rem;
87: cursor: pointer;
88: border-radius: 0.25rem;
89: margin-right: 0.5rem;
93: background-color: var(--color-primary-darker);
97: background-color: var(--color-primary-darkest);
102: width: 1rem;
103: height: 1rem;
```

## editor/packages/excalidraw/components/ViewportStatusFrame/ViewportStatusFrame.tsx

82 lines. Check platform/build reachability at the call site.

```text
18: border: string;
23: style={{ borderColor: border, ...style }}
52: label.background || border || "var(--color-primary)",
53: color: label.color,
```

## editor/packages/excalidraw/components/canvases/InteractiveCanvas.tsx

311 lines. Check platform/build reachability at the call site.

```text
209: width: props.appState.width,
210: height: props.appState.height,
239: scrollX: appState.scrollX,
240: scrollY: appState.scrollY,
241: width: appState.width,
242: height: appState.height,
```

## editor/packages/excalidraw/components/canvases/NewElementCanvas.tsx

60 lines. Check platform/build reachability at the call site.

```text
50: width: props.appState.width,
51: height: props.appState.height,
```

## editor/packages/excalidraw/components/canvases/StaticCanvas.tsx

134 lines. Check platform/build reachability at the call site.

```text
80: scrollX: appState.scrollX,
81: scrollY: appState.scrollY,
82: width: appState.width,
83: height: appState.height,
```

## editor/packages/excalidraw/components/dropdownMenu/DropdownMenu.scss

292 lines. Check platform/build reachability at the call site.

```text
5: max-width: 20rem;
6: z-index: 1;
9: margin-bottom: 0.5rem;
15: background-color: var(--button-hover-bg);
21: margin-left: auto;
22: opacity: 0.5;
24: stroke-width: 2;
29: width: 100%;
30: row-gap: 0.75rem;
34: min-width: 232px;
35: margin-top: 0;
36: margin-bottom: 0;
39: max-width: 232px;
44: padding: 8px 8px;
46: border-radius: var(--border-radius-lg);
48: transition: box-shadow 0.5s ease-in-out;
54: box-shadow: none;
60: background-color: var(--island-bg-color);
64: gap: 1px;
66: box-shadow: var(--box-shadow, var(--shadow-island));
68: max-height: calc(100svh - var(--editor-container-padding) * 2 - 2.25rem);
71: box-shadow: var(--box-shadow, var(--shadow-island)),
78: column-gap: 0.625rem;
79: padding: 0 0.5rem;
80: font-size: 0.875rem;
81: color: var(--color-on-surface);
82: width: 100%;
84: font-weight: 400;
85: font-family: inherit;
92: background-color: transparent;
96: background-color: var(--button-hover-bg) !important;
100: background-color: var(--color-primary-light) !important;
106: margin-top: 1rem;
109: max-height: calc(7 * (2rem + 2px) + 2 * (0.5rem + 1.3 * 0.75rem) + 1rem);
111: @media screen and (min-width: 1921px) {
112: max-height: calc(
122: margin-top: 1rem;
126: font-size: 0.75rem;
128: font-weight: 400;
129: margin: 0 0 0.5rem;
130: line-height: 1.3;
135: height: 2rem;
136: padding: 0 0.5rem;
137: background-color: transparent;
138: border: none;
140: cursor: pointer;
141: border-radius: var(--border-radius-md);
144: @media screen and (min-width: 1921px) {
145: height: 2.25rem;
151: width: 100%;
155: gap: 0.75rem;
159: margin-inline-start: auto;
160: opacity: 0.5;
164: font-size: 0.875rem;
165: padding: 0 0.625rem;
170: background: var(--color-primary-light);
171: --icon-fill-color: var(--color-primary-darker);
175: background-color: var(--button-hover-bg);
180: background-color: var(--button-hover-bg);
181: box-shadow: 0 0 0 1px var(--color-brand-active);
185: cursor: not-allowed;
186: opacity: 0.5;
190: background-color: transparent;
194: background-color: transparent;
195: box-shadow: none;
200: width: 1rem;
201: height: 1rem;
208: height: 2rem;
211: @media screen and (min-width: 1921px) {
212: height: 2.25rem;
216: width: 1rem;
217: height: 1rem;
223: margin-top: 0.5rem;
227: font-size: 14px;
229: margin: 10px 0;
230: font-weight: 500;
236: width: var(--lg-button-size);
237: height: var(--lg-button-size);
239: --background: var(--color-surface-mid);
241: background-color: var(--background);
244: --background: var(--color-surface-high);
246: --background: #363541;
251: --background: var(--color-surface-high);
252: background-color: var(--background);
257: box-shadow: 0 0 0 1px var(--color-primary);
261: cursor: not-allowed;
264: --background: var(--color-surface-mid);
265: background-color: var(--background);
269: box-shadow: none;
274: --background: var(--color-surface-high);
280: width: var(--lg-icon-size);
281: height: var(--lg-icon-size);
285: border: none;
286: margin: 0;
287: padding: 0;
288: width: var(--default-button-size);
289: height: var(--default-button-size);
```

## editor/packages/excalidraw/components/dropdownMenu/DropdownMenuItem.tsx

119 lines. Check platform/build reachability at the call site.

```text
80: marginLeft: "auto",
81: padding: "2px 4px",
82: borderRadius: 6,
85: border: theme === THEME.LIGHT ? "1.5px solid white" : "none",
91: backgroundColor: "var(--background-color-badge)",
92: color: "var(--color-badge)",
97: backgroundColor: "pink",
98: color: "darkred",
104: background: "var(--color-promo)",
105: color: "var(--color-surface-lowest)",
```

## editor/packages/excalidraw/components/dropdownMenu/DropdownMenuSeparator.tsx

15 lines. Check platform/build reachability at the call site.

```text
6: height: "1px",
7: backgroundColor: "var(--default-border-color)",
8: margin: "6px 0",
```

## editor/packages/excalidraw/components/footer/FooterCenter.scss

12 lines. Check platform/build reachability at the call site.

```text
5: width: 100%;
7: margin-inline-end: 0.6rem;
```

## editor/packages/excalidraw/components/hyperlink/Hyperlink.scss

70 lines. Check platform/build reachability at the call site.

```text
8: box-shadow: 0px 2px 4px 0 rgb(0 0 0 / 30%);
9: z-index: var(--zIndex-hyperlinkContainer);
10: background: var(--island-bg-color);
11: border-radius: var(--border-radius-md);
14: min-height: 42px;
18: z-index: 100;
23: height: 24px;
24: padding: 0 8px;
25: line-height: 24px;
26: font-size: 0.9rem;
27: font-weight: 500;
28: font-family: var(--ui-font);
32: width: 18rem;
33: border: none;
34: background-color: transparent;
35: color: var(--text-primary-color);
37: outline: none;
38: border: none;
39: box-shadow: none !important;
46: max-width: 15rem;
50: color: $color-blue-6;
51: background-color: transparent !important;
52: font-weight: 500;
54: color: $color-red-9;
59: color: $color-red-6;
63: width: 2rem;
64: height: 2rem;
```

## editor/packages/excalidraw/components/hyperlink/Hyperlink.tsx

495 lines. Check platform/build reachability at the call site.

```text
148: width:
154: height:
257: width: POPUP_WIDTH,
258: padding: POPUP_PADDING,
434: width: linkWidth,
435: height: linkHeight,
```

## editor/packages/excalidraw/components/icons.tsx

2582 lines. Check platform/build reachability at the call site.

```text
37: } = typeof opts === "number" ? ({ width: opts } as Opts) : opts;
54: width: 24,
55: height: 24,
64: width: 20,
65: height: 20,
73: width: 40,
74: height: 20,
216: width: 24,
217: height: 24,
243: { width: 41, height: 94, fill: "none" },
268: { width: 85, height: 71, fill: "none" },
293: { width: 38, height: 78, fill: "none" },
304: { width: 40, height: 40, fill: "none" },
314: { fill: "none", width: 22, height: 22, strokeWidth: 1.25 },
329: { fill: "none", width: 22, height: 22, strokeWidth: 1.25 },
585: width: 24,
586: height: 24,
600: { width: 448, height: 512 },
605: { width: 448, height: 512 },
619: { width: 384, height: 512 },
665: { width: 512, height: 512 },
670: { width: 448, height: 512 },
675: { width: 448, height: 512 },
721: { width: 24, height: 24 },
746: { width: 64, height: 64 },
758: { width: 1024 },
986: { width: 24 },
991: { width: 384, height: 512 },
1022: { width: 182, height: 182, mirror: true },
1054: { width: 182, height: 182, mirror: true },
1205: width: 40,
1206: height: 20,
1868: { width: 640, height: 512 },
2547: export const emptyIcon = <div style={{ width: "1rem", height: "1rem" }} />;
```

## editor/packages/excalidraw/components/live-collaboration/LiveCollaborationTrigger.scss

66 lines. Check platform/build reachability at the call site.

```text
5: --button-bg: var(--color-primary);
6: --button-color: var(--color-surface-lowest);
7: --button-border: var(--color-primary);
9: --button-width: var(--lg-button-size);
10: --button-height: var(--lg-button-size);
12: --button-hover-bg: var(--color-primary-darker);
13: --button-hover-border: var(--color-primary-darker);
15: --button-active-bg: var(--color-primary-darker);
17: box-shadow: 0 0 0 1px var(--color-surface-lowest);
23: background-color: #0fb884;
24: border-color: #0fb884;
27: color: #fff;
32: background-color: #0fb884;
33: border-color: #0fb884;
39: background-color: var(--button-special-active-bg-color);
43: color: var(--icon-green-fill-color);
54: min-width: 1em;
55: min-height: 1em;
56: line-height: 1;
59: padding: 3px;
60: border-radius: 50%;
61: background-color: $color-green-2;
62: color: $color-green-9;
63: font-size: 0.6rem;
64: font-family: "Cascadia";
```

## editor/packages/excalidraw/components/live-collaboration/LiveCollaborationTrigger.tsx

48 lines. Check platform/build reachability at the call site.

```text
34: style={{ position: "relative", width: showIconOnly ? undefined : "auto" }}
```

## editor/packages/excalidraw/components/main-menu/DefaultItems.scss

21 lines. Check platform/build reachability at the call site.

```text
11: width: 9.3em;
15: width: 1.15em;
16: margin-inline-end: 0.3em;
```

## editor/packages/excalidraw/components/main-menu/DefaultItems.tsx

647 lines. Check platform/build reachability at the call site.

```text
81: color: "warning",
332: <div style={{ marginTop: "0.75rem" }}>
337: marginBottom: "0.25rem",
338: marginLeft: "0.5rem",
343: <div style={{ padding: "0 0.625rem" }}>
```

## editor/packages/excalidraw/components/positionElementBesideCursor.test.ts

59 lines. Test source; not runtime UI.

```text
4: width: 48,
5: height: 48,
11: width: 400,
12: height: 300,
19: cursor: { x: 200, y: 100 },
22: gap: 20,
30: cursor: { x: 480, y: 330 },
33: gap: 20,
41: cursor: { x: 160, y: 90 },
43: container: { left: 100, top: 50, width: 100, height: 80 },
44: gap: 20,
52: cursor: { x: 130, y: 80 },
54: container: { left: 100, top: 50, width: 40, height: 40 },
55: gap: 0,
```

## editor/packages/excalidraw/components/positionElementBesideCursor.ts

65 lines. Check platform/build reachability at the call site.

```text
12: gap: number;
40: cursor: {
45: width: number;
46: height: number;
51: gap: number;
```

## editor/packages/excalidraw/components/shapeActionPredicates.ts

177 lines. Check platform/build reachability at the call site.

```text
114: backgroundColor: canChangeBackgroundColor(appState, targetElements),
143: opacity: activeToolType !== "autoshape" || hasSelection,
```

## editor/packages/excalidraw/components/welcome-screen/WelcomeScreen.Center.tsx

198 lines. Check platform/build reachability at the call site.

```text
95: <div className="welcome-screen-center" style={{ marginTop: 0 }}>
```

## editor/packages/excalidraw/components/welcome-screen/WelcomeScreen.scss

269 lines. Check platform/build reachability at the call site.

```text
3: font-family: "Excalifont", "Xiaolai";
12: color: var(--color-gray-40);
15: --color: var(--color-primary);
16: color: var(--color);
18: margin-bottom: -6px;
24: color: var(--color-gray-60);
32: @media (max-height: 780px) {
36: @media (max-width: 1024px), (max-width: 800px) {
57: margin-top: 0.5rem;
58: width: 85px;
59: height: 71px;
74: margin-top: 2.5rem;
79: width: 120px;
85: width: 38px;
86: height: 78px;
96: width: 320px;
97: font-size: 1rem;
100: margin-top: 0.25rem;
101: margin-inline-start: 0.6rem;
105: gap: 0.5rem;
108: width: 41px;
109: height: 94px;
116: @media (max-width: 860px) {
118: max-width: 160px;
130: gap: 2rem;
144: column-gap: 0.75rem;
145: font-size: 2.25rem;
149: font-size: 1.125rem;
151: line-height: 1.35rem;
157: gap: 2px;
167: color: var(--color-gray-50);
168: font-size: 0.875rem;
170: width: 100%;
171: min-width: 300px;
172: max-width: 400px;
177: background: none;
178: border: 1px solid transparent;
180: padding: 0.75rem;
182: border-radius: var(--border-radius-md);
189: margin-right: auto;
191: column-gap: 0.5rem;
195: width: var(--default-icon-size);
196: height: var(--default-icon-size);
200: margin-left: auto;
201: color: var(--color-gray-40);
202: font-size: 0.75rem;
208: background: var(--button-hover-bg);
213: color: var(--color-gray-100);
218: background: var(--button-hover-bg);
219: border-color: var(--color-brand-active);
224: color: var(--color-gray-100);
230: color: var(--color-gray-60);
233: color: var(--color-gray-60);
238: background-color: var(--color-surface-low);
243: color: var(--color-gray-10);
251: color: var(--color-gray-10);
258: margin-bottom: 2rem;
262: @media (max-height: 500px), (max-width: 320px) {
```

## editor/packages/excalidraw/css/app.scss

37 lines. Check platform/build reachability at the call site.

```text
3: height: 1px;
4: width: 1px;
17: z-index: 999;
25: font-size: 2.8em;
29: margin-top: 1em;
30: font-size: 0.8em;
35: background-color: #121212;
36: color: #ced4da;
```

## editor/packages/excalidraw/css/styles.scss

1030 lines. Check platform/build reachability at the call site.

```text
5: --zIndex-canvas: 1;
6: --zIndex-interactiveCanvas: 2;
7: --zIndex-svgLayer: 3;
8: --zIndex-wysiwyg: 3;
9: --zIndex-canvasButtons: 3;
10: --zIndex-layerUI: 4;
11: --zIndex-viewportStatusFrame: 5;
12: --zIndex-eyeDropperBackdrop: 5;
13: --zIndex-eyeDropperPreview: 6;
14: --zIndex-hyperlinkContainer: 7;
15: --zIndex-cursorHint: 8;
17: --zIndex-ui-bottom: 60;
18: --zIndex-ui-context-menu: 90;
19: --zIndex-ui-styles-popup: 100;
20: --zIndex-ui-top: 100;
21: --zIndex-ui-main-menu: 110;
22: --zIndex-ui-library: 120;
24: --zIndex-modal: 1000;
25: --zIndex-popup: 1001;
26: --zIndex-toast: 999999;
28: --sab: env(safe-area-inset-bottom);
29: --sal: env(safe-area-inset-left);
30: --sar: env(safe-area-inset-right);
31: --sat: env(safe-area-inset-top);
37: cursor: ew-resize;
41: --ui-font: Assistant, system-ui, BlinkMacSystemFont, -apple-system, Segoe UI,
43: --viewport-status-frame-border-width: 0px;
46: --viewport-status-frame-border-width: 4px;
49: font-family: var(--ui-font);
53: color: var(--text-primary-color);
59: height: 100%;
60: width: 100%;
64: font-size: 0.8333rem;
73: cursor: pointer;
78: outline: none;
90: font-weight: 500;
92: color: var(--link-color);
94: cursor: pointer;
114: z-index: var(--zIndex-canvas);
117: z-index: var(--zIndex-interactiveCanvas);
137: width: 100%;
138: height: 100%;
139: border: 0;
144: z-index: 2;
150: padding-top: var(--sat, 0);
151: padding-right: var(--sar, 0);
152: padding-bottom: var(--sab, 0);
153: padding-left: var(--sal, 0);
164: row-gap: 0.75rem;
169: margin: 0;
170: margin-bottom: 0.25rem;
171: font-size: 0.75rem;
172: color: var(--text-primary-color);
173: font-weight: 400;
179: width: 100%;
183: padding: 0;
194: column-gap: 0.5rem;
195: row-gap: 0.5rem;
198: font-size: 0.75rem;
203: opacity: 0;
209: margin-top: 8px;
214: margin: 0;
215: padding: 0;
216: border: none;
221: width: 1px;
222: background-color: $color-gray-2;
223: margin: 1px;
231: outline: transparent;
232: box-shadow: 0 0 0 1px var(--color-brand-hover);
244: box-shadow: none !important;
254: background-color: transparent;
282: z-index: var(--zIndex-ui-top);
297: z-index: var(--zIndex-viewportStatusFrame);
302: z-index: var(--zIndex-layerUI);
308: width: calc(100% - 28px);
309: max-width: 450px;
313: --bar-padding: calc(4 * var(--space-factor));
314: z-index: var(--zIndex-ui-bottom);
323: max-height: 100%;
324: padding: 4px;
337: --icon-fill-color: #fff;
338: --keybinding-color: #fff;
341: background-color: var(--color-primary);
350: gap: 0.5rem;
365: width: 100%;
369: margin-bottom: var(--bar-padding);
372: padding: 8px 8px 0 8px;
378: color: var(--icon-fill-color);
393: grid-gap: 1rem;
395: cursor: default;
402: @media (min-width: 1536px) {
404: grid-gap: 3rem;
445: width: fit-content;
448: min-width: 48px;
463: cursor: default;
466: padding: 0 1rem;
470: width: 185px;
489: height: 100%;
494: height: 100%;
499: padding: 0.75rem;
500: width: 12.5rem;
506: height: 1.5rem;
507: padding: 0;
508: padding-inline-start: 0.5rem;
509: padding-inline-end: 1.5rem;
510: color: var(--icon-fill-color);
511: background-color: var(--button-gray-1);
512: border-radius: var(--space-factor);
513: border: 1px solid var(--button-gray-2);
514: font-size: 0.8rem;
515: font-family: inherit;
516: outline: none;
518: background-image: var(--dropdown-icon);
519: background-repeat: no-repeat;
520: background-position: right 0.7rem top 50%, 0 0;
523: background-position: left 0.7rem top 50%, 0 0;
526: background-size: 0.65em auto, 100%;
529: box-shadow: 0 0 0 2px var(--focus-highlight-color);
533: background-color: var(--button-gray-2);
537: background-color: var(--button-gray-2);
541: height: 2rem;
542: background-color: var(--island-bg-color);
543: border-color: var(--default-border-color) !important;
544: cursor: pointer;
547: background-color: var(--island-bg-color);
553: border-radius: var(--border-radius-lg);
554: background-color: var(--island-bg-color);
555: color: var(--icon-fill-color);
557: border: 1px solid var(--default-border-color);
558: padding: 10px 20px;
564: max-width: calc(
569: font-family: inherit;
572: background-color: var(--button-hover-bg);
576: border: 1px solid var(--button-active-border);
590: gap: 0.5rem;
598: max-width: 100%;
613: margin-bottom: 0.5rem;
616: .help-icon {
620: width: var(--lg-button-size);
621: height: var(--lg-button-size);
624: width: var(--lg-icon-size);
625: height: var(--lg-icon-size);
630: font-family: var(--ui-font);
636: gap: 0.4em;
637: margin-top: auto;
638: margin-bottom: auto;
639: margin-inline-start: 0.6em;
646: margin-top: auto;
647: margin-bottom: auto;
648: margin-inline-start: 0.6em;
658: z-index: var(--zIndex-ui-bottom);
670: opacity: 1;
671: height: auto;
672: width: auto;
673: transition: opacity 0.5s;
677: opacity: 0;
678: height: 0;
679: width: 0;
680: transition: opacity 0.5s;
705: cursor: default;
741: color: var(--text-primary-color);
742: border: 1.5px solid var(--input-border-color);
743: padding: 0.75rem;
745: border-radius: var(--space-factor);
746: background-color: var(--input-bg-color);
750: border-color: var(--color-brand-hover);
755: outline: none;
756: border-color: var(--color-brand-hover);
771: width: 4px;
772: height: 3px;
776: width: 10px;
780: background: var(--scrollbar-thumb);
781: border-radius: 10px;
784: background: var(--scrollbar-thumb-hover);
787: background: var(--scrollbar-thumb);
796: border: 1px solid var(--sidebar-border-color);
797: border-top-left-radius: var(--border-radius-lg);
798: border-bottom-left-radius: var(--border-radius-lg);
799: border-right: 0;
802: background-color: var(--island-bg-color);
805: width: 2rem;
806: height: 2rem;
807: border-radius: 0;
811: border: 0;
817: max-width: 98vw;
824: margin: 0;
825: padding: 0;
826: border: none;
831: font-size: 0.75rem;
832: font-weight: 400;
833: margin: 0 0 0.25rem;
834: padding: 0;
839: z-index: var(--zIndex-ui-main-menu);
847: --button-border: transparent;
848: --button-bg: var(--color-surface-mid);
854: --button-hover-bg: #363541;
855: --button-bg: var(--color-surface-high);
861: padding: 0.25rem 0;
866: margin: 1rem 0;
871: margin-top: 0;
874: margin-top: 0rem;
885: min-height: 100vh;
886: padding: 20px 0;
899: padding: 40px;
900: background-color: $color-red-1;
901: border: 3px solid $color-red-9;
905: margin: 15px 0;
906: max-width: 600px;
915: font-size: 1.1em;
920: font-size: 0.9em;
929: width: 100%;
930: margin: 10px 0;
931: font-family: "Cascadia";
932: font-size: 0.8em;
944: border-radius: var(--embeddable-radius);
949: z-index: 1;
954: gap: 0.5rem;
955: padding: 0.375rem 0.75rem;
956: border-radius: 12px;
957: background: rgba(0, 0, 0, 0.5);
958: color: #fff;
959: font-size: 0.875rem;
960: font-family: "Assistant";
964: --spinner-color: #fff;
967: height: auto;
968: margin: 0;
973: width: 100%;
974: height: 100%;
978: width: 100%;
979: height: 100%;
984: border-radius: var(--embeddable-radius);
990: z-index: 1;
991: background: rgba(0, 0, 0, 0.5);
992: padding: 1rem 1.6rem;
993: border-radius: 12px;
994: color: #fff;
995: font-weight: 700;
997: font-family: "Assistant";
1003: z-index: var(--zIndex-hyperlinkContainer);
1005: gap: 0.375rem;
1009: width: 2rem;
1010: height: 2rem;
1014: padding: 0;
1015: border: 1px solid var(--button-gray-3);
1016: border-radius: 999px;
1017: background: var(--island-bg-color);
1018: color: var(--text-primary-color);
1019: box-shadow: 0 2px 8px rgba(0, 0, 0, 0.18);
1023: width: 1rem;
1024: height: 1rem;
1028: background: var(--button-hover-bg);
```

## editor/packages/excalidraw/css/theme.scss

281 lines. Check platform/build reachability at the call site.

```text
6: --theme-filter: none;
7: --button-destructive-bg-color: #{$color-red-1};
8: --button-destructive-color: #{$color-red-9};
9: --button-gray-1: #{$color-gray-2};
10: --button-gray-2: #{$color-gray-4};
11: --button-gray-3: #{$color-gray-5};
12: --mobile-action-button-bg: rgba(255, 255, 255, 0.35);
13: --mobile-color-border: var(--default-border-color);
14: --button-special-active-bg-color: #{$color-green-0};
15: --dialog-border-color: var(--color-gray-20);
16: --dropdown-icon: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" width="292.4" height="292.4" viewBox="0 0 292 292"><path d="M287 197L159 69c-4-3-8-5-13-5s-9 2-13 5L5 197c-3 4-5 8-5 13s2 9 5 13c4 4 8 5 13 5h256c5 0 9-1 13-5s5-8 5-13-1-9-5-13z"/></svg>');
17: --focus-highlight-color: #{$color-blue-2};
18: --icon-fill-color: var(--color-on-surface);
19: --icon-green-fill-color: #{$color-green-9};
20: --default-bg-color: #fff;
21: --input-bg-color: #fff;
22: --input-border-color: #{$color-gray-4};
23: --input-hover-bg-color: #{$color-gray-1};
24: --input-label-color: #{$color-gray-7};
25: --island-bg-color: #ffffff;
26: --island-bg-color-alt: #fff;
27: --keybinding-color: var(--color-gray-40);
28: --link-color: #{$color-blue-7};
29: --link-color-hover: #{$color-blue-8};
30: --link-color-active: #{$color-blue-2};
31: --overlay-bg-color: #{color.adjust(#fff, $alpha: -0.12)};
32: --popup-bg-color: var(--island-bg-color);
33: --popup-secondary-bg-color: #{$color-gray-1};
34: --popup-text-color: #000;
35: --popup-text-inverted-color: #fff;
36: --select-highlight-color: #{$color-blue-5};
37: --shadow-island: 0px 0px 1px 0px rgba(0, 0, 0, 0.17),
39: --shadow-island-stronger: 0px 0px 1px 0px rgba(0, 0, 0, 0.17),
42: --button-hover-bg: var(--color-surface-high);
43: --button-active-bg: var(--color-surface-high);
44: --button-active-border: var(--color-brand-active);
45: --default-border-color: var(--color-surface-high);
47: --default-button-size: 2rem;
48: --default-icon-size: 1rem;
49: --lg-button-size: 2.25rem;
50: --lg-icon-size: 1rem;
51: --editor-container-padding: 1rem;
52: --mobile-action-button-size: 2rem;
54: --scrollbar-thumb: var(--button-gray-2);
55: --scrollbar-thumb-hover: var(--button-gray-3);
57: --color-slider-track: hsl(240, 100%, 90%);
58: --color-slider-thumb: var(--color-gray-80);
60: --modal-shadow: 0px 100px 80px rgba(0, 0, 0, 0.07),
66: --avatar-border-color: var(--color-gray-20);
67: --sidebar-shadow: 0px 100px 80px rgba(0, 0, 0, 0.07),
73: --sidebar-border-color: var(--color-surface-high);
74: --sidebar-bg-color: var(--island-bg-color);
75: --library-dropdown-shadow: 0px 15px 6px rgba(0, 0, 0, 0.01),
78: --chat-msg-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
80: --space-factor: 0.25rem;
81: --text-primary-color: var(--color-on-surface);
83: --color-selection: #6965db;
85: --color-icon-white: #fff;
87: --color-primary: #6965db;
88: --color-primary-darker: #5b57d1;
89: --color-primary-darkest: #4a47b1;
90: --color-primary-light: #e3e2fe;
91: --color-primary-light-darker: #d7d5ff;
92: --color-primary-hover: #5753d0;
94: --color-gray-10: #f5f5f5;
95: --color-gray-20: #ebebeb;
96: --color-gray-30: #d6d6d6;
97: --color-gray-40: #b8b8b8;
98: --color-gray-50: #999999;
99: --color-gray-60: #7a7a7a;
100: --color-gray-70: #5c5c5c;
101: --color-gray-80: #3d3d3d;
102: --color-gray-85: #242424;
103: --color-gray-90: #1e1e1e;
104: --color-gray-100: #121212;
106: --color-disabled: var(--color-gray-40);
108: --color-warning: #fceeca;
109: --color-warning-dark: #f5c354;
110: --color-warning-darker: #f3ab2c;
111: --color-warning-darkest: #ec8b14;
112: --color-text-warning: var(--text-primary-color);
114: --color-danger: #db6965;
115: --color-danger-dark: #db6965;
116: --color-danger-darker: #d65550;
117: --color-danger-darkest: #d1413c;
118: --color-danger-text: black;
120: --color-danger-background: #fff0f0;
121: --color-danger-icon-background: #ffdad6;
122: --color-danger-color: #700000;
123: --color-danger-icon-color: #700000;
125: --color-warning-background: var(--color-warning);
126: --color-warning-icon-background: var(--color-warning-dark);
127: --color-warning-color: var(--text-primary-color);
128: --color-warning-icon-color: var(--text-primary-color);
130: --color-muted: var(--color-gray-30);
131: --color-muted-darker: var(--color-gray-60);
132: --color-muted-darkest: var(--color-gray-100);
133: --color-muted-background: var(--color-gray-80);
134: --color-muted-background-darker: var(--color-gray-100);
136: --color-promo: var(--color-primary);
138: --color-success: #cafccc;
139: --color-success-darker: #bafabc;
140: --color-success-darkest: #a5eba8;
141: --color-success-text: #268029;
142: --color-success-contrast: #65bb6a;
143: --color-success-contrast-hover: #6bcf70;
144: --color-success-contrast-active: #6edf74;
146: --color-logo-icon: var(--color-primary);
147: --color-logo-text: #190064;
149: --border-radius-md: 0.375rem;
150: --border-radius-lg: 0.5rem;
152: --color-surface-high: #f1f0ff;
153: --color-surface-mid: #f6f6f9;
154: --color-surface-low: #ececf4;
155: --color-surface-lowest: #ffffff;
156: --color-on-surface: #1b1b1f;
157: --color-brand-hover: #5753d0;
158: --color-on-primary-container: #030064;
159: --color-surface-primary-container: #e0dfff;
160: --color-brand-active: #4440bf;
161: --color-border-outline: #767680;
162: --color-border-outline-variant: #c5c5d0;
163: --color-surface-primary-container: #e0dfff;
165: --color-badge: #0b6513;
166: --background-color-badge: #d3ffd2;
169: --editor-container-padding: 0.75rem;
172: @media screen and (min-device-width: 1921px) {
173: --lg-button-size: 2.5rem;
174: --lg-icon-size: 1.25rem;
175: --default-button-size: 2.25rem;
176: --default-icon-size: 1.25rem;
181: background: none;
186: --theme-filter: invert(93%) hue-rotate(180deg);
187: --button-destructive-bg-color: #5a0000;
188: --button-destructive-color: #{$color-red-3};
190: --button-gray-1: #363636;
191: --button-gray-2: #272727;
192: --button-gray-3: #222;
193: --mobile-action-button-bg: var(--island-bg-color);
194: --mobile-color-border: rgba(255, 255, 255, 0.85);
195: --button-special-active-bg-color: #204624;
196: --dialog-border-color: var(--color-gray-80);
197: --dropdown-icon: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" width="292.4" height="292.4" viewBox="0 0 292 292"><path fill="%23ced4da" d="M287 197L159 69c-4-3-8-5-13-5s-9 2-13 5L5 197c-3 4-5 8-5 13s2 9 5 13c4 4 8 5 13 5h256c5 0 9-1 13-5s5-8 5-13-1-9-5-13z"/></svg>');
198: --focus-highlight-color: #{$color-blue-6};
199: --icon-green-fill-color: #{$color-green-4};
200: --default-bg-color: #121212;
201: --input-bg-color: #121212;
202: --input-border-color: #2e2e2e;
203: --input-hover-bg-color: #181818;
204: --input-label-color: #{$color-gray-2};
205: --island-bg-color: #232329;
206: --island-bg-color-alt: hsl(240, 12%, 12%);
207: --keybinding-color: var(--color-gray-60);
208: --link-color: #{$color-blue-4};
209: --overlay-bg-color: #{color.adjust($color-gray-8, $alpha: -0.88)};
210: --popup-secondary-bg-color: #222;
211: --popup-text-color: #{$color-gray-4};
212: --popup-text-inverted-color: #2c2c2c;
213: --select-highlight-color: #{$color-blue-4};
215: --modal-shadow: 0px 100px 80px rgba(0, 0, 0, 0.07),
221: --avatar-border-color: var(--color-gray-85);
223: --scrollbar-thumb: #{$color-gray-8};
224: --scrollbar-thumb-hover: #{$color-gray-7};
226: --color-slider-track: hsl(244, 23%, 39%);
229: --color-selection: #3530c4;
231: --color-icon-white: var(--color-gray-90);
233: --color-primary: #a8a5ff;
234: --color-primary-darker: #b2aeff;
235: --color-primary-darkest: #beb9ff;
236: --color-primary-light: #4f4d6f;
237: --color-primary-light-darker: #43415e;
238: --color-primary-hover: #bbb8ff;
240: --color-disabled: var(--color-gray-70);
242: --color-text-warning: var(--color-gray-80);
244: --color-danger: #ffa8a5;
245: --color-danger-dark: #672120;
246: --color-danger-darker: #8f2625;
247: --color-danger-darkest: #ac2b29;
248: --color-danger-text: #fbcbcc;
250: --color-danger-background: #fbcbcc;
251: --color-danger-icon-background: #672120;
252: --color-danger-color: #261919;
253: --color-danger-icon-color: #fbcbcc;
255: --color-warning-background: var(--color-warning);
256: --color-warning-icon-background: var(--color-warning-dark);
257: --color-warning-color: var(--color-gray-80);
258: --color-warning-icon-color: var(--color-gray-80);
260: --color-muted: var(--color-gray-80);
261: --color-muted-darker: var(--color-gray-60);
262: --color-muted-darkest: var(--color-gray-20);
263: --color-muted-background: var(--color-gray-40);
264: --color-muted-background-darker: var(--color-gray-20);
266: --color-logo-text: #e2dfff;
268: --color-surface-high: #2e2d39;
269: --color-surface-low: hsl(240, 8%, 15%);
270: --color-surface-mid: hsl(240 6% 10%);
271: --color-surface-lowest: hsl(0, 0%, 7%);
272: --color-on-surface: #e3e3e8;
273: --color-brand-hover: #bbb8ff;
274: --color-on-primary-container: #e0dfff;
275: --color-surface-primary-container: #403e6a;
276: --color-brand-active: #d0ccff;
277: --color-border-outline: #8e8d9c;
278: --color-border-outline-variant: #46464f;
279: --color-surface-primary-container: #403e6a;
```

## editor/packages/excalidraw/css/variables.module.scss

252 lines. Check platform/build reachability at the call site.

```text
37: --icon-fill-color: var(--color-on-primary-container);
46: background: var(--color-surface-primary-container);
47: --keybinding-color: var(--color-on-primary-container);
50: color: var(--color-on-primary-container);
61: background: var(--button-hover-bg);
65: background: var(--button-hover-bg);
66: border: 1px solid var(--button-active-border);
69: color: var(--color-on-primary-container);
74: background: initial;
75: border: none;
78: color: var(--color-disabled);
86: cursor: default;
87: --keybinding-color: var(--color-disabled);
91: color: var(--color-disabled);
96: background: initial;
97: border: none;
100: color: var(--color-disabled);
111: padding: 0.625rem;
112: width: var(--button-width, var(--default-button-size));
113: height: var(--button-height, var(--default-button-size));
115: border-width: 1px;
116: border-style: solid;
117: border-color: var(--button-border, var(--default-border-color));
118: border-radius: var(--border-radius-lg);
119: cursor: pointer;
120: background-color: var(--button-bg, var(--island-bg-color));
121: color: var(--button-color, var(--color-on-surface));
122: font-family: var(--ui-font);
125: width: var(--button-width, var(--lg-icon-size));
126: height: var(--button-height, var(--lg-icon-size));
130: background-color: var(--button-hover-bg, var(--island-bg-color));
131: border-color: var(
135: color: var(
142: background-color: var(--button-active-bg, var(--island-bg-color));
143: border-color: var(--button-active-border, var(--color-primary-darkest));
148: background-color: var(
152: border-color: var(
158: background-color: var(
165: color: var(--button-color, var(--color-on-primary-container));
170: width: var(--mobile-action-button-size, var(--default-button-size));
171: height: var(--mobile-action-button-size, var(--default-button-size));
176: -webkit-tap-highlight-color: transparent;
185: padding: 0;
189: width: var(--default-icon-size);
190: height: var(--default-icon-size);
195: width: var(--avatar-size, 1.5rem);
196: height: var(--avatar-size, 1.5rem);
198: border-radius: 100%;
199: outline-offset: 2px;
203: cursor: pointer;
204: font-size: 0.75rem;
205: font-weight: 700;
206: line-height: 1;
207: color: var(--color-gray-90);
215: width: 100%;
216: height: 100%;
217: border-radius: 100%;
227: border-radius: 100%;
231: border-color: var(--color-primary-hover);
232: box-shadow: 0 0 0 1px var(--color-primary-hover);
235: cursor: auto;
240: border: none;
241: box-shadow: 0 0 0 1px var(--color-surface-lowest);
242: background-color: var(--color-surface-low);
245: box-shadow: 0 0 0 1px var(--color-brand-active);
249: width: var(--mobile-action-button-size, 2rem);
250: height: var(--mobile-action-button-size, 2rem);
```

## editor/packages/excalidraw/data/blob.ts

562 lines. Check platform/build reachability at the call site.

```text
175: (data.appState?.scrollX === undefined ||
176: data.appState?.scrollY === undefined)
331: return new Promise<{ width: number; height: number }>((resolve, reject) => {
346: width: image.naturalWidth || image.width,
347: height: image.naturalHeight || image.height,
```

## editor/packages/excalidraw/data/restore.ts

1285 lines. Check platform/build reachability at the call site.

```text
131: `Removing extremely large ${label} ${element.id} (width: ${element.width}, height: ${element.height}, x: ${element.x}, y: ${element.y})`,
138: width: 100,
139: height: 100,
147: width: unknown,
148: height: unknown,
163: isFiniteNumber(width) ? width : 0,
164: isFiniteNumber(height) ? height : 0,
447: opacity:
448: element.opacity == null ? DEFAULT_ELEMENT_PROPS.opacity : element.opacity,
453: backgroundColor:
455: width: element.width || 0,
456: height: element.height || 0,
525: ).font.split(" ");
1027: width: boundElement.width,
1028: height: boundElement.height,
```

## editor/packages/excalidraw/fonts/ExcalidrawFontFace.ts

209 lines. Check platform/build reachability at the call site.

```text
49: `@font-face { font-family: ${this.fontFace.family}; src: url(${content}); }`,
```

## editor/packages/excalidraw/fonts/YRDZST/index.ts

289 lines. Check platform/build reachability at the call site.

```text
5: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./67f4c8faf6b4ab2dd7c197bfa3f61fe8.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+FF17-FF20,U+FF3B-FF40,U+FF5B-FF5E,U+FFE0,U+FFE3;}
6: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./efb2d7238c4a66de9695973ade7a12ad.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+0,U+2C7,U+2C9,U+2014,U+2016,U+2018-2019,U+201C-201D,U+2026,U+2030,U+2032-2033,U+203B,U+20AC,U+2103,U+2116,U+2190-2193,U+2208,U+220F,U+2211,U+221A,U+221D-221E,U+2220,U+2225,U+2227-222B,U+222E,U+2234-2237,U+223D,U+2248,U+224C,U+2260-2261,U+2264-2265,U+226E-226F,U+2299,U+22A5,U+2312,U+2460-2469,U+2
7: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./123be3b8661d284fa88d5d306bb9f75a.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+9A6E-9A71,U+9A73-9A82,U+9A84-9A88,U+9A8A-9A8C,U+9A8F-9A93,U+9A96-9A98,U+9A9A-9AA5,U+9AA7,U+9AC5,U+9ACB-9ACC,U+9B13,U+9B47,U+9B49,U+9C7C,U+9C7F,U+9C81-9C82,U+9C85-9C88,U+9C8B,U+9C8D-9C8E,U+9C90-9C92,U+9C94-9C95,U+9C9A-9C9C,U+9C9E-9CA9,U+9CAB,U+9CAD-9CAE,U+9CB0-9CB8,U+9CBA-9CBD,U+9CC3-9CC7,U+9CCA-
8: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./e322f67781269eefaccefebaaaccea1e.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+951D-951F,U+9521-9526,U+9528-9532,U+9534-953C,U+953E-9542,U+9544-9547,U+9549-954A,U+954C-9554,U+9556-9559,U+955B-955F,U+9561-956D,U+956F-9573,U+9576,U+957F,U+95E8-95EB,U+95ED-95FE,U+9600-9606,U+9608-9612,U+9614-9617,U+9619-961A,U+961F,U+9633-9636,U+9645-9649,U+9655,U+9667-9669,U+968F-9690,U+96B6
9: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./b0e3a9a2b6d520b5f0ff9717db2b3a45.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+8DDE,U+8DF5,U+8DF7-8DF9,U+8DFB,U+8E0C,U+8E2A,U+8E2C,U+8E2F,U+8E51-8E52,U+8E70,U+8E7F,U+8E8F,U+8E9C,U+8EAF,U+8F66-8F69,U+8F6B-8F7F,U+8F81-8F8B,U+8F8D-8F91,U+8F93-8F9A,U+8F9E-8F9F,U+8FA9,U+8FAB,U+8FB9,U+8FBD-8FBE,U+8FC1,U+8FC7-8FC8,U+8FD0,U+8FD8-8FD9,U+8FDB-8FDF,U+8FE9,U+8FF3,U+8FF9,U+9002,U+9009-
10: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./12479607f6e9b15b28bf0e3803c0ef64.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+8721,U+8747-8749,U+874E,U+877C,U+877E,U+87A8,U+8845,U+8854,U+8865,U+886C,U+886E,U+8884-8885,U+889C,U+88AD,U+88C5-88C6,U+88E2-88E5,U+891B,U+8934,U+89C1-89C2,U+89C4-89CC,U+89CE-89D1,U+89DE,U+89E6,U+89EF,U+8A89-8A8A,U+8BA0-8BAB,U+8BAD-8BB0,U+8BB2-8BBA,U+8BBC-8BC6,U+8BC8-8BCF,U+8BD1-8BE9,U+8BEB-8C08
11: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./d18f7c939278c4a71414e7f5bfe4841c.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+7ED7-7EE3,U+7EE5-7EEB,U+7EED-7EF8,U+7EFA-7F09,U+7F0B-7F0F,U+7F11-7F1D,U+7F1F-7F35,U+7F42,U+7F51,U+7F57,U+7F5A,U+7F62,U+7F74,U+7F81,U+7F9F,U+7FA1,U+7FA4,U+7FD8,U+8022,U+8027,U+8038,U+803B,U+8042,U+804B-804D,U+8054,U+8069-806A,U+8083,U+80A0,U+80A4,U+80AE,U+80B4,U+80BE-80C1,U+80C6,U+80DC,U+80E7-80E
12: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./cdcdd891543498384e1a1f7e1360d294.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+709D,U+70B9,U+70BC-70BD,U+70C1-70C3,U+70DB,U+70DF,U+70E6-70E9,U+70EB-70ED,U+7115-7116,U+7118,U+718F,U+7231,U+7237,U+724D,U+7266,U+7275,U+727A,U+728A,U+72B6-72B9,U+72C8,U+72DE,U+72EC-72F2,U+7303,U+730E,U+7315,U+7321,U+732A-732C,U+732E,U+736D,U+7391,U+739B,U+73AE-73B0,U+73BA,U+73D0-73D1,U+73F2,U+7
13: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./b74bc3ad26697a7541af292e983ba1a6.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+6321-6325,U+635E-635F,U+6361-6363,U+636E,U+63B3-63B4,U+63B7-63B8,U+63BA,U+63BC,U+63FD,U+63FF-6402,U+6405,U+643A,U+6444-6448,U+644A,U+6484,U+6491,U+64B5,U+64B7-64B8,U+64BA,U+64DE,U+6512,U+654C,U+655B,U+6570,U+658B,U+6593,U+6597,U+65A9,U+65AD,U+65E0,U+65E7,U+65F6-65F7,U+6619,U+6635,U+663C,U+663E,U
14: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./3d5d40d65b4ca2da1ddd23a485e43be1.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+56FD-56FE,U+5706,U+5723,U+5739-573A,U+574F,U+5757,U+575A-5760,U+5784-5786,U+5792,U+57A6,U+57A9,U+57AB,U+57AD,U+57B2,U+57B4,U+57D8-57DA,U+5811,U+5815,U+5899,U+58EE,U+58F0,U+58F3,U+58F6,U+5904,U+5907,U+590D,U+591F,U+5934,U+5938-593A,U+5941-5942,U+594B,U+5956,U+5965,U+5986-5988,U+59A9-59AB,U+59D7,U
15: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./dedade291a6fdc93ef36f6d2290990ed.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+4E07,U+4E0E,U+4E11,U+4E13,U+4E1A-4E1D,U+4E22,U+4E24-4E25,U+4E27,U+4E2A,U+4E30,U+4E34,U+4E3A,U+4E3D-4E3E,U+4E48-4E49,U+4E4C,U+4E50,U+4E54,U+4E60-4E61,U+4E66,U+4E70-4E71,U+4E89,U+4E8E-4E8F,U+4E91,U+4E98,U+4E9A,U+4EA7,U+4EA9,U+4EB2,U+4EB5,U+4EBF,U+4EC5-4EC6,U+4ECE,U+4ED1,U+4ED3,U+4EEA,U+4EEC,U+4EF7
16: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./8e4d40b3900dad9fe223d1fb8871e586.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+9F19,U+9F20,U+9F22,U+9F2C,U+9F2F,U+9F37,U+9F3B,U+9F3D-9F3E,U+9F44,U+9FA0,U+FE31,U+FE33-FE44;}
17: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./b92062ca4a6ec67a521b3ef63b518bcb.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+9139,U+9143,U+9146,U+9149-9150,U+9152,U+9157,U+915A,U+915E,U+9161-9165,U+9169-916A,U+916C,U+916E-9170,U+9172,U+9174-9179,U+9185,U+9187,U+9189,U+918B-918D,U+9190-9192,U+919A-919B,U+91A2-91A3,U+91AA,U+91AD-91AF,U+91B4-91B5,U+91BA,U+91C9,U+91CD-91CF,U+91D1,U+91DC,U+928E,U+92C8,U+936A,U+938F,U+93CA,
18: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./b0e9d017ee57eb1524a47f5c10719eda.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+89D2,U+89D6,U+89DA,U+89DC,U+89E3,U+89E5,U+89EB,U+89F3,U+8A00,U+8A07,U+8A3E,U+8A48,U+8A79,U+8A93,U+8B07,U+8B26,U+8B66,U+8B6C,U+8C37,U+8C41,U+8C46-8C47,U+8C49,U+8C4C,U+8C55,U+8C5A,U+8C61-8C62,U+8C6A-8C6B,U+8C73,U+8C78-8C7A,U+8C82,U+8C85,U+8C89-8C8A,U+8C8C,U+8C94,U+8C98,U+8D64,U+8D66-8D67,U+8D6B,U+
19: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./1a2e73f048c7ebcbc740468c0e887d84.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+84EC,U+84F0,U+84FC,U+84FF,U+850C,U+8511,U+8513,U+8517,U+851A,U+851F,U+8521,U+852B-852C,U+8538,U+853B,U+853D,U+8543,U+8548-854A,U+8556,U+8559,U+855E,U+8564,U+8568,U+8579-857B,U+857E,U+8584-8585,U+8587,U+858F,U+859B-859C,U+85A4,U+85A8,U+85AA,U+85AF-85B0,U+85B7,U+85B9,U+85C1,U+85C9,U+85CF-85D0,U+85
20: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./116211d17ccec55fb37d5158d0cb5662.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+81AA,U+81B3,U+81BA,U+81C0-81C3,U+81C6,U+81CA,U+81CC,U+81E3,U+81E7,U+81EA,U+81EC-81ED,U+81F3-81F4,U+81FB-81FC,U+81FE,U+8200-8202,U+8204-8205,U+820C-820D,U+8210,U+8212,U+8214,U+821B-821C,U+821E-821F,U+8221-8222,U+8228,U+822A-822D,U+822F,U+8233-8239,U+823E,U+8244,U+8247,U+8249,U+824B,U+824F,U+8258,
21: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./9303e5db3bb54beb5875a8c0716857ba.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+7BDD,U+7BE1,U+7BE5-7BE6,U+7BEA,U+7BF7,U+7BFC,U+7BFE,U+7C07,U+7C0B-7C0C,U+7C0F,U+7C1F,U+7C26-7C27,U+7C2A,U+7C38,U+7C3F-7C40,U+7C4D,U+7C73,U+7C7D,U+7C89,U+7C91-7C92,U+7C95,U+7C97-7C98,U+7C9E-7C9F,U+7CA2,U+7CA5,U+7CB1-7CB3,U+7CB9,U+7CBC,U+7CBE,U+7CC5,U+7CC8,U+7CCA,U+7CCC,U+7CD5-7CD7,U+7CD9,U+7CDC,U
22: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./44801190ce94921d08ee99a7f98a6346.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+77B0,U+77B3,U+77B5,U+77BB,U+77BD,U+77BF,U+77CD,U+77D7,U+77DB-77DC,U+77E2-77E3,U+77E5,U+77E7,U+77E9,U+77EC-77EE,U+77F3,U+77F8,U+77FD,U+7802,U+7809,U+780C-780D,U+7811-7812,U+7814,U+7818,U+781D,U+781F,U+7823,U+7825-7827,U+7829,U+782C-782D,U+7830,U+7834,U+7837-7839,U+783C,U+7845,U+7847,U+784C,U+784E
23: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./0aa99c6a513e5f8be6f7fd3114cf5495.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+7403,U+7405-7406,U+7409-740A,U+741A-741B,U+7422,U+7425-7426,U+7428,U+742A,U+742C,U+742E,U+7430,U+7433-7436,U+7441,U+7455,U+7457,U+7459-745C,U+745E-745F,U+746D,U+7470,U+747E,U+7480-7481,U+7483,U+7487,U+748B,U+7490,U+749C,U+749E,U+74A7-74A9,U+74BA,U+74DC,U+74DE,U+74E0,U+74E2-74E4,U+74E6,U+74F4,U+7
24: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./5d796163c9881ef76b7db549c47bcaf6.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+6ED1,U+6ED3-6ED5,U+6EF4,U+6EF9,U+6F02,U+6F06,U+6F09,U+6F0F,U+6F13-6F15,U+6F20,U+6F24,U+6F29-6F2B,U+6F2D,U+6F2F,U+6F31,U+6F33,U+6F36,U+6F3E,U+6F58,U+6F5E,U+6F62,U+6F66,U+6F6D-6F6E,U+6F72,U+6F78,U+6F7A,U+6F7C,U+6F84,U+6F88-6F89,U+6F8C-6F8E,U+6FA1,U+6FA7,U+6FB3,U+6FB6,U+6FB9,U+6FC0,U+6FC2,U+6FC9,U+
25: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./0fc493e8a1aa7106f47f15b8a7483fad.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+6B84,U+6B86,U+6B89-6B8A,U+6B8D,U+6B96,U+6B9B,U+6BAA,U+6BB3,U+6BB5,U+6BB7,U+6BBF,U+6BC5,U+6BCB,U+6BCD,U+6BCF,U+6BD2-6BD4,U+6BD6-6BD7,U+6BDB,U+6BEA-6BEB,U+6BEF,U+6BF3,U+6BF9,U+6BFD,U+6C05-6C06,U+6C0D,U+6C0F-6C11,U+6C13,U+6C15-6C16,U+6C18-6C1B,U+6C1F,U+6C21,U+6C24,U+6C26-6C28,U+6C2A,U+6C2E-6C30,U+6
26: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./d258e6f43eb8d675e49eb99c40a3a2b3.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+66F0,U+66F2-66F4,U+66F7,U+66F9,U+66FC,U+66FE-6700,U+6708-670B,U+670D,U+6710,U+6714-6715,U+6717,U+671B,U+671D,U+671F,U+6726,U+6728,U+672A-672D,U+6731,U+6735,U+673D,U+6746,U+6748-6749,U+674C,U+674E-6751,U+6753,U+6756,U+675C,U+675E-675F,U+676A,U+676D,U+676F,U+6772-6773,U+6775,U+6777,U+677C,U+677E-6
27: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./861cea6ad6adae15dddf8985e28dc4b9.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+632B,U+632F,U+6332,U+6339-633A,U+633D,U+6342-6343,U+6345-6346,U+6349,U+634B-6350,U+6355,U+6367,U+6369,U+636D,U+6371,U+6376-6377,U+637A-637B,U+6380,U+6382,U+6387-638A,U+638C,U+638E-6390,U+6392,U+6396,U+6398,U+63A0,U+63A2-63A3,U+63A5,U+63A7-63AA,U+63AC-63AE,U+63B0,U+63BE,U+63C4,U+63C6,U+63C9,U+63C
28: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./3cae6d282188991b574074304ad208e9.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+5FCC-5FCD,U+5FD0-5FD2,U+5FD6-5FD9,U+5FDD,U+5FE0-5FE1,U+5FE4,U+5FEA-5FEB,U+5FED-5FEE,U+5FF1,U+5FF5,U+5FF8,U+5FFB,U+5FFD,U+5FFF,U+600A,U+600D-600F,U+6012,U+6014-6016,U+6019,U+601B,U+601D,U+6020-6021,U+6025-602B,U+602F,U+6035,U+6041-6043,U+604D,U+6050,U+6055,U+6059-605A,U+605D,U+6062-6064,U+6067-60
29: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./ec06916baca7360a53e16d11d522764b.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+5BC4-5BC7,U+5BCC,U+5BD0,U+5BD2-5BD3,U+5BDE-5BDF,U+5BE1,U+5BE4-5BE5,U+5BE8,U+5BEE,U+5BF0,U+5BF8,U+5BFA,U+5C01,U+5C04,U+5C09-5C0A,U+5C0F,U+5C11,U+5C15-5C16,U+5C1A,U+5C1C,U+5C22,U+5C24-5C25,U+5C2C,U+5C31,U+5C39-5C3C,U+5C3E-5C41,U+5C45,U+5C48,U+5C4B,U+5C4E-5C51,U+5C55,U+5C59,U+5C60,U+5C63,U+5C65,U+5
30: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./bec2950b59aa2c8301ff3bdb000c804b.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+57A1-57A4,U+57A7,U+57AE,U+57B8,U+57C2-57C3,U+57CB,U+57CE-57CF,U+57D2,U+57D4-57D5,U+57DD,U+57DF-57E0,U+57E4,U+57ED,U+57EF,U+57F4,U+57F8-57FA,U+57FD,U+5800,U+5802,U+5806-5807,U+580B,U+580D,U+5819,U+581E,U+5820-5821,U+5824,U+582A,U+5830,U+5835,U+5844,U+584C-584D,U+5851,U+5854,U+5858,U+585E,U+5865,U
31: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./d54f8a6b15be45b128b52f620b358529.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+5478,U+547B-547D,U+5480,U+5482,U+5484,U+5486,U+548B-548C,U+548E,U+5490,U+5492,U+5494-5496,U+549A,U+54A3,U+54A6-54A7,U+54A9-54AD,U+54AF,U+54B1,U+54B3-54B4,U+54BB,U+54BD,U+54BF-54C2,U+54C4,U+54C6-54C9,U+54CC,U+54CE-54D0,U+54DA,U+54DE,U+54E5-54EA,U+54ED-54EE,U+54F2-54F3,U+54FA,U+54FC-54FD,U+54FF,U+
32: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./a134063c16dd9ebe5e2ef8495a2f61d5.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+5121,U+5140-5141,U+5143-5146,U+5148-5149,U+514B,U+514D,U+5154-5155,U+515C,U+5162,U+5165,U+5168,U+516B-516E,U+5171,U+5175-5178,U+517C,U+5180,U+5182,U+5189,U+518D,U+5192,U+5195-5197,U+51A0,U+51A2,U+51A4-51A5,U+51AB-51AC,U+51B0-51B1,U+51B6-51B7,U+51BC-51BD,U+51C7,U+51CB-51CC,U+51DD,U+51E1,U+51F0,U+
33: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./03616aa478f384c4b3070a173de5686d.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+3001-3002,U+3008-3011,U+3014-3017,U+4E00-4E01,U+4E03,U+4E08-4E0D,U+4E10,U+4E14-4E16,U+4E18-4E19,U+4E1E,U+4E28,U+4E2B-4E2D,U+4E32,U+4E36,U+4E38-4E39,U+4E3B,U+4E3F,U+4E43,U+4E45,U+4E47,U+4E4B,U+4E4D-4E4F,U+4E52-4E53,U+4E56,U+4E58-4E59,U+4E5C-4E5F,U+4E69,U+4E73,U+4E7E,U+4E86,U+4E88,U+4E8B-4E8D,U+4E
34: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./bb67e7147f26393fbab4a6e0b1485832.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+391-3A1,U+3A3-3A9,U+3B1-3C1,U+3C3-3C9;}
35: @font-face {font-family:"YRDZST-Regular";src:local("YRDZST-Regular"),url("./43811864ed301258a1bfd268fa7a9201.woff2") format("woff2");font-style: normal;font-display: swap;font-weight: 400;unicode-range:U+1D,U+20-7E,U+A4-A5,U+A7-A8,U+B0-B1,U+B7,U+D7,U+E0-E1,U+E8-EA,U+EC-ED,U+F2-F3,U+F7,U+F9-FA,U+FC,U+101,U+113,U+11B,U+12B,U+144,U+148,U+14D,U+16B,U+1CE,U+1D0,U+1D2,U+1D4,U+1D6,U+1D8,U+1DA,U+1DC,U+251,U+261,U+2160-216B,U+2170-2179,U+FF21-FF3A,U+FF41-FF5A;}
```

## editor/packages/excalidraw/fonts/fonts.css

35 lines. Check platform/build reachability at the call site.

```text
6: font-family: "Assistant";
8: font-weight: 400;
14: font-family: "Assistant";
16: font-weight: 500;
22: font-family: "Assistant";
24: font-weight: 600;
30: font-family: "Assistant";
32: font-weight: 700;
```

## editor/packages/excalidraw/global.d.ts

311 lines. Check platform/build reachability at the call site.

```text
23: width: number;
24: height: number;
57: color: string;
159: width: number;
160: height: number;
201: width: number;
202: height: number;
216: width: number,
217: height: number,
```

## editor/packages/excalidraw/hooks/useAppStateValue.ts

172 lines. Check platform/build reachability at the call site.

```text
46: { width: 0, height: 0, offsetLeft: 0, offsetTop: 0 },
```

## editor/packages/excalidraw/index-node.ts

84 lines. Check platform/build reachability at the call site.

```text
14: width: 113,
15: height: 115,
17: backgroundColor: "transparent",
21: opacity: 100,
29: width: 49,
30: height: 44,
32: backgroundColor: "transparent",
36: opacity: 100,
44: width: 43,
45: height: 31,
47: backgroundColor: "transparent",
51: opacity: 100,
68: width: 0,
69: height: 0,
```

## editor/packages/excalidraw/index.tsx

554 lines. Check platform/build reachability at the call site.

```text
341: !!prevUI.enabled?.scrollBackToContent ===
342: !!nextUI.enabled?.scrollBackToContent);
```

## editor/packages/excalidraw/lasso/index.ts

198 lines. Check platform/build reachability at the call site.

```text
157: scrollX: this.app.state.scrollX,
158: scrollY: this.app.state.scrollY,
```

## editor/packages/excalidraw/renderer/animation.ts

166 lines. Check platform/build reachability at the call site.

```text
9: animation: Animation<any>;
21: static start<R extends object>(key: string, animation: Animation<R>) {
122: const state = animation.animation({
```

## editor/packages/excalidraw/renderer/helpers.ts

116 lines. Check platform/build reachability at the call site.

```text
20: context.stroke();
92: width: number,
93: height: number,
110: context.stroke();
```

## editor/packages/excalidraw/renderer/interactiveScene.ts

2125 lines. Check platform/build reachability at the call site.

```text
164: context.translate(appState.scrollX, appState.scrollY);
168: fillCircle(
232: fillCircle(
299: context.stroke();
344: context.stroke();
363: context.stroke();
382: context.stroke();
404: context.stroke();
423: context.stroke();
642: context.stroke();
654: const cx = center[0] + appState.scrollX;
655: const cy = center[1] + appState.scrollY;
662: element.x + appState.scrollX - offset,
663: element.y + appState.scrollY - offset,
687: context.stroke();
707: context.stroke();
726: context.stroke();
749: context.stroke();
768: context.stroke();
791: element.x + appState.scrollX,
792: element.y + appState.scrollY,
812: context.stroke();
840: element.x + appState.scrollX,
841: element.y + appState.scrollY,
942: context.translate(appState.scrollX, appState.scrollY);
998: elementProperties.padding ?? DEFAULT_TRANSFORM_HANDLE_SPACING * 2;
1005: context.translate(appState.scrollX, appState.scrollY);
1046: context.translate(appState.scrollX, appState.scrollY);
1120: context.translate(appState.scrollX, appState.scrollY);
1242: context.translate(appState.scrollX, appState.scrollY);
1251: context.stroke();
1264: context.translate(appState.scrollX, appState.scrollY);
1272: fillCircle(
1393: fillCircle(context, x + width / 2, y + height / 2, width / 2, true);
1399: context.stroke();
1511: context.stroke();
1516: context.stroke();
1537: context.translate(cx + appState.scrollX, cy + appState.scrollY);
1571: autoResizeHandle.start[0] + appState.scrollX,
1572: autoResizeHandle.start[1] + appState.scrollY,
1575: autoResizeHandle.end[0] + appState.scrollX,
1576: autoResizeHandle.end[1] + appState.scrollY,
1578: context.stroke();
1889: padding:
1932: context.translate(appState.scrollX, appState.scrollY);
2049: context.translate(appState.scrollX, appState.scrollY);
```

## editor/packages/excalidraw/renderer/renderSnaps.ts

209 lines. Check platform/build reachability at the call site.

```text
34: context.translate(appState.scrollX, appState.scrollY);
108: context.stroke();
120: context.stroke();
```

## editor/packages/excalidraw/renderer/roundRect.ts

41 lines. Check platform/build reachability at the call site.

```text
15: width: number,
16: height: number,
40: context.stroke();
```

## editor/packages/excalidraw/renderer/staticScene.ts

508 lines. Check platform/build reachability at the call site.

```text
67: width: number,
68: height: number,
107: context.stroke();
128: context.stroke();
139: context.translate(frame.x + appState.scrollX, frame.y + appState.scrollY);
154: -(frame.x + appState.scrollX),
155: -(frame.y + appState.scrollY),
185: context.translate(appState.scrollX + centerX, appState.scrollY + centerY);
231: context.globalAlpha = element.opacity / 100;
276: appState.scrollX,
277: appState.scrollY,
```

## editor/packages/excalidraw/renderer/staticSvgScene.ts

837 lines. Check platform/build reachability at the call site.

```text
138: ((getContainingFrame(element, elementsMap)?.opacity ?? 100) *
139: element.opacity) /
223: const opacity = element.opacity / 100;
492: ({ width: uncroppedWidth, height: uncroppedHeight } =
533: const { width: uncroppedWidth, height: uncroppedHeight } =
```

## editor/packages/excalidraw/scene/Renderer.ts

262 lines. Check platform/build reachability at the call site.

```text
31: height: AppState["height"];
32: width: AppState["width"];
63: height: AppState["height"];
64: width: AppState["width"];
222: scrollX: opts.scrollX,
223: scrollY: opts.scrollY,
224: height: opts.height,
225: width: opts.width,
```

## editor/packages/excalidraw/scene/export.ts

587 lines. Check platform/build reachability at the call site.

```text
74: ctx.font = getFontString({
96: return newElementWith(element, { text, width: maxWidth });
144: outline: exportingFrame ? false : frameRendering.outline,
196: width: number,
197: height: number,
```

## editor/packages/excalidraw/scene/scrollbars.ts

155 lines. Check platform/build reachability at the call site.

```text
45: const viewportMinX = -appState.scrollX + safeArea.left;
46: const viewportMinY = -appState.scrollY + safeArea.top;
106: width: scrollbarWidth,
107: height: SCROLLBAR_WIDTH,
125: width: SCROLLBAR_WIDTH,
126: height: scrollbarHeight,
```

## editor/packages/excalidraw/scene/types.ts

177 lines. Check platform/build reachability at the call site.

```text
141: width: number;
142: height: number;
148: width: number;
149: height: number;
```

## editor/packages/excalidraw/snapping.ts

1414 lines. Check platform/build reachability at the call site.

```text
92: gap: Gap;
752: x: nearestSnapsX[0]?.offset ?? 0,
753: y: nearestSnapsY[0]?.offset ?? 0,
1206: x: nearestSnapsX[0]?.offset ?? 0,
1207: y: nearestSnapsY[0]?.offset ?? 0,
1286: x: nearestSnapsX[0]?.offset ?? 0,
1287: y: nearestSnapsY[0]?.offset ?? 0,
1409: activeToolType === TOOL_TYPE.frame ||
```

## editor/packages/excalidraw/tests/App.test.tsx

46 lines. Test source; not runtime UI.

```text
33: width: 0,
```

## editor/packages/excalidraw/tests/MermaidToExcalidraw.test.tsx

145 lines. Test source; not runtime UI.

```text
30: width: 69.703125,
31: height: 44,
46: width: 64.28125,
47: height: 44,
```

## editor/packages/excalidraw/tests/actionStyles.test.tsx

88 lines. Test source; not runtime UI.

```text
86: expect(firstRect.opacity).toBe(60);
```

## editor/packages/excalidraw/tests/appStateHooks.test.tsx

111 lines. Test source; not runtime UI.

```text
16: width: 0,
17: height: 0,
```

## editor/packages/excalidraw/tests/arrowBinding.test.tsx

653 lines. Test source; not runtime UI.

```text
140: width: 400,
141: height: 200,
169: width: 400,
170: height: 200,
200: width: 300,
201: height: 200,
231: width: 400,
232: height: 200,
260: width: 200,
261: height: 120,
339: width: 400,
340: height: 200,
346: width: 502,
347: height: -48,
385: width: 200,
386: height: 200,
429: width: 200,
430: height: 200,
471: width: 240,
472: height: 120,
```

## editor/packages/excalidraw/tests/arrowEndpointTextBinding.test.tsx

860 lines. Test source; not runtime UI.

```text
40: width: Math.abs(endX - startX),
41: height: Math.abs(endY - startY),
161: width: 300,
162: height: 180,
283: width: 100,
284: height: 100,
558: width: 300,
559: height: 50,
618: width: 120,
619: height: 120,
620: backgroundColor: "#ffc9c9",
660: coveringRect({ backgroundColor: "transparent" }),
677: UI.createElement("arrow", { x: 100, y: 300, width: 0, height: -200 });
705: UI.createElement("arrow", { x: 100, y: 300, width: 0, height: -200 });
749: width: 80,
750: height: 80,
752: backgroundColor: "transparent",
761: width: 50,
762: height: 25,
819: width: 50,
820: height: 50,
```

## editor/packages/excalidraw/tests/bucketFill.test.tsx

839 lines. Test source; not runtime UI.

```text
58: width: 120,
59: height: 100,
61: backgroundColor: "transparent",
421: width: 100,
422: height: 80,
424: backgroundColor: "transparent",
430: width: 100,
431: height: 80,
433: backgroundColor: "transparent",
488: expect(fill!.opacity).toBe(60);
571: width: 100,
572: height: 100,
574: backgroundColor: "transparent",
580: width: 100,
581: height: 100,
583: backgroundColor: "transparent",
615: width: 100,
616: height: 100,
618: backgroundColor: "#ff0000",
624: width: 100,
625: height: 100,
627: backgroundColor: "transparent",
```

## editor/packages/excalidraw/tests/clipboard.test.tsx

647 lines. Test source; not runtime UI.

```text
222: width: 166,
223: height: 187.01953125,
232: width: 154,
233: height: 175,
288: width: 100,
289: height: 100,
318: width: 100,
319: height: 100,
328: width: 20,
329: height: 20,
362: width: 100,
363: height: 100,
371: width: 20,
372: height: 20,
396: width: 100,
397: height: 100,
406: width: 50,
407: height: 50,
431: width: 100,
432: height: 100,
438: width: 50,
439: height: 50,
443: width: 50,
444: height: 50,
473: width: 100,
474: height: 100,
480: width: 50,
481: height: 50,
486: width: 50,
487: height: 50,
517: width: 100,
518: height: 100,
524: width: 50,
525: height: 50,
531: width: 75,
532: height: 75,
538: width: 50,
539: height: 50,
584: width: 69.703125,
585: height: 44,
```

## editor/packages/excalidraw/tests/colorInput.test.tsx

386 lines. Test source; not runtime UI.

```text
306: fireEvent.blur(colorInput);
```

## editor/packages/excalidraw/tests/colorPickerHotkeys.test.ts

82 lines. Test source; not runtime UI.

```text
10: onChange: (color: string) => void,
23: color: null,
```

## editor/packages/excalidraw/tests/contextmenu.test.tsx

628 lines. Test source; not runtime UI.

```text
156: height: 200,
157: width: 200,
158: backgroundColor: "red",
164: height: 200,
165: width: 200,
166: backgroundColor: "red",
384: expect(firstRect.opacity).toBe(60);
607: width: 100,
608: backgroundColor: "red",
614: width: 100,
615: backgroundColor: "red",
```

## editor/packages/excalidraw/tests/cursorHint.test.tsx

215 lines. Test source; not runtime UI.

```text
199: width: 1920,
200: height: 1080,
```

## editor/packages/excalidraw/tests/data/restore.test.ts

1303 lines. Test source; not runtime UI.

```text
132: textElement.font = "10 unknown";
464: width: 100,
465: height: 200,
488: width: 100,
489: height: 200,
493: width: 100,
494: height: 200,
579: width: 100,
580: height: 200,
586: width: 200,
587: height: 400,
643: opacity: 10,
647: backgroundColor: "blue",
648: width: 100,
649: height: 200,
718: width: 500,
721: width: 600,
1195: width: 0,
1196: height: 0,
```

## editor/packages/excalidraw/tests/drawShape.test.tsx

858 lines. Test source; not runtime UI.

```text
38: width: number,
39: height: number,
156: width: 100,
157: height: 100,
163: width: 100,
164: height: 100,
193: width: 100,
194: height: 100,
200: width: 100,
201: height: 100,
221: width: 100,
222: height: 100,
228: width: 100,
229: height: 100,
255: width: 500,
256: height: 500,
277: width: 500,
278: height: 500,
295: width: 100,
296: height: 100,
318: width: 100,
319: height: 100,
432: width: 100,
433: height: 100,
439: width: 100,
440: height: 100,
489: expect(predicates.opacity).toBe(false);
624: width: 200,
625: height: 100,
626: backgroundColor: "transparent",
654: width: 200,
655: height: 100,
663: width: 20,
664: height: 10,
684: width: 200,
685: height: 100,
702: width: 200,
703: height: 100,
```

## editor/packages/excalidraw/tests/elementLocking.test.tsx

390 lines. Test source; not runtime UI.

```text
27: width: 100,
28: backgroundColor: "red",
42: width: 100,
43: backgroundColor: "red",
61: width: 100,
62: backgroundColor: "red",
78: width: 100,
79: backgroundColor: "red",
84: width: 100,
85: backgroundColor: "red",
121: width: 100,
122: backgroundColor: "red",
127: width: 100,
128: backgroundColor: "red",
143: width: 100,
144: backgroundColor: "red",
149: width: 100,
150: backgroundColor: "red",
173: width: 100,
174: backgroundColor: "red",
179: width: 100,
180: backgroundColor: "red",
200: width: 100,
201: backgroundColor: "red",
207: width: 100,
208: backgroundColor: "red",
228: width: 100,
236: width: textSize,
237: height: textSize,
254: width: 100,
255: height: 100,
274: width: 100,
275: height: 100,
291: width: 100,
299: width: textSize,
300: height: textSize,
330: width: 100,
339: width: textSize,
340: height: textSize,
362: width: 100,
371: width: textSize,
372: height: textSize,
```

## editor/packages/excalidraw/tests/excalidraw.test.tsx

501 lines. Test source; not runtime UI.

```text
254: style={{ height: "2rem" }}
419: style={{ height: "2rem" }}
```

## editor/packages/excalidraw/tests/export.test.tsx

221 lines. Test source; not runtime UI.

```text
32: width: 16,
33: height: 16,
162: width: 100,
163: height: 100,
172: width: 50,
173: height: 50,
182: width: 100,
183: height: 100,
192: width: 50,
193: height: 50,
```

## editor/packages/excalidraw/tests/eyeDropper.test.tsx

168 lines. Test source; not runtime UI.

```text
41: width: 400,
42: height: 300,
98: color: "#121212",
```

## editor/packages/excalidraw/tests/fitToContent.test.tsx

369 lines. Test source; not runtime UI.

```text
73: width: 50,
74: height: 100,
86: animation: false,
99: width: 20,
100: height: 20,
106: width: 20,
107: height: 20,
122: animation: false,
138: width: 50,
139: height: 100,
153: animation: false,
169: width: 100,
170: height: 100,
177: expect(h.state.scrollX).toBe(0);
178: expect(h.state.scrollY).toBe(0);
184: animation: false,
191: expect(h.state.scrollX).not.toBe(0);
192: expect(h.state.scrollY).not.toBe(0);
204: width: 50,
205: height: 50,
219: animation: false,
227: expect(h.state.scrollX).toBeCloseTo(100 / 2 / 0.5 - 1025);
228: expect(h.state.scrollY).toBeCloseTo(100 / 2 / 0.5 - 1025);
253: width: 100,
254: height: 100,
264: animation: { duration: LONG_ANIMATION_DURATION },
269: expect(h.state.scrollX).toBe(0);
270: expect(h.state.scrollY).toBe(0);
275: const prevScrollX = h.state.scrollX;
276: const prevScrollY = h.state.scrollY;
278: expect(h.state.scrollX).not.toBe(0);
279: expect(h.state.scrollY).not.toBe(0);
283: expect(h.state.scrollX).not.toBe(prevScrollX);
284: expect(h.state.scrollY).not.toBe(prevScrollY);
294: width: 100,
295: height: 100,
301: expect(h.state.scrollX).toBe(0);
302: expect(h.state.scrollY).toBe(0);
308: animation: { duration: LONG_ANIMATION_DURATION },
314: const prevScrollX = h.state.scrollX;
315: const prevScrollY = h.state.scrollY;
317: expect(h.state.scrollX).not.toBe(0);
318: expect(h.state.scrollY).not.toBe(0);
322: expect(h.state.scrollX).not.toBe(prevScrollX);
323: expect(h.state.scrollY).not.toBe(prevScrollY);
333: width: 100,
334: height: 100,
345: animation: { duration: 10 },
358: const settledScrollX = h.state.scrollX;
359: const settledScrollY = h.state.scrollY;
366: expect(h.state.scrollX).toBe(settledScrollX);
367: expect(h.state.scrollY).toBe(settledScrollY);
```

## editor/packages/excalidraw/tests/fixtures/constants.ts

9 lines. Test source; not runtime UI.

```text
2: width: 318,
3: height: 335,
7: width: 56,
8: height: 77,
```

## editor/packages/excalidraw/tests/fixtures/elementFixture.ts

70 lines. Test source; not runtime UI.

```text
11: width: 214,
12: height: 214,
15: backgroundColor: "#15aabf",
20: opacity: 100,
```

## editor/packages/excalidraw/tests/flip.test.tsx

920 lines. Test source; not runtime UI.

```text
80: width: 100,
81: height: 50,
90: width: 100,
91: height: 50,
100: width: 100,
101: height: 50,
110: width: 100,
111: height: 50,
120: width: 100,
121: height: 50,
130: width: 50,
131: height: 100,
144: width: 1750.4888916015625,
145: height: 410.51605224609375,
148: backgroundColor: "#fa5252",
153: opacity: 100,
175: width: 591.2804897585779,
176: height: 69.32871961377737,
179: backgroundColor: "transparent",
184: opacity: 100,
865: width: 180,
866: height: 80,
877: width: 100,
878: height: 100,
```

## editor/packages/excalidraw/tests/helpers/api.ts

568 lines. Test source; not runtime UI.

```text
274: backgroundColor:
293: opacity: rest.opacity ?? appState.currentItemOpacity,
440: width: 50,
441: height: 20,
478: width: 50,
479: height: 20,
```

## editor/packages/excalidraw/tests/helpers/ui.ts

692 lines. Test source; not runtime UI.

```text
491: width: initialWidth = size,
492: height: initialHeight = initialWidth,
581: editor.blur();
597: input.blur();
637: keepAspectRatio ? element.width / element.height : undefined,
```

## editor/packages/excalidraw/tests/history.test.tsx

5310 lines. Test source; not runtime UI.

```text
351: expect.objectContaining({ id: rect.id, backgroundColor: blue }),
359: expect.objectContaining({ id: rect.id, backgroundColor: red }),
367: expect.objectContaining({ id: rect.id, backgroundColor: transparent }),
375: expect.objectContaining({ id: rect.id, backgroundColor: transparent }),
383: expect.objectContaining({ id: rect.id, backgroundColor: red }),
391: expect.objectContaining({ id: rect.id, backgroundColor: blue }),
399: expect.objectContaining({ id: rect.id, backgroundColor: red }),
407: expect.objectContaining({ id: rect.id, backgroundColor: transparent }),
415: expect.objectContaining({ id: rect.id, backgroundColor: transparent }),
1537: height: 100,
1538: width: 100,
1545: height: 100,
1546: width: 100,
2136: expect.objectContaining({ backgroundColor: red }),
2153: expect.objectContaining({ backgroundColor: transparent }),
2159: expect.objectContaining({ backgroundColor: red }),
2167: expect.objectContaining({ backgroundColor: transparent }),
2192: backgroundColor: transparent,
2200: backgroundColor: red,
2219: expect.objectContaining({ backgroundColor: red }),
2224: expect.objectContaining({ backgroundColor: blue }),
2231: backgroundColor: yellow,
2240: expect.objectContaining({ backgroundColor: red }),
2247: backgroundColor: violet,
2256: expect.objectContaining({ backgroundColor: yellow }),
2261: expect.objectContaining({ backgroundColor: violet }),
2266: expect.objectContaining({ backgroundColor: transparent }),
2276: width: 157,
2277: height: 126,
2284: width: 124,
2285: height: 129,
2323: width: 178.9000000000001,
2324: height: 236.10000000000002,
2516: backgroundColor: transparent,
2525: backgroundColor: yellow,
2535: backgroundColor: yellow,
2548: backgroundColor: yellow,
2559: backgroundColor: yellow,
2570: backgroundColor: yellow,
2581: backgroundColor: yellow,
2595: expect.objectContaining({ backgroundColor: red }),
2602: backgroundColor: yellow,
2611: backgroundColor: yellow,
2623: backgroundColor: transparent,
2635: backgroundColor: yellow, // the color still get's updated
2685: backgroundColor: transparent,
2707: backgroundColor: red,
3307: const props1 = { x: 10, y: 10, width: 10, height: 10 };
3340: width: 90,
3341: height: 90,
3388: width: 90,
3389: height: 90,
3570: width: 100,
3817: width: 50,
4549: height: 100,
4550: width: 100,
4557: height: 100,
4558: width: 100,
4807: width: 50,
5208: width: 500,
5213: width: 100,
```

## editor/packages/excalidraw/tests/image.test.tsx

176 lines. Test source; not runtime UI.

```text
25: sizes: { width: number; height: number }[],
```

## editor/packages/excalidraw/tests/interactivity.test.tsx

1648 lines. Test source; not runtime UI.

```text
73: elements: [API.createElement({ type: "rectangle", width: 10, height: 10 })],
114: expect([h.state.scrollX, h.state.scrollY]).not.toEqual([scrollX, scrollY]);
148: width: 50,
149: height: 50,
189: expect(h.state.scrollX).toBe(scrollX);
190: expect(h.state.scrollY).toBe(scrollY);
213: expect(h.state.scrollY).toBe(scrollY);
225: expect(h.state.scrollX).toBe(scrollX);
226: expect(h.state.scrollY).toBe(scrollY);
258: animation: false,
273: width: 30,
274: height: 30,
517: width: 80,
518: height: 50,
525: const input = queryContainer(".frame-name input");
541: expect(queryContainer(".frame-name input")).toBe(null);
614: width: 50,
615: height: 50,
639: expect(queryContainer(".help-icon")).toBe(null);
693: width: 50,
694: height: 50,
701: await waitFor(() => expect(h.state.scrolledOutside).toBe(true));
712: expect(queryContainer(".help-icon")).toBe(null);
736: await waitFor(() => expect(h.state.scrolledOutside).toBe(false));
824: width: 50,
825: height: 50,
862: expect(h.state.scrollX).toBe(scrollX);
863: expect(h.state.scrollY).toBe(scrollY);
869: expect(h.state.scrollX).toBe(scrollX);
870: expect(h.state.scrollY).toBe(scrollY);
904: width: 120,
905: height: 90,
1073: width: 50,
1074: height: 50,
1094: expect([h.state.scrollX, h.state.scrollY]).not.toEqual([scrollX, scrollY]);
1113: expect([h.state.scrollX, h.state.scrollY]).not.toEqual([scrollX, scrollY]);
1120: expect(h.state.scrollY).toBeLessThan(scrollY);
1123: expect(h.state.scrollY).toBe(scrollY);
1132: expect(h.state.scrollX).toBeLessThan(scrollX);
1133: expect(h.state.scrollY).toBe(scrollY);
1151: expect([h.state.scrollX, h.state.scrollY]).not.toEqual([scrollX, scrollY]);
1188: width: 120,
1189: height: 90,
1241: width: 120,
1242: height: 90,
1346: width: 50,
1347: height: 50,
1409: expect([h.state.scrollX, h.state.scrollY]).toEqual([scrollX, scrollY]);
1607: expect([h.state.scrollX, h.state.scrollY]).toEqual([scrollX, scrollY]);
1629: expect([h.state.scrollX, h.state.scrollY]).toEqual([scrollX, scrollY]);
```

## editor/packages/excalidraw/tests/laser.test.tsx

286 lines. Test source; not runtime UI.

```text
33: width: 120,
34: height: 90,
72: width: 300,
73: height: 180,
117: width: 300,
118: height: 180,
124: width: 300,
125: height: 180,
126: backgroundColor: "#ff0000",
163: const initialScrollX = h.state.scrollX;
164: const initialScrollY = h.state.scrollY;
170: expect(h.state.scrollX).toBe(initialScrollX);
171: expect(h.state.scrollY).toBe(initialScrollY);
218: width: 100,
219: height: 180,
225: width: 300,
226: height: 180,
```

## editor/packages/excalidraw/tests/lasso.test.tsx

2219 lines. Test source; not runtime UI.

```text
98: width: 107.11328125,
99: height: 90.16015625,
102: backgroundColor: "transparent",
107: opacity: 100,
128: width: 123.3828125,
129: height: 74.66796875,
132: backgroundColor: "transparent",
137: opacity: 100,
158: width: 146.8984375,
159: height: 91.01171875,
162: backgroundColor: "transparent",
167: opacity: 100,
188: width: 168.4765625,
189: height: 153.38671875,
192: backgroundColor: "transparent",
197: opacity: 100,
227: width: 206.12890625,
228: height: 35.4140625,
231: backgroundColor: "transparent",
236: opacity: 100,
265: width: 537.55078125,
266: height: 288.48046875,
269: backgroundColor: "transparent",
274: opacity: 100,
933: width: 146.8359375,
934: height: 104.921875,
937: backgroundColor: "transparent",
942: opacity: 100,
963: width: 102.55859375,
964: height: 93.80078125,
967: backgroundColor: "transparent",
972: opacity: 100,
993: width: 116.13671875,
994: height: 70.7734375,
997: backgroundColor: "transparent",
1002: opacity: 100,
1023: width: 451.04296875,
1024: height: 397.09765625,
1027: backgroundColor: "transparent",
1032: opacity: 100,
1214: opacity: 100,
1219: backgroundColor: "#846358",
1220: width: 66.16406551308279,
1221: height: 78.24124358133415,
1255: opacity: 100,
1260: backgroundColor: "#2f9e44",
1261: width: 369.2312846526558,
1262: height: 192.4489303545334,
1295: opacity: 100,
1300: backgroundColor: "#2f9e44",
1301: width: 290.9653230160535,
1302: height: 173.62827429793325,
1335: opacity: 100,
1340: backgroundColor: "#2f9e44",
1341: width: 194.196753378859,
1342: height: 137.02921662223056,
1375: opacity: 100,
1380: backgroundColor: "#c2255c",
1381: width: 25.723148574685204,
1382: height: 25.723148574685204,
1405: opacity: 100,
1410: backgroundColor: "#f08c00",
1411: width: 25.723148574685204,
1412: height: 25.723148574685204,
1435: opacity: 100,
1440: backgroundColor: "#6741d9",
1441: width: 25.723148574685204,
1442: height: 25.723148574685204,
1465: opacity: 100,
1470: backgroundColor: "#e8590c",
1471: width: 25.723148574685204,
1472: height: 25.723148574685204,
1495: opacity: 100,
1500: backgroundColor: "#228be6",
1501: width: 25.723148574685204,
1502: height: 25.723148574685204,
1525: opacity: 100,
1530: backgroundColor: "#ffd43b",
1531: width: 25.723148574685204,
1532: height: 25.723148574685204,
1555: opacity: 100,
1560: backgroundColor: "#38d9a9",
1561: width: 25.723148574685204,
1562: height: 25.723148574685204,
1585: opacity: 100,
1590: backgroundColor: "#fa5252",
1591: width: 25.723148574685204,
1592: height: 25.723148574685204,
1615: opacity: 100,
1620: backgroundColor: "#9775fa",
1621: width: 25.723148574685204,
1622: height: 25.723148574685204,
1645: opacity: 100,
1650: backgroundColor: "#fab005",
1651: width: 25.723148574685204,
1652: height: 25.723148574685204,
1675: opacity: 100,
1680: backgroundColor: "#fab005",
1681: width: 84.29101925982515,
1682: height: 84.66090652809709,
1726: opacity: 100,
1731: backgroundColor: "#ffd43b",
1732: width: 61.28316986803382,
1733: height: 61.55209370467244,
1817: width: 50,
1818: height: 50,
1826: width: 50,
1827: height: 50,
1893: width: 50,
1894: height: 50,
1901: width: 50,
1902: height: 50,
1933: width: 50,
1934: height: 50,
1977: width: 200,
1978: height: 100,
1986: width: 80,
1987: height: 25,
2038: width: 50,
2039: height: 50,
2047: width: 50,
2048: height: 50,
2098: width: 200,
2099: height: 200,
2108: width: 100,
2109: height: 50,
2142: width: 0,
2143: height: 0,
2174: width: 50,
2175: height: 50,
```

## editor/packages/excalidraw/tests/library.test.tsx

383 lines. Test source; not runtime UI.

```text
294: width: 100,
295: height: 100,
302: width: 100,
303: height: 80,
310: width: 40,
311: height: 50,
318: width: 50,
319: height: 50,
326: width: 70,
327: height: 100,
```

## editor/packages/excalidraw/tests/multiPointCreate.test.tsx

227 lines. Test source; not runtime UI.

```text
40: mockBoundingClientRect({ width: 1000, height: 1000 });
```

## editor/packages/excalidraw/tests/regressionTests.test.tsx

1200 lines. Test source; not runtime UI.

```text
69: API.setAppState({ height: 768, width: MQ_MIN_WIDTH_DESKTOP });
294: const startScrollY = h.state.scrollY;
307: expect(h.state.scrollY).toBeLessThan(startScrollY);
311: const startScrollX = h.state.scrollX;
325: expect(h.state.scrollX).toBeGreaterThan(startScrollX);
759: backgroundColor: "red",
762: width: 1000,
763: height: 1000,
767: backgroundColor: "red",
770: width: 500,
771: height: 500,
795: backgroundColor: "red",
798: width: 1000,
799: height: 1000,
803: backgroundColor: "red",
806: width: 500,
807: height: 500,
```

## editor/packages/excalidraw/tests/rotate.test.tsx

85 lines. Test source; not runtime UI.

```text
21: width: 200,
22: height: 100,
27: width: 85,
28: height: 0,
47: width: 300,
48: height: 120,
53: width: 50,
54: height: 60,
63: width: -140,
64: height: -60,
```

## editor/packages/excalidraw/tests/scene/export.test.ts

645 lines. Test source; not runtime UI.

```text
37: height: ELEMENT_HEIGHT,
38: width: ELEMENT_WIDTH,
43: height: ELEMENT_HEIGHT,
44: width: ELEMENT_WIDTH,
49: height: ELEMENT_HEIGHT,
50: width: ELEMENT_WIDTH,
56: height: ELEMENT_HEIGHT,
57: width: ELEMENT_WIDTH,
84: height: ELEMENT_HEIGHT,
85: width: ELEMENT_WIDTH,
210: width: 200,
211: height: 0,
219: width: 50,
220: height: 20,
249: width: 200,
250: height: 100,
251: backgroundColor: "#ffc9c9",
259: width: 300,
260: height: 0,
270: width: 50,
271: height: 20,
328: width: 100,
329: height: 100,
335: width: 100,
336: height: 100,
355: width: 100,
356: height: 100,
364: width: 100,
365: height: 100,
389: width: 100,
390: height: 100,
396: width: 100,
397: height: 100,
404: width: 100,
405: height: 100,
433: width: 100,
434: height: 100,
440: width: 100,
441: height: 100,
448: width: 100,
449: height: 100,
475: width: 100,
476: height: 100,
482: width: 100,
483: height: 100,
490: width: 100,
491: height: 100,
498: width: 100,
499: height: 100,
506: width: 100,
507: height: 100,
551: width: 100,
552: height: 100,
586: width: 100,
587: height: 100,
593: width: 100,
594: height: 100,
601: width: 150,
602: height: 100,
609: width: 150,
610: height: 100,
```

## editor/packages/excalidraw/tests/scroll.test.tsx

168 lines. Test source; not runtime UI.

```text
38: width: ELEM_WIDTH,
39: height: ELEM_HEIGHT,
54: expect(h.state.scrollX).toBe(WIDTH / 2 - ELEM_WIDTH / 2);
55: expect(h.state.scrollY).toBe(HEIGHT / 2 - ELEM_HEIGHT / 2);
70: width: 100,
71: height: 60,
78: width: 200,
79: height: 100,
97: expect(h.state.scrollX).toBe(-1000);
98: expect(h.state.scrollY).toBe(-500);
99: expect(h.state.scrollConstraints).toMatchObject({
102: width: 200,
103: height: 100,
118: const initialScrollY = h.state.scrollY;
119: const initialScrollX = h.state.scrollX;
127: expect(h.state.scrollY).toBe(initialScrollY + pageStepY);
129: expect(h.state.scrollX).toBe(initialScrollX);
134: expect(h.state.scrollY).toBe(initialScrollY - pageStepY);
136: expect(h.state.scrollX).toBe(initialScrollX);
142: expect(h.state.scrollX).toBe(initialScrollX + pageStepX);
144: expect(h.state.scrollY).toBe(initialScrollY - pageStepY);
151: expect(h.state.scrollX).toBe(initialScrollX - pageStepX);
153: expect(h.state.scrollY).toBe(initialScrollY - pageStepY);
```

## editor/packages/excalidraw/tests/scrollConstraints.test.tsx

1279 lines. Test source; not runtime UI.

```text
43: const VIEWPORT = { width: 200, height: 100 };
56: width: VIEWPORT.width,
57: height: VIEWPORT.height,
111: width: 1000,
112: height: 1000,
119: expect(result.scrollX).toBe(9999);
120: expect(result.scrollY).toBe(9999);
127: width: 1000,
128: height: 1000,
146: width: 1000,
147: height: 1000,
156: expect(corner.scrollX).toBeCloseTo(0);
157: expect(corner.scrollY).toBeCloseTo(0);
163: expect(farEdge.scrollX).toBeCloseTo(VIEWPORT.width - lock.width); // -800
164: expect(farEdge.scrollY).toBeCloseTo(VIEWPORT.height - lock.height); // -900
193: expect(result.scrollX).toBeCloseTo(centeredX);
199: const base = { x: 0, y: 0, width: 1000, height: 1000 } as const;
233: const base = { x: 0, y: 0, width: 1000, height: 1000 } as const;
243: expect(topLeft.scrollX).toBeCloseTo(40); // left offset
244: expect(topLeft.scrollY).toBeCloseTo(10); // top offset
250: expect(farEdge.scrollX).toBeCloseTo(VIEWPORT.width - base.width - 20); // -820
251: expect(farEdge.scrollY).toBeCloseTo(VIEWPORT.height - base.height - 30); // -930
267: expect(result.scrollY).toBeCloseTo(20);
277: expect(result.scrollX).toBeCloseTo(0);
295: expect(result.scrollX).toBeCloseTo(70);
300: const base = { x: 0, y: 0, width: 1000, height: 1000 } as const;
311: expect(result.scrollX).toBeCloseTo(overscroll / 1); // 30 (zoom 1)
325: expect(result.scrollX).toBeCloseTo(overscroll / 2); // 15
335: expect(result.scrollX).toBeCloseTo(0);
350: expect(constrainScrollState(state, overscroll).scrollX).toBeCloseTo(
354: expect(constrainScrollState(state).scrollX).toBeCloseTo(500);
366: width: 1000,
367: height: 1000,
421: width: 1000,
422: height: 1000,
443: (viewport.scrollY - restingViewport.scrollY) * viewport.zoom.value,
466: animation: false,
471: expect(h.state.scrollConstraints).not.toBe(null);
477: expect(h.state.scrollY).toBeGreaterThanOrEqual(h.state.height - 1000);
483: expect(h.state.scrollConstraints).toBe(null);
484: const before = h.state.scrollY;
486: expect(h.state.scrollY).toBeLessThan(before);
497: width: 100,
498: height: 100,
506: animation: false,
510: expect(h.state.scrollConstraints).not.toBe(null);
518: animation: { duration: 10 },
530: expect(h.state.scrollConstraints).toBe(null);
534: scrollX: h.state.scrollX,
535: scrollY: h.state.scrollY,
558: scrollX: h.state.scrollX,
559: scrollY: h.state.scrollY,
569: expect(h.state.scrollConstraints).toMatchObject({
572: width: rect.width,
573: height: rect.height,
589: width: 100,
590: height: 100,
596: width: 200,
597: height: 200,
606: animation: { duration: 1000 },
616: animation: { duration: 10 },
629: expect(h.state.scrollConstraints).toMatchObject({
632: width: secondTarget.width,
633: height: secondTarget.height,
649: animation: false,
653: expect(h.state.scrollConstraints).not.toBe(null);
658: animation: { duration: 1000 },
664: expect(h.state.scrollConstraints).toBe(null);
675: expect(h.state.scrollConstraints).toBe(null);
686: animation: { duration: 1000 },
702: expect(h.state.scrollX).toBe(123);
703: expect(h.state.scrollY).toBe(456);
713: animation: false,
718: animation: false,
723: animation: false,
727: expect(h.state.scrollConstraints).toBe(null);
729: expect(h.state.scrollX).toBeCloseTo(-1500);
730: expect(h.state.scrollY).toBeCloseTo(-2000);
739: target: { x: 10, y: 20, width: 50 },
741: animation: false,
746: expect(h.state.scrollConstraints).toMatchObject({
749: width: 50,
750: height: h.state.height,
755: target: { x: 30, y: 40, height: 60 },
757: animation: false,
762: expect(h.state.scrollConstraints).toMatchObject({
765: width: h.state.width,
766: height: 60,
773: animation: false,
778: expect(h.state.scrollConstraints).toMatchObject({
781: width: h.state.width,
782: height: h.state.height,
799: width: 300,
800: height: 400,
821: animation: false,
828: expect(h.state.scrollConstraints).toMatchObject({
831: width: validRect.width,
832: height: validRect.height,
835: const scrollConstraints = h.state.scrollConstraints;
847: animation: false,
854: expect(h.state.scrollConstraints).toBe(scrollConstraints);
871: animation: false,
883: scrollX: h.state.scrollX,
884: scrollY: h.state.scrollY,
901: expect(h.state.scrollX).toBeCloseTo(restingViewport.scrollX);
902: expect(h.state.scrollY).toBeCloseTo(restingViewport.scrollY);
914: width: 100,
915: height: 50,
923: animation: false,
928: const lockedZoom = h.state.scrollConstraints?.zoom;
951: width: 100,
952: height: 50,
960: animation: false,
965: const lockedZoom = h.state.scrollConstraints?.zoom;
996: animation: false,
1007: expect(h.state.scrollY).toBeGreaterThan(0);
1008: expect(h.state.scrollY).toBeLessThanOrEqual(
1021: animation: false,
1028: expect(h.state.scrollX).toBeCloseTo(500);
1045: expect(h.state.scrollX).toBeCloseTo(0);
1049: expect(h.state.scrollY).toBeGreaterThan(0);
1050: expect(h.state.scrollY).toBeLessThanOrEqual(
1063: animation: false,
1072: expect(h.state.scrollY).toBeCloseTo(0);
1087: expect(h.state.scrollY).toBeGreaterThan(0);
1088: expect(h.state.scrollY).toBeLessThanOrEqual(
1098: expect(h.state.scrollY).toBeGreaterThan(0);
1112: animation: false,
1125: const heldScrollY = h.state.scrollY;
1137: expect(h.state.scrollY).toBe(heldScrollY);
1156: animation: false,
1167: const heldScrollY = h.state.scrollY;
1179: expect(h.state.scrollY).toBe(heldScrollY);
1203: animation: false,
1219: expect(h.state.scrollY).toBeGreaterThan(
1220: constrainScrollState(h.state).scrollY,
1230: expect(h.state.scrollY).toBeGreaterThan(
1231: constrainScrollState(h.state).scrollY,
1244: expect(h.state.scrollX).toBeCloseTo(restingViewport.scrollX);
1245: expect(h.state.scrollY).toBeCloseTo(restingViewport.scrollY);
1261: animation: false,
1268: expect(h.state.scrollConstraints?.overscroll).toBe(DEFAULT_OVERSCROLL);
1271: expect(h.state.scrollConstraints?.overscroll).toBe(DEFAULT_OVERSCROLL);
1274: expect(h.state.scrollConstraints?.overscroll).toBe(0);
1277: expect(h.state.scrollConstraints?.overscroll).toBe(25);
```

## editor/packages/excalidraw/tests/search.test.tsx

193 lines. Test source; not runtime UI.

```text
78: searchInput?.blur();
91: window.HTMLElement.prototype.scrollIntoView = scrollIntoViewMock;
124: window.HTMLElement.prototype.scrollIntoView = scrollIntoViewMock;
167: window.HTMLElement.prototype.scrollIntoView = scrollIntoViewMock;
```

## editor/packages/excalidraw/tests/selection.test.tsx

1481 lines. Test source; not runtime UI.

```text
72: width: 50,
73: height: 50,
74: backgroundColor: "red",
81: width: 50,
82: height: 50,
109: width: 50,
110: height: 50,
111: backgroundColor: "red",
137: width: 50,
138: height: 50,
139: backgroundColor: "red",
164: width: 100,
165: height: 100,
166: backgroundColor: "red",
173: width: 100,
174: height: 100,
175: backgroundColor: "blue",
266: width: 50,
267: height: 50,
268: backgroundColor: "red",
284: width: 50,
285: height: 50,
292: width: 50,
293: height: 50,
311: width: 50,
312: height: 50,
320: width: 50,
321: height: 50,
329: width: 50,
330: height: 50,
336: width: 10,
337: height: 70,
358: width: 50,
359: height: 50,
367: width: 50,
368: height: 50,
376: width: 50,
377: height: 50,
385: width: 50,
386: height: 50,
394: width: 50,
395: height: 50,
402: width: 10,
403: height: 70,
423: width: 100,
424: height: 100,
425: backgroundColor: "transparent",
441: width: 100,
442: height: 100,
443: backgroundColor: "transparent",
459: width: 100,
460: height: 100,
462: backgroundColor: "transparent",
478: width: 100,
479: height: 180,
481: backgroundColor: "transparent",
517: width: 100,
518: height: 100,
520: backgroundColor: "red",
536: width: 100,
537: height: 100,
538: backgroundColor: "red",
554: width: 100,
555: height: 100,
556: backgroundColor: "red",
572: width: 100,
573: height: 100,
575: backgroundColor: "red",
591: width: 100,
592: height: 100,
594: backgroundColor: "red",
610: width: 100,
611: height: 100,
628: width: 100,
629: height: 100,
647: width: 100,
648: height: 100,
650: backgroundColor: "red",
673: width: 100,
674: height: 100,
675: backgroundColor: "transparent",
691: width: 100,
692: height: 100,
694: backgroundColor: "transparent",
720: width: 100,
721: height: 100,
722: backgroundColor: "transparent",
742: width: 100,
743: height: 100,
744: backgroundColor: "transparent",
751: width: 100,
752: height: 80,
754: backgroundColor: "transparent",
770: width: 100,
771: height: 100,
777: width: 200,
778: height: 200,
780: backgroundColor: "red",
801: width: 300,
802: height: 300,
803: backgroundColor: "red",
810: width: 50,
811: height: 50,
817: width: 50,
818: height: 50,
836: width: 300,
837: height: 300,
838: backgroundColor: "red",
845: width: 50,
846: height: 50,
853: width: 50,
854: height: 50,
885: width: 50,
886: height: 50,
893: width: 50,
894: height: 50,
901: width: 50,
902: height: 50,
939: width: 50,
940: height: 50,
947: width: 50,
948: height: 50,
955: width: 50,
956: height: 50,
963: width: 140,
964: height: 70,
997: width: 50,
998: height: 50,
1007: width: 50,
1008: height: 20,
1016: width: 50,
1017: height: 50,
1039: width: 300,
1040: height: 300,
1041: backgroundColor: "red",
1048: width: 50,
1049: height: 50,
1056: width: 50,
1057: height: 50,
1394: width: 10,
1395: height: 10,
```

## editor/packages/excalidraw/tests/test-utils.ts

493 lines. Test source; not runtime UI.

```text
168: width: 200,
171: height: 100,
189: dimensions: { width: number; height: number },
```

## editor/packages/excalidraw/tests/tool.test.tsx

350 lines. Test source; not runtime UI.

```text
198: width: 50,
199: height: 50,
```

## editor/packages/excalidraw/tests/viewMode.test.tsx

190 lines. Test source; not runtime UI.

```text
103: expect([h.state.scrollX, h.state.scrollY]).toEqual([scrollX, scrollY]);
166: width: 80,
167: height: 50,
174: const input = queryContainer(".frame-name input");
184: expect(queryContainer(".frame-name input")).toBe(null);
```

## editor/packages/excalidraw/types.ts

1509 lines. Check platform/build reachability at the call site.

```text
83: background: string;
194: width: AppState["width"];
195: height: AppState["height"];
294: width: number;
295: height: number;
386: outline: boolean;
500: width: number;
501: height: number;
561: width: number;
562: height: number;
667: /** viewport-edge border: CSS color, or `false` for none */
668: border: false | string;
1147: cursor: App["cursor"];
1341: width: number;
1342: height: number;
```

## editor/packages/excalidraw/viewport.ts

461 lines. Check platform/build reachability at the call site.

```text
155: return { scrollX: state.scrollX, scrollY: state.scrollY, zoom: state.zoom };
167: scrollX: state.scrollX,
168: scrollY: state.scrollY,
182: state.scrollX,
191: state.scrollY,
214: const baseScrollX = appState.scrollX + (appLayerX - appLayerX / currentZoom);
215: const baseScrollY = appState.scrollY + (appLayerY - appLayerY / currentZoom);
242: (state.scrollX - restingViewport.scrollX) * state.zoom.value;
244: (state.scrollY - restingViewport.scrollY) * state.zoom.value;
251: if (!state.scrollConstraints?.lockScroll || (!overscrollX && !overscrollY)) {
260: scrollX: zoomedViewport.scrollX + overscrollX / zoom,
261: scrollY: zoomedViewport.scrollY + overscrollY / zoom,
263: state.scrollConstraints.overscroll,
269: viewportDimensions: { width: number; height: number },
327: width: effectiveCanvasWidth,
328: height: effectiveCanvasHeight,
344: width: appState.width,
345: height: appState.height,
354: scrollX: centerScroll.scrollX,
355: scrollY: centerScroll.scrollY,
404: viewportDimensions: { height: number; width: number };
458: viewportDimensions: { width: appState.width, height: appState.height },
```

## editor/packages/excalidraw/wysiwyg/textWysiwyg.test.tsx

2100 lines. Test source; not runtime UI.

```text
85: width: 100,
86: height: 0,
95: width: textSize,
96: height: textSize,
113: width: 100,
123: width: textSize,
124: height: textSize,
133: width: textSize,
134: height: textSize,
154: width: 100,
162: width: textSize,
163: height: textSize,
182: width: 100,
192: width: textSize,
193: height: textSize,
202: width: textSize,
203: height: textSize,
226: width: 100,
227: height: 100,
284: width: 100,
285: height: 100,
306: width: 100,
307: height: 100,
330: width: 160,
331: height: 70,
339: width: 120,
340: height: 25,
361: width: 160,
362: height: 70,
370: width: 120,
371: height: 25,
391: width: 300,
392: height: 0,
405: const dimensions = { height: 400, width: 800 };
509: const dimensions = { height: 400, width: 800 };
737: width: 90,
738: height: 75,
747: width: 90,
748: height: 75,
749: backgroundColor: "red",
781: width: 200,
782: height: 200,
788: width: 90,
789: height: 75,
790: backgroundColor: "red",
807: width: 200,
808: height: 200,
814: width: 90,
815: height: 75,
816: backgroundColor: "red",
836: width: 90,
837: height: 75,
865: width: 90,
866: height: 75,
898: width: 90,
899: height: 75,
900: backgroundColor: "transparent",
959: width: 90,
960: height: 75,
990: width: 100,
991: height: 0,
1015: width: 100,
1016: height: 50,
1296: width: 120,
1297: height: 100,
1458: height: 75,
1459: width: 90,
1737: backgroundColor: "transparent",
1746: height: 35,
1750: opacity: 100,
1759: width: 610,
1827: width: 90,
1828: height: 75,
1850: width: 90,
1851: height: 75,
1868: width: 90,
1869: height: 75,
1893: width: 90,
1894: height: 75,
1993: width: 300,
1994: height: 50,
```

## editor/packages/excalidraw/wysiwyg/textWysiwyg.tsx

1037 lines. Check platform/build reachability at the call site.

```text
80: width: number,
81: height: number,
157: margin: 0,
158: padding: 0,
159: border: 0,
160: opacity: "0",
237: height: number;
240: width: number;
342: app.scene.mutateElement(container, { height: targetContainerHeight });
356: app.scene.mutateElement(container, { height: targetContainerHeight });
390: width: `${width}px`,
391: height: `${height}px`,
404: color: applyDarkModeFilter(
408: opacity: updatedTextElement.opacity / 100,
414: height: updatedTextElement.height,
420: width: updatedTextElement.width,
424: editable.scrollTop = 0;
456: margin: 0,
457: padding: 0,
458: border: 0,
459: outline: 0,
461: background: "transparent",
493: layout.font,
494: whiteSpace === "pre-wrap" ? layout.width : Infinity,
502: const lineWidth = getLineWidth(line.text, layout.font);
517: font: layout.font,
```

## editor/packages/utils/src/export.ts

222 lines. Check platform/build reachability at the call site.

```text
36: width: number,
37: height: number,
38: ) => { width: number; height: number; scale?: number };
62: { ...restoredAppState, offsetTop: 0, offsetLeft: 0, width: 0, height: 0 },
65: (width: number, height: number) => {
```

## editor/packages/utils/src/shape.ts

546 lines. Check platform/build reachability at the call site.

```text
369: gap: number = 0,
```

## editor/packages/utils/tests/export.test.ts

134 lines. Test source; not runtime UI.

```text
15: ...diagramFactory({ elementOverrides: { width: 100, height: 100 } }),
24: ...diagramFactory({ elementOverrides: { width: 100, height: 100 } }),
25: getDimensions: () => ({ width: 200, height: 200, scale: 1 }),
```
