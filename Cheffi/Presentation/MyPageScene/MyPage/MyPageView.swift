//
//  MyPageView.swift
//  Cheffi
//
//  Created by 김문옥 on 4/5/24.
//

import SwiftUI
import Combine
import ComposableArchitecture
import ViewStore

@ViewStore(MyPageReducer.self)
struct MyPageView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MyPageView_Preview: PreviewProvider {
    static var previews: some View {
        MyPageView(
            Store(initialState: MyPageReducer.State()) {
                MyPageReducer(
                    steps: PassthroughSubject<RouteStep, Never>()
                )._printChanges()
            }
        )
    }
}
