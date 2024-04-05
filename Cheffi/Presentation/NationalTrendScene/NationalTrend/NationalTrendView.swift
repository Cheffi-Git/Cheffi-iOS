//
//  NationalTrendView.swift
//  Cheffi
//
//  Created by 김문옥 on 4/5/24.
//

import SwiftUI
import Combine
import ComposableArchitecture
import ViewStore

@ViewStore(NationalTrendReducer.self)
struct NationalTrendView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct NationalTrendView_Preview: PreviewProvider {
    static var previews: some View {
        NationalTrendView(
            Store(initialState: NationalTrendReducer.State()) {
                NationalTrendReducer(
                    steps: PassthroughSubject<RouteStep, Never>()
                )._printChanges()
            }
        )
    }
}
