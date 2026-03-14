//
//  FilmListView.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 2/9/26.
//

import SwiftUI

struct FilmListView: View {
    var films: [Film]
    
    var body: some View {
        
            
                List(films) { film in
                    NavigationLink(value: film) {
                        HStack {
                            FilmImageView(urlPath: film.image)
                                .frame(width: 100, height: 150)
                            Text(film.title)
                        }
                    }
                }
                .navigationDestination(for: Film.self) { film in
                    FilmDetailScreen(film: film)
                }
            
    }
}

/*
#Preview {
    @State @Previewable var vm = FilmsViewModel(service: MockGhibliService())
    FilmListView(filmsViewModel: vm)
}
*/
