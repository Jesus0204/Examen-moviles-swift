//
//  CustumButton.swift
//  Examen Moviles
//
//  Created by Jesus Cedillo on 06/10/24.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var backgroundColor: Color
    var foregroundColor: Color = .black
    var action: () -> Void
    var tieneIcono: Bool?
    var icono: String?

    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                    .font(.subheadline)
                    .bold()

                if tieneIcono ?? false {
                    Image(systemName: icono ?? "chevron.right")
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(10)
        }
        .buttonStyle(PlainButtonStyle())
        .contentShape(Rectangle())
        .shadow(color: .yellow, radius: 5) 
    }
}
