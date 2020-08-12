//
//  CustomBadgeButton.swift
//  Baitap5
//
//  Created by MBA0245P on 8/11/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class CustomBadgeButton: UIView {
    var badgeButton: UIButton = UIButton()
    var badgeLabel: UILabel = UILabel()
    var buttonColor: String = String()
    var badgeValue: Int = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(frame: CGRect, badgeValue: Int, position: BadgePosition, buttonText: String, buttonColor: String) {
        self.init(frame: frame)
        createBadgeButton(badgeValue: badgeValue, position: position, buttonText: buttonText, buttonColor: buttonColor)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createBadgeButton(badgeValue: Int, position: BadgePosition, buttonText: String, buttonColor: String) {
        badgeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 60))
        badgeButton.backgroundColor = hexStringToUIColor(hex: buttonColor)
        badgeButton.layer.cornerRadius = 5
        badgeButton.setTitle(buttonText, for: .normal)
        badgeButton.titleLabel?.textColor = .black
        badgeButton.titleLabel?.textAlignment = .center
        badgeLabel.frame.size = CGSize(width: 30, height: 30)
        guard let font = UIFont(name: "Arial", size: 12) else { return }
        badgeLabel.font = badgeLabel.font.withSize(12)
        badgeLabel.frame.size.width = String(badgeValue).textWidth(font: font)
        badgeLabel.layer.cornerRadius = 15
        badgeLabel.textAlignment = .center
        badgeLabel.backgroundColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
        badgeLabel.clipsToBounds = true
        
        configBadePosition(position: position)
        if badgeValue == 0 {
            badgeLabel.text = "0"
            badgeLabel.isHidden = true
        } else {
            badgeLabel.isHidden = false
            if badgeValue > 100 {
                badgeLabel.text = "99+"
            } else {
                badgeLabel.text = String(badgeValue)
            }
        }
        self.addSubview(badgeButton)
        self.addSubview(badgeLabel)
    }

    private func configBadePosition(position: BadgePosition) {
        switch position {
        case .topLeft:
            badgeLabel.center.x = 0
            badgeLabel.center.y = 0
        case .topCenter:
            badgeLabel.center.x = badgeButton.center.x
            badgeLabel.center.y = 0
        case .topRight:
            badgeLabel.center.x = badgeButton.frame.width
            badgeLabel.center.y = 0
        case .centerLeft:
            badgeLabel.center.x = 0
            badgeLabel.center.y = badgeButton.center.y
        case .centerRight:
            badgeLabel.center.x = badgeButton.frame.width
            badgeLabel.center.y = badgeButton.center.y
        case .bottomLeft:
            badgeLabel.center.x = 0
            badgeLabel.center.y = badgeButton.frame.height
        case .bottomCenter:
            badgeLabel.center.x = badgeButton.center.x
            badgeLabel.center.y = badgeButton.frame.height
        case .bottomRight:
            badgeLabel.center.x = badgeButton.frame.width
            badgeLabel.center.y = badgeButton.frame.height
        }
    }

    func hexStringToUIColor (hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

extension String {
    func textWidth(font: UIFont) -> CGFloat {
        let size = (self as NSString).size(withAttributes: [.font: font])
        return size.width + 30 - 6.67
    }
}
