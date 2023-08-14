//
//  ImagesCache.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 13.08.2023.
//

import Foundation
import SwiftUI

final class ImagesCache {
    static private var cache = {
        let result = NSCache<NSString, ImageWrapper>()
        result.countLimit = 100

        return result
    }()

    static subscript(_ url: URL?) -> Image? {
        get {
            url
                .map(\.absoluteString)
                .map(NSString.init)
                .flatMap {
                    cache.object(forKey: $0)?.image
                }
        }
        set {
            url
                .map(\.absoluteString)
                .map(NSString.init)
                .map {
                    guard let newValue else { return }

                    cache.setObject(ImageWrapper(newValue), forKey: $0)
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

