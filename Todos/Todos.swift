import ComposableArchitecture
import SwiftUI

public struct Todos: View {
    @ObservedObject var store: Store<[String], TodosAction>

    public init(store: Store<[String], TodosAction>) {
        self.store = store
    }

    public var body: some View {
        List {
            ForEach(self.store.value, id: \.self, content: Text.init)
                .onDelete(perform: onDelete)
        }
    }
}

extension Todos {
    func onDelete(indexSet: IndexSet) {
        self.store.send(.deleteTodos(indexSet))
    }
}
