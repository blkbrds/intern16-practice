//
//  Bai402ViewController.swift
//  baitap09
//
//  Created by NXH on 7/16/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap402ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naviBarItem()
    }
    // MARK: - Private function
    private func naviBarItem() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        title = "BaiTap2"
        let rightButton: UIButton = UIButton()
        rightButton.setBackgroundImage(UIImage(named: "hihi"), for: .normal)
        let leftButton: UIButton = UIButton()
        leftButton.setBackgroundImage(UIImage(named: "left"), for: .normal)
        
        if let naviController = navigationController {
            naviController.navigationBar.setBackgroundImage(UIImage(named: "blueBackground"), for: UIBarMetrics.default)
        }
        let rightItem = UIBarButtonItem(customView: rightButton)
        let leftItem = UIBarButtonItem(customView: leftButton)
        navigationItem.rightBarButtonItem = rightItem
        navigationItem.leftBarButtonItem = leftItem
    }
}
