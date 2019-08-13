import SwiftUI

struct TodoItemView: View {
    let todo: Todo

    var body: some View {
        Text(todo.title)
    }
}
