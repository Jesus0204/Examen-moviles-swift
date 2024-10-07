//
//  Examen_MovilesApp.swift
//  Examen Moviles
//
//  Created by Jesus Cedillo on 06/10/24.
//

import SwiftUI

@main
struct Examen_MovilesApp: App {
    
    init() {
        let appearance = UINavigationBarAppearance()
        
        let darkerYellow = UIColor(red: 247.0 / 255.0, green: 148.0 / 255.0, blue: 30.0 / 255.0, alpha: 1.0)
        
        appearance.backButtonAppearance.normal.titleTextAttributes = [
            .foregroundColor: darkerYellow,
            .underlineStyle: 0
        ]
        if let backImage = UIImage(systemName: "chevron.left")?.withTintColor(darkerYellow, renderingMode: .alwaysOriginal) {
            appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
        }
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance

        UINavigationBar.appearance().tintColor = darkerYellow
    }
    
    var body: some Scene {
        WindowGroup {
            BienvenidaView()
        }
    }
}
