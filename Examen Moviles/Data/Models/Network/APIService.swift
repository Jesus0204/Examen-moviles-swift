//
//  APIService.swift
//  Examen Moviles
//
//  Created by Jesus Cedillo on 06/10/24.
//

import Foundation
import Alamofire

class APIService {
    
    // El singleton para usar el APIService desde el Repository
    static let shared = APIService()
    
    func getCharacters (url: URL, page: Int) async -> Response? {
        
        let parameters : Parameters = [
            "page": page,
            "limit" : 10
        ]
        
        let taskRequest = AF.request(url, method: .get, parameters: parameters).validate()
        let response = await taskRequest.serializingData().response

        // Como el result guarda success o failure haces un switch con el caso
        switch response.result {
        case .success(let data):
            do {
                // Usando el JSONDecorder transforma la información de data para pasarlo a Pokedex
                return try JSONDecoder().decode(Response.self, from: data)
            } catch {
                debugPrint(error.localizedDescription)
                return nil
            }
            // En caso de error imprimes dicho error
        case let .failure(error):
            debugPrint(error.localizedDescription)
            return nil
        }
    }
}
