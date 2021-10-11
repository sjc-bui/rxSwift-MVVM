//
//  AppCoordinator.swift
//  rxSwift-MVVM
//
//  Created by quan bui on 2021/10/11.
//

import UIKit

class AppCoordinator {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let viewController = ViewController.instantiate(viewModel: RestaurantsListViewModel())
        let nav = UINavigationController(rootViewController: viewController)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}
