//
//  FoodData.swift
//  BaiTapCollectionView
//
//  Created by NganHa on 8/3/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import UIKit

struct Food {
    var name: String
    var image: UIImage
}

enum Kind: Int {
    case sushi
    case sashimi
    case eggs
    
    var kindName: String {
        switch self {
        case .sushi:
            return "Sushi"
        case .sashimi:
            return "Sashimi"
        case .eggs:
            return "Eggs"
        }
    }
    
    var kindImage: UIImage {
        switch self {
        case .sushi:
            return #imageLiteral(resourceName: "sushi")
        case .sashimi:
            return #imageLiteral(resourceName: "sashimi")
        case .eggs:
            return #imageLiteral(resourceName: "eggs")
        }
    }
    
    var food: [Food] {
        switch self {
        case .sushi:
            return [Food(name: "Salmon sushi", image: #imageLiteral(resourceName: "salmonsushi")),
                    Food(name: "Salmon roe sushi", image: #imageLiteral(resourceName: "trungcachuon")),
                    Food(name: "Flying fish roe sushi", image: #imageLiteral(resourceName: "TOBIKO")),
                    Food(name: "Eggs sushi", image: #imageLiteral(resourceName: "sushitrung")),
                    Food(name: "Crab sushi", image: #imageLiteral(resourceName: "sushithanhcua")),
                    Food(name: "Tuna sushi", image: #imageLiteral(resourceName: "tunasushi")),
                    Food(name: "Shrimp sushi", image: #imageLiteral(resourceName: "sushi-tom-mem")),
                    Food(name: "California roll", image: #imageLiteral(resourceName: "californiaroll"))
            ]
        case .sashimi:
            return [Food(name: "Salmon sashimi", image: #imageLiteral(resourceName: "salmonsushi")),
                    Food(name: "Hokkigai sashimi", image: #imageLiteral(resourceName: "trungcachuon")),
                    Food(name: "Tuna sashimi", image: #imageLiteral(resourceName: "tunasashimi")),
                    Food(name: "Octopus sashimi", image: #imageLiteral(resourceName: "octopusSashimi"))
            ]
        case .eggs:
            return [Food(name: "Curry", image: #imageLiteral(resourceName: "curry")),
                    Food(name: "Omurice", image: #imageLiteral(resourceName: "omurice")),
                    Food(name: "Tamako kake gohan", image: #imageLiteral(resourceName: "tamagokakegohan")),
                    Food(name: "Tamagoyaki", image: #imageLiteral(resourceName: "tamagoyaki")),
                    Food(name: "Tokushima ramen", image: #imageLiteral(resourceName: "tokushimaramen"))
            ]
        }
    }
    
    static var count: Int { Kind.sushi.rawValue + 1}


}
