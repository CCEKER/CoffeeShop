//
//  CoffeeShopDeliveryMapInteractor.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 25.03.2024.
//

import Foundation

protocol CoffeeShopDeliveryMapInteractorProtocol {
    func viewDidLoad()
}

protocol CoffeeShopDeliveryMapInteractorCoordinatorDelegate: AnyObject {
    
}

final class CoffeeShopDeliveryMapInteractor {
    
    private let presenter: CoffeeShopDeliveryMapPresenterProtocol
    private let coffeeShop: CoffeeShop
    weak var coordinator: CoffeeShopDeliveryMapInteractorCoordinatorDelegate?
    
    init(presenter: CoffeeShopDeliveryMapPresenterProtocol, coffeeShop: CoffeeShop) {
        self.presenter = presenter
        self.coffeeShop = coffeeShop
    }
    
}

extension CoffeeShopDeliveryMapInteractor: CoffeeShopDeliveryMapInteractorProtocol {
    
    func viewDidLoad() {
        presenter.presentViewModel(self.coffeeShop)
    }
}
