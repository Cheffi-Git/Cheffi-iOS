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
                NavigationBarView(title: "내 맛집 등록")
                
                SearchBarView(store: self.store.scope(
                    state: \.searchBarState, 
                    action: RestaurantRegistFeature.Action.searchBarAction
                ))
                
                List {
                    ForEach(viewStore.restaurantList, id: \.id) { restaurant in
                        Text("Result: \(restaurant.name)")
                    }
                }
            }
        }
    }
}

#Preview {
    RestaurantRegistView(
        store: Store(initialState: RestaurantRegistFeature.State()) {
            RestaurantRegistFeature(
                useCase: PreviewRestaurantRegistUseCase()
            )
                ._printChanges()
        }
    )
}
