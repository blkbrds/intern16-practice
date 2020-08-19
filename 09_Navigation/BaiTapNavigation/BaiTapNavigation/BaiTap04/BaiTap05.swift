//
//  BaiTap05.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/23/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class BaiTap05: UIViewController {

    // MARK: - Configure
    private struct Configure {
        static let titleBackButton = "Left"
        static let titleMid1Button = "Mid1"
        static let titleMid2Button = "Mid2"
        static let titleRightButton = "Right"
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        rightButton()
        backButton()
    }

    // MARK: - Private functions
    private func backButton() {
        let backButton = UIBarButtonItem(title: Configure.titleBackButton, style: .plain, target: self, action: nil)
        let mid1Button = UIBarButtonItem(title: Configure.titleMid1Button, style: .plain, target: self, action: nil)
        let mid2Button = UIBarButtonItem(title: Configure.titleMid2Button, style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItems = [backButton, mid1Button, mid2Button]
    }

    private func rightButton() {
        let rightButton = UIBarButtonItem(title: Configure.titleRightButton, style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightButton
    }
}
