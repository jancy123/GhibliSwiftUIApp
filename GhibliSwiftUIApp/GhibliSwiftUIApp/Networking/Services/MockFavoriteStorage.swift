//
//  MockFavoriteStorage.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 3/14/26.
//

import Foundation
struct MockFavoriteStorage: FavoriteStorage {
    private let favoritesKey = "GhibliExplorer.FavoriteFilms"

    
    func load() -> Set<String> {
        return ["2baf70d1-42bb-4437-b551-e5fed5a87abe"]
    }
    
    func save(favoriteIDs: Set<String>) {
        //UserDefaults.standard.set(favoriteIDs, forKey: favoritesKey)
    }
    
    
}
