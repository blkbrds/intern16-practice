//
//  CircleCustom.swift
//  BaiTapDraw
//
//  Created by PCI0004 on 7/13/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class CircleCustom: UIView {

    // MARK: - Propeties
    var values: [CGFloat] = [] {
        didSet {
            sum = values.reduce(0, +)
        }
    }

    var sum: CGFloat = 0

    // MARK: - Private Function
    private func random() -> UIColor {
        return UIColor(red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0)
    }

    func createCircle() {
        var startAngle: CGFloat = 0.0
        let anglePI2 = (CGFloat.pi * 2)
        let arrCenter = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)

        for i in 0..<values.count {
            let percent: CGFloat = values[i] / sum
            let angle = percent * anglePI2

            let circlePath = UIBezierPath(arcCenter: arrCenter,
                radius: 100,
                startAngle: startAngle,
                endAngle: startAngle + angle,
                clockwise: true)

            circlePath.addLine(to: arrCenter)
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = circlePath.cgPath
            // Change the fill color
            shapeLayer.fillColor = random().cgColor
            // You can change the line width
            shapeLayer.lineWidth = 3.0
            self.layer.addSublayer(shapeLayer)
            startAngle += angle
        }
    }
}

final class DrawLine: UIView {

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
