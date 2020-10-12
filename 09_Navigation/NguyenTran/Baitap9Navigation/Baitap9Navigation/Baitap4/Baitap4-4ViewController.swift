//
//  Baitap4-4ViewController.swift
//  Baitap9Navigation
//
//  Created by MBA0245P on 10/12/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap4_4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let rightBarButton = UIBarButtonItem(title: "Right", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightBarButton
        let mid1 = UIBarButtonItem(title: "Mid 1", style: .plain, target: self, action: nil)
        let mid2 = UIBarButtonItem(title: "Mid 2", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItems = [mid1, mid2]
        navigationController?.navigationBar.barTintColor = .white
        self.navigationItem.leftItemsSupplementBackButton = true
    }
}
