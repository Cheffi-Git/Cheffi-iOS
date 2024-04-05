//
//  MyPageReducer.swift
//  Cheffi
//
//  Created by 김문옥 on 4/5/24.
//

import Foundation
import Combine
import ComposableArchitecture

struct MyPageReducer: Reducer {
    let steps: PassthroughSubject<RouteStep, Never>
    
    init(
        steps: PassthroughSubject<RouteStep, Never>
    ) {
        self.steps = steps
    }
    
    struct State: Equatable {
    }
    
    enum Action {
        case onAppear
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        .none
    }
}

extension MyPageReducer: Stepper {}
