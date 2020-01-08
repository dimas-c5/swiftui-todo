public func showReducer(state: inout [String], action: ShowAction) {
    switch action {
    case let .load(todos):
        state = todos
    case let .delete(indexSet):
        for index in indexSet {
          state.remove(at: index)
        }
    }
}
