//
//  FilmDetailScreen.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 3/7/26.
//

import SwiftUI

struct FilmDetailScreen: View {
    
    let film: Film
    @State private var viewModel = FilmDetailViewModel()
    var body: some View {
        VStack(alignment: .loading, content: () -> View) {
            Text(film.title)
            
            Divider()
            Text("Characters")
                .font(.title3)
            switch viewModel.state {
            case .idle: EmptyView()
            case .loading: ProgressView()
            case .loaded(let people):
                ForEach(people) { person in
                    Text(person.name)
                }
            case .error(let error):
                Text(error)
                    .foregroundStyle(.pink)
            }
        }
        .task {
            await viewModel.fetch(for: film)
        }
    }
    
}

#Preview {
    FilmDetailScreen(film: Film.example)
}
