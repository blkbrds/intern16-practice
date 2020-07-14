//
//  BadgeViewController.swift
//  BaiTap3_CustomView
//
//  Created by MBA0168 on 7/8/20.
//  Copyright © 2020 chungiOS. All rights reserved.
//

import UIKit

class BadgeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let badgeButton = BadgeButton()
        let frame1 = CGRect(x: 100, y: 140, width: 200, height: 40)
        badgeButton.frame = frame1
        badgeButton.addpositionBadge(position: .topCenter)
        badgeButton.badge = "104"
        badgeButton.backgroundColor = .green
        badgeButton.titleLabel?.textColor = .white
        badgeButton.setTitle("Email", for: .normal)
        view.addSubview(badgeButton)
    }

}
