//
//  SwiftUIEssentialApp.swift
//  SwiftUIEssential
//
//  Created by Timmy Lau on 2024-12-16.
//

import SwiftUI

@main
struct SwiftUIEssentialApp: App {
    
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(ModelData())
        }
    }
}
