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
                        Image(systemName: "arrow.backward.circle")
                            .foregroundColor(Color(red: 247.0 / 255.0, green: 148.0 / 255.0, blue: 30.0 / 255.0))
                            .font(.system(size: 30))
                            
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                }
                Spacer()
                
                if viewModel.currentPage != viewModel.totalPages {
                    
                    Button(action: {
                        Task {
                            await viewModel.loadNextPage()
                        }
                    }, label: {
                        Image(systemName: "arrow.forward.circle")
                            .foregroundColor(Color(red: 247.0 / 255.0, green: 148.0 / 255.0, blue: 30.0 / 255.0))
                            .font(.system(size: 30))
                    })
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal)

            
            ScrollView {
                ForEach(viewModel.filteredCharacters) { character in
                    CharacterCard(character: character)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                }
                .padding(.horizontal)
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
