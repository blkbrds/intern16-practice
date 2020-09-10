//
//  UIImageView.Ext.swift
//  API
//
//  Created by bu on 9/10/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImage(from url: String, placeholder: UIImage? = nil) {
        image = placeholder
        API.shared().dowloadImage(url: url) { (image) in
            self.image = image
        }
    }
}
