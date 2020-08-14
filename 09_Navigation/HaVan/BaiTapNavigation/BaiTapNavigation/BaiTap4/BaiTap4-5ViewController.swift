//
//  BaiTap4-5ViewController.swift
//  BaiTapNavigation
//
//  Created by NganHa on 7/23/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap4_5ViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
    }
    
    // MARK: - Private functions
    private func configNavigationBar() {
        let backButton =  UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        let firstMidButton =  UIBarButtonItem(title: "Mid1", style: .plain, target: self, action: nil)
        let secondMid2Button =  UIBarButtonItem(title: "Mid2", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItems = [backButton,firstMidButton, secondMid2Button]
        let rightButton =  UIBarButtonItem(title: "Right", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightButton
    }
}
