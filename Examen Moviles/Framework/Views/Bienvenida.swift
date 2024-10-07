//
//  Bienvenida.swift
//  Examen Moviles
//
//  Created by Jesus Cedillo on 07/10/24.
//

import SwiftUI

struct BienvenidaView: View {
    @State private var path: [Paths] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack {
                    
                    
                    Text("¡Bienvenido!")
                        .font(.title)
                    
                    Text("¡Aquí podrás descrubir a todos los personajes de DragonBall!")
                    
                    CustomButton(
                        text: "¡Entra!",
                        backgroundColor: Color.orange,
                        foregroundColor: Color.white,
                        action: {
                            path.append(.menu)
                        }
                    )
                    
                }
                .padding()
            }
        }
        .navigationDestination(for: Paths.self) { value in
            switch value {
            case .menu:
                ContentView(path: $path)
            }
        }
    }
}

#Preview {
    BienvenidaView()
}
