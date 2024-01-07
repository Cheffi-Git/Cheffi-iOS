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
        var isEmptyNearRestaurant: Bool = false
        // TODO: Eli - add isEmptyRestaurant
        
        var searchBarState = SearchBarReducer.State()
        var nearRestaurantListState = NearRestaurantListReducer.State()
        var nearRestaurantEmptyState = NearRestaurantEmptyReducer.State()
    }

    enum Action {
        case getNearRestaurants([RestaurantInfoDTO])
        case getRestaurants([RestaurantInfoDTO])
        case occerError(DataTransferError)
        
        case searchBarAction(SearchBarReducer.Action)
        case nearRestaurantListAction(NearRestaurantListReducer.Action)
        case nearRestaurantEmptyAction(NearRestaurantEmptyReducer.Action)
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .getNearRestaurants(let list):
            state.isEmptyNearRestaurant = list.isEmpty
            state.nearRestaurantListState.restaurantList = list
            return .none
        case .getRestaurants(let list):
            // TODO: Eli - Near restaurant -> restaurant
            state.isEmptyNearRestaurant = list.isEmpty
            state.nearRestaurantListState.restaurantList = list
            return .none
        case .occerError(let error):
            state.error = error.localizedDescription
            return .none
        case .searchBarAction(let action):
            switch action {
            case .input(let text):
                return .publisher {
                    useCase.getRestaurants(name: text, province: "", city: "")
                        .map(Action.getRestaurants)
                        .catch { Just(Action.occerError($0)) }
                }
            }
        case .nearRestaurantEmptyAction(let action):
            switch action {
            case .emptyViewButtonAction(let action):
                switch action {
                case .tapButton:
                    // TODO: Eli - 화면이동
                    return .none
                }
            }
        }
    }
}
