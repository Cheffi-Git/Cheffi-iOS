//
//  RestaurantInfoComposeReducer.swift
//  Cheffi
//
//  Created by 김문옥 on 1/14/24.
//

import Foundation
import Combine
import ComposableArchitecture

struct RestaurantInfoComposeReducer: Reducer {
    let useCase: RestaurantUseCase
    let steps: PassthroughSubject<RouteStep, Never>

    init(
        useCase: RestaurantUseCase,
        steps: PassthroughSubject<RouteStep, Never>
    ) {
        self.useCase = useCase
        self.steps = steps
    }
    
    struct State: Equatable {
        var restaurant: RestaurantInfoDTO
        
        let navigationBarState = NavigationBarReducer.State(
            title: "내 맛집 등록",
            buttonKind: .back
        )
        var bottomButtonState = BottomButtonReducer.State(
            title: "다음",
            able: false
        )
    }
    
    enum Action {
        case navigaionBarAction(NavigationBarReducer.Action)
        case startSelectPhoto
        case bottomButtonAction(BottomButtonReducer.Action)
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .navigaionBarAction(let action):
            switch action {
            case .tap:
                steps.send(.popToNavigationController)
                return .none
            }
        case .bottomButtonAction(let action):
            switch action {
            case .tap:
                // TODO: Eli - 맛집정보 해시태그 화면으로 이동
                // steps.send(.hashtag....)
                return .none
            }
        case .startSelectPhoto:
            // TODO: -
            return .none
        }
    }
}

extension RestaurantInfoComposeReducer: Stepper {}
