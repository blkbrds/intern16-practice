//
//  bai4bViewController.swift
//  Bai4Navigation
//
//  Created by Trung Le D. on 7/23/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class bai4bViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gradient NavigationBar"
        self.navigationController?.navigationBar .setBackgroundImage(UIImage(named: "rong-banner"), for: .default)
    }
}
