//
//  Repository.swift
//  Examen Moviles
//
//  Created by Jesus Cedillo on 06/10/24.
//

import Foundation

// Se crea el protocolo para que lo hereden la clase o el struct (como la base)
protocol APIProtocol {
    // TODO: Insertar funciones que lleva el Repository
}

// Crear nuestra clase PokemonRespository y heredar de nuestro protocolo PokemonAPIProtocol
class Repository: APIProtocol {
    
    // Singleton para que cada requerimiento pueda acceder al mismo archivo y clase (repositiorio con funciones de llamadas API
    static let shared = Repository()
    
    // Se crea la variable tipo NetworkAPIService con la librería Alamofire
    let apiService: APIService
    
    // Se inicializa con la variable singleton
    init(apiService: APIService = APIService.shared) {
            self.apiService = apiService
        }
    
    // TODO: Insertar funciones que llaman al Network (API Service) o Local Storage 
}
