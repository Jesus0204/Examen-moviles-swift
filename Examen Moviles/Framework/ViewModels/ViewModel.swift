//
//  ViewModel.swift
//  Examen Moviles
//
//  Created by Jesus Cedillo on 06/10/24.
//

import Foundation

class ViewModel: ObservableObject {
    
    // TODO: Insertar variables tipo @Published para que el View puede observar cambios
    @Published var variable = ""
    
    // Llamas el requerimiento de user con sus funciones
    var requirement: RequirementProtocol
        
    init(requirement: RequirementProtocol = Requirement.shared) {
        self.requirement = requirement
    }
    
    // Creas las funciones con el @MainActor para que se ejecuten en el hilo principal
    @MainActor
    func funcion() {
        // TODO: Insertar llamadas a la función al requirement
    }
}
