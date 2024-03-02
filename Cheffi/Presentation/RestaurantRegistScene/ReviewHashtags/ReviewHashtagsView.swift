//
//  ReviewHashtagsView.swift
//  Cheffi
//
//  Created by 김문옥 on 3/2/24.
//

import SwiftUI
import Combine
import ComposableArchitecture
import ViewStore

@ViewStore(ReviewHashtagsReducer.self)
struct ReviewHashtagsView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ReviewHashtagsView_Preview: PreviewProvider {
    static var previews: some View {
        ReviewHashtagsView(
            Store(initialState: ReviewHashtagsReducer.State(
                reviewRequestInfo: RegisterReviewRequest(
                    restaurantId: 1234,
                    registered: false,
                    title: "기사식당",
                    text: "훌륭한 맛입니다.",
                    menus: [
                        MenuDTO(
                            name: "Pizza",
                            price: 14000,
                            description: nil
                        ),
                        MenuDTO(
                            name: "Cheeze Pizza",
                            price: 19000,
                            description: nil
                        )
                    ],
                    tag: TagsChangeRequest(foodTags: [], tasteTags: [])
                )
            )) {
                ReviewHashtagsReducer(
                    useCase: PreviewRestaurantRegistUseCase(),
                    steps: PassthroughSubject<RouteStep, Never>()
                )
                    ._printChanges()
            }
        )
    }
}
