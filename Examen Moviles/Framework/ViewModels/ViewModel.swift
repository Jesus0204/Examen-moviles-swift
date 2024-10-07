//
//  ViewModel.swift
//  Examen Moviles
//
//  Created by Jesus Cedillo on 06/10/24.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var characters: [Character] = []
    @Published var searchText = ""
    @Published var currentPage = 1
    @Published var totalPages = 1
    @Published var isLoading = false
    
    // Llamas el requerimiento de user con sus funciones
    var getAllCharactersRequirement: GetAllCharactersRequirementProtocol
        
    init(getAllCharactersRequirement: GetAllCharactersRequirementProtocol = GetAllCharactersRequirement.shared) {
        self.getAllCharactersRequirement = getAllCharactersRequirement
    }
    
    // Creas las funciones con el @MainActor para que se ejecuten en el hilo principal
    @MainActor
    func getCharacters() async {
        self.isLoading = true
        let response = await getAllCharactersRequirement.getCharacters(page: currentPage)
        
        if response != nil {
            self.totalPages = response!.meta.totalPages
            self.currentPage = response!.meta.currentPage
            self.characters = response!.items
        }
        
        self.isLoading = false
    }
    
    var filteredCharacters: [Character] {
        if searchText.isEmpty {
            return characters
        } else {
            return characters.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func loadNextPage() async {
        currentPage = currentPage + 1
        let response = await getAllCharactersRequirement.getCharacters(page: currentPage)
        
        if response != nil {
            self.totalPages = response!.meta.totalPages
            self.currentPage = response!.meta.currentPage
            self.characters = response!.items
        }
    }
    
    func loadPreviousPage() async {
        currentPage = currentPage - 1
        let response = await getAllCharactersRequirement.getCharacters(page: currentPage)
        
        if response != nil {
            self.totalPages = response!.meta.totalPages
            self.currentPage = response!.meta.currentPage
            self.characters = response!.items
        }
    }

}
