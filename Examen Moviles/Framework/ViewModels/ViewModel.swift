//
//  ViewModel.swift
//  Examen Moviles
//
//  Created by Jesus Cedillo on 06/10/24.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var characters: [Character] = []
    @Published var searchText: String = ""
    @Published var selectedGender: String = ""
    @Published var selectedAffiliation: String = ""
    @Published var selectedRace: String = ""
    @Published var minKi: String = ""
    @Published var maxKi: String = ""
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
        characters.filter { character in
            // Filtrado por nombre
            let matchesSearchText = searchText.isEmpty || character.name.lowercased().contains(searchText.lowercased())
            
            // Filtrado por género
            let matchesGender = selectedGender.isEmpty || character.gender.lowercased() == selectedGender.lowercased()
            
            // Filtrado por afiliación
            let matchesAffiliation = selectedAffiliation.isEmpty || character.affiliation.lowercased() == selectedAffiliation.lowercased()
            
            // Filtrado por raza
            let matchesRace = selectedRace.isEmpty || character.race.lowercased() == selectedRace.lowercased()
            
            // Filtrado por Ki
            let characterKi = Int(character.ki) ?? 0
            let characterMaxKi = Int(character.maxKi) ?? 0
            let minKiValue = Int(minKi) ?? 0
            let maxKiValue = Int(maxKi) ?? Int.max
            let matchesKi = characterKi >= minKiValue && characterMaxKi <= maxKiValue

            return matchesSearchText && matchesGender && matchesAffiliation && matchesRace && matchesKi
        }
    }
    
    @MainActor
    func loadNextPage() async {
        currentPage = currentPage + 1
        let response = await getAllCharactersRequirement.getCharacters(page: currentPage)
        
        if response != nil {
            self.totalPages = response!.meta.totalPages
            self.currentPage = response!.meta.currentPage
            self.characters = response!.items
        }
    }
    
    @MainActor
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
