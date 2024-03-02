//
//  ReviewHashtagsReducer.swift
//  Cheffi
//
//  Created by 김문옥 on 3/2/24.
//

import Foundation
import Combine
import ComposableArchitecture

struct ReviewHashtagsReducer: Reducer {
    private let useCase: RestaurantUseCase
    let steps: PassthroughSubject<RouteStep, Never>
    
    init(
        useCase: RestaurantUseCase,
        steps: PassthroughSubject<RouteStep, Never>
    ) {
        self.useCase = useCase
        self.steps = steps
    }
    
    struct State: Equatable {
        var reviewRequestInfo: ReviewHashtagsActionType
        
        var navigationBarState: NavigationBarReducer.State
    }
    
    enum Action {
        case navigationBarAction(NavigationBarReducer.Action)
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .navigationBarAction(let action):
            switch action {
            case .leftButtonTapped:
                steps.send(.popToNavigationController)
                fallthrough
            default: return .none
            }
        }
    }
}

extension ReviewHashtagsReducer: Stepper {}
