//
//  NationalTrendViewController.swift
//  Cheffi
//
//  Created by USER on 2023/07/14.
//

import UIKit
import ComposableArchitecture

final class NationalTrendViewController: UIViewController {
    static func instance<T: NationalTrendViewController>(reducer: NationalTrendReducer) -> T {
        let vc: T = .instance(storyboardName: .nationalTrend)
        vc.reducer = reducer
        return vc
    }
    
    private var reducer: NationalTrendReducer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("------------------------------------------")
        debugPrint("NationalTrendViewController viewDidLoad")
        debugPrint("------------------------------------------")
        
        addHostingController(
            view: NationalTrendView(
                Store(initialState: NationalTrendReducer.State()) {
                    reducer._printChanges()
                }
            )
        )
    }
}
