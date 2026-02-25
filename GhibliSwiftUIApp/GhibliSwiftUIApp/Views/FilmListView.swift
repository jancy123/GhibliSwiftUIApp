//
//  FilmListView.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 2/9/26.
//

import SwiftUI

struct FilmListView: View {
    
    @State private var filmsViewModel = FilmsViewModel()
    
    var body: some View {
        
        switch filmsViewModel.state {
        case .idle:
            Text("No films yet")
                .task {
                    await filmsViewModel.fetch()
                }
        case .loading:
            ProgressView {
                Text("Loading...")
            }
        case .loaded(let films):
            List(films) {
                Text($0.title)
            }
        case .error(let error):
            Text(error)
                .foregroundStyle(.pink)
        }
        
    }
}

#Preview {
    FilmListView()
}
