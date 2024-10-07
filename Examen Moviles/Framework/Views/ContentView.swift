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
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
            Task {
                await viewModel.getCharacters()
            }
        }
    }
}

#Preview {
    ContentView()
}
