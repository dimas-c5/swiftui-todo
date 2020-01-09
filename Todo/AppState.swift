import Manage

struct AppState {
    var manageViewState: ManageViewState = .init()
    var textInput: String = ""
    var todos: [String] = []
}
