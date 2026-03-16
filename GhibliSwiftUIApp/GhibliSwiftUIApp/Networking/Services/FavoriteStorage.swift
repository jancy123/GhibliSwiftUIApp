//
//  FavoriteStorage.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 3/14/26.
//

import Foundation

protocol FavoriteStorage {
    func load() -> Set<String>
    func save(favoriteIDs: Set<String>)
}
