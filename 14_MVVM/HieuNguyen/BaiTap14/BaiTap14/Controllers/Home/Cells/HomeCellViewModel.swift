//
//  HomeCellViewModel.swift
//  BaiTap14
//
//  Created by PCI0020 on 7/17/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import Foundation
import UIKit

final class HomeCellViewModel {
    
    private(set) var coffeeShop: CoffeeShop?
    
    init(coffeeShop: CoffeeShop? = nil) {
        self.coffeeShop = coffeeShop
    }
    
    func changeLikeButton(button: UIButton) {
        if button.tag == 2 {
            button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            button.tag = 1
        } else {
            button.setImage(UIImage(systemName: "star"), for: .normal)
            button.tag = 2
        }
    }
}
