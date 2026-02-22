//
//  FilmsViewModel.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 2/9/26.
//
import Foundation
import Observation

enum APIError: LocalizedError {
    case invalidURL
    case decodingFailed
    case networkError(Error)
}

@Observable
class FilmsViewModel {
    
    enum State {
        case idle
        case loading
        case loaded([Film])
        case error(String)
    }
    var films: [Film] = []
    
    func fetchFilms() async throws {
        guard let url = URL(string: "https://ghibliapi.vercel.app/films") else { throw APIError.invalidURL }
        do {
            
                let (data, response) = try await URLSession.shared.data(from: url)
                films = try JSONDecoder().decode([Film].self, from: data)
        } catch {
         print(error)
     }
    }
}
