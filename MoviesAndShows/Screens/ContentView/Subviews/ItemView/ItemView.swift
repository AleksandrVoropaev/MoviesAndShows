//
//  ItemView.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 11.08.2023.
//

import SwiftUI

struct ItemView<Item: WatchItem, Details: WatchItemDetails>: View {
    // MARK: - PROPERTIES

    @ObservedObject var viewModel: ViewModel

    // MARK: - BODY

    var body: some View {
        VStack {
            HStack {
                Spacer()
                LoadingImage(url: viewModel.item.posterURL)
                Spacer()
            }

            Text(viewModel.item.title)
                .multilineTextAlignment(.center)
                .font(.headline)

            Text("Rating: " + String(format: "%.1f", viewModel.item.voteAverage))

            if let details = viewModel.details {
                Text(details.firstSubtitle)
                Text(details.secondSubtitle)
            }

            Spacer()
        }
        .font(.footnote)
    }
}

// MARK: - PREVIEW

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        if let mock = Movie.mock {
            ItemView<Movie, MovieDetails>(viewModel: .init(item: mock))
        } else {
            EmptyView()
        }
    }
}
