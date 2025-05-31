//
//  TodoTextField.swift
//  TodoApp
//
//  Created by Batuhan Gözegü on 31.05.2025.
//

import SwiftUI

struct TodoTextField: View {
    @Binding var text: String
    
    var placeHolder : String
    
    var body: some View {
        TextField(placeHolder,text: $text)
            .padding()
            .background(Color("TextFieldBackground"))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.4), lineWidth:1)
            )
    }
}
