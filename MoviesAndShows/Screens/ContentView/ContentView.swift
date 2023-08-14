//
//  ContentView.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 11.08.2023.
//

import SwiftUI

struct ContentView<Item: WatchItem, Details: WatchItemDetails>: View {
    // MARK: - PROPERTIES

    @ObservedObject private var viewModel = ViewModel()

    // MARK: - BODY

    var body: some View {
        VStack {
            GenresListView(viewModel: viewModel.genresViewModel)

            ItemListView(viewModel: viewModel.itemsListViewModel)
        }
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView<Movie, MovieDetails>()
    }
}
