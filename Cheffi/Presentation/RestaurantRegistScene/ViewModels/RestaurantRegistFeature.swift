//
//  RestaurantRegistFeature.swift
//  Cheffi
//
//  Created by Eli_01 on 12/17/23.
//

import ComposableArchitecture

@Reducer
struct RestaurantRegistFeature {
    struct State: Equatable {
        var searchQuery = ""
        var resultList: [String] = []
    }

    enum Action {
        case input(String)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .input(let text):
                state.resultList = [text]
                return .none
            }
        }
    }
}
