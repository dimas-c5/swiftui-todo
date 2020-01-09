import Add
import ComposableArchitecture
import Show

let appReducer = combine(
    pullback(addReducer, value: \AppState.todos, action: \AppAction.add),
    pullback(showReducer, value: \.todos, action: \.show)
)
