//
//  ItemListView.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 11.08.2023.
//

import SwiftUI

struct ItemListView<Item: WatchItem, Details: WatchItemDetails>: View {
    // MARK: - PROPERTIES

    @ObservedObject var viewModel: ViewModel

    let columns = Array(
        repeating: GridItem(.flexible()),
        count: 2
    )

    // MARK: - BODY

    var body: some View {
        if #available(iOS 15.0, *) {
            ScrollView {
                content
            }
            .refreshable {
                viewModel.reload()
            }
        } else {
            content
                .refreshableScrollView {
                    viewModel.reload()
                }
        }
    }

    // MARK: - CONTENT
    
    var content: some View {
        LazyVGrid(columns: columns) {
            ForEach(viewModel.itemsViewModels, id: \.item.id) { viewModel in
                ItemView(viewModel: viewModel)
                    .padding()
                    .onAppear {
                        self.viewModel.onAppear(item: viewModel.item)
                    }
            }

            if viewModel.canLoadMore {
                HStack {
                    Divider()
                    ProgressView()
                }
            }
        }
    }
}

// MARK: - PREVIEW

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView<Movie, MovieDetails>(viewModel: .init())
    }
}
