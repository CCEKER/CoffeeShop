//
//  CoffeShopHomePagePresenter.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 20.03.2024.
//

import Foundation

protocol CoffeShopHomePagePresenterProtocol {
    func presentCoffeeShop(_ model: CoffeeShop, selectedSection: Section?)
}

final class CoffeShopHomePagePresenter: CoffeShopHomePagePresenterProtocol {
    
    weak var viewController: CoffeShopHomePageViewControllerProtocol?
    
    func presentCoffeeShop(_ model: CoffeeShop, selectedSection: Section?) {
        let promoImages = model.home.promotions.map { $0.image }
        let sectionTitle = model.home.products.map { $0.section.title }
        let isSelected = model.home.products.contains { $0.section.id == selectedSection?.id }
        let allProductList = model.home.products.flatMap { $0.productList }
        let productNames = allProductList.map { $0.title }
        let productImageUrl = allProductList.map { $0.imageUrl }
        let productTitles = model.home.products.flatMap { $0.productList.map { $0.title } }
        let productSubtitles = model.home.products.flatMap { $0.productList.map { $0.subtitle } }
        let productPrices = model.home.products.flatMap { product in
            product.productList.flatMap { productList in
                productList.prices.filter { $0.type.rawValue == "SMALL"}
            }
        }
        
        let prices = productPrices.map { $0.price }
        let productCurrencies = model.home.products.flatMap { $0.productList.flatMap { $0.prices.map { $0.currency } } }
        let ratings = model.home.products.flatMap { $0.productList.map { $0.score} }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        formatter.currencySymbol = ""
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        let formattedPrices = prices.map { price in
            formatter.string(from: NSNumber(value: Double(price) / 100)) ?? "\(price)"
        }
        
        let viewModel = CoffeeShopHomePageViewModel(
            addressLabel: model.user.location.current.address,
            profileImageUrl: model.user.imageUrl ?? "",
            promoImages: promoImages,
            sectionTitles: sectionTitle,
            isSelected: isSelected,
            products: productNames,
            productsImageUrl: productImageUrl,
            productTitleLabel: productTitles,
            productSubtitleLabel: productSubtitles,
            currency: productCurrencies,
            price: formattedPrices,
            rating: ratings
           )
        viewController?.displayViewModel(viewModel)
    }
}
