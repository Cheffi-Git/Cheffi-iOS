//
//  RestaurantRegistComposeReducer.swift
//  Cheffi
//
//  Created by 김문옥 on 1/14/24.
//

import Foundation
import Combine
import ComposableArchitecture

struct RestaurantRegistComposeReducer: Reducer {
    let steps: PassthroughSubject<RouteStep, Never>

    init(
        steps: PassthroughSubject<RouteStep, Never>
    ) {
        self.steps = steps
    }
    
    struct State: Equatable {
        var roadNameAddressTextFieldBarState = TextFieldBarReducer.State(placeHolder: "도로명 주소 입력")
        var restaurantNameTextFieldBarState = TextFieldBarReducer.State(placeHolder: "식당 이름")
        var bottomButtonState = BottomButtonReducer.State(
            title: "다음",
            able: false
        )
    }
    
    enum Action {
        case roadNameAddressTextFieldBarAction(TextFieldBarReducer.Action)
        case restaurantNameTextFieldBarAction(TextFieldBarReducer.Action)
        case bottomButtonAction(BottomButtonReducer.Action)
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        .none
    }
}

extension RestaurantRegistComposeReducer: Stepper {}
