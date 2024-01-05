//
//  NearRestaurantListView.swift
//  Cheffi
//
//  Created by 김문옥 on 1/6/24.
//

import SwiftUI
import ComposableArchitecture

struct NearRestaurantListView: View {
    private enum Policy {
        static let verticalCount = 4
    }
    
    let store: StoreOf<NearRestaurantListFeature>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ScrollView(.horizontal) {
                LazyHGrid(
                    rows: [GridItem(.fixed(72)), GridItem(.fixed(72)), GridItem(.fixed(72)), GridItem(.fixed(72))],
                    spacing: 0
                ) {
                    ForEach(viewStore.restaurantList, id: \.self) { restaurant in
                        NearRestaurantItemView(restaurant: restaurant)
                    }
                }
            }
        }
    }
}

#Preview {
    NearRestaurantListView(
        store: Store(initialState: NearRestaurantListFeature.State()) {
            NearRestaurantListFeature()._printChanges()
        }
    )
}
