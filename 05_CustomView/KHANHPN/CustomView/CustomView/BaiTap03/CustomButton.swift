//
//  CustomButton.swift
//  CustomView
//
//  Created by PCI0007 on 7/6/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    // MARK: - Badge Position
    enum badgePosition {
        case topLeft
        case topCenter
        case topRight
        case bottomLeft
        case bottomCenter
        case bottomRight
        case centerLeft
        case centerRight
        
        func customBadge(with frame: CGRect) -> CGPoint {
            switch self {
            case .topLeft:
                return CGPoint(x: 0, y: 0)
            case .topCenter:
                return CGPoint(x: frame.size.width / 2, y: 0)
            case .topRight:
                return CGPoint(x: frame.size.width, y: 0)
            case .bottomLeft:
                return CGPoint(x: 0, y: frame.size.height)
            case .bottomCenter:
                return CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
            case .bottomRight:
                return CGPoint(x: frame.size.width, y: frame.size.height)
            case .centerLeft:
                return CGPoint(x: 0, y: frame.size.height / 2)
            case .centerRight:
                return CGPoint(x: frame.size.width, y: frame.size.height / 2)
            }
        }
    }
    
    // MARK: - Custom Button

    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    convenience init(frame: CGRect, number: Int, colorButon: UIColor, position: badgePosition, name: String) {
        self.init(frame: frame)
        backgroundColor = colorButon
        setTitle(name, for: .normal)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 15
        
        if number > 0 {
            showBadge(position: position, number: number)
        }
    }
    
    private func showBadge(position: badgePosition, number: Int) {
        let badge = UIView()
        badge.frame.size = CGSize(width: 30, height: 30)
        badge.center = position.customBadge(with: frame)
        badge.layer.cornerRadius = badge.bounds.height / 2
        badge.backgroundColor = .red
        addSubview(badge)
        // number:
        let num = UILabel()
        num.frame = badge.bounds // nhét vào thằng frame cha
        num.text = String(number)
        num.textAlignment = .center
        num.textColor = .white
        badge.addSubview(num)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
