//
//  CoffeeShopDeliveryMapViewModel.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 25.03.2024.
//

import Foundation
import CoreLocation
import UIKit

struct CoffeeShopDeliveryMapViewModel {
    let userAddress: String
    let deliveryLatitude: CLLocationDegrees
    let deliveryLongitude: CLLocationDegrees
    let driverLatitude: CLLocationDegrees
    let driverLongitude: CLLocationDegrees
    let deliveryTime: String
    let deliveryTitleLabel: String
    let deliveryAdress: String
    let deliveredOrderTitle: String
    let deliveredOrderSubtitle: String
    let driverIcon: UIImage
    let driverProfileImage: String
    let driverName: String
    let driverJob: String
    let driverPhoneIcon: UIImage
}
