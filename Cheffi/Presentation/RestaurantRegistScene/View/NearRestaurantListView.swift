//
//  NearRestaurantListView.swift
//  Cheffi
//
//  Created by 김문옥 on 1/6/24.
//

import SwiftUI
import ComposableArchitecture
import ViewStore

@ViewStore(NearRestaurantListReducer.self)
struct NearRestaurantListView: View {
    private enum Policy {
        static let verticalCount = 4
    }
    
    var body: some View {
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

struct NearRestaurantListView_Preview: PreviewProvider {
    static var previews: some View {
        NearRestaurantListView(
            Store(initialState: NearRestaurantListReducer.State()) {
                NearRestaurantListReducer()._printChanges()
            }
        )
    }
}
