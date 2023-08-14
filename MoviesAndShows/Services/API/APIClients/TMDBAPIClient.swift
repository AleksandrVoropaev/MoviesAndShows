//
//  TMDBAPIClient.swift
//
//  Created by Oleksandr Voropayev
//

import Foundation

protocol TMDBAPIClient {
    func fetchMoviesGenres() async -> Result<[Genre], GeneralError>
    func fetchMovies<Item: WatchItem>(with genres: [Genre], page: Int) async -> Result<WatchItemsResponse<Item>, GeneralError>
    func fetchMovieDetails<Details: WatchItemDetails>(id: Int) async -> Result<Details, GeneralError>

    func fetchShowsGenres() async -> Result<[Genre], GeneralError>
    func fetchShows<Item: WatchItem>(with genres: [Genre], page: Int) async -> Result<WatchItemsResponse<Item>, GeneralError>
    func fetchShowDetails<Details: WatchItemDetails>(id: Int) async -> Result<Details, GeneralError>
}

final class TMDBAPIClientImpl: HTTPClient, TMDBAPIClient {
    func fetchMoviesGenres() async -> Result<[Genre], GeneralError> {
        let response: Result<GenresList, GeneralError> = await sendRequest(
            endpoint: TMDBEndpoint.getMoviesGenres
        )

        return response.map(\.genres)
    }

    func fetchMovies<Item: WatchItem>(with genres: [Genre], page: Int) async -> Result<WatchItemsResponse<Item>, GeneralError> {
        await sendRequest(endpoint: TMDBEndpoint.getMoviesWith(genres: genres.map(\.id), page: page))
    }

    func fetchMovieDetails<Details: WatchItemDetails>(id: Int) async -> Result<Details, GeneralError> {
        await sendRequest(endpoint: TMDBEndpoint.getMovieDetails(id: id))
    }

    func fetchShowsGenres() async -> Result<[Genre], GeneralError> {
        let response: Result<GenresList, GeneralError> = await sendRequest(
            endpoint: TMDBEndpoint.getShowsGenres
        )

        return response.map(\.genres)
    }

    func fetchShows<Item: WatchItem>(with genres: [Genre], page: Int) async -> Result<WatchItemsResponse<Item>, GeneralError> {
        await sendRequest(endpoint: TMDBEndpoint.getShowsWith(genres: genres.map(\.id), page: page))
    }

    func fetchShowDetails<Details: WatchItemDetails>(id: Int) async -> Result<Details, GeneralError> {
        await sendRequest(endpoint: TMDBEndpoint.getShowDetail(id: id))
    }
}
