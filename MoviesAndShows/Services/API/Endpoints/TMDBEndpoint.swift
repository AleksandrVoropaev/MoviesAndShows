//
//  TMDBEndpoint.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 12.08.2023.
//

import Foundation

enum TMDBEndpoint {
    case getMoviesGenres
    case getShowsGenres
    case getMoviesWith(genres: [Int], page: Int)
    case getShowsWith(genres: [Int], page: Int)
    case getMovieDetails(id: Int)
    case getShowDetail(id: Int)
}

extension TMDBEndpoint: Endpoint {
    var host: String {
        "api.themoviedb.org"
    }

    var path: String {
        switch self {
        case .getMoviesGenres:
            return "/3/genre/movie/list"
        case .getShowsGenres:
            return "/3/genre/tv/list"
        case .getMoviesWith:
            return "/3/discover/movie"
        case .getShowsWith:
            return "/3/discover/tv"
        case .getMovieDetails(let id):
            return "/3/movie/\(id)"
        case .getShowDetail(let id):
            return "/3/tv/\(id)"
        }
    }

    var method: HTTPMethod {
        .get
    }

    var header: [String : String]? {
        [
            "Content-Type": "application/json;charset=utf-8",
            "Authorization": "Bearer \(Constant.apiKey)"
        ]
    }

    var body: [String : String]? {
        nil
    }

    var query: [String : String?]? {
        switch self {
        case .getMoviesWith(let genres, let page), .getShowsWith(let genres, let page):
            let genresIds = genres.reduce("") { $0 + ($0.isEmpty ? "" : ", ") + String($1) }

            return [
                "page": String(page),
                "with_genres": genresIds
            ]
        default:
            return nil
        }
    }
}
