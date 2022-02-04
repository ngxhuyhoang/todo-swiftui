//
//  ContentView.swift
//  Todo
//
//  Created by Huy Hoang Nguyen on 05/02/2022.
//

import SwiftUI

struct TodoItemData {
    let id = UUID().uuidString
    let content: String
    var isCompleted: Bool
}

struct ContentView: View {
    @State private var _content: String = ""
    @State private var _todoList: [TodoItemData] = []
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    TextField("What are you doing today ?", text: $_content)
                        .frame(height: 36)
                        .textFieldStyle(.roundedBorder)
                    Button(action: {
                        _todoList.append(TodoItemData(content: _content, isCompleted: false))
                        _content = ""
                    }, label: {
                        Image(systemName: "plus.app.fill")
                    })
                        .buttonStyle(.borderedProminent)
                }
                
                if _todoList.isEmpty {
                    HStack {
                        Spacer()
                        Text("Nothing to do today").foregroundColor(.gray)
                        Spacer()
                    }
                } else {
                    ForEach(_todoList.indices, id: \.self) { index in
                        TodoItem(
                            id: _todoList[index].id,
                            content: _todoList[index].content,
                            isCompleted: _todoList[index].isCompleted,
                            onDelete: { item in
                                _todoList = _todoList.filter { $0.id != item }
                            },
                            onDone: { item in
                                _todoList[index].isCompleted = !_todoList[index].isCompleted
                            }
                        )
                    }
                }
                
                Spacer()
            }
            .navigationTitle("Todo App SwiftUI")
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
