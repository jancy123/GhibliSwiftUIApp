//
//  Film.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 2/9/26.
//

import Foundation

struct Film: Codable, Identifiable, Equatable, Hashable {
    let id: String
    let title: String
    let description: String
    let director: String
    let producer: String
    
    let releaseYear: String
    let duration: String
    let score: String
    
    let image: String
    let bannerImage: String
    
    let people: [String]
    enum CodingKeys: String, CodingKey {
        case id, title, image, description, director, producer, people
        case bannerImage = "movie_banner"
        case releaseYear = "release_date"
        case duration = "running_time"
        case score = "rt_score"
    }
    
    //MARK: Preview
    
    static var example: Film {
        MockGhibliService().fetchFilm()[0]
    }
    
    static var exampleFavorite: Film {
        MockGhibliService().fetchFilm()[1]
    }
}

/*
 download xcode 26 in video 14: 50 timestamp
 import Playgrounds
 
 #Playground {
    do {
    let url = URLString(string: "https://ghibliapi")!
    let (data, response) = try await URLSession.shared.data(from: url)
    try JSONDecoder().decode([Films]).decode([Film].self, from: data)
    } catch {
     print(error)
 }
 
 }
 
 */

