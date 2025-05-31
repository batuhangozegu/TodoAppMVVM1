//
//  TodoListItem.swift
//  TodoApp
//
//  Created by Batuhan Gözegü on 31.05.2025.
//

import SwiftUI

struct TodoListView: View {
    
    @ObservedObject var viewModel: TodoViewModel
    
    var action: () -> Void
    
    var body: some View {
        List{
            ForEach(viewModel.todos){ todo in
                TodoRowView(todo: todo){
                    viewModel.toggleDone(for: todo)
                }
                .listRowSeparator(.hidden)
            }
            .onDelete(perform: viewModel.delete)
        }
        .listStyle(.plain)
    }
}
