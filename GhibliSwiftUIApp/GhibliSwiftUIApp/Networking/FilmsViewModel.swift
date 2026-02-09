//
//  FilmsViewModel.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 2/9/26.
//
import Foundation
import Observation

@Observable
class FilmsViewModel {
    var films: [Film] = []
    
    func fetchFilms() async {
        do {
        let url = URL(string: "https://ghibliapi")!
        let (data, response) = try await URLSession.shared.data(from: url)
        films = try JSONDecoder().decode([Film].self, from: data)
        } catch {
         print(error)
     }
    }
}
