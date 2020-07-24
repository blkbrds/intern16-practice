//
//  BaiTap05.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/23/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class BaiTap05: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        rightButton()
        backButton()
    }

    // MARK: - Private functions
    private func backButton() {
        let backButton = UIBarButtonItem(title: "Left", style: .plain, target: self, action: nil)
        let mid1Button = UIBarButtonItem(title: "Mid1", style: .plain, target: self, action: nil)
        let mid2Button = UIBarButtonItem(title: "Mid2", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItems = [backButton, mid1Button, mid2Button]
    }

    private func rightButton() {
        let rightButton = UIBarButtonItem(title: "Right", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightButton
    }
}
