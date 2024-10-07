//
//  CharacterCard.swift
//  Examen Moviles
//
//  Created by Jesus Cedillo on 07/10/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterCard: View {
    let character: Character

    var body: some View {
        VStack {
            WebImage(url: URL(string: character.image))
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())

            Text(character.name)
                .font(.headline)
            Text("Raza: \(character.race)")
                .font(.subheadline)
            Text("Ki: \(character.ki) / \(character.maxKi)")
                .font(.subheadline)
            
            Text("Género: \(character.gender)")
            Text("Afiliación: \(character.affiliation)")
            Text("Descripción: \(character.description)")
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}
