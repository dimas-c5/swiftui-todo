import Add
import ComposableArchitecture
import Manage
import Prelude
import Show
import SwiftUI

struct ContentView : View {
    @ObservedObject var store: Store<AppState, AppAction>

    var body: some View {
        VStack {
            Add(store: store.view(value: ^\.textInput, action: AppAction.add))
                .padding(.leading, 20)
            Show(store: store.view(value: ^\.todos, action: AppAction.show))
            Manage(store: store.view(value: ^\.manageViewState, action: AppAction.manage))
        }
    }
}
