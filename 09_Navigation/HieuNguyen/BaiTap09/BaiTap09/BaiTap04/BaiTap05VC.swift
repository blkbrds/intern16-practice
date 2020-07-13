//
//  BaiTap05VC.swift
//  BaiTap09
//
//  Created by PCI0020 on 7/10/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class BaiTap05VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        let mid1 = UIBarButtonItem(title: "Mid 1", style: .plain, target: self, action: nil)
        let mid2 = UIBarButtonItem(title: "Mid 2", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItems = [backButton,mid1,mid2]        
        
        let rightButton = UIBarButtonItem(title: "Right", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightButton
    }

}
