//
//  CoffeShopWelcomeInteractor.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 19.03.2024.
//

import Foundation

protocol CoffeShopWelcomeInteractorProtocol {
    func viewDidLoad()
    func didTapGetStartedButton()
}

protocol CoffeShopWelcomeInteractorCoordinatorDelegate: AnyObject {
    func coffeShopWelcomeInteractorDidTapGetStartedButton()
}

final class CoffeShopWelcomeInteractor {
    
    private let presenter: CoffeShopWelcomePresenterProtocol
    weak var coordinator: CoffeShopWelcomeInteractorCoordinatorDelegate?
    
    init(presenter: CoffeShopWelcomePresenterProtocol) {
        self.presenter = presenter
    }
}

extension CoffeShopWelcomeInteractor: CoffeShopWelcomeInteractorProtocol {
    
    func viewDidLoad() {
        presenter.presentViewDidLoad()
    }
    
    func didTapGetStartedButton() {
        coordinator?.coffeShopWelcomeInteractorDidTapGetStartedButton()
    }
}
