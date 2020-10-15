//
//  RoundButton.swift
//  Baitap10Protocol
//
//  Created by MBA0245P on 10/15/20.
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
