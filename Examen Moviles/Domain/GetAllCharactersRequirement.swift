//
//  Requirement.swift
//  Examen Moviles
//
//  Created by Jesus Cedillo on 06/10/24.
//

protocol GetAllCharactersRequirementProtocol {
    func getCharacters (page: Int) async -> Response?
}

// Creas la clase con el protocolo (pruebas unitarias)
class GetAllCharactersRequirement: GetAllCharactersRequirementProtocol {
    
    // Singleton para que el ViewModel acceda a la historia de usuario
    static let shared = GetAllCharactersRequirement()
    
    let dataRepository: Repository
    
    // Inicializas la instancia con el repositorio 
    init(dataRepository: Repository = Repository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getCharacters (page: Int) async -> Response? {
        return await dataRepository.getCharacters(page: page)
    }
}

