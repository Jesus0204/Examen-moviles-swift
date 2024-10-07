//
//  CoordinatorView.swift
//  Examen Moviles
//
//  Created by Jesus Cedillo on 06/10/24.
//

import FlowStacks
import SwiftUI

struct CoordinatorView: View {
    // Se crea el arreglo con los casos de las vistas
    @State var routes: [Route<Screen>] = []
    
    enum Screen: Hashable {
        // TODO: Insertar los casos para navegar a las diferentes vistas
        case ejemplo
    }
    
    var body: some View {
        
        FlowStack($routes, withNavigation: true) {
            // TODO: Insertar la vista principal
            ContentView(
                
            )
            .flowDestination(for: Screen.self) { screen in
                switch screen {
                    // TODO: Insertar los demas casos que no sean la vista principal
                case .ejemplo:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    CoordinatorView()
}
