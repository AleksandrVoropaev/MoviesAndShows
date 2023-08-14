//
//  MainTabView.swift
//
//  Created by Oleksandr Voropayev
//

import SwiftUI

struct MainTabView: View {
    // MARK: - BODY

    var body: some View {
        TabView {
            ContentView<Movie, MovieDetails>()
                .tabItem {
                    Image(systemName: Constants.Images.movies)
                    Text(Constants.Strings.movies)
                }

            ContentView<Show, ShowDetails>()
                .tabItem {
                    Image(systemName: Constants.Images.tvShows)
                    Text(Constants.Strings.tvShows)
                }
        }
    }
}

// MARK: - PREVIEW

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

// MARK: - CONSTANTS

private enum Constants {
    // Change with the localization framework of your choice
    enum Strings {
        static let movies = "Movies"
        static let tvShows = "TV Shows"
    }

    enum Images {
        static let movies = "popcorn.fill"
        static let tvShows = "tv.fill"
    }
}
