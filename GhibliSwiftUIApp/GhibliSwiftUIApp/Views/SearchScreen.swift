//
//  SearchScreen.swift
//  GhibliSwiftUIApp
//
//  Created by Jancy on 3/12/26.
//

import SwiftUI

struct SearchScreen: View {
    
    @State private var text: String = ""
    
    var body: some View {
        NavigationStack {
            Text("Search goes here")
                .searchable(text: $text)
        }
    }
}

#Preview {
    SearchScreen()
}
