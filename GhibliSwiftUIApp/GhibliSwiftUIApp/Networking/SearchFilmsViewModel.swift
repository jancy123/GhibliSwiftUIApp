//
//  SearchFilmsViewModel.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 3/18/26.
//

import Foundation
import Observation

@Observable

class SearchFilmsViewModel {
    var state: LoadingState<[Film]> = .idle
    
    private let service: GhibliService
    
    init(service: GhibliService = DefaultGhibliService()) {
        self.service = service
    }
    
    func fetch(for searchTerm: String) async {
        try? await Task.sleep(for: .milliseconds(500))
        guard !Task.isCancelled else { return }
        
        
        //guard !state.isLoading || state.error != nil else { return }
        self.state = .loading
        do {
            
            let films = try await service.searchFilm(for: searchTerm)
            self.state = .loaded(films)
            
        } catch let error as APIError {
            self.state = .error(error.errorDescription ?? "unknown error")
        } catch {
            self.state = .error(error.localizedDescription)
        }
    }
}
