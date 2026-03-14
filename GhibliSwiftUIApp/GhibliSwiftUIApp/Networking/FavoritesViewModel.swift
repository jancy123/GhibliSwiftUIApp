//
//  FavoritesViewModel.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 3/14/26.
//

import Foundation
import Observation

@Observable
class FavoritesViewModel {
    private(set) var favoriteIDs: Set<String> = []
    private let favoritesKey = "GhibliExplorer.FavoriteFilms"
    
    func load() {
        let array = UserDefaults.standard.stringArray(forKey: favoritesKey) ?? []
        favoriteIDs = Set(array)
    }
    
    func save() {
        UserDefaults.standard.set(favoriteIDs, forKey: favoritesKey)
    }
    
    func toggleFavorite(filmID: String) {
        if favoriteIDs.contains(filmID) {
            favoriteIDs.remove(filmID)
        } else {
            favoriteIDs.insert(filmID)
        }
        save()
    }
    
    func isFavorite(filmId: String) -> Bool {
        favoriteIDs.contains(filmId)
    }
}
