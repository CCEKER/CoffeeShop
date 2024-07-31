//
//  CoffeeShopViewModel.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 20.03.2024.
//

import Foundation
import CoreLocation

struct CoffeeShop: Codable {
    let user: User
    let paymentType: PaymentType
    let delivery: Delivery
    let home: Home
}

enum PaymentType: String, Codable {
    case cash = "CASH"
}

struct Delivery: Codable {
    let fee: Int
    let currency: String
    let deliveryTime: Int
    let driver: Driver
}

struct Driver: Codable {
    let id: String
    let name: String
    let title: String
    let imageUrl: String?
    let coordinate: Coordinate

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case title
        case imageUrl
        case coordinate
    }
}

struct Coordinate: Codable {
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            latitude = try container.decode(CLLocationDegrees.self, forKey: .latitude)
            longitude = try container.decode(CLLocationDegrees.self, forKey: .longitude)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
        
            try container.encode(latitude, forKey: .latitude)
            try container.encode(longitude, forKey: .longitude)
        }
        
        enum CodingKeys: String, CodingKey {
            case latitude = "latitude"
            case longitude = "longitude"
        }
}

struct Home: Codable {
    let promotions: [Promotion]
    let products: [Product]
}

struct Product: Codable {
    let section: Section
    let productList: [ProductList]
}

struct ProductList: Codable {
    let id: String
    let title: String
    let subtitle: String
    let imageUrl: String
    let prices: [Price]
    let score: Double
    let vote: Int
    let description: String
    let ingredients: [Ingredient]

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case subtitle
        case imageUrl
        case prices
        case score
        case vote
        case description
        case ingredients
    }
}

struct Ingredient: Codable {
    let id: String
    let title: String
    let image: String?
}

struct Price: Codable {
    let id: String
    let type: PriceType
    let price: Int
    let currency: String
}

enum PriceType: String, Codable {
    case small = "SMALL"
    case medium = "MEDIUM"
    case large = "LARGE"
}

struct Section: Codable {
    let id: String
    let title: String
}

struct Promotion: Codable {
    let id: String
    let image: String
}

struct User: Codable {
    let id: String
    let name: String
    let location: Location
    let imageUrl: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case location
        case imageUrl
    }
}

struct Location: Codable {
    let current, delivery: Current
}

struct Current: Codable {
    let id: String
    let address: String
    let addressDetail: String
    let coordinate: Coordinate
}
