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

        var badgeViewPoint: CGPoint {
            switch self {
                case .topLeft: return CGPoint(x: 0, y: 0)
                case .topRight: return CGPoint(x: 200, y: 0)
                case .topCenter: return CGPoint(x: 100, y: 0)
                case .centerLeft: return CGPoint(x: 0, y: 25)
                case .centerRight: return CGPoint(x: 200, y: 50)
                case .bottomLeft: return CGPoint(x: 0, y: 100)
                case .bottomRight: return CGPoint(x: 200, y: 100)
                case .bottomCenter: return CGPoint(x: 100, y: 100)
            }
        }

        var badgeViewSize: CGSize {
            return CGSize(width: 48, height: 32)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(frame: CGRect, pointNumber: Int, name: String, colorBtn: UIColor, position: PositionBadge) {
        self.init(frame: frame)
//        heightButton = frame.size.height
//        widthButton = frame.size.width
        self.layer.cornerRadius = 15
        self.setTitle(name, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = colorBtn
        clipsToBounds = false
        setupBadgeView(position: position, number: pointNumber)
    }

    func setupBadgeView(position: PositionBadge, number: Int) {
        let badgeView = UIView()
        self.addSubview(badgeView)
        badgeView.frame.size = position.badgeViewSize
        badgeView.center = position.badgeViewPoint
        badgeView.layer.cornerRadius = 12
        badgeView.layer.masksToBounds = true
        badgeView.backgroundColor = #colorLiteral(red: 0.9995597005, green: 0, blue: 0, alpha: 1)

        let numberLabel = UILabel()
        numberLabel.frame = bounds
        numberLabel.text = String(number)
        numberLabel.textColor = .black
        numberLabel.textAlignment = .center
        numberLabel.font = UIFont(name: "Menlo", size: 16)
        badgeView.addSubview(numberLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
