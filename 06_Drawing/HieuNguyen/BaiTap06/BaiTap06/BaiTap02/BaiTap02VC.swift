//
//  BaiTap02VC.swift
//  BaiTap06
//
//  Created by PCI0020 on 7/3/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class BaiTap02VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let circleViewFrame = CGRect(x: 50, y: 50, width: 200, height: 400)
        let circleView = CircleView(frame: circleViewFrame)
        view.addSubview(circleView)
    }
}
