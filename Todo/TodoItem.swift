//
//  TodoItem.swift
//  Todo
//
//  Created by Huy Hoang Nguyen on 05/02/2022.
//

import SwiftUI

struct TodoItem: View {
    let id: String
    let content: String
    let isCompleted: Bool
    let onDelete: (String) -> Void
    let onDone: (String) -> Void
    
    var body: some View {
        HStack {
            Text(content).strikethrough(isCompleted).foregroundColor(isCompleted ? .gray : .black)
            Spacer()
            Button(action: {
                onDone(id)
            }, label: {
                Image(systemName: "checkmark.circle.fill")
            })
                .buttonStyle(.borderedProminent)
                .tint(.green)
            Button(action: {
                onDelete(id)
            }, label: {
                Image(systemName: "trash.circle.fill")
            })
                .buttonStyle(.borderedProminent)
                .tint(.red)
        }
        
    }
}
