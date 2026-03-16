//
//  FilmListView.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 2/9/26.
//

import SwiftUI

struct FilmListView: View {
    var films: [Film]
    let favoritesViewModel: FavoritesViewModel
    var body: some View {
        
            
                List(films) { film in
                    NavigationLink(value: film) {
                        FilmRow(film: film, favoritesViewModel: favoritesViewModel)
                    }
                }
                .navigationDestination(for: Film.self) { film in
                    FilmDetailScreen(film: film)
                }
            
    }
}


private struct FilmRow: View {
    let film: Film
    let favoritesViewModel: FavoritesViewModel
    var body: some View {
        HStack {
            FilmImageView(urlPath: film.image)
                .frame(width: 100, height: 150)
            Text(film.title)
            Button {
                favoritesViewModel.toggleFavorite(filmID: film.id)
            } label: {
                Image(systemName: favoritesViewModel.isFavorite(filmId: film.id) ? "heart.fill" : "heart")
            }.buttonStyle(.plain)
        }
    }
}

/*
#Preview {
    @State @Previewable var vm = FilmsViewModel(service: MockGhibliService())
    FilmListView(filmsViewModel: vm)
}
*/
