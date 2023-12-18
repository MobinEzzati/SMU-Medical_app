//
//  MedicalAppApp.swift
//  MedicalApp
//
//  Created by Mobin on 11/13/23.
//

import SwiftUI

@main
struct MedicalAppApp: App {
    @State var path = NavigationPath()

    
    var body: some Scene {
        WindowGroup {
            SignInView(path: $path)
        }
    }
}
