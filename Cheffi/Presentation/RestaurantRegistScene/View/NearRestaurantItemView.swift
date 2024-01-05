//
//  NearRestaurantItemView.swift
//  Cheffi
//
//  Created by 김문옥 on 1/5/24.
//

import SwiftUI

struct NearRestaurantItemView: View {
    private enum Metrics {
        static let itemWidth = 285.0
        static let itemHeight = 72.0
        static let padding = EdgeInsets(top: 11.0, leading: 19.0, bottom: 11.0, trailing: 0.0)
        static let textVerticalPadding = 4.0
    }
    
    let restaurant: RestaurantInfoDTO
    
    var body: some View {
        VStack {
            Text(restaurant.name)
                .font(
                    Font.custom("SUIT", size: 16)
                        .weight(.medium)
                )
                .foregroundColor(.cheffiGray8)
                .padding(.vertical, Metrics.textVerticalPadding)
            
            Text(restaurant.address.fullRodNameAddress)
                .font(
                    Font.custom("SUIT", size: 14)
                        .weight(.medium)
                )
                .foregroundColor(.cheffiGray5)
                .padding(.vertical, Metrics.textVerticalPadding)
        }
        .frame(width: Metrics.itemWidth, height: Metrics.itemHeight, alignment: .leading)
        .padding(Metrics.padding)
    }
}

#Preview {
    NearRestaurantItemView(restaurant: RestaurantInfoDTO(
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
    ))
}
