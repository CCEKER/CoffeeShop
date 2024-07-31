//
//  CoffeeShopProductDetailPresenter.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 21.03.2024.
//

import Foundation

protocol CoffeeShopProductDetailPresenterProtocol {
    func presentModel(_ model: CoffeeShop, selectedProductIndex: Int, selectedProductType: Price?, newPrice: String)
}

final class CoffeeShopProductDetailPresenter: CoffeeShopProductDetailPresenterProtocol {
    
    weak var viewController: CoffeeShopProductDetailViewControllerProtocol?
    let size = ["SMALL": "S", "MEDIUM": "M", "LARGE": "L"]
    
    func presentModel(_ model: CoffeeShop, selectedProductIndex: Int, selectedProductType: Price?, newPrice: String) {
        

        let imageUrl = model.home.products.first?.productList[selectedProductIndex].imageUrl
        let productTitle = model.home.products.first?.productList[selectedProductIndex].title
        let productSubtitle = model.home.products.first?.productList[selectedProductIndex].subtitle
        let scoreLabel = model.home.products.first?.productList[selectedProductIndex].score
        let voteLabel = model.home.products.first?.productList[selectedProductIndex].vote
        let description = model.home.products.first?.productList[selectedProductIndex].description
        let productType = model.home.products.first?.productList.flatMap { $0.prices }.map { $0.type.rawValue }
        let productTypeSize = updateProductTypeSize(from: productType ?? [])
        let selectedProductType = model.home.products.first?.productList.first?.prices.map { type in
            CoffeeShopProductTypeViewModel(id: type.id, isSelected: type.type.rawValue == selectedProductType?.type.rawValue)
        }
        
        let prices = model.home.products.first?.productList.first?.prices.map { $0.price }
        let productCurrencies = model.home.products.first?.productList.first?.prices.first?.currency
        guard let productCurrencies else { return }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        formatter.currencySymbol = ""
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        let formattedPrices = prices.map { price in
            formatter.string(from: NSNumber(value: (Double(newPrice) ?? 0.0) / 100))
        }
        
        guard let selectedProductType else { return }
       
        let viewModel = CoffeeShopDetailViewModel(
            productDetailImage: imageUrl ?? "",
            navigationTitle: "Detail",
            productTitle: productTitle ?? "",
            productSubtitle: productSubtitle ?? "",
            scoreLabel: "\(scoreLabel ?? 0.0)",
            voteLabel: "(\(voteLabel ?? 0))",
            descriptionTitle: "Description",
            readMoreButtonTitle: "Read More",
            description: description ?? "",
            sizeLabel: "Size",
            productType: productTypeSize,
            priceTitle: "Price",
            price: (formattedPrices ?? "") ?? "",
            currency: productCurrencies,
            buyNowButtonTitle: "Buy Now"
        )
        viewController?.displayViewModel(viewModel, productTypeViewModel: selectedProductType)
    }
    
    private func updateProductTypeSize(from productTypes: [String]) -> [String] {
        productTypes.map { size[$0] ?? $0 }
    }
}

