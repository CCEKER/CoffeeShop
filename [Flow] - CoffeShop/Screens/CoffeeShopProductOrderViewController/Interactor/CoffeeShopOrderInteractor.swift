//
//  CoffeeShopOrderInteractor.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 23.03.2024.
//

import Foundation

protocol CoffeeShopOrderInteractorProtocol {
    func viewDidLoad()
    func addProduct()
    func deleteProduct()
    func didTapOrderButton()
}

protocol CoffeeShopOrderInteractorCoordinatorDelegate: AnyObject {
    func coffeeShopOrderInteractorDidTapOrderButton(coffeeShop: CoffeeShop)
}

final class CoffeeShopOrderInteractor {
    
    enum Constant {
        static let minimumProductCount = 1
        static let maxiumumProductCount = 5
    }
    
    private let presenter: CoffeeShopOrderPresenterProtocol
    private var price: Price
    weak var coordinator: CoffeeShopOrderInteractorCoordinatorDelegate?
    private var coffeeShop: CoffeeShop
    private var productList: ProductList
    private var productCount = Constant.minimumProductCount
    
    init(presenter: CoffeeShopOrderPresenterProtocol, price: Price, coffeeShop: CoffeeShop, productList: ProductList) {
        self.presenter = presenter
        self.price = price
        self.coffeeShop = coffeeShop
        self.productList = productList
    }
}

extension CoffeeShopOrderInteractor: CoffeeShopOrderInteractorProtocol {
    
    func viewDidLoad() {
        
        presenter.presentViewModel(price, coffeeShop: coffeeShop, productList: productList, isMinusButtonActive: false, isPlusButtonActive: true, productCount: productCount, formattedNewPrice: Double(price.price) / 100, formattedTotalPayment: Double(price.price + coffeeShop.delivery.fee) / 100)
        
    }
    
    func addProduct() {
        
        let newPrice = Double(price.price) / 100 + Double(productCount) * (Double(price.price) / 100)
        let deliveryFee = Double(coffeeShop.delivery.fee) / 100
        let totalNewPayment = newPrice + deliveryFee
        
        if productCount < Constant.maxiumumProductCount {
            productCount += 1
        }
        if productCount > Constant.minimumProductCount && productCount < Constant.maxiumumProductCount {
            presenter.presentViewModel(price, coffeeShop: coffeeShop, productList: productList, isMinusButtonActive: true, isPlusButtonActive: true, productCount: productCount, formattedNewPrice: newPrice, formattedTotalPayment: totalNewPayment)
        } else {
            presenter.presentViewModel(price, coffeeShop: coffeeShop, productList: productList, isMinusButtonActive: true, isPlusButtonActive: false, productCount: productCount, formattedNewPrice: newPrice, formattedTotalPayment: totalNewPayment)
        }
    }
    
    func deleteProduct() {
        
        if productCount > Constant.minimumProductCount {
            productCount -= 1
        }
        
        let basePrice = Double(price.price) / 100
        let newPrice = max(0, basePrice * Double(productCount))
        let deliveryFee = Double(coffeeShop.delivery.fee) / 100
        let totalNewPayment = max(0, newPrice + deliveryFee)
        
        if productCount < Constant.maxiumumProductCount && productCount > Constant.minimumProductCount {
            presenter.presentViewModel(price, coffeeShop: coffeeShop, productList: productList, isMinusButtonActive: true, isPlusButtonActive: true, productCount: productCount, formattedNewPrice: newPrice, formattedTotalPayment: totalNewPayment)
        } else {
            presenter.presentViewModel(price, coffeeShop: coffeeShop, productList: productList, isMinusButtonActive: false, isPlusButtonActive: true, productCount: productCount, formattedNewPrice: newPrice, formattedTotalPayment: totalNewPayment)
        }
    }
    
    func didTapOrderButton() {
        coordinator?.coffeeShopOrderInteractorDidTapOrderButton(coffeeShop: self.coffeeShop)
    }
}
