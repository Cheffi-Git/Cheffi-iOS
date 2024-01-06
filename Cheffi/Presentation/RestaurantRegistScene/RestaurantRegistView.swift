//
//  RestaurantRegistView.swift
//  Cheffi
//
//  Created by Eli_01 on 12/17/23.
//

import SwiftUI
import ComposableArchitecture
import ViewStore

@ViewStore(RestaurantRegistReducer.self)
struct RestaurantRegistView: View {
    var body: some View {
        VStack {
            NavigationBarView(title: "내 맛집 등록")
            
            SearchBarView(store.scope(
                state: \.searchBarState,
                action: RestaurantRegistReducer.Action.searchBarAction
            ))
            
            NearRestaurantListView(store.scope(
                state: \.nearRestaurantListState,
                action: RestaurantRegistReducer.Action.nearRestaurantListAction
            ))
            
            Spacer()
        }
    }
}

struct RestaurantRegistView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantRegistView(
            Store(initialState: RestaurantRegistReducer.State()) {
                RestaurantRegistReducer(
                    useCase: PreviewRestaurantRegistUseCase()
                )
                    ._printChanges()
            }
        )
    }
}
