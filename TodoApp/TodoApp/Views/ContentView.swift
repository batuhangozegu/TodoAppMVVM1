//
//  ContentView.swift
//  TodoApp
//
//  Created by Batuhan Gözegü on 31.05.2025.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @StateObject private var viewModel = TodoViewModel()
    
    
    var body: some View {
        GeometryReader { geometry in
            
            let genislik = geometry.size.width
            let yukseklik = geometry.size.height
            NavigationView{
                VStack (spacing: genislik * 0.02){
                    HStack(spacing: genislik * 0.03){
                        TodoTextField(text: $viewModel.newTaskTitle, placeHolder: "Görev Başlığı")
                            .frame(width: genislik*0.75,height: yukseklik * 0.06)
                        TodoAddButton(action:{
                            viewModel.addTask()
                        },isDisabled: viewModel.newTaskTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    }
                    List{
                        ForEach(viewModel.todos){ todo in
                            TodoRowView(todo: todo) {
                                        viewModel.toggleDone(for: todo)
                                    }
                        }
                        .onDelete(perform: viewModel.delete)
                    }.listStyle(.plain)
                }
                .padding()
                .navigationTitle("ToDo Listesi")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing){
                        Button{
                            isDarkMode.toggle()
                        } label:{
                            Image(systemName: isDarkMode ? "sun.max.fill" : "moon")
                        }
                    }
                }
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
#Preview {
    ContentView()
}
