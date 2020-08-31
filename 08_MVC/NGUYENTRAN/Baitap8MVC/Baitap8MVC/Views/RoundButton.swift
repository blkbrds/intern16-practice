//
//  RoundButton.swift
//  Baitap8MVC
//
//  Created by MBA0245P on 8/31/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var roundButton: Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }
}
