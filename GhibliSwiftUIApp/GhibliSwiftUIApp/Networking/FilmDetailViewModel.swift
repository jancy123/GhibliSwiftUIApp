//
//  FilmDetailViewModel.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 3/2/26.
//
import Foundation
import Observation

@Observable
class FilmDetailViewModel {
    var people: [Person] = []
    enum State: Equatable {
        case idle
        case loading
        case loaded([Person])
        case error(String)
    }
    var state: State = .idle
    
   
    private let service: GhibliService
    
    init(service: GhibliService = DefaultGhibliService()) {
        self.service = service
    }
    
    func fetch(for film: Film) async {
        guard state != .loading else { return }
        state = .loading
        var loadedPeople: [Person] = []
        do {
            try await withThrowingTaskGroup(of: Person.self) { group in
                for personInfoURL in film.people {
                    group.addTask {
                       return try await self.service.fetchPerson(from: personInfoURL)
                    }
                }
                // collect result as they complete
                for try await person in group {
                    loadedPeople.append(person)
                }
                state = .loaded(loadedPeople)
            }
        } catch let error as APIError {
            self.state = .error(error.errorDescription ?? "unknown error")
        } catch {
            self.state = .error(error.localizedDescription)
        }
    }
}
/*
import Playgrounds

 #Playground {
    let vm = FilmDetailViewModel
at 1:00:08
*/
