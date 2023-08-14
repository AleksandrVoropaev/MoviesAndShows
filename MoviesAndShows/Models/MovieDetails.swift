//
//  MovieDetails.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 13.08.2023.
//

import Foundation

struct MovieDetails: WatchItemDetails {
    let adult: Bool
    let backdropPath: String?
    let belongsToCollection: BelongsToCollection?
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let id: Int
    let imdbId: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let releaseDate: String
    let revenue: Int
    let runtime: Int
    let spokenLanguages: [SpokenLanguage]
    let status: String
    let tagline: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    var firstSubtitle: String {
        "Budget: " + String(budget / 1000000) + "M"
    }

    var secondSubtitle: String {
        "Revenue: " + String(revenue / 1000000) + "M"
    }
}

struct BelongsToCollection: Decodable {
    let id: Int
    let name: String
    let posterPath: String?
    let backdropPath: String?
}

struct ProductionCompany: Decodable {
    let id: Int
    let logoPath: String?
    let name: String
    let originCountry: String
}

struct ProductionCountry: Decodable {
    let iso3166_1: String?
    let name: String
}

struct SpokenLanguage: Decodable {
    let englishName: String
    let iso639_1: String?
    let name: String
}
