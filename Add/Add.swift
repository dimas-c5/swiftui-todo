import SwiftUI
import ComposableArchitecture
import Prelude

public struct Add: View {
    @State var textInput = ""
    @ObservedObject var store: Store<String, AddAction>

    public init(store: Store<String, AddAction>) {
        self.store = store
    }

    public var body: some View {
        TextField("Add a todo", text: $textInput, onEditingChanged: const(()), onCommit: onCommit)
    }
}

extension Add {
    func onCommit() {
        store.send(.add(textInput))
        textInput = ""
    }
}
