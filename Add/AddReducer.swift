import ComposableArchitecture

public func addReducer(state: inout [String], action: AddAction) -> [Effect<AddAction>] {
    switch action {
    case let .add(todo):
        state.append(todo)
        return []
    }
}
