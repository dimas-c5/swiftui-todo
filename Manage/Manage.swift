import ComposableArchitecture
import SwiftUI

public struct Manage: View {
    @ObservedObject var store: Store<ManageViewState, ManageAction>

    public init(store: Store<ManageViewState, ManageAction>) {
        self.store = store
    }

    public var body: some View {
        HStack {
            Button("Load") { self.store.send(.load) }
            Spacer()
            Button("Save") { self.store.send(.save) }
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}
