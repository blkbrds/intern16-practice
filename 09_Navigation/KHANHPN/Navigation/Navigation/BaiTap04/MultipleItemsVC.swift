//
//  MultipleItems.swift
//  Navigation
//
//  Created by PCI0007 on 7/20/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

class MultipleItemsVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        customBar()
    }
    
    func customBar() {
        let midButton1 = UIBarButtonItem(title: "Mid 1", style: .plain, target: self, action: nil)
        let midButton2 = UIBarButtonItem(title: "Mid 2", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItems = [midButton1, midButton2]
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right", style: .plain, target: self, action: nil)
    }
}
