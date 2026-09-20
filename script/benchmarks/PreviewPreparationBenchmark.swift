import Foundation

private func makeScene(elementCount: Int, embeddedBytes: Int) throws -> (Data, [String: Any]) {
    let elements: [[String: Any]] = (0..<elementCount).map { index in
        [
            "id": "element-\(index)",
            "type": "rectangle",
            "x": index % 2_000,
            "y": index / 2_000,
            "width": 120,
            "height": 80,
            "strokeColor": "#1b1b1f",
            "backgroundColor": "#e5e7eb",
        ]
    }
    let payload = Data(repeating: 0x41, count: embeddedBytes).base64EncodedString()
    let files: [String: Any] = [
        "image-1": [
            "id": "image-1",
            "mimeType": "image/png",
            "dataURL": "data:image/png;base64,\(payload)",
        ]
    ]
    let scene: [String: Any] = [
        "type": "excalidraw",
        "version": 2,
        "source": "benchmark",
        "elements": elements,
        "appState": ["width": 1280, "height": 800],
        "files": files,
    ]
    return (try JSONSerialization.data(withJSONObject: scene), files)
}

private func prepareSceneData(_ content: Data, files: [String: Any]) throws -> Data {
    var object = try JSONSerialization.jsonObject(with: content) as! [String: Any]
    object["files"] = files
    return try JSONSerialization.data(withJSONObject: object)
}

private func milliseconds(since start: ContinuousClock.Instant) -> Double {
    let duration = start.duration(to: .now)
    return Double(duration.components.seconds) * 1_000
        + Double(duration.components.attoseconds) / 1_000_000_000_000_000
}

@main
private struct PreviewPreparationBenchmark {
    static func main() async throws {
        let (content, files) = try makeScene(elementCount: 50_000, embeddedBytes: 8 * 1024 * 1024)
        print("fixtureMiB=\(String(format: "%.1f", Double(content.count) / 1_048_576))")

        for mode in ["main", "detached", "reuse"] {
            var preparationTimes: [Double] = []
            var actorLatencies: [Double] = []
            for _ in 0..<5 {
                let heartbeat = Task.detached {
                    try await Task.sleep(for: .milliseconds(5))
                    let actorStart = ContinuousClock.now
                    return await MainActor.run {
                        milliseconds(since: actorStart)
                    }
                }
                let preparationStart = ContinuousClock.now
                if mode == "main" {
                    _ = try await MainActor.run {
                        try prepareSceneData(content, files: files)
                    }
                } else if mode == "detached" {
                    _ = try await Task.detached(priority: .utility) {
                        try prepareSceneData(content, files: files)
                    }.value
                } else {
                    _ = try await Task.detached(priority: .utility) {
                        try Task.checkCancellation()
                        return content
                    }.value
                }
                preparationTimes.append(milliseconds(since: preparationStart))
                actorLatencies.append(try await heartbeat.value)
            }
            let sortedPreparation = preparationTimes.sorted()
            let sortedLatency = actorLatencies.sorted()
            print("\(mode) preparationMedianMs=\(String(format: "%.1f", sortedPreparation[2])) actorHeartbeatMedianMs=\(String(format: "%.1f", sortedLatency[2]))")
        }
    }
}
