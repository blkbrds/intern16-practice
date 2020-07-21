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
}
