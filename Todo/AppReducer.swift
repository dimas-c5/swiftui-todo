import ComposableArchitecture
import Todos

let appReducer: (inout AppState, AppAction) -> Void = combine(
    pullback(todosReducer, value: \.todos, action: \.todos)
)
