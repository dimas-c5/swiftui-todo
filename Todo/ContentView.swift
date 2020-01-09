import SwiftUI
import Add
import ComposableArchitecture
import Prelude
import Show

struct ContentView : View {
    @ObservedObject var store: Store<AppState, AppAction>

    var body: some View {
        VStack {
            Add(store: store.view(value: ^\.textInput, action: AppAction.add))
                .padding(.leading, 20)
            Show(store: store.view(value: ^\.todos, action: AppAction.show))
        }
    }
}
