//
//  RestaurantItemView.swift
//  Cheffi
//
//  Created by 김문옥 on 1/5/24.
//

import SwiftUI

struct RestaurantItemView: View {
    private enum Metrics {
        static let itemHeight = 72.0
        static let padding = EdgeInsets(top: 11.0, leading: 16.0, bottom: 11.0, trailing: 0.0)
        static let textVerticalPadding = 4.0
    }
    
    let restaurant: RestaurantInfoDTO
    let itemWidth: CGFloat
    
    var body: some View {
        VStack {
            Text(restaurant.name)
                .font(
                    Font.custom("SUIT", size: 16)
                        .weight(.medium)
                )
                .foregroundColor(.cheffiGray8)
                .background(.green)
                .padding(.vertical, Metrics.textVerticalPadding)
            
            Text(restaurant.address.fullRodNameAddress)
                .font(
                    Font.custom("SUIT", size: 14)
                        .weight(.medium)
                )
                .foregroundColor(.cheffiGray5)
                .background(.blue)
                .padding(.vertical, Metrics.textVerticalPadding)
        }
        .frame(idealWidth: itemWidth, maxWidth: itemWidth, idealHeight: Metrics.itemHeight, maxHeight: Metrics.itemHeight, alignment: .leading)
        .background(.orange)
        .padding(Metrics.padding)
        .background(.yellow)
    }
}

#Preview {
    RestaurantItemView(
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
        ),
        itemWidth: .infinity
    )
}
