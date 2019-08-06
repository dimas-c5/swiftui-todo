//
//  ContentView.swift
//  Todo
//
//  Created by Tim Kersey on 6/17/19.
//  Copyright © 2019 Tim Kersey. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var textInput = ""
    @ObservedObject var state: AppState

    var body: some View {
        List {
            TextField("Add a todo", text: $textInput, onEditingChanged: {_ in}, onCommit: onCommit)
             ForEach(state.todos, content: TodoItemView.init)
                .onDelete(perform: delete)
        }
    }

    func onCommit() {
        state.todos.append(.init(title: textInput))
        textInput = ""
    }

    func delete(at offsets: IndexSet?) {
        if let offsets = offsets {
            offsets.forEach {
                state.todos.remove(at: $0)
            }
        }
    }

}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(state: AppState())
    }
}
#endif
 
