//
//  BaiTap02VC.swift
//  BaiTap05
//
//  Created by PCI0020 on 7/1/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class BaiTap02VC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button1 = BadgeButton(frame: CGRect(x: 100, y: 100, width: 200, height: 100), pointNumber: 10, name: "Email", colorBtn: #colorLiteral(red: 0.4401525557, green: 0.6798833013, blue: 0.2787234783, alpha: 1), position: .topRight)
        self.view.addSubview(button1)
        
        let button2 = BadgeButton(frame: CGRect(x: 100, y: 250, width: 200, height: 100), pointNumber: 500, name: "Friend", colorBtn: #colorLiteral(red: 0.9742196202, green: 0.7773076892, blue: 0.1968542337, alpha: 1), position: .topLeft)
        self.view.addSubview(button2)
        
        let button3 = BadgeButton(frame: CGRect(x: 100, y: 400, width: 200, height: 100), pointNumber: 8, name: "Email", colorBtn: #colorLiteral(red: 0.4508126378, green: 0.2739751637, blue: 0.6256997585, alpha: 1), position: .topCenter)
        self.view.addSubview(button3)
    }

}
