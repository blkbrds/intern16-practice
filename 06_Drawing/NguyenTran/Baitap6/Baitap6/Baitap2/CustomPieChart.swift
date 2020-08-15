//
//  CustomPieChart.swift
//  Baitap6
//
//  Created by MBA0245P on 8/14/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class CustomPieChart: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createPieChart(value: Int, startAngle: CGFloat, endAngle: CGFloat, radius: CGFloat) {
        let shapeLayer = CAShapeLayer()
        let center = CGPoint(x: bounds.size.width * 0.5, y: bounds.size.height * 0.5)
        let startAngle = startAngle
        let endAngle = endAngle

        let circularPath = UIBezierPath()
        circularPath.move(to: center)
        circularPath.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        circularPath.close()
        shapeLayer.path = circularPath.cgPath
        shapeLayer.fillColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1).cgColor
        self.layer.addSublayer(shapeLayer)
    }
}

