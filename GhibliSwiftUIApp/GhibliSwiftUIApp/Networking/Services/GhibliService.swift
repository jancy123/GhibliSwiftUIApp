//
//  GhibliService.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 2/27/26.
//

import Foundation

protocol GhibliService {
    func fetchFilms() async throws -> [Film]
    func fetchPerson(from URLString: String) async throws -> Person
    
    func searchFilm(for searchTerm: String) async throws -> [Film]
}
