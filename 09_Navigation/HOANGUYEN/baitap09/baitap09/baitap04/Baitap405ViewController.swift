//
//  Baitap405ViewController.swift
//  baitap09
//
//  Created by NXH on 7/20/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap405ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
    }
    
    // MARK: - Private Function
    private func configNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right", style: .plain, target: self, action: nil)
        let leftButtons: [UIBarButtonItem] = [UIBarButtonItem(title: "Mid 2", style: .plain, target: self, action: nil), UIBarButtonItem(title: "Mid 1", style: .plain, target: self, action: nil)]
        navigationItem.leftBarButtonItems = leftButtons
    }
}
