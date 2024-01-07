//
//  NearRestaurantEmptyView.swift
//  Cheffi
//
//  Created by 김문옥 on 1/7/24.
//

import SwiftUI
import ComposableArchitecture
import ViewStore

@ViewStore(NearRestaurantEmptyReducer.self)
struct NearRestaurantEmptyView: View {
    private enum Metrics {
        static let imageTopHeight = 83.0
        static let descriptionTopHeight = 18.0
    }
    var body: some View {
        VStack {
            Spacer().frame(height: Metrics.imageTopHeight)
            
            Image("empty_near_restaurant")
            
            Spacer().frame(height: Metrics.descriptionTopHeight)
            
            Text("성동구 근처 맛집등록 된 곳이 없어요\n첫 맛집을 발굴해볼까요?")
                .font(
                    Font.custom("SUIT", size: 14)
                        .weight(.medium)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(.cheffiGray6)
            
            Spacer().frame(height: Metrics.descriptionTopHeight)
            
            EmptyViewButton(store.scope(
                state: \.emptyViewButtonState,
                action: NearRestaurantEmptyReducer.Action.emptyViewButtonAction
            ))
        }
    }
}

struct NearRestaurantEmptyView_Preview: PreviewProvider {
    static var previews: some View {
        NearRestaurantEmptyView(
            Store(initialState: NearRestaurantEmptyReducer.State()) {
                NearRestaurantEmptyReducer()._printChanges()
            }
        )
    }
}
