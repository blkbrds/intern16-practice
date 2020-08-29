//
//  BaiTap01.swift
//  Navigation
//
//  Created by PCI0007 on 7/16/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class BaiTap01: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
    }
    
    @IBAction func push(_ sender: UIButton) {
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
