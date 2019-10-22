import ComposableArchitecture
import SwiftUI

public struct AddTodo: View {
    @State var textInput = ""
    @ObservedObject var store: Store<String, AddTodoAction>

    public init(store: Store<String, AddTodoAction>) {
        self.store = store
    }

    public var body: some View {
        TextField("Add a todo", text: $textInput, onEditingChanged: {_ in}, onCommit: onCommit)
    }
}

extension AddTodo {
    func onCommit() -> Void {
        store.send(.add(textInput))
        textInput = ""
    }
}
