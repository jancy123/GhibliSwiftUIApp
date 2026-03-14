//
//  FavoritesScreen.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 3/12/26.
//

import SwiftUI

struct FavoritesScreen: View {
    let filmsViewModel: FilmsViewModel
    
    var films: [Film] {
        //TODO: get favorites
        // retrieve ids from storage from films data
        return []
    }
    var body: some View {
        NavigationStack {
            Group {
                if films.isEmpty {
                    ContentUnavailableView("No Favorites yet", systemImage: "heart")
                } else {
                    FilmListView(films: films)
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavoritesScreen(filmsViewModel: FilmsViewModel(service: MockGhibliService()))
}
