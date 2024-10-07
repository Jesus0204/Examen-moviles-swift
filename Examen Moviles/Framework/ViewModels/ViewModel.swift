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
    var getAllCharactersRequirement: GetAllCharactersRequirementProtocol
        
    init(getAllCharactersRequirement: GetAllCharactersRequirementProtocol = GetAllCharactersRequirement.shared) {
        self.getAllCharactersRequirement = getAllCharactersRequirement
    }
    
    // Creas las funciones con el @MainActor para que se ejecuten en el hilo principal
    @MainActor
    func getCharacters() async {
        let response = await getAllCharactersRequirement.getCharacters(page: 1)
    }
}
