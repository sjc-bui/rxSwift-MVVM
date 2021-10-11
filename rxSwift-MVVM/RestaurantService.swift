//
//  RestaurantService.swift
//  rxSwift-MVVM
//
//  Created by quan bui on 2021/10/11.
//

import UIKit
import RxSwift

protocol RestaurantServiceProtocol {
    func fetchRestaurants() -> Observable<[Restaurant]>
}

class RestaurantService: RestaurantServiceProtocol {

    /// Fetch restaurants data from json file
    /// - Returns: restaurants
    func fetchRestaurants() -> Observable<[Restaurant]> {
        return Observable.create { observable -> Disposable in
            guard let path = Bundle.main.path(forResource: "restaurants", ofType: ".json") else {
                observable.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create { }
            }
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                observable.onNext(restaurants)
            } catch {
                observable.onError(error)
            }
            
            return Disposables.create { }
        }
    }
}
