//
//  CoffeShopWelcomeViewState.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 19.03.2024.
//

import Foundation
import UIKit

struct CoffeShopWelcomeViewModel {
    let backgroundImage: UIImage
    let backgroundImage2: UIImage
    let title: String
    let subtitle: String
    let buttonTitle: String
}

enum CoffeShopWelcomeViewState {
    case initial(CoffeShopWelcomeViewModel)
    case error
}
