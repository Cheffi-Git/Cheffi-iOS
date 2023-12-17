//
//  RestaurantUseCase.swift
//  Cheffi
//
//  Created by Juhyun Seo on 10/22/23.
//

import Foundation
import Combine
import Dependencies

protocol RestaurantUseCase {
    func getRestaurants(name: String, province: String, city: String) -> AnyPublisher<[RestaurantInfoDTO], DataTransferError>
}


final class DefaultRestaurantUseCase: RestaurantUseCase {
    private let repository: RestaurantRepository
    init(repository: RestaurantRepository) {
        self.repository = repository
    }
    
    func getRestaurants(name: String, province: String, city: String) -> AnyPublisher<[RestaurantInfoDTO], DataTransferError> {
        return repository.getRestaurants(name: name, province: province, city: city)
            .map({ $0.0.data })
            .eraseToAnyPublisher()
    }
}
