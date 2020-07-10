//
//  BaiTap01VC.swift
//  BaiTap09
//
//  Created by PCI0020 on 7/10/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class BaiTap01VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gradient NavigationBar"
        let image = UIImage(named: "Gradient")
        navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }

}
