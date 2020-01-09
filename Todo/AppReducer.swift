import Add
import ComposableArchitecture
import Manage
import Show

let appReducer = combine(
    pullback(addReducer, value: \AppState.todos, action: \AppAction.add),
    pullback(manageReducer, value: \.manageView, action: \.manage),
    pullback(showReducer, value: \.todos, action: \.show)
)
