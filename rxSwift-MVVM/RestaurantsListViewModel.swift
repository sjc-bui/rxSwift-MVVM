//
//  RestaurantsListViewModel.swift
//  rxSwift-MVVM
//
//  Created by quan bui on 2021/10/11.
//

import Foundation
import RxSwift

class RestaurantsListViewModel {
    let title = "Restaurants"

    private let restaurantService: RestaurantServiceProtocol

    init(restaurantService: RestaurantServiceProtocol = RestaurantService()) {
        self.restaurantService = restaurantService
    }

    func fetchRestaurantViewModels() -> Observable<[RestaurantViewModel]> {
        restaurantService.fetchRestaurants().map { $0.map {
            RestaurantViewModel(restaurant: $0)
        } }
    }
}
