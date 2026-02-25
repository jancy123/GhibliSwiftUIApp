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
    case invalidResponse
    case decoding(Error)
    case networkError(Error)
}

@Observable
class FilmsViewModel {
    
    enum State: Equatable {
        case idle
        case loading
        case loaded([Film])
        case error(String)
    }
    var films: [Film] = []
    var state: State = .idle
    func fetch() async {
        guard state == .idle else { return }
        state = .idle
        do {
            let films = try await fetchFilms()
            self.state = .loaded(films)
            self.state = .loading
        } catch {
            
        }
    }
    private func fetchFilms() async throws -> [Film] {
        guard let url = URL(string: "https://ghibliapi.vercel.app/films") else {
            throw APIError.invalidURL }
        do {
            
                let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw APIError.invalidResponse
            }
            
                return try JSONDecoder().decode([Film].self, from: data)
        } catch let error as DecodingError {
            throw APIError.decoding(error)
        } catch let error as URLError {
            throw APIError.networkError(error)
        }
    }
}
