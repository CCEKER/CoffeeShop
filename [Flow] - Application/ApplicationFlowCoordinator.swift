//
//  ApplicationFlowCoordinator.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 19.03.2024.
//

import Foundation
import UIKit

protocol ApplicationFlowCoordinatorProtocol {
    func start()
}

final class ApplicationFlowCoordinator: ApplicationFlowCoordinatorProtocol {
    
    private let window: UIWindow
    private var coffeShopWelcomeFlowCoordinator: CoffeShopWelcomeFlowCoordinatorProtocol?
    private var dashboardFlowCoordinator: DashboardFlowCoordinatorProtocol?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        coffeShopWelcomeFlowCoordinator = CoffeShopWelcomeFlowCoordinator(window: self.window, delegate: self)
        coffeShopWelcomeFlowCoordinator?.start()
    }
}

extension ApplicationFlowCoordinator: CoffeShopWelcomeFlowCoordinatorDelegate {
    
    func coffeShopWelcomeFlowCoordinatorDidFinish() {
        coffeShopWelcomeFlowCoordinator = nil
        dashboardFlowCoordinator = DashboardFlowCoordinator(window: self.window, delegate: self)
        dashboardFlowCoordinator?.start()
    }
}

extension ApplicationFlowCoordinator: DashboardFlowCoordinatorDelegate {
    
}

