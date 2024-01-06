//
//  RestaurantRegistReducer.swift
//  Cheffi
//
//  Created by Eli_01 on 12/17/23.
//

import Foundation
import Combine
import ComposableArchitecture

struct RestaurantRegistReducer: Reducer {
    let useCase: RestaurantUseCase

    init(useCase: RestaurantUseCase) {
        self.useCase = useCase
    }

    struct State: Equatable {
        var error: String?
        
        var searchBarState = SearchBarReducer.State()
        var nearRestaurantListState = NearRestaurantListReducer.State()
    }

    enum Action {
        case getRestaurants([RestaurantInfoDTO])
        case occerError(DataTransferError)
        
        case searchBarAction(SearchBarReducer.Action)
        case nearRestaurantListAction(NearRestaurantListReducer.Action)
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .searchBarAction(let action):
            switch action {
            case .input(let text):
                return .publisher {
                    useCase.getRestaurants(name: text, province: "", city: "")
                        .map(Action.getRestaurants)
                        .catch { Just(Action.occerError($0)) }
                }
            }
        case .getRestaurants(let list):
            state.nearRestaurantListState.restaurantList = list
            return .none
        case .occerError(let error):
            state.error = error.localizedDescription
            return .none
        }
    }
}
