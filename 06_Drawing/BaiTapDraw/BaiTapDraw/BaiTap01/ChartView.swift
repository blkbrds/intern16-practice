//
//  ChartView.swift
//  BaiTapDraw
//
//  Created by PCI0004 on 7/9/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class ChartLineView: UIView {

    // MARK: - Initialize
    init(frame: CGRect, backgroundColor: CGColor) {
        super.init(frame: frame)
        createRectangle(backgroundColor: backgroundColor)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Function
    private func createRectangle(backgroundColor: CGColor) {
        let path = UIBezierPath(rect: bounds)
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = backgroundColor
        shapeLayer.lineWidth = 1
        shapeLayer.path = path.cgPath
        self.layer.addSublayer(shapeLayer)
    }
}

final class ChartColumnView: UIView {

    // MARK: - Propeties
    static let labelHeight: CGFloat = 40
    let labelWidth: CGFloat = 70

    // MARK: - Initialize
    init(frame: CGRect, name: String, backgroundColor: CGColor, nameColor: UIColor) {
        super.init(frame: frame)
        createRectangle(name: name, backgroundColor: backgroundColor, nameColor: nameColor)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Function
    private func createRectangle(name: String, backgroundColor: CGColor, nameColor: UIColor) {
        clipsToBounds = false
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height - ChartColumnView.labelHeight))
        let nameLabel = UILabel(frame: CGRect(x: bounds.width / 2 - labelWidth / 2, y: path.bounds.height, width: labelWidth, height: ChartColumnView.labelHeight))

        nameLabel.text = name
        nameLabel.textColor = nameColor
        nameLabel.textAlignment = .center
        nameLabel.clipsToBounds = false
        nameLabel.font = .systemFont(ofSize: 11)
        addSubview(nameLabel)

        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = backgroundColor
        shapeLayer.lineWidth = 1
        shapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
    }
}
