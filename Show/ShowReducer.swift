import ComposableArchitecture

public func showReducer(state: inout [String], action: ShowAction) -> [Effect<ShowAction>]  {
    switch action {
    case let .load(todos):
        state = todos
        return []
    case let .delete(indexSet):
        for index in indexSet {
          state.remove(at: index)
        }
        return []
    }
}
