//
//  RestaurantViewModel.swift
//  rxSwift-MVVM
//
//  Created by quan bui on 2021/10/11.
//

import Foundation

struct RestaurantViewModel {
    private let restaurant: Restaurant

    var displayText: String {
        return "\(restaurant.name) - \(restaurant.cuisine.rawValue.uppercased())"
    }

    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
}
