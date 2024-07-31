//
//  CoffeShopWelcomePresenter.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 19.03.2024.
//

import Foundation
import UIKit

protocol CoffeShopWelcomePresenterProtocol {
    func presentViewDidLoad()
}

final class CoffeShopWelcomePresenter: CoffeShopWelcomePresenterProtocol {
    
    weak var viewController: CoffeShopWelcomeViewControllerProtocol?
    
    func presentViewDidLoad() {
        let viewModel = CoffeShopWelcomeViewModel(
            backgroundImage: UIImage(named: "welcome1")!,
            backgroundImage2: UIImage(named: "welcome2")!,
            title: "Coffee so good, your taste buds will love it.",
            subtitle: "The best grain, the finest roast, the powerful flavor.",
            buttonTitle: "Get Started"
        )
        viewController?.displayViewState(.initial(viewModel))
    }
}
