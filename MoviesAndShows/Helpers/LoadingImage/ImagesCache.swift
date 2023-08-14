//
//  ImagesCache.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 13.08.2023.
//

import SwiftUI

protocol ImageCache {
    static subscript(_ url: URL?) -> Image? { get set }
}

final class ImageCacheImpl: ImageCache {
    static private var cache = {
        let result = NSCache<NSURL, ImageWrapper>()
        result.countLimit = 100

        return result
    }()

    static subscript(_ url: URL?) -> Image? {
        get {
            url
                .map { $0 as NSURL }
                .flatMap {
                    cache.object(forKey: $0)?.image
                }
        }
        set {
            url
                .map { $0 as NSURL }
                .map {
                    if let newValue {
                        cache.setObject(ImageWrapper(newValue), forKey: $0)
                    } else {
                        cache.removeObject(forKey: $0)
                    }
                }
        }
    }
}

private final class ImageWrapper {
    let image: Image

    init(_ image: Image) {
        self.image = image
    }
}

