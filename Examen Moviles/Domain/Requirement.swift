//
//  Requirement.swift
//  Examen Moviles
//
//  Created by Jesus Cedillo on 06/10/24.
//

protocol RequirementProtocol {
    // TODO: Insertar las funciones del requirement
}

// Creas la clase con el protocolo (pruebas unitarias)
class Requirement: RequirementProtocol {
    
    // Singleton para que el ViewModel acceda a la historia de usuario
    static let shared = Requirement()
    
    let dataRepository: Repository
    
    // Inicializas la instancia con el repositorio 
    init(dataRepository: Repository = Repository.shared) {
        self.dataRepository = dataRepository
    }
    
    // TODO: Insertar las funciones del requirement que llaman al repository
}

