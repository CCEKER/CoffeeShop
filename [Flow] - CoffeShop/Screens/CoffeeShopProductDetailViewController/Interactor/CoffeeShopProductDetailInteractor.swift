//
//  CoffeeShopProductDetailInteractor.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 21.03.2024.
//

import Foundation

protocol CoffeeShopProductDetailInteractorProtocol {
    func viewDidLoad()
    func didSelectProductType(at index: Int)
    func didTapBuyNowButton()
}

protocol CoffeeShopProductDetailInteractorCoordinatorDelegate: AnyObject {
    func coffeeShopProductDetailInteractorDidTapBuyNowButton(selectedPrice: Price, coffeeShop: CoffeeShop, productList: ProductList)
}

final class CoffeeShopProductDetailInteractor {
    
    private let presenter: CoffeeShopProductDetailPresenterProtocol
    weak var coordinator: CoffeeShopProductDetailInteractorCoordinatorDelegate?
    private var selectedIndex: Int
    private var selectedPrice: Price?
    private let coffeeShop: CoffeeShop
    private var productList: ProductList?
    
    init(presenter: CoffeeShopProductDetailPresenterProtocol, selectedIndex: Int, coffeeShop: CoffeeShop) {
        self.presenter = presenter
        self.selectedIndex = selectedIndex
        self.coffeeShop = coffeeShop
    }
}

extension CoffeeShopProductDetailInteractor: CoffeeShopProductDetailInteractorProtocol {
    
    func viewDidLoad() {
        
        let selectedPrice = coffeeShop.home.products.first?.productList[selectedIndex].prices.first?.price
        let selectedType = coffeeShop.home.products.first?.productList[selectedIndex].prices.first
        guard let selectedPrice else { return }
        presenter.presentModel(coffeeShop, selectedProductIndex: selectedIndex, selectedProductType: selectedType, newPrice: "\(selectedPrice)")
        
    }
    
    func didSelectProductType(at index: Int) {
        
        let selectedProductType = coffeeShop.home.products.first?.productList[selectedIndex].prices[index]
        self.productList = coffeeShop.home.products.first?.productList[selectedIndex]
        self.selectedPrice = selectedProductType
        let product = self.coffeeShop
        guard let selectedProductType else { return }
        presenter.presentModel(product, selectedProductIndex: selectedIndex, selectedProductType: selectedProductType, newPrice: "\(selectedProductType.price)")
    }
    
    func didTapBuyNowButton() {
        
        guard let selectedPrice = self.selectedPrice else { return }
        guard let productList = self.productList else { return }
        coordinator?.coffeeShopProductDetailInteractorDidTapBuyNowButton(selectedPrice: selectedPrice, coffeeShop: coffeeShop, productList: productList)
    }
}

