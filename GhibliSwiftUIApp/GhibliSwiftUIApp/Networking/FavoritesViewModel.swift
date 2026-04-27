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
    private let service: FavoriteStorage
    
    init(service: FavoriteStorage = DefaultFavoriteStorage()) {
        self.service = service
    }
    
    func load() {
        favoriteIDs = service.load()
    }
    
    private func save() {
        service.save(favoriteIDs: favoriteIDs)
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
    
    //MARK: - preview
    static var example: FavoritesViewModel {
        let vm = FavoritesViewModel(service: MockFavoriteStorage())
        vm.favoriteIDs = ["12cfb892-aac0-4c5b-94af-521852e46d6a"]
        return vm
    }
}
