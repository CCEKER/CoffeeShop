//
//  DashboardFlowCoordinator.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 21.03.2024.
//

import Foundation
import UIKit

protocol DashboardFlowCoordinatorProtocol {
    func start()
}

protocol DashboardFlowCoordinatorDelegate: AnyObject {
    
}

final class DashboardFlowCoordinator: DashboardFlowCoordinatorProtocol {
    
    private let window: UIWindow
    private let delegate: DashboardFlowCoordinatorDelegate
    private var navigationController = UINavigationController()
    
    init(window: UIWindow, delegate: DashboardFlowCoordinatorDelegate) {
        self.window = window
        self.delegate = delegate
    }
    
    func start() {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = UIColor.init(rgb: 0xF1F1F1)
        tabBarController.tabBar.unselectedItemTintColor = .white
        tabBarController.tabBar.tintColor = .systemOrange
        let coffeeShopHomePageViewController = CoffeShopHomePageViewController.build(coordinator: self, tabBarController: tabBarController)
        tabBarController.viewControllers = [coffeeShopHomePageViewController]
        let navigationController = UINavigationController(rootViewController: tabBarController)
        self.navigationController = navigationController
        self.window.rootViewController = navigationController
    }
}

extension DashboardFlowCoordinator: CoffeShopHomePageInteractorCoordinatorDelegate {
    
    func didTapPlusButton(selectedIndex: Int, coffeeShop: CoffeeShop) {
        let coffeeShopProductDetailViewController = CoffeeShopProductDetailViewController.build(coordinator: self, selectedIndex: selectedIndex, coffeeShop: coffeeShop)
        self.navigationController.pushViewController(coffeeShopProductDetailViewController, animated: true)
    }
}

extension DashboardFlowCoordinator: CoffeeShopProductDetailInteractorCoordinatorDelegate {
   
    func coffeeShopProductDetailInteractorDidTapBuyNowButton(selectedPrice: Price, coffeeShop: CoffeeShop, productList: ProductList) {
        
        let coffeeShopOrderViewController = CoffeeShopOrderViewController.build(coordinator: self, price: selectedPrice, coffeeShop: coffeeShop, productList: productList)
        self.navigationController.pushViewController(coffeeShopOrderViewController, animated: true)
    }
}

extension DashboardFlowCoordinator: CoffeeShopOrderInteractorCoordinatorDelegate {
   
    func coffeeShopOrderInteractorDidTapOrderButton(coffeeShop: CoffeeShop) {
        
        let coffeeShopDeliveryMapViewController = CoffeeShopDeliveryMapViewController.build(coordidnator: self, coffeShop: coffeeShop)
        self.navigationController.pushViewController(coffeeShopDeliveryMapViewController, animated: true)
    }
}

extension DashboardFlowCoordinator: CoffeeShopDeliveryMapInteractorCoordinatorDelegate {
    
}
