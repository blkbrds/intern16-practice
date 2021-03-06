//
//  MyButton.swift
//  BaiTapCustomView
//
//  Created by PCI0004 on 7/7/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class MyButton: UIButton {

    // MARK: - Properties
    enum NotifyView {
        case topRight
        case topLeft
        case centerTop
        case centerBottom
        case centerLeft
        case centerRight
        case bottomLeft
        case bottomRight

        func findPoint(bounds: CGRect) -> CGPoint {
            switch self {
            case .topRight:
                return CGPoint(x: bounds.maxX, y: bounds.minY)
            case .topLeft:
                return CGPoint(x: bounds.minX, y: bounds.minY)
            case .centerTop:
                return CGPoint(x: bounds.midX, y: bounds.minY)
            case .centerBottom:
                return CGPoint(x: bounds.midX, y: bounds.maxY)
            case .centerLeft:
                return CGPoint(x: bounds.minX, y: bounds.midY)
            case .centerRight:
                return CGPoint(x: bounds.minX, y: bounds.midY)
            case .bottomLeft:
                return CGPoint(x: bounds.minX, y: bounds.maxY)
            case .bottomRight:
                return CGPoint(x: bounds.maxX, y: bounds.maxY)
            }
        }
    }

    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(frame: CGRect, index: NotifyView, number: Int, name: String) {
        self.init(frame: frame)
        backgroundColor = .gray
        setTitle(name, for: .normal)
        setTitleColor(.black, for: .normal)

        if number > 0 {
            showBadge(index: index, number: number)
        }
    }

    // MARK: - Private Methods
    private func showBadge(index: NotifyView, number: Int) {
        // Tao view
        let notifyView = UIView()
        let numberLabel = UILabel()

        if number > 99 {
            notifyView.bounds.size = CGSize(width: 50, height: 30)
            numberLabel.text = "99+"
        } else {
            notifyView.bounds.size = CGSize(width: 30, height: 30)
            numberLabel.text = String(number)
        }

        notifyView.center = index.findPoint(bounds: bounds)
        notifyView.backgroundColor = .red
        addSubview(notifyView)

        // Tao label
        numberLabel.frame = notifyView.bounds
        numberLabel.textAlignment = .center
        numberLabel.textColor = .white
        notifyView.addSubview(numberLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
