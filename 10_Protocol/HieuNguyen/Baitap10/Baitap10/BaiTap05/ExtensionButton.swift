//
//  ExtensionButton.swift
//  Baitap10
//
//  Created by PCI0020 on 7/13/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class ExtensionButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        layer.borderWidth = 2
        layer.masksToBounds = true
        layer.cornerRadius = 5
    }

}
