//
//  RefreshableScrollViewModifier.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 14.08.2023.
//

import SwiftUI

struct RefreshableScrollViewModifier: ViewModifier {
    var refreshAction: () -> Void

    func body(content: Content) -> some View {
        RefreshableScrollView(refreshAction: refreshAction) {
            content
        }
    }
}

extension View {
    func refreshableScrollView(refreshAction: @escaping () -> Void) -> some View {
        modifier(RefreshableScrollViewModifier(refreshAction: refreshAction))
    }
}
