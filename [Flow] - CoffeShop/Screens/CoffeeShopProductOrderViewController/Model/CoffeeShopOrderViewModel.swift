//
//  CoffeeShopOrderViewModel.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 23.03.2024.
//

import Foundation
import UIKit

struct CoffeeShopOrderViewModel {
    let navigationTitle: String
    let deliveryTitle: String
    let address: String
    let addressDetail: String
    let editAdressButtonIcon: UIImage
    let addNoteButtonIcon: UIImage
    let selectedProductImageUrl: String
    let productTitle: String
    let productSubtitle: String
    let minusButtonIcon: UIImage
    let plusButtonIcon: UIImage
    let isPlusButtonEnabled: Bool
    let isMinusButtonEnabled: Bool
    let productCountLabel: String
    let discountIcon: UIImage
    let arrowRightIcon: UIImage
    let discountTitle: String
    let paymentSummaryTitle: String
    let priceTitleLabel: String
    let priceValueLabel: String
    let deliveryFeeTitleLabel: String
    let deliveryFeeDiscountLabel: String
    let totalPaymentTitleLabel: String
    let totalPaymentValueLabel: String
    let cashTitleLabel: String
    let cashPriceLabel: String
    let moneysIcon: UIImage
    let orderButtonTitle: String
}
