//
//  ChartView.swift
//  BaiTapDraw
//
//  Created by PCI0004 on 7/9/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class ChartLine: UIView {

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
        let path1 = UIBezierPath(rect: bounds)
        let shapeLayer1 = CAShapeLayer()
        shapeLayer1.fillColor = backgroundColor
        shapeLayer1.lineWidth = 1
        shapeLayer1.path = path1.cgPath
        self.layer.addSublayer(shapeLayer1)
    }
}

final class ChartColume: UIView {

    // MARK: - Propeties
    static let heightLabel: CGFloat = 40
    let widthLabel: CGFloat = 70

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
        let path1 = UIBezierPath(rect: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height - ChartColume.heightLabel))
        let nameLabel = UILabel(frame: CGRect(x: bounds.width / 2 - widthLabel / 2, y: path1.bounds.height, width: widthLabel, height: ChartColume.heightLabel))

        nameLabel.text = name
        nameLabel.textColor = nameColor
        nameLabel.textAlignment = .center
        nameLabel.clipsToBounds = false
        nameLabel.font = .systemFont(ofSize: 11)
        addSubview(nameLabel)

        let shapeLayer1 = CAShapeLayer()
        shapeLayer1.fillColor = backgroundColor
        shapeLayer1.lineWidth = 1
        shapeLayer1.path = path1.cgPath
        self.layer.addSublayer(shapeLayer1)
    }
}
