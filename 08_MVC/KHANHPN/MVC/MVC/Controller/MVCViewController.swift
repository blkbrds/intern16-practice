//
//  MVCViewController.swift
//  MVC
//
//  Created by PCI0007 on 7/15/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class MVCViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let caltulator = Bundle.main.loadNibNamed("CalculatorView", owner: self, options: nil)?.first as? CalculatorView
        caltulator?.frame = CGRect(x: 25, y: 100, width: 314, height: 429)
        view.addSubview(caltulator!)
    }
}
