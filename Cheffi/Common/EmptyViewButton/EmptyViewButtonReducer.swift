//
//  EmptyViewButtonReducer.swift
//  Cheffi
//
//  Created by 김문옥 on 1/7/24.
//

import Foundation
import ComposableArchitecture

struct EmptyViewButtonReducer: Reducer {
    struct State: Equatable {
        var title: String = "맛집 직접 등록하기"
    }
    
    enum Action {
        case tapButton
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        .none
    }
}
