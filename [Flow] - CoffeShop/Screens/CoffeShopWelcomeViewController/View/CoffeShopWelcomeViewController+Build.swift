//
//  CoffeShopWelcomeViewController+Build.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 19.03.2024.
//

import Foundation
import UIKit

extension CoffeShopWelcomeViewController {
    static func build(coordinator: CoffeShopWelcomeInteractorCoordinatorDelegate) -> UIViewController {
        let presenter = CoffeShopWelcomePresenter()
        let interactor = CoffeShopWelcomeInteractor(presenter: presenter)
        interactor.coordinator = coordinator
        let viewController = CoffeShopWelcomeViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
