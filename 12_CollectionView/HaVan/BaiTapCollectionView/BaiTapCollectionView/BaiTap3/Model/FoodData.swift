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

enum KindFood {
    case sushi(name: String)
    case sashimi(name: String)
    case eggs(name: String)
}

class FoodManagement {
    
    var kindName: String?
    var kindImage: UIImage?
    var food: [Food]?
    
    func createKindFood(with kindFood: KindFood) {
        switch kindFood {
        case .eggs(name: let name):
            self.kindName = name
            self.kindImage = #imageLiteral(resourceName: "eggs")
            self.food = [Food(name: "Curry", image: #imageLiteral(resourceName: "curry")),
                         Food(name: "Omurice", image: #imageLiteral(resourceName: "omurice")),
                         Food(name: "Tamako kake gohan", image: #imageLiteral(resourceName: "tamagokakegohan")),
                         Food(name: "Tamagoyaki", image: #imageLiteral(resourceName: "tamagoyaki")),
                         Food(name: "Tokushima ramen", image: #imageLiteral(resourceName: "tokushimaramen"))
            ]
        case .sushi(name: let name):
            self.kindName = name
            self.kindImage = #imageLiteral(resourceName: "sushi")
            self.food = [Food(name: "Salmon sushi", image: #imageLiteral(resourceName: "salmonsushi")),
                         Food(name: "Salmon roe sushi", image: #imageLiteral(resourceName: "trungcachuon")),
                         Food(name: "Flying fish roe sushi", image: #imageLiteral(resourceName: "TOBIKO")),
                         Food(name: "Eggs sushi", image: #imageLiteral(resourceName: "sushitrung")),
                         Food(name: "Crab sushi", image: #imageLiteral(resourceName: "sushithanhcua")),
                         Food(name: "Tuna sushi", image: #imageLiteral(resourceName: "tunasushi")),
                         Food(name: "Shrimp sushi", image: #imageLiteral(resourceName: "sushi-tom-mem")),
                         Food(name: "California roll", image: #imageLiteral(resourceName: "californiaroll"))
            ]
        case .sashimi(name: let name):
            self.kindName = name
            self.kindImage = #imageLiteral(resourceName: "sashimi")
            self.food = [Food(name: "Salmon sashimi", image: #imageLiteral(resourceName: "salmonsushi")),
                         Food(name: "Hokkigai sashimi", image: #imageLiteral(resourceName: "trungcachuon")),
                         Food(name: "Tuna sashimi", image: #imageLiteral(resourceName: "tunasashimi")),
                         Food(name: "Octopus sashimi", image: #imageLiteral(resourceName: "octopusSashimi"))
            ]
        }
    }
}

class FoodFacttory {
    var foodFactory = [[Food]]()
    var sectionFood : [String : UIImage] = [ : ]
    
    func configData() {
        let newSushi = FoodManagement()
        let newSashimi = FoodManagement()
        let newEggs = FoodManagement()
        newSushi.createKindFood(with: KindFood.sushi(name: "Sushi"))
        newSashimi.createKindFood(with: KindFood.sashimi(name: "Sashimi"))
        newEggs.createKindFood(with: KindFood.eggs(name: "Eggs"))
        guard let nameSushi = newSushi.kindName, let imageSushi = newSushi.kindImage
            else { return }
        sectionFood[nameSushi] = imageSushi
        guard let nameSashimi = newSashimi.kindName, let imageSashimi = newSashimi.kindImage
            else { return }
        sectionFood[nameSashimi] = imageSashimi
        guard let nameEggs = newEggs.kindName, let imageEggs = newEggs.kindImage
            else { return }
        sectionFood[nameEggs] = imageEggs
        guard let sushi = newSushi.food, let sashimi = newSashimi.food, let eggs = newEggs.food
            else {return }
        foodFactory.append(sushi)
        foodFactory.append(sashimi)
        foodFactory.append(eggs)
    }
}
