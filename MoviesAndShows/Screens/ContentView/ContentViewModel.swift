//
//  ContentViewModel.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 12.08.2023.
//

import Foundation
import Combine

extension ContentView {
    @MainActor final class ViewModel: ObservableObject {
        // MARK: - PROPERTIES

        @Published var items: [WatchItem] = []

        let genresViewModel: GenresListView<Item, Details>.ViewModel
        let itemsListViewModel: ItemListView<Item, Details>.ViewModel

        private let apiClient: TMDBAPIClient
        private var cancellables = Set<AnyCancellable>()

        // MARK: - INIT

        init(apiClient: TMDBAPIClient = TMDBAPIClientImpl()) {
            self.apiClient = apiClient
            genresViewModel = .init(apiClient: apiClient) //, state: state)
            itemsListViewModel = .init(apiClient: apiClient) //, state: state)
            bindViewModels()
        }

        // MARK: - PRIVATE FUNCTIONS

        private func bindViewModels() {
            genresViewModel.$selectedGenre
                .sink { [weak self] genre in
                    guard let self, let genre else { return }
                    
                    self.itemsListViewModel.loadItems(with: [genre])
                }
                .store(in: &cancellables)
        }
    }
}
