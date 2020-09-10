//
//  badgeButton.swift
//  BaiTap05
//
//  Created by PCI0020 on 7/6/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class BadgeButton: UIButton {

    enum PositionBadge {
        case topLeft
        case topRight
        case topCenter
        case centerLeft
        case centerRight
        case bottomLeft
        case bottomRight
        case bottomCenter

        func calBadgeViewPoint(sizeButton: CGSize) -> CGPoint {
            switch self {
            case .topLeft: return CGPoint(x: 0, y: 0)
            case .topRight: return CGPoint(x: sizeButton.width, y: 0)
            case .topCenter: return CGPoint(x: sizeButton.width / 2, y: 0)
            case .centerLeft: return CGPoint(x: 0, y: sizeButton.height / 2)
            case .centerRight: return CGPoint(x: sizeButton.width, y: sizeButton.height / 2)
            case .bottomLeft: return CGPoint(x: 0, y: sizeButton.height)
            case .bottomRight: return CGPoint(x: sizeButton.width, y: sizeButton.height)
            case .bottomCenter: return CGPoint(x: sizeButton.width / 2, y: sizeButton.height)
            }
        }

        func badgeViewSize(number: Int) -> CGSize {
            if number < 10 {
                return CGSize(width: 24, height: 32)
            } else if number < 99 {
                return CGSize(width: 32, height: 32)
            } else {
                return CGSize(width: 48, height: 32)
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(frame: CGRect, pointNumber: Int, name: String, colorBtn: UIColor, position: PositionBadge) {
        self.init(frame: frame)
        layer.cornerRadius = 15
        setTitle(name, for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = colorBtn
        clipsToBounds = false
        setupBadgeView(position: position, number: pointNumber)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupBadgeView(position: PositionBadge, number: Int) {
        if number == 0 { return }
        let sizeButton: CGSize = frame.size

        let badgeView = UIView()
        self.addSubview(badgeView)
        badgeView.frame.size = position.badgeViewSize(number: number)
        badgeView.center = position.calBadgeViewPoint(sizeButton: sizeButton)
        badgeView.layer.cornerRadius = 12
        badgeView.layer.masksToBounds = true
        badgeView.backgroundColor = #colorLiteral(red: 0.9995597005, green: 0, blue: 0, alpha: 1)

        let numberLabel = UILabel()
        if number > 99 {
            numberLabel.text = "99+"
        } else {
            numberLabel.text = String(number)
        }
        numberLabel.textColor = .black
        numberLabel.textAlignment = .center
        numberLabel.font = UIFont.systemFont(ofSize: 17)
        badgeView.addSubview(numberLabel)
        numberLabel.frame = badgeView.bounds
    }
}
