//
//  WatchItemsResponse.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 12.08.2023.
//

import Foundation

struct WatchItemsResponse<I: WatchItem>: Decodable {
    let page: Int
    let results: [I]
    let totalPages: Int
    let totalResults: Int
}

