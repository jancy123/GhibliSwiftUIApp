//
//  Film.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 2/9/26.
//

import Foundation

struct Film: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let director: String
    let producer: String
    
    let releaseYear: String
    let duration: Int
    let score: String
    
    let image: String
    let bannerImage: String
    
    let people: [People]
    enum CodingKeys: String, CodingKey {
        case id, title, image, description, director, producer, people
        case bannerImage = "movie_banner"
        case releaseYear = "release_date"
        case duration = "running_time"
        case score = "rt_score"
       
    }
}
