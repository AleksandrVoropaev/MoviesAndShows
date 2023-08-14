//
//  LoadingImage.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 13.08.2023.
//

import SwiftUI

struct LoadingImage: View {
    // MARK: - PROPERTIES

    let url: URL?

    // MARK: - BODY

    var body: some View {
        CachedAsyncImage(url: url) { phase in
            if let image = phase.image {
                image
                    .resizable()
            } else if phase.error != nil {
                VStack {
                    Spacer()
                    Image(systemName: "exclamationmark.triangle")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Spacer()
                }
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
                    .padding()
            }
        }
        .scaledToFit()
    }
}

// MARK: - PREVIEW

struct LoadingImage_Previews: PreviewProvider {
    static var previews: some View {
        LoadingImage(url: URL(string: "http://image.tmdb.org/t/p/w185/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg"))
    }
}
