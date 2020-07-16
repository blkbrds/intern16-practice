//
//  CircleView.swift
//  BaiTap06
//
//  Created by PCI0020 on 7/9/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class CircleView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        drawCircle(startAngle: CGFloat(Double.pi * 3 / 2), endAngle: CGFloat(Double.pi / 4), color: .red)
        drawCircle(startAngle: CGFloat(Double.pi / 4), endAngle: CGFloat(2 * Double.pi / 3), color: .yellow)
        drawCircle(startAngle: CGFloat(2 * Double.pi / 3), endAngle: CGFloat(Double.pi * 3 / 2), color: .blue)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    func drawCircle(startAngle: CGFloat, endAngle: CGFloat, color: UIColor) {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2, y: frame.size.height / 2), radius: CGFloat(100), startAngle: startAngle, endAngle: endAngle, clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 50
        self.layer.addSublayer(shapeLayer)
    }
}
