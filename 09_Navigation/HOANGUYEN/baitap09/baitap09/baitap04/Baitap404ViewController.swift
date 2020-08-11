//
//  Baitap404ViewController.swift
//  baitap09
//
//  Created by NXH on 7/20/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap404ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
    }
    
// MARK: - Private Function
    private func configNavigationBar() {
        title = "Bar Button Test"
        let rightButton: UIButton = UIButton()
        rightButton.setBackgroundImage(UIImage(named: "chamhoi"), for: .normal)
        let rightItem: UIBarButtonItem = UIBarButtonItem(customView: rightButton)
        navigationItem.rightBarButtonItem = rightItem
    }
}
