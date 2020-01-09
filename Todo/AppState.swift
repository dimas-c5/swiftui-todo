import Manage

struct AppState {
    var textInput: String = ""
    var todos: [String] = []
}

extension AppState {
    var manageView: ManageViewState {
        get { .init(todos: todos) }
        set { todos = newValue.todos }
    }
}
