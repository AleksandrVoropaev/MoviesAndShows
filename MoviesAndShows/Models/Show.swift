//
//  Show.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 12.08.2023.
//

import Foundation

struct Show: WatchItem {
    let backdropPath: String?
    let firstAirDate: String
    let genreIds: [Int]
    let id: Int
    let name: String
    let originCountry: [String]
    let originalLanguage: String
    let originalName: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let voteAverage: Double
    let voteCount: Int

    var title: String {
        name
    }
}
