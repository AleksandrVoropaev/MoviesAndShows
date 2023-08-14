//
//  ShowDetails.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 13.08.2023.
//

import Foundation

struct ShowDetails: WatchItemDetails {
    let adult: Bool
    let backdropPath: String?
    let createdBy: [Author]
    let episodeRunTime: [Int]
    let firstAirDate: String
    let genres: [Genre]
    let homepage: String
    let id: Int
    let inProduction: Bool
    let languages: [String]
    let lastAirDate: String
    let lastEpisodeToAir: Episode
    let name: String
    let nextEpisodeToAir: Episode?
    let networks: [Network]
    let numberOfEpisodes: Int
    let numberOfSeasons: Int
    let originCountry: [String]
    let originalLanguage: String
    let originalName: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let productionCompanies: [Network]
    let productionCountries: [ProductionCountry]
    let seasons: [Season]
    let spokenLanguages: [SpokenLanguage]
    let status: String
    let tagline: String
    let type: String
    let voteAverage: Double
    let voteCount: Int

    var firstSubtitle: String {
        "Last air date: \n" + lastAirDate
    }

    var secondSubtitle: String {
        "Last episode: \n" + lastEpisodeToAir.name
    }
}

struct Author: Decodable {
    let id: Int
    let credit_id: String?
    let name: String
    let gender: Int
    let profile_path: String?
}

struct Episode: Decodable {
    let id: Int
    let name: String
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let airDate: String
    let episodeNumber: Int
    let episodeType: String
    let productionCode: String
    let runtime: Int?
    let seasonNumber: Int
    let showId: Int
    let stillPath: String?
}

struct Network: Decodable {
    let id: Int
    let logoPath: String?
    let name, originCountry: String
}

struct Season: Decodable {
    let airDate: String?
    let episodeCount, id: Int
    let name: String
    let overview: String
    let posterPath: String?
    let seasonNumber: Int
    let voteAverage: Double
}
