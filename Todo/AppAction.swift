import Add
import Todos

enum AppAction {
    case add(AddAction)
    case todos(TodosAction)
}

extension AppAction {
    var add: AddAction? {
        get {
            guard case let .add(action) = self else {
                return nil
            }
            return action
        }

        set {
            guard case .add = self, let newValue = newValue else { return }
            self = .add(newValue)
        }
    }
}

extension AppAction {
    var todos: TodosAction? {
        get {
            guard case let .todos(action) = self else { return nil }
            return action
        }

        set {
            guard case .todos = self, let newValue = newValue else { return }
            self = .todos(newValue)
        }
    }
}
