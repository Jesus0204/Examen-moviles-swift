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
        VStack(alignment: .leading, spacing: 10) {
            // Image and Basic Info
            HStack {
                WebImage(url: URL(string: character.image))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64, alignment: .center)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(character.name)
                        .font(.headline)
                    Text("Raza: \(character.race)")
                        .font(.subheadline)
                }
            }

            // Additional Information
            VStack(alignment: .leading, spacing: 5) {
                Text("Ki: \(character.ki) / \(character.maxKi)")
                    .font(.subheadline)
                Text("Género: \(character.gender)")
                Text("Afiliación: \(character.affiliation)")
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}
