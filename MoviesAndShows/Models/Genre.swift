//
//  Genre.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 12.08.2023.
//

import Foundation

struct Genre: Decodable, Identifiable, Equatable {
    let id: Int
    let name: String
}
