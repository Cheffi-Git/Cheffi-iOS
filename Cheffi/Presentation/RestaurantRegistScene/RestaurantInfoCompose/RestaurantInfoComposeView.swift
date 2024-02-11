//
//  RestaurantInfoComposeView.swift
//  Cheffi
//
//  Created by 김문옥 on 1/14/24.
//

import SwiftUI
import Combine
import ComposableArchitecture
import ViewStore

@ViewStore(RestaurantInfoComposeReducer.self)
struct RestaurantInfoComposeView: View {
    private enum Metrics {
        static let safeAreaPadding = 16.0
        static let headlineTextTopPadding = 32.0
        static let headlineTextHorizontalSpacing = 8.0
        static let photoThumbnailImageSize = CGSize(width: 88.0, height: 88.0)
        static let attatchPhotoButtonContentsSpacing = 4.0
        static let attatchPhotoButtonViewPadding = 16.0
        static let attatchPhotoButtonPadding = 8.0
        static let attatchPhotoButtonCornerRadius = 8.0
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                NavigationBarView(store.scope(
                    state: \.navigationBarState,
                    action: RestaurantInfoComposeReducer.Action.navigaionBarAction
                ))
                
                // 사진첨부 영역
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Text("맛집에서의 경험은 어떠셨나요?")
                            .font(.custom("SUIT", size: 20).weight(.semibold))
                            .minimumScaleFactor(0.5)
                            .foregroundColor(.cheffiGray8)
                        
                        Spacer(minLength: Metrics.headlineTextHorizontalSpacing)
                        
                        Text("3개이상 등록")
                            .font(.custom("SUIT", size: 14))
                            .minimumScaleFactor(0.5)
                            .foregroundColor(.cheffiGray5)
                    }
                    .padding(.top, Metrics.headlineTextTopPadding)
                    
                    // TODO: Eli - 첨부된 사진들이 있다면..
                    LazyHStack {
                        
                    }
                    .frame(
                        width: .infinity,
                        height: Metrics.photoThumbnailImageSize.height
                    )
                    
                    Button {
                        
                    } label: {
                        HStack(spacing: Metrics.attatchPhotoButtonContentsSpacing) {
                            Image(.attatchPhoto)
                            
                            Text("사진 첨부하기")
                                .font(.custom("SUIT", size: 14).weight(.medium))
                        }
                        .padding(Metrics.attatchPhotoButtonPadding)
                        .frame(maxWidth: .infinity)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: Metrics.attatchPhotoButtonCornerRadius)
                            .inset(by: 0.5)
                            .stroke(
                                .cheffiPink1,
                                lineWidth: 1
                            )
                    )
                    .padding(.vertical, Metrics.attatchPhotoButtonViewPadding)
                    .foregroundColor(.mainCTA)
                } // 사진첨부 영역
                
                // 리뷰작성 영역
                VStack(spacing: 0) {
                    Text("어떤 메뉴를 드셨나요?")
                        .font(.custom("SUIT", size: 20).weight(.semibold))
                        .foregroundColor(.cheffiGray8)
                        .padding(.top, Metrics.headlineTextTopPadding)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                } // 리뷰작성 영역
                
                // 메뉴선택 영역
                VStack(spacing: 0) {
                    
                } // 메뉴선택 영역
                
                Spacer()
                
                BottomButtonView(store.scope(
                    state: \.bottomButtonState,
                    action: RestaurantInfoComposeReducer.Action.bottomButtonAction
                ))
            }
            .padding(.horizontal, Metrics.safeAreaPadding)
            
//            if viewStore.isShowConfirmPopup {
//                ConfirmPopupView(store.scope(
//                    state: \.confirmPopupState,
//                    action: RestaurantRegistComposeReducer.Action.confirmPopupAction
//                ))
//            }
        }
//        .animation(.default, value: viewStore.isShowConfirmPopup)
    }
}

struct RestaurantInfoComposeView_Preview: PreviewProvider {
    static var previews: some View {
        RestaurantInfoComposeView(
            Store(initialState: RestaurantInfoComposeReducer.State(
                restaurant: RestaurantInfoDTO(
                    id: 0,
                    name: "기사식당",
                    address: Address(
                        province: "서울",
                        city: "강북구",
                        lotNumber: "수유3동",
                        roadName: "한천로 140길",
                        fullLotNumberAddress: "111-22",
                        fullRodNameAddress: "11-22"
                    ),
                    registered: false
                )
            )) {
                RestaurantInfoComposeReducer(
                    useCase: PreviewRestaurantRegistUseCase(),
                    steps: PassthroughSubject<RouteStep, Never>()
                )._printChanges()
            }
        )
    }
}
