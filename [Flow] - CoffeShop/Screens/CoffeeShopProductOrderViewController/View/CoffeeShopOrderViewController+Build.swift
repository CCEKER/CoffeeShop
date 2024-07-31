//
//  CoffeeShopOrderViewController+Build.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 23.03.2024.
//

import Foundation
import UIKit

extension CoffeeShopOrderViewController {
    static func build(coordinator: CoffeeShopOrderInteractorCoordinatorDelegate, price: Price, coffeeShop: CoffeeShop, productList: ProductList) -> UIViewController {
        let presenter = CoffeeShopOrderPresenter()
        let interactor = CoffeeShopOrderInteractor(presenter: presenter, price: price, coffeeShop: coffeeShop, productList: productList)
        interactor.coordinator = coordinator
        let viewController = CoffeeShopOrderViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
