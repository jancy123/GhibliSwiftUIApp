//
//  ContentView.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 2/9/26.
//

import SwiftUI

struct ContentView: View {
    @State private var filmsViewModel = FilmsViewModel()
    @State private var favoritesViewModel = FavoritesViewModel()
    
    var body: some View {
        TabView {
            
            Tab("Films", systemImage: "movieclapper") {
                FilmsScreen(filmsViewModel: filmsViewModel, favoritesViewModel: favoritesViewModel)
            }
            
            Tab("Favorites", systemImage: "heart") {
                FavoritesScreen(filmsViewModel: filmsViewModel, favoritesViewModel: favoritesViewModel)
            }
            Tab("Settings", systemImage: "gear") {
                SettingsScreen()
            }
            
            Tab(role: .search) {
                SearchScreen(favoritesViewModel: favoritesViewModel)
            }
        }
        .task {
            favoritesViewModel.load()
            await filmsViewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
