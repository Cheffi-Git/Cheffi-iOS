//
//  SearchBarView.swift
//  Cheffi
//
//  Created by 김문옥 on 1/1/24.
//

import SwiftUI
import ComposableArchitecture
 
struct SearchBarView: View {
    private enum Metrics {
        static let barPaddingEdgeInsets = EdgeInsets(top: 20.0, leading: 16.0, bottom: 16.0, trailing: 16.0)
        static let barHeight = 40.0
        static let barCornerRadius = 6.0
    }
    
    let store: StoreOf<SearchBarFeature>
 
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
     
                    TextField(
                        "검색어 입력",
                        text: viewStore.binding(get: \.searchQuery, send: { .input($0) })
                    )
                        .foregroundColor(.cheffiBlack)
     
                    if !viewStore.searchQuery.isEmpty {
                        Button(action: {
                            viewStore.send(.input(""))
                        }) {
                            Image(systemName: "xmark.circle.fill")
                        }
                    } else {
                        EmptyView()
                    }
                }
                .padding()
                .frame(height: Metrics.barHeight)
                .foregroundColor(.cheffiBlack)
                .background(.cheffiWhite05)
                .cornerRadius(Metrics.barCornerRadius)
            }
            .padding(Metrics.barPaddingEdgeInsets)
        }
    }
}

#Preview {
    SearchBarView(
        store: Store(initialState: SearchBarFeature.State()) {
            SearchBarFeature()._printChanges()
        }
    )
}
