//
//  GenresListView.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 11.08.2023.
//

import SwiftUI

struct GenresListView<Item: WatchItem, Details: WatchItemDetails>: View {
    // MARK: - PROPERTIES

    @ObservedObject var viewModel: ViewModel

    // MARK: - BODY

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.genres) { genre in
                    Text(genre.name)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                        .background(genre == viewModel.selectedGenre ? Color.accentColor : .white)
                        .foregroundColor(genre == viewModel.selectedGenre ? .white : .accentColor)
                        .clipShape(Capsule())
                        .gesture(
                            TapGesture()
                                .onEnded {
                                    viewModel.didSelect(genre)
                                }
                        )
                }
            }
        }
    }
}

// MARK: - PREVIEW

struct GenresListView_Previews: PreviewProvider {
    static var previews: some View {
        GenresListView<Movie, MovieDetails>(viewModel: .init())
    }
}
