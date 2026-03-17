//
//  FilmDetailScreen.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 3/7/26.
//

import SwiftUI

struct FilmDetailScreen: View {
    
    let film: Film
    let favoritesViewModel: FavoritesViewModel
    @State private var viewModel = FilmDetailViewModel()
    var isFavorite: Bool {
        favoritesViewModel.isFavorite(filmId: film.id)
    }
    var body: some View {
        VStack(alignment: .leading) {
            FilmImageView(urlPath: film.bannerImage)
                .frame(height: 230)
                .containerRelativeFrame(.horizontal)
            ScrollView {
                VStack(alignment: .leading) {
                    Text(film.title)
                    
                    Divider()
                    Text("Characters")
                        .font(.title3)
                    switch viewModel.state {
                    case .idle: EmptyView()
                    case .loading: ProgressView()
                    case .loaded(let people):
                        ForEach(people) { person in
                            Text(person.name)
                        }
                    case .error(let error):
                        Text(error)
                            .foregroundStyle(.pink)
                    }
                }
                .padding()
            }
        }.toolbar {
            FavoriteButton(filmId: film.id, favoritesViewModel: favoritesViewModel)
                  }
        
        .task(id: film) {
            await viewModel.fetch(for: film)
        }
    }
    
}


struct FavoriteButton: View {
    let filmId: String
    let favoritesViewModel: FavoritesViewModel
    var isFavorite: Bool {
        favoritesViewModel.isFavorite(filmId: filmId)
    }
    
    var body: some View {
        Button {
            favoritesViewModel.toggleFavorite(filmID: filmId)
        } label: {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .foregroundStyle(isFavorite ? Color.pink: Color.gray)
        }.buttonStyle(.plain)
            .controlSize(.large)
    }
}

#Preview {
    NavigationStack {
        FilmDetailScreen(film: Film.example, favoritesViewModel: FavoritesViewModel(service: MockFavoriteStorage()))
    }
}
