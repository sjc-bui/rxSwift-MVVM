//
//  ViewController.swift
//  rxSwift-MVVM
//
//  Created by quan bui on 2021/10/11.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    private var viewModel: RestaurantsListViewModel!
    @IBOutlet weak var tableView: UITableView!

    static func instantiate(viewModel: RestaurantsListViewModel) -> ViewController {
        let storyboard = UIStoryboard(name: "ViewController", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchRestaurantViewModels().bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
            cell.textLabel?.text = viewModel.displayText
        }.disposed(by: disposeBag)
    }
}
