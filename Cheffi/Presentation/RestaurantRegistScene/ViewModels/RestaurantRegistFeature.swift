//
//  RestaurantRegistFeature.swift
//  Cheffi
//
//  Created by Eli_01 on 12/17/23.
//

import Foundation
import Combine
import ComposableArchitecture

@Reducer
struct RestaurantRegistFeature: Reducer {
    let useCase: RestaurantUseCase

    init(useCase: RestaurantUseCase) {
        self.useCase = useCase
    }

    struct State: Equatable {
        var searchQuery = ""
        var restaurantList: [RestaurantInfoDTO] = []
    }

    enum Action {
        case input(String)
        case getRestaurants([RestaurantInfoDTO])
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .input(let text):
            return useCase.getRestaurants(name: text, province: "", city: "")
        case .getRestaurants(let list):
            state.restaurantList = list
            return .none
        }
    }
}
