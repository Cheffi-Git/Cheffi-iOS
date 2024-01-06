//
//  SearchBarReducer.swift
//  Cheffi
//
//  Created by 김문옥 on 1/1/24.
//

import Foundation
import ComposableArchitecture

public struct SearchBarReducer: Reducer {
    public struct State: Equatable {
        var searchQuery: String = "검색어 입력"
    }

    public enum Action {
        case input(String)
    }

    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .input:
            return .none
        }
    }
}
