//
//  CachedAsyncImage.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 13.08.2023.
//

import SwiftUI

struct CachedAsyncImage<ViewContent: View>: View {
    let url: URL?
    let scale: CGFloat
    let transaction: Transaction
    let content: (AsyncImagePhase) -> ViewContent

    init(
        url: URL?,
        scale: CGFloat = 1,
        transaction: Transaction = Transaction(),
        @ViewBuilder content: @escaping (AsyncImagePhase) -> ViewContent
    ) {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }

    var body: some View {
        if let cached = ImagesCache[url] {
            content(.success(cached))
        } else {
            AsyncImage(url: url, scale: scale, transaction: transaction) { phase in
                { () -> ViewContent in
                    if case .success(let image) = phase {
                        ImagesCache[url] = image
                    }

                    return content(phase)
                }()
            }
        }
    }
}
