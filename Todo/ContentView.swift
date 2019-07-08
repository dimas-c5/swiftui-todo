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
            TodoItemView(todo: Todo(id: 1, title: "🚢"))
            TodoItemView(todo: Todo(id: 1, title: "IT"))
        }
    }

    func didChange(_ change: Bool) {
        if !change {
            todos.append(.init(id: todos.count, title: textInput))
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
 
