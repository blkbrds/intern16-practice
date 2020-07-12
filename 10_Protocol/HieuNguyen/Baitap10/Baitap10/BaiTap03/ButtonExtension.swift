//
//  buttonExtension.swift
//  Baitap10
//
//  Created by hieungq on 7/11/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class ButtonExtension: UIButton {
    
    var colorButton:UIColor?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.masksToBounds = true
        layer.cornerRadius = 10
        layer.borderWidth = 2.0
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    

}
