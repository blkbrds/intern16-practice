//
//  BaiTap04.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/23/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class BaiTap04: UIViewController {

    // MARK: - Configure
    private struct Configure {
        static let titleName = "Bar Button Test"
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Configure.titleName
        rightButton()
    }

    // MARK: - Private funtions
    private func rightButton() {

        let userButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        userButton.addTarget(self, action: #selector(clickAction), for: .touchUpInside)
        userButton.setImage(UIImage(named: "img_avatar_01"), for: .normal)

        let rightCustomView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        rightCustomView.layer.cornerRadius = 20
        rightCustomView.layer.masksToBounds = true
        rightCustomView.addSubview(userButton)

        let rightButton = UIBarButtonItem(customView: rightCustomView)
        navigationItem.rightBarButtonItem = rightButton
    }

    // MARK: - Objc functions
    @objc private func clickAction() {
        print("tap")
    }
}
