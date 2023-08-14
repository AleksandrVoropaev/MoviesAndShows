//
//  Movie.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 12.08.2023.
//

import Foundation
    
struct Movie: WatchItem {
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}

extension Movie: Mockable {
    static var stub: JSONFileStub { .makeResourceGetMovie200() }
}

extension JSONFileStub {
    static func makeResourceGetMovie200() -> Self {
        .getResource(.movie, 200)
    }
}
