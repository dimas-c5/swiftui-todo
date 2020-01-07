import Add
import Show

enum AppAction {
    case add(AddAction)
    case show(ShowAction)
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
    var show: ShowAction? {
        get {
            guard case let .show(action) = self else { return nil }
            return action
        }

        set {
            guard case .show = self, let newValue = newValue else { return }
            self = .show(newValue)
        }
    }
}
