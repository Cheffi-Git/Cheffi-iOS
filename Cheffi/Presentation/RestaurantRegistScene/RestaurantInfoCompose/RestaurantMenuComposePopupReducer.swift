//
//  RestaurantMenuComposePopupReducer.swift
//  Cheffi
//
//  Created by 김문옥 on 2/25/24.
//

import Foundation
import ComposableArchitecture

struct RestaurantMenuComposePopupReducer: Reducer {
    struct State: Equatable {
        var menuNameTextFieldState = TextFieldBarReducer.State(placeHolder: "메뉴명")
        var menuPriceTextFieldState = TextFieldBarReducer.State(
            placeHolder: "가격",
            rightText: "원"
        )
        var tappable: Bool = false
    }
    
    enum Action {
        case menuNameTextFieldAction(TextFieldBarReducer.Action)
        case menuPriceTextFieldAction(TextFieldBarReducer.Action)
        case tap
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        .none
    }
}
