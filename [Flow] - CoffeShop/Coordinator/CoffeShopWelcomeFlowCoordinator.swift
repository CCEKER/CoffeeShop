//
//  CoffeShopWelcomeFlowCoordinator.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 20.03.2024.
//

import Foundation
import UIKit

protocol CoffeShopWelcomeFlowCoordinatorProtocol {
    func start()
}

protocol CoffeShopWelcomeFlowCoordinatorDelegate: AnyObject {
    func coffeShopWelcomeFlowCoordinatorDidFinish()
}

final class CoffeShopWelcomeFlowCoordinator: CoffeShopWelcomeFlowCoordinatorProtocol {
    
    private let window: UIWindow
    private let delegate: CoffeShopWelcomeFlowCoordinatorDelegate
    private var navigationController = UINavigationController()
    
    init(window: UIWindow, delegate: CoffeShopWelcomeFlowCoordinatorDelegate) {
        self.window = window
        self.delegate = delegate
    }
    
    func start() {
        let coffeShopWelcomeViewController = CoffeShopWelcomeViewController.build(coordinator: self)
        navigationController.viewControllers = [coffeShopWelcomeViewController]
        self.window.rootViewController = navigationController
    }
}

extension CoffeShopWelcomeFlowCoordinator: CoffeShopWelcomeInteractorCoordinatorDelegate {
    
    func coffeShopWelcomeInteractorDidTapGetStartedButton() {
        delegate.coffeShopWelcomeFlowCoordinatorDidFinish()
    }
}

extension CoffeShopWelcomeFlowCoordinator: CoffeShopHomePageInteractorCoordinatorDelegate {
    
    func didTapPlusButton(selectedIndex: Int, coffeeShop: CoffeeShop) {
        
        let coffeeShopProductDetailViewController = CoffeeShopProductDetailViewController.build(coordinator: self, selectedIndex: selectedIndex, coffeeShop: coffeeShop)
        navigationController.pushViewController(coffeeShopProductDetailViewController, animated: true)
    }
}

extension CoffeShopWelcomeFlowCoordinator: CoffeeShopProductDetailInteractorCoordinatorDelegate {
    
    func coffeeShopProductDetailInteractorDidTapBuyNowButton(selectedPrice: Price, coffeeShop: CoffeeShop, productList: ProductList) {
        
    }
}
