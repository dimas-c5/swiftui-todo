import Combine

class AppState: ObservableObject {
    @Published var todos = [Todo]()
}
