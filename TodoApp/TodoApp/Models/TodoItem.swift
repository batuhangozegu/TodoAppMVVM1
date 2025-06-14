//
//  Todos.swift
//  TodoApp
//
//  Created by Batuhan Gözegü on 31.05.2025.
//

import Foundation

struct TodoItem: Identifiable,Codable,Equatable {
    
    let id : UUID
    var title: String
    var isDone: Bool
    
    init(id: UUID = UUID(), title: String, isDone: Bool = false) {
        self.id = id
        self.title = title
        self.isDone = isDone
    }
    
}
