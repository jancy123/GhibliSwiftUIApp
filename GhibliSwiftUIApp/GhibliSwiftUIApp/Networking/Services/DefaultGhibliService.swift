//
//  DefaultGhibliService.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 2/27/26.
//
import Foundation
struct DefaultGhibliService: GhibliService {
    
    
    func fetch<T: Decodable>(from URLString: String, type: T.Type) async throws -> T {
        /* I am just learning what utf8 means
         let data1 = Data("".utf8)
         */
       
        guard let url = URL(string: URLString) else {
            throw APIError.invalidURL }
        do {
            print("url>> \(url)")
                let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw APIError.invalidResponse
            }
                return try JSONDecoder().decode(type, from: data)
        } catch let error as DecodingError {
            throw APIError.decodingError(error)
        }
//            catch let DecodingError.typeMismatch(type, context) {
//            print("Type '\(type)' mismatch:", context.debugDescription)
//            print("CodingPath:", context.codingPath)
//            throw APIError.decodingError("Type '\(context.debugDescription)' mismatch:")
//        }
        catch let error as URLError {
            throw APIError.networkError(error)
        }
    }
    
   func fetchFilms() async throws -> [Film] {
       let url = "https://ghibliapi.vercel.app/films"
       return try await fetch(from: url, type: [Film].self)
    }
    
    func fetchPerson(from URLString: String) async throws -> Person {
        return try await fetch(from: URLString, type: Person.self)
    }
    
    func searchFilm(for searchTerm: String) async throws -> [Film] {
        let allFilms = try await fetchFilms()
        return allFilms.filter { film in
            film.title.localizedStandardContains(searchTerm)
        }
    }
}
