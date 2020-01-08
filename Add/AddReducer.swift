public func addReducer(state: inout [String], action: AddAction) {
    switch action {
    case let .add(todo):
        state.append(todo)
    }
}
