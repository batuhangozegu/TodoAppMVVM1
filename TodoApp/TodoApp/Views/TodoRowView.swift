//
//  TodoRowView.swift
//  TodoApp
//
//  Created by Batuhan Gözegü on 31.05.2025.
//

import SwiftUI

struct TodoRowView: View {

    let todo: TodoItem
    var toggleDone: () -> Void
    
    var body: some View {
        HStack{
            Button(action: toggleDone) {
                Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.plain)
        
            Text(todo.title)
                .strikethrough(todo.isDone,color: Color("StrikethroughColor"))
                .foregroundColor(todo.isDone ? Color("SecondaryText") : Color("PrimaryText"))
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

