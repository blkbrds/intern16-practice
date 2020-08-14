//
//  FoodFactory.swift
//  BaiTapCollectionView
//
//  Created by NganHa on 8/14/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import UIKit

final class FoodFacttory {
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
