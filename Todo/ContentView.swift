import SwiftUI
import AddTodo
import ComposableArchitecture
import Todos

struct ContentView : View {
    @ObservedObject var store: Store<AppState, AppAction>

    var body: some View {
        VStack {
            AddTodo(store: store.view(value: ^\.textInput, action: AppAction.addTodo))
                .padding(.leading, 20)
            Todos(store: store.view(value: ^\.todos, action: AppAction.todos))
        }
    }
}
