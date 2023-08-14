//
//  RefreshableScrollView.swift
//  MoviesAndShows
//
//  Created by Oleksandr Voropayev on 14.08.2023.
//

import SwiftUI

struct RefreshableScrollView<Content:View>: View {
    // MARK: - PROPERTIES

    private var content: () -> Content
    private var refreshAction: () -> Void
    private let threshold: CGFloat = 50.0

    // MARK: - INIT

    init(
        refreshAction: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
        self.refreshAction = refreshAction
    }

    // MARK: - BODY

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                content()
                    .anchorPreference(key: OffsetPreferenceKey.self, value: .top) {
                        geometry[$0].y
                    }
            }
            .onPreferenceChange(OffsetPreferenceKey.self) { offset in
                if offset > threshold {
                    refreshAction()
                }
            }
        }
    }
}

private struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
