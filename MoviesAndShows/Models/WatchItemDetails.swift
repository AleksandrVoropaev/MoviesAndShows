//
//  WatchItemDetails.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 13.08.2023.
//

import Foundation

protocol WatchItemDetails: Decodable {
    var firstSubtitle: String { get }
    var secondSubtitle: String { get }
}
