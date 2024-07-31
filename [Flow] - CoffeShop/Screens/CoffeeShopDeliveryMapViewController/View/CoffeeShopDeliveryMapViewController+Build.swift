//
//  CoffeeShopDeliveryMapViewController+Build.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 25.03.2024.
//

import Foundation
import UIKit

extension CoffeeShopDeliveryMapViewController {
    static func build(coordidnator: CoffeeShopDeliveryMapInteractorCoordinatorDelegate, coffeShop: CoffeeShop) -> UIViewController {
        let presenter = CoffeeShopDeliveryMapPresenter()
        let interactor = CoffeeShopDeliveryMapInteractor(presenter: presenter, coffeeShop: coffeShop)
        interactor.coordinator = coordidnator
        let viewController = CoffeeShopDeliveryMapViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
