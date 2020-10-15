//
//  SubCalculator.swift
//  Baitap10Protocol
//
//  Created by MBA0245P on 10/15/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

@IBDesignable
class SubCalculator: UIView {

    @IBOutlet weak var navigationStack: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configNavigationStack()
    }
    
    func configNavigationStack() {
        let border = CALayer()
        border.backgroundColor = #colorLiteral(red: 0.09297447849, green: 0.3600888325, blue: 0.16213688, alpha: 1)
        border.frame = CGRect(x: 0, y: 35, width: frame.width, height: 1.0)
        navigationStack.layer.addSublayer(border)
    }

}
