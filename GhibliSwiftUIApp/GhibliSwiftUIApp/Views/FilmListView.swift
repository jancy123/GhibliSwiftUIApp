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
        List(filmsViewModel.films) {
            Text($0.title)
        }
    }
}

#Preview {
    FilmListView()
}
