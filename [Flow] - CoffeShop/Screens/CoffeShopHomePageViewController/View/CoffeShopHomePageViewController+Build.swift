//
//  CoffeShopHomePageViewController+Build.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 20.03.2024.
//

import Foundation
import UIKit

extension CoffeShopHomePageViewController {
    static func build(coordinator: CoffeShopHomePageInteractorCoordinatorDelegate, tabBarController: UITabBarController) -> UIViewController {
        let presenter = CoffeShopHomePagePresenter()
        let interactor = CoffeShopHomePageInteractor(presenter: presenter, tabBarController: tabBarController)
        interactor.coordinator = coordinator
        let viewController = CoffeShopHomePageViewController(interactor: interactor)
        viewController.tabBarItem.title = "Home"
        viewController.tabBarItem.image = UIImage(named: "home")
        presenter.viewController = viewController
        return viewController
    }
}
