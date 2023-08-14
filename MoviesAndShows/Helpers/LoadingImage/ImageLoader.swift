//
//  ImageLoader.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 14.08.2023.
//

import SwiftUI
import Combine

class ImageLoader<Cache: ImageCache>: ObservableObject {
    // MARK: - PROPERTIES

    @Published var image: Image?

    private(set) var isLoading = false

    private let url: URL?
    private var cancellable: AnyCancellable?
    private let queue = DispatchQueue(label: "ImageLoader")

    // MARK: - INIT and DEINIT
    init(url: URL?) {
        self.url = url
    }

    deinit {
        cancel()
    }

    // MARK: - PUBLIC FUNCTIONS

    @MainActor func load() {
        guard let url, !isLoading else { return }

        if let image = Cache[url] {
            self.image = image
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .compactMap { UIImage(data: $0.data) }
            .map(Image.init)
            .replaceError(with: nil)
            .handleEvents(receiveSubscription: { [weak self] _ in self?.onSubscription() },
                          receiveOutput: { [weak self] in self?.cache($0) },
                          receiveCompletion: { [weak self] _ in self?.onCompletion() },
                          receiveCancel: { [weak self] in self?.onCompletion() })
            .subscribe(on: queue)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
    }

    func cancel() {
        cancellable?.cancel()
    }

    // MARK: - PRIVATE FUNCTIONS

    private func onSubscription() {
        isLoading = true
    }

    private func onCompletion() {
        isLoading = false
    }

    private func cache(_ image: Image?) {
        Cache[url] = image
    }
}
