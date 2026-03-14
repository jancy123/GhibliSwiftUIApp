//
//  ContentView.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 2/9/26.
//

import SwiftUI

struct ContentView: View {
    @State private var filmsViewModel = FilmsViewModel()
    
    var body: some View {
        TabView {
            
            Tab("Films", systemImage: "movieclapper") {
                FilmsScreen(filmsViewModel: filmsViewModel)
            }
            
            Tab("Favorites", systemImage: "heart") {
                FavoritesScreen(filmsViewModel: filmsViewModel)
            }
            Tab("Settings", systemImage: "gear") {
                SettingsScreen()
            }
            
            Tab(role: .search) {
                SearchScreen()
            }
        }
    
    }
}

#Preview {
    ContentView()
}
