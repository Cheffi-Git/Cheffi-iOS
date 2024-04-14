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
        let navigationBarState = NavigationBarReducer.State(
            title: "마이페이지",
            leftButtonKind: .back,
            rightButtonKind: .setting
        )
    }
    
    enum Action {
        case onAppear
        case navigationBarAction(NavigationBarReducer.Action)
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .navigationBarAction(let action):
            switch action {
            case .rightButtonTapped:
                // TODO: - 프로필 수정 화면 띄우기
//                steps.send(.presentSetting)
                return .none
            default: return .none
            }
        default: return .none
        }
    }
}

extension MyPageReducer: Stepper {}
