import ComposableArchitecture

public struct FileClient {
    public var load: (String) -> Effect<Data?>
    public var save: (String, Data) -> Effect<Never>
}

extension FileClient {
    static func url(_ fileName: String) -> URL {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let documentsUrl = URL(fileURLWithPath: documentsPath)
        return documentsUrl.appendingPathComponent(fileName)
    }
}

extension FileClient {
    public static let live = FileClient(
        load: { fileName in
            .sync {
                try? .init(contentsOf: Self.url(fileName))
            }
    },
        save: { fileName, data in
            .fireAndForget {
                try! data.write(to: Self.url(fileName))
            }
    }
    )
}
