//
//  WatchItem.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 12.08.2023.
//

import Foundation

protocol WatchItem: Decodable {
    var id: Int { get }
    var title: String { get }
    var posterPath: String? { get }
    var voteAverage: Double { get }
}

extension WatchItem {
    var posterURL: URL? {
        posterPath.flatMap { URL(string: "http://image.tmdb.org/t/p/w185" + $0) }
    }
}
