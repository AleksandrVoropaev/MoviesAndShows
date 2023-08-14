//
//  ItemViewModel.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 13.08.2023.
//

import Foundation

extension ItemView {
    @MainActor final class ViewModel: ObservableObject {
        // MARK: - PROPERTIES

        @Published var item: Item
        @Published var details: Details?

        private let apiClient: TMDBAPIClient

        // MARK: - INIT

        init(apiClient: TMDBAPIClient = TMDBAPIClientImpl(), item: Item) {
            self.item = item
            self.apiClient = apiClient

            getDetails()
        }

        // MARK: - PRIVATE FUNCTIONS
        
        private func getDetails() {
            Task {
                switch await fetchDetails() {
                case .success(let result):
                    details = result
                case .failure(let error):
                    print(error)
                }
            }
        }

        private func fetchDetails() async -> Result<Details, GeneralError> {
            switch Details.self {
            case is MovieDetails.Type:
                return await apiClient.fetchMovieDetails(id: item.id)
            case is ShowDetails.Type:
                return await apiClient.fetchShowDetails(id: item.id)
            default:
                return .failure(.unknown)
            }
        }
    }
}   
