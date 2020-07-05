//
//  CustomButton.swift
//  baitap05
//
//  Created by NXH on 7/3/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

// MARK: - Properties
class CustomButton: UIView {
    var numberOfBadge: Int = 0
    var button: UIButton = {
        let btn: UIButton = UIButton()
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1
        btn.layer.backgroundColor = UIColor.systemYellow.cgColor
        btn.layer.borderColor = UIColor.black.cgColor
        btn.frame.origin = CGPoint(x: 0, y: 0)
        return btn
    }()
    var badgeNumberLabel: UILabel = {
        let lbl: UILabel = UILabel()
        lbl.frame.size = CGSize(width: 20, height: 20)
        lbl.layer.borderWidth = 1
        lbl.layer.cornerRadius = 10
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.backgroundColor = UIColor.red
        lbl.clipsToBounds = true
        lbl.layer.borderColor = UIColor.black.cgColor
        return lbl
    }()
// MARK: - Life cycle
    init(origin: CGPoint, numberOfBadge: Int) {
        super.init(frame: CGRect(x: origin.x, y: origin.y, width: 100, height: 70))
        self.numberOfBadge = numberOfBadge
        self.addSubview(button)
        checkBadgeNumber()
        button.frame.size = self.frame.size
        self.addSubview(badgeNumberLabel)
    }
    
// MARK: - Private Function
    private func checkBadgeNumber() {
        if numberOfBadge != 0 {
            switch numberOfBadge {
            case 1...9:
                badgeNumberLabel.frame.size = CGSize(width: 20, height: 20)
                badgeNumberLabel.text = String(numberOfBadge)
            case 10...99:
                badgeNumberLabel.frame.size = CGSize(width: 30, height: 20)
                badgeNumberLabel.text = String(numberOfBadge)
            default:
                badgeNumberLabel.frame.size = CGSize(width: 40, height: 20)
                badgeNumberLabel.text = "99+"
            }
        } else {
            badgeNumberLabel.isHidden = true
        }
    }
    
     func setBadge(loc: String = "") -> UILabel {
        switch loc {
        case "Top-Right":
            badgeNumberLabel.center.x = self.frame.width
            badgeNumberLabel.center.y = 0
            return badgeNumberLabel
        case "Top-Mid":
            badgeNumberLabel.center.x = self.frame.width / 2
            badgeNumberLabel.center.y = 0
            return badgeNumberLabel
        default:
            badgeNumberLabel.center.x = 0
            badgeNumberLabel.center.y = 0
            return badgeNumberLabel
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
