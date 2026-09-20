import { performance } from "node:perf_hooks";
import { pathToFileURL } from "node:url";
import { resolve } from "node:path";
if (!process.argv[2]) throw new Error("Usage: node NativeStateWatcherBenchmark.mjs EDITOR_SOURCE_ROOT");
const { NativeStateChangeTracker } = await import(pathToFileURL(resolve(process.argv[2], "excalidraw-app/excalidrawZ/stateChange.js")));

const elementCount = 25_000;
const iterations = 200;
const elements = Array.from({ length: elementCount }, (_, index) => ({
  id: `element-${index}`,
  version: 1,
  versionNonce: index,
  isDeleted: index % 37 === 0,
  index: `a${index}`,
  fileId: index % 19 === 0 ? `file-${index}` : undefined,
}));
const selectedElementIds = Object.fromEntries(
  Array.from({ length: 5_000 }, (_, index) => [`element-${index}`, true]),
);
const baseAppState = {
  viewBackgroundColor: "#ffffff",
  currentItemStrokeColor: "#1b1b1f",
  scrollX: 0,
  scrollY: 0,
  zoom: { value: 1 },
  selectedElementIds,
  collaborators: Object.fromEntries(
    Array.from({ length: 100 }, (_, index) => [index, { username: `user-${index}` }]),
  ),
};

const updateHash = (hash, value) => {
  const text = String(value ?? "");
  for (let index = 0; index < text.length; index++) {
    hash = (hash << 5) + hash + text.charCodeAt(index);
  }
  return hash >>> 0;
};

let oldContentSignature;
let oldAppStateSignature;
const oldReset = (appState) => {
  let hash = updateHash(5381, elements.length);
  for (const element of elements) {
    hash = updateHash(hash, element.id);
    hash = updateHash(hash, element.version);
    hash = updateHash(hash, element.versionNonce);
    hash = updateHash(hash, element.isDeleted ? 1 : 0);
    hash = updateHash(hash, element.index);
    hash = updateHash(hash, element.fileId);
  }
  oldContentSignature = `${elements.length}:${hash}`;
  oldAppStateSignature = JSON.stringify(appState);
};
const oldDispatch = (appState) => {
  let hash = updateHash(5381, elements.length);
  for (const element of elements) {
    hash = updateHash(hash, element.id);
    hash = updateHash(hash, element.version);
    hash = updateHash(hash, element.versionNonce);
    hash = updateHash(hash, element.isDeleted ? 1 : 0);
    hash = updateHash(hash, element.index);
    hash = updateHash(hash, element.fileId);
  }
  const contentSignature = `${elements.length}:${hash}`;
  const appStateSignature = JSON.stringify(appState);
  const dirty =
    contentSignature !== oldContentSignature ||
    appStateSignature !== oldAppStateSignature;
  oldContentSignature = contentSignature;
  oldAppStateSignature = appStateSignature;
  if (dirty) {
    elements.reduce((count, element) => count + (element.isDeleted ? 1 : 0), 0);
    elements.reduce((count, element) => count + (element.fileId ? 1 : 0), 0);
  }
};

const tracker = new NativeStateChangeTracker();
tracker.reset(elements, baseAppState, 1);
oldReset(baseAppState);

const measure = (dispatch) => {
  for (let index = 0; index < 20; index++) {
    dispatch({ ...baseAppState, scrollX: index });
  }
  const started = performance.now();
  for (let index = 0; index < iterations; index++) {
    dispatch({ ...baseAppState, scrollX: index + 100 });
  }
  return performance.now() - started;
};

const oldMilliseconds = measure(oldDispatch);
const newMilliseconds = measure((appState) =>
  tracker.createPayload(elements, appState, 1),
);

console.log(
  JSON.stringify(
    {
      elementCount,
      selectedElementCount: Object.keys(selectedElementIds).length,
      iterations,
      oldMilliseconds,
      newMilliseconds,
      oldMicrosecondsPerDispatch: (oldMilliseconds * 1000) / iterations,
      newMicrosecondsPerDispatch: (newMilliseconds * 1000) / iterations,
      speedup: oldMilliseconds / newMilliseconds,
    },
    null,
    2,
  ),
);
