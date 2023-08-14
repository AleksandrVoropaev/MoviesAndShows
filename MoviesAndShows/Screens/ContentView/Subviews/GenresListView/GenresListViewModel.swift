//
//  GenresListViewModel.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 12.08.2023.
//

import Foundation

extension GenresListView {
    @MainActor final class ViewModel: ObservableObject {
        // MARK: - PROPERTIES

        @Published var genres: [Genre] = []
        @Published var selectedGenre: Genre?

        private let apiClient: TMDBAPIClient

        // MARK: - INIT

        init(apiClient: TMDBAPIClient = TMDBAPIClientImpl()) {
            self.apiClient = apiClient

            getGenres()
        }

        // MARK: - PUBLIC FUNCTIONS

        func didSelect(_ genre: Genre) {
            selectedGenre = genre
        }

        // MARK: - PRIVATE FUNCTIONS

        private func getGenres() {
            Task {
                switch await fetchGenres() {
                case .success(let result):
                    genres = result
                    selectedGenre = genres.first
                case .failure(let error):
                    genres = []
                    selectedGenre = nil
                }
            }
        }

        private func fetchGenres() async -> Result<[Genre], GeneralError> {
            switch Item.self {
            case is Movie.Type:
                return await apiClient.fetchMoviesGenres()
            case is Show.Type:
                return await apiClient.fetchShowsGenres()
            default:
                return .failure(.unknown)
            }
        }
    }
}
