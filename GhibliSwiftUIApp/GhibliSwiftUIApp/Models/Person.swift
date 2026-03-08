//
//  People.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 2/9/26.
//

struct Person: Identifiable, Decodable, Equatable {
    let id: String
    let name: String
    let gender: String
    let age: String
    let eyeColor: String
    let hairColor: String
    let films: [String]
    let species: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, gender, age, films, species, url
        case eyeColor = "eye_color"
        case hairColor = "hair_color"
    }
}



/*
 import Playgrounds
 
 #Playground
 do {
 let url = URLString(string: "https://ghibliapi.vercel.app/people/986faac6-67e3-4fb8-a9ee-bad077c2e7fe"")!
    let (data, response) = try await URLSession.shared.data(from: url)
  try JSONDecoder().decode([People], from: data)
 } catch {
    print(error)
 }
 
 */
