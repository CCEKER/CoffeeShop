//
//  CoffeeShopDetailViewModel.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 21.03.2024.
//

import Foundation

struct CoffeeShopDetailViewModel {
    let productDetailImage: String
    let navigationTitle: String
    let productTitle: String
    let productSubtitle: String
    let scoreLabel: String
    let voteLabel: String
    let descriptionTitle: String
    let readMoreButtonTitle: String
    let description: String
    let sizeLabel: String
    let productType: [String]
    let priceTitle: String
    let price: String
    let currency: String
    let buyNowButtonTitle: String
}

struct CoffeeShopProductTypeViewModel {
    let id: String
    let isSelected: Bool
}
