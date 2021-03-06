import Combine
import ComposableArchitecture
import Prelude

public func manageReducer(state: inout ManageViewState, action: ManageAction) -> [Effect<ManageAction>] {
    switch action {
    case .load:
        return [
            Current.fileClient
                .load(state.fileName)
                .compactMap(id)
                .decode(type: [String].self, decoder: JSONDecoder())
                .catch(const(Empty(completeImmediately: true)))
                .map(ManageAction.loaded)
                .eraseToEffect()
        ]
    case let .loaded(todos):
        state.todos = todos
    case .save:
        return [
            Current.fileClient
                .save(state.fileName, try! JSONEncoder().encode(state.todos))
                .fireAndForget()
        ]
    }

    return []
}
