import ComposableArchitecture
import Add
import Show

let appReducer: (inout AppState, AppAction) -> Void = combine(
    pullback(addReducer, value: \.textInput, action: \.add),
    pullback(showReducer, value: \.todos, action: \.show)
)
