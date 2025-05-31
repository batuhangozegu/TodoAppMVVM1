//
//  TodoAddButton.swift
//  TodoApp
//
//  Created by Batuhan Gözegü on 31.05.2025.
//

import SwiftUI

struct TodoAddButton: View {
    var action : () -> Void
    var isDisabled : Bool = false
    
    var body: some View {
        Button(action: action){
            Image(systemName: "plus")
                .foregroundStyle(.white)
                .frame(width:40,height: 40)
                .background(isDisabled ? Color("ButtonDisabled") : Color("ButtonActive"))
                .clipShape(Circle())
        }
        .disabled(isDisabled)
    }
}

