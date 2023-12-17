//
//  RestaurantRegistView.swift
//  Cheffi
//
//  Created by Eli_01 on 12/17/23.
//

import SwiftUI
import ComposableArchitecture

struct RestaurantRegistView: View {
    let store: StoreOf<RestaurantRegistFeature>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                TextField(
                    "검색어 입력",
                    text: viewStore.binding(get: \.searchQuery, send: { .input($0) })
                )
                Text("Result: \(viewStore.resultList[safe: 0] ?? "")")
            }
        }
    }
}

#Preview {
    RestaurantRegistView(
        store: Store(initialState: RestaurantRegistFeature.State()) {
            RestaurantRegistFeature()
        }
    )
}
