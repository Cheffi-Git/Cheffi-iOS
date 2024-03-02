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
        var reviewRequestInfo: RegisterReviewRequest
    }
    
    enum Action {
        case postingButtonTapped
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        .none
    }
}

extension ReviewHashtagsReducer: Stepper {}
