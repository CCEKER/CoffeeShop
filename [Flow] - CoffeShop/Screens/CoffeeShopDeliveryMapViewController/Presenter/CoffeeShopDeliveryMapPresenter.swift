//
//  CoffeeShopDeliveryMapPresenter.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 25.03.2024.
//

import Foundation
import UIKit

protocol CoffeeShopDeliveryMapPresenterProtocol {
    func presentViewModel(_ coffeeShop: CoffeeShop)
}

final class CoffeeShopDeliveryMapPresenter: CoffeeShopDeliveryMapPresenterProtocol {
    
    weak var viewController: CoffeeShopDeliveryMapViewControllerProtocol?
    
    func presentViewModel(_ coffeeShop: CoffeeShop) {
        
        guard let driverProfileImage = coffeeShop.delivery.driver.imageUrl else { return }
        
        let viewModel = CoffeeShopDeliveryMapViewModel(
            userAddress: coffeeShop.user.location.current.address,
            deliveryLatitude: coffeeShop.user.location.current.coordinate.latitude,
            deliveryLongitude: coffeeShop.user.location.current.coordinate.longitude,
            driverLatitude: coffeeShop.delivery.driver.coordinate.latitude,
            driverLongitude: coffeeShop.delivery.driver.coordinate.longitude,
            deliveryTime: formatDeliveryTime(minutes: coffeeShop.delivery.deliveryTime),
            deliveryTitleLabel: "Delivery to",
            deliveryAdress: coffeeShop.user.location.current.address,
            deliveredOrderTitle: "Delivered your order",
            deliveredOrderSubtitle: "We deliver your goods to you in the shortes possible time",
            driverIcon: UIImage(named: "bike")!,
            driverProfileImage: driverProfileImage,
            driverName: coffeeShop.delivery.driver.name,
            driverJob: coffeeShop.delivery.driver.title,
            driverPhoneIcon: UIImage(named: "telpon")!
        )
        viewController?.displayViewModel(viewModel)
    }
    
    private func formatDeliveryTime(minutes: Int) -> String {
        if minutes < 60 {
            return "\(minutes) minutes left"
        } else {
            let hours = minutes / 60
            let remainingMinutes = minutes % 60
            if remainingMinutes > 0 {
                return "\(hours) hour \(remainingMinutes) minutes left"
            } else {
                return "\(hours) hour left"
            }
        }
    }
}
