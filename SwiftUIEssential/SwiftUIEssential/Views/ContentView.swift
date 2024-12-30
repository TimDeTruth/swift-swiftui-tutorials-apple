//
//  ContentView.swift
//  SwiftUIEssential
//
//  Created by Timmy Lau on 2024-12-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        LandmarkList()
 
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
