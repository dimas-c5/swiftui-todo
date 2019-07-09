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
    @State var todos = [Todo]()

    var body: some View {
        List {
            TextField($textInput, placeholder: Text("Add a todo"), onCommit: onCommit)
            ForEach(todos, content: TodoItemView.init)
                .onDelete(perform: delete)
        }
    }

    func onCommit() {
        todos.append(.init(title: textInput))
        textInput = ""
    }

    func delete(at offsets: IndexSet?) {
        if let offsets = offsets {
            offsets.forEach {
                todos.remove(at: $0)
            }
        }
    }

}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
 
