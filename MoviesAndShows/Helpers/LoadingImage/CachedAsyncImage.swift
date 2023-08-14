//
//  CachedAsyncImage.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 13.08.2023.
//

import SwiftUI

struct CachedAsyncImage<ErrorContent: View, PlaceholderContent: View, ViewContent: View>: View {
    // MARK: - PROPERTIES

    @StateObject private var imageLoader: ImageLoader<ImageCacheImpl>
    let url: URL?
    let error: () -> ErrorContent
    let placeholder: () -> PlaceholderContent
    let content: (Image) -> ViewContent

    // MARK: - INIT

    init(
        url: URL?,
        @ViewBuilder error: @escaping () -> ErrorContent,
        @ViewBuilder placeholder: @escaping () -> PlaceholderContent,
        @ViewBuilder content: @escaping (Image) -> ViewContent
    ) {
        self.url = url
        self.error = error
        self.placeholder = placeholder
        self.content = content
        self._imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }

    // MARK: - BODY

    var body: some View {
        Group {
            if let image = imageLoader.image {
                content(image)
            } else if imageLoader.isLoading {
                placeholder()
            } else {
                error()
            }
        }
        .onAppear(perform: imageLoader.load)
    }
}
