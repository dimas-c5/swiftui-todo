import AddTodo
import Todos

enum AppAction {
    case addTodo(AddTodoAction)
    case todos(TodosAction)
}

extension AppAction {
    var addTodo: AddTodoAction? {
        get {
            guard case let .addTodo(action) = self else {
                return nil
            }
            return action
        }

        set {
            guard case .addTodo = self, let newValue = newValue else { return }
            self = .addTodo(newValue)
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
