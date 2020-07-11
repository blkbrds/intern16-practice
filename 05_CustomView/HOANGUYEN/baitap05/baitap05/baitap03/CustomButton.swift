//
//  CustomButton.swift
//  baitap05
//
//  Created by NXH on 7/3/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit


class CustomButton: UIView {
    // MARK: - Properties
    enum locationBadge {
        case topLeft
        case topRight
        case topMid
        case bottomLeft
        case bottomRight
        case bottomMid
    }
    var padding: CGFloat = 10
    var badge: Int = 0
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
        self.badge = numberOfBadge
        self.addSubview(button)
        checkBadgeNumber()
        button.frame.size = self.frame.size
        self.addSubview(badgeNumberLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Function
    
    private func checkBadgeNumber() {
        if badge != 0 {
            let sizeCharacter: CGFloat = String(badge).contentWidth(font: badgeNumberLabel.font)
            switch badge {
            case 1...9:
                badgeNumberLabel.frame.size = CGSize(width: sizeCharacter + padding, height: 20)
                badgeNumberLabel.text = String(badge)
            case 10...99:
                badgeNumberLabel.frame.size = CGSize(width: sizeCharacter + padding, height: 20)
                badgeNumberLabel.text = String(badge)
            default:
                badgeNumberLabel.frame.size = CGSize(width: sizeCharacter + padding , height: 20)
                badgeNumberLabel.text = "99+"
            }
        } else {
            badgeNumberLabel.isHidden = true
        }
    }
    // MARK: - Public Function
    func setBadge(location: locationBadge ) {
        switch location {
        case .topRight:
            badgeNumberLabel.center.x = self.frame.width
            badgeNumberLabel.center.y = 0
        case .topMid:
            badgeNumberLabel.center.x = self.frame.width / 2
            badgeNumberLabel.center.y = 0
        case .bottomMid:
            badgeNumberLabel.center.x = self.frame.width / 2
            badgeNumberLabel.center.y = self.frame.height / 2
        case .bottomLeft:
            badgeNumberLabel.center.x = 0
            badgeNumberLabel.center.y = self.frame.height
        case .bottomRight:
            badgeNumberLabel.center.x = self.frame.width
            badgeNumberLabel.center.y = self.frame.height
        default:
            badgeNumberLabel.center.x = 0
            badgeNumberLabel.center.y = 0
        }
    }
    
}

// MARK: Extension
extension String {
    func contentWidth(font: UIFont) -> CGFloat {
        let size = (self as NSString).size(withAttributes: [.font: font])
        return size.width
    }
}
