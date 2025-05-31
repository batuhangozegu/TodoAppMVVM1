//
//  TodoViewModel.swift
//  TodoApp
//
//  Created by Batuhan Gözegü on 31.05.2025.
//

import Foundation

class TodoViewModel : ObservableObject {
    
    @Published var todos: [TodoItem] = []
    @Published var newTaskTitle: String = ""
    
    private let todosKey = "todos"
    
    init() {
        loadTodos()
    }
    
    func addTask(){
        let trimmed = newTaskTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        
        todos.insert(TodoItem(title:trimmed,isDone: false),at: 0)
        newTaskTitle = ""
        saveTodos()
    }

    func toggleDone(for todo: TodoItem){
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isDone.toggle()
            saveTodos()
        }
    }
    
    func delete(at offsets: IndexSet){
        todos.remove(atOffsets: offsets)
        saveTodos()
    }

    private func saveTodos() {
        if let encoded = try? JSONEncoder().encode(todos) {
            UserDefaults.standard.set(encoded, forKey: todosKey)
        }
    }
    
    private func loadTodos() {
        if let data = UserDefaults.standard.data(forKey: todosKey),
           let decoded = try? JSONDecoder().decode([TodoItem].self, from: data) {
            todos = decoded
        }
    }
    
}
