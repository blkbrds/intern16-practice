//
//  BaiTap03.swift
//  CustomView
//
//  Created by PCI0007 on 7/6/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

class BaiTap03: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = CustomButton(frame: CGRect(x: 100, y: 100, width: 200, height: 100), number: 10, colorButon: .green, position: .topLeft)
        self.view.addSubview(button)
    }

}
