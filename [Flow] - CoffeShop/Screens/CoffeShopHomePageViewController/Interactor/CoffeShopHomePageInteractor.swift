//
//  CoffeShopHomePageInteractor.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 20.03.2024.
//

import Foundation
import UIKit

protocol CoffeShopHomePageInteractorProtocol {
    func viewDidLoad()
    func didTapProductTitle(at index: Int)
    func didTapPlusButton(at index: Int)
}

protocol CoffeShopHomePageInteractorCoordinatorDelegate: AnyObject {
    func didTapPlusButton(selectedIndex: Int, coffeeShop: CoffeeShop)
}

final class CoffeShopHomePageInteractor {
    
    private let presenter: CoffeShopHomePagePresenterProtocol
    weak var coordinator: CoffeShopHomePageInteractorCoordinatorDelegate?
    private var tabBarController: UITabBarController
    private var coffeeShop: CoffeeShop?
    private var selectedProductTitleIndex: Int?
    
    init(presenter: CoffeShopHomePagePresenterProtocol, tabBarController: UITabBarController) {
        self.presenter = presenter
        self.tabBarController = tabBarController
    }
}

extension CoffeShopHomePageInteractor: CoffeShopHomePageInteractorProtocol {
    
    func viewDidLoad() {
        
        do {
            if let filePath = Bundle.main.path(forResource: "coffee_shop", ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                let decodedData = try JSONDecoder().decode(CoffeeShop.self, from: data)
                self.coffeeShop = decodedData
                presenter.presentCoffeeShop(decodedData, selectedSection: nil)
            }
        } catch {
            print("Error: \(error)")
        }
    }
    
    func didTapProductTitle(at index: Int) {
        
        if let selectedProductTitleIndex = self.selectedProductTitleIndex, selectedProductTitleIndex == index {
            self.selectedProductTitleIndex = nil
        } else {
            self.selectedProductTitleIndex = index
        }
        
        let selectedProduct = self.selectedProductTitleIndex != nil ? coffeeShop?.home.products[index].section : nil
        guard let selectedProduct else { return }
        guard let coffeeShop else { return }
        presenter.presentCoffeeShop(coffeeShop, selectedSection: selectedProduct)
    }
    
    func didTapPlusButton(at index: Int) {
        guard let coffeeShop else { return }
        coordinator?.didTapPlusButton(selectedIndex: index, coffeeShop: coffeeShop)
    }
}
