//
//  SearchScreen.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 3/12/26.
//

import SwiftUI

struct SearchScreen: View {
    
    @State private var text: String = ""
    @State private var searchViewModel: SearchFilmsViewModel
    let favoritesViewModel: FavoritesViewModel
    
    init(service: GhibliService = DefaultGhibliService(), favoritesViewModel: FavoritesViewModel) {
        self.searchViewModel = SearchFilmsViewModel(service: service)
        self.favoritesViewModel = favoritesViewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                switch searchViewModel.state {
                case .idle:
                    Text("Search goes here")
                case .loading:
                    ProgressView()
                case .loaded(let films):
                    FilmListView(films: films, favoritesViewModel: favoritesViewModel)
                case .error(let error):
                    Text(error)
                }
            }
            
                .searchable(text: $text)
                .task(id: text) {
                    await searchViewModel.fetch(for: text)
                }
        }
    }
}

#Preview {
    //SearchScreen()
}
