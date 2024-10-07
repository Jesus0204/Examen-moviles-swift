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
