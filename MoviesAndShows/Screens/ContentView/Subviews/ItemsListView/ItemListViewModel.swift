//
//  ItemListViewModel.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 13.08.2023.
//

import Foundation

extension ItemListView {
    @MainActor final class ViewModel: ObservableObject {
        // MARK: - PROPERTIES

        @Published var itemsViewModels: [ItemView<Item, Details>.ViewModel] = []
        var canLoadMore: Bool { page < min(10, totalPages) }

        private let pageSize: Int = 10
        private var page = 0
        private var totalPages = 1

        private var genres: [Genre] = []
        private var task: Task<(), Never>?

        private let apiClient: TMDBAPIClient

        // MARK: - INIT

        init(apiClient: TMDBAPIClient = TMDBAPIClientImpl()) {
            self.apiClient = apiClient
        }

        // MARK: - PUBLIC FUNCTIONS

        func onAppear(item: WatchItem) {
            if item.id == itemsViewModels.last?.item.id, !genres.isEmpty {
                loadItems(with: genres)
            }
        }

        func reload() {
            loadItems(with: genres, shouldReload: true)
        }

        func loadItems(with genres: [Genre], shouldReload: Bool = false) {
            if genres != self.genres || shouldReload {
                self.genres = genres
                itemsViewModels = []
                page = 0
            }

            task?.cancel()
            task = Task {
                switch await fetchItems(with: genres) {
                case .success(let result):
                    itemsViewModels += result.map { ItemView<Item, Details>.ViewModel(apiClient: apiClient, item: $0) }
                case .failure(.decode(let error)):
                    itemsViewModels = []
                case .failure(let error):
                    itemsViewModels = []
                }
            }
        }

        // MARK: - PRIVATE FUNCTIONS

        private func fetchItems(with genres: [Genre]) async -> Result<[Item], GeneralError> {
            guard canLoadMore else {
                return .success([])
            }

            switch Item.self {
            case is Movie.Type:
                return await apiClient.fetchMovies(with: genres, page: page + 1)
                    .map(mapResults)
            case is Show.Type:
                return await apiClient.fetchShows(with: genres, page: page + 1)
                    .map(mapResults)
            default:
                return .failure(.unknown)
            }
        }

        private func mapResults(response: WatchItemsResponse<Item>) -> [Item] {
            page = response.page
            totalPages = response.totalPages

            return response.results
        }
    }
}
