//
//  Bienvenida.swift
//  Examen Moviles
//
//  Created by Jesus Cedillo on 07/10/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct BienvenidaView: View {
    @State private var path: [Paths] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack {
                    
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .center)
                    
                    Spacer().frame(height: 40)
                    
                    Text("¡Bienvenido!")
                        .font(.title)
                    
                    Spacer().frame(height: 40)
                    
                    Text("¡Aquí podrás descrubir a todos los personajes de DragonBall!")
                    
                    Spacer().frame(height: 40)
                    
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
            .navigationDestination(for: Paths.self) { value in
                switch value {
                case .menu:
                    ContentView(path: $path)
                }
            }
        }
    }
}

#Preview {
    BienvenidaView()
}
