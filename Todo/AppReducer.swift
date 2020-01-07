import ComposableArchitecture
import Show

let appReducer: (inout AppState, AppAction) -> Void = combine(
    pullback(showReducer, value: \.todos, action: \.show)
)
