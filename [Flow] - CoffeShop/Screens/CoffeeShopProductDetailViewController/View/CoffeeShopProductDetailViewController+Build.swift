//
//  CoffeeShopProductDetailViewController+Build.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 21.03.2024.
//

import Foundation
import UIKit

extension CoffeeShopProductDetailViewController {
    static func build(coordinator: CoffeeShopProductDetailInteractorCoordinatorDelegate, selectedIndex: Int, coffeeShop: CoffeeShop) -> UIViewController {
        let presenter = CoffeeShopProductDetailPresenter()
        let interactor = CoffeeShopProductDetailInteractor(presenter: presenter, selectedIndex: selectedIndex, coffeeShop: coffeeShop)
        interactor.coordinator = coordinator
        let viewController = CoffeeShopProductDetailViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
