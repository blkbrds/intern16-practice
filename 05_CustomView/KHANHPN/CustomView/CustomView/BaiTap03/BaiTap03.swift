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
        let button1 = CustomButton(frame: CGRect(x: 100, y: 200, width: 200, height: 100), number: 1, colorButon: .systemTeal, position: .topRight, name: "Email")
        self.view.addSubview(button1)
        
        let button2 = CustomButton(frame: CGRect(x: 100, y: 400, width: 200, height: 100), number: 10, colorButon: .systemTeal, position: .topCenter, name: "Photos")
        self.view.addSubview(button2)
        
        let button3 = CustomButton(frame: CGRect(x: 100, y: 600, width: 200, height: 100), number: 10, colorButon: .systemTeal, position: .topLeft, name: "Friends")
        self.view.addSubview(button3)
    }

}
