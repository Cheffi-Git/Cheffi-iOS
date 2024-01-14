//
//  RestaurantInfoComposeView.swift
//  Cheffi
//
//  Created by 김문옥 on 1/14/24.
//

import SwiftUI
import Combine
import ComposableArchitecture
import ViewStore

@ViewStore(RestaurantInfoComposeReducer.self)
struct RestaurantInfoComposeView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct RestaurantInfoComposeView_Preview: PreviewProvider {
    static var previews: some View {
        RestaurantInfoComposeView(
            Store(initialState: RestaurantInfoComposeReducer.State()) {
                RestaurantInfoComposeReducer(steps: PassthroughSubject<RouteStep, Never>())._printChanges()
            }
        )
    }
}
