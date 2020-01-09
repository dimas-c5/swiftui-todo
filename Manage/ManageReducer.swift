import ComposableArchitecture

public func manageReducer(state: ManageViewState, action: ManageAction) -> [Effect<ManageAction>] {
    switch action {
    case .loadTapped: return []
    case .saveTapped: return []
    }
}
