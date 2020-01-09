import Services

struct ManageEnvironment {
    var fileClient: FileClient
}

extension ManageEnvironment {
    static let live = ManageEnvironment(fileClient: .live)
}

var Current = ManageEnvironment.live
