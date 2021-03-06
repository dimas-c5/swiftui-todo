import ComposableArchitecture
import SwiftUI

public struct Show: View {
    @ObservedObject var store: Store<[String], ShowAction>

    public init(store: Store<[String], ShowAction>) {
        self.store = store
    }

    public var body: some View {
        List {
            ForEach(store.value, id: \.self, content: Text.init)
                .onDelete(perform: onDelete)
        }
    }
}

extension Show {
    func onDelete(indexSet: IndexSet) {
        store.send(.delete(indexSet))
    }
}
