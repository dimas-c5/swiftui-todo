public struct ManageViewState: Equatable {
    public let fileName: String = "persist_todos.json"
    public var todos: [String]

    public init(todos: [String]) {
        self.todos = todos
    }
}
