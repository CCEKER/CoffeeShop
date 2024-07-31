//
//  CoffeeShopOrderPresenter.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 23.03.2024.
//

import Foundation
import UIKit

protocol CoffeeShopOrderPresenterProtocol {
    func presentViewModel(_ price: Price, coffeeShop: CoffeeShop, productList: ProductList, isMinusButtonActive: Bool, isPlusButtonActive: Bool, productCount: Int, formattedNewPrice: Double, formattedTotalPayment: Double)
}

final class CoffeeShopOrderPresenter: CoffeeShopOrderPresenterProtocol {
    
    weak var viewController: CoffeeShopOrderViewControllerProtocol?
    
    func presentViewModel(_ price: Price, coffeeShop: CoffeeShop, productList: ProductList, isMinusButtonActive: Bool, isPlusButtonActive: Bool, productCount: Int, formattedNewPrice: Double, formattedTotalPayment: Double) {
        
        let imageUrl = productList.imageUrl
        let deliveryFeeValue = Double(coffeeShop.delivery.fee) / 100.0
        let formattedNewPrices = String(format: "%.2f", formattedNewPrice)
        let formattedTotalNewPrices = String(format: "%.2F", formattedTotalPayment)
        
        let viewModel = CoffeeShopOrderViewModel(
            navigationTitle: "Order",
            deliveryTitle: "Delivery Address",
            address: coffeeShop.user.location.current.address,
            addressDetail: coffeeShop.user.location.current.addressDetail,
            editAdressButtonIcon: UIImage(named: "editAddress")!,
            addNoteButtonIcon: UIImage(named: "addNote")!,
            selectedProductImageUrl: imageUrl,
            productTitle: productList.title,
            productSubtitle: productList.subtitle,
            minusButtonIcon: UIImage(named: "minusButton")!,
            plusButtonIcon: UIImage(named: "plusButton")!,
            isPlusButtonEnabled: isPlusButtonActive,
            isMinusButtonEnabled: isMinusButtonActive,
            productCountLabel: "\(productCount)",
            discountIcon: UIImage(named: "discount")!,
            arrowRightIcon: UIImage(named: "arrowRight")!,
            discountTitle: "Add Discount Code",
            paymentSummaryTitle: "Payment Summary",
            priceTitleLabel: "Price",
            priceValueLabel: "\(price.currency) \(formattedNewPrices)",
            deliveryFeeTitleLabel: "Delivery Fee",
            deliveryFeeDiscountLabel: "\(price.currency) \(deliveryFeeValue)",
            totalPaymentTitleLabel: "Total Payment",
            totalPaymentValueLabel: "\(price.currency) \(formattedTotalNewPrices)",
            cashTitleLabel: coffeeShop.paymentType.rawValue,
            cashPriceLabel: "\(price.currency) \(formattedTotalNewPrices)",
            moneysIcon: UIImage(named: "moneys")!,
            orderButtonTitle: "Order"
        )
        viewController?.displayViewModel(viewModel)
    }
}
