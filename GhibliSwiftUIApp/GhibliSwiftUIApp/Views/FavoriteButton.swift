//
//  FavoriteButton.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 3/17/26.
//


import SwiftUI

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