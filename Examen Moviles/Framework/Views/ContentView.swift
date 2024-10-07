//
//  ContentView.swift
//  Examen Moviles
//
//  Created by Jesus Cedillo on 06/10/24.
//

import SwiftUI

struct ContentView: View {
    // Importas el viewmodel con @StateObject
    @StateObject var viewModel = ViewModel()
    
    @Binding var path: [Paths]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            
            Text("")
            TextField("Busca por Nombre...", text: $viewModel.searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            HStack {
                if viewModel.currentPage != 1 {
                    Button(action: {
                        Task {
                            await viewModel.loadPreviousPage()
                        }
                    }, label: {
                        Text("Previous")
                            .padding()
                            .background(.yellow)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    })
                }
                Spacer()
                
                if viewModel.currentPage != viewModel.totalPages {
                    
                    Button(action: {
                        Task {
                            await viewModel.loadNextPage()
                        }
                    }, label: {
                        Text("Next")
                            .padding()
                            .background(.yellow)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    })
                }
            }
            .padding(.horizontal)

            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.filteredCharacters) { character in
                        CharacterCard(character: character)
                    }
                }
                .padding()
            }
        }
        .onAppear {
            Task {
                await viewModel.getCharacters()
            }
        }
        .navigationTitle("Personajes de Dragon Ball")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        @State var path: [Paths] = []

        var body: some View {
            ContentView(path: $path)
        }
    }
}
