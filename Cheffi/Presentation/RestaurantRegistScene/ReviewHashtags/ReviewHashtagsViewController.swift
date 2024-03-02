//
//  ReviewHashtagsViewController.swift
//  Cheffi
//
//  Created by 김문옥 on 3/2/24.
//

import UIKit
import ComposableArchitecture

class ReviewHashtagsViewController: UIViewController {
    private let reducer: ReviewHashtagsReducer
    private let composedReviewInfo: RegisterReviewRequest
    
    init(
        reducer: ReviewHashtagsReducer,
        composedReviewInfo: RegisterReviewRequest
    ) {
        self.reducer = reducer
        self.composedReviewInfo = composedReviewInfo
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addHostingController(
            view: ReviewHashtagsView(
                Store(initialState: ReviewHashtagsReducer.State(
                    reviewRequestInfo: composedReviewInfo
                )) {
                    reducer._printChanges()
                }
            )
        )
    }
}
