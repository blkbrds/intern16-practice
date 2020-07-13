//
//  chartCircle.swift
//  Bai6
//
//  Created by PCI0001 on 7/11/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

class chartCircle: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircle()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    private func createCircle() {
        let shapeLayer1 = CAShapeLayer()
        let shapeLayer2 = CAShapeLayer()
        let shapeLayer3 = CAShapeLayer()
        
        shapeLayer1.lineWidth = 50.0
        shapeLayer1.fillColor = UIColor.white.cgColor
        shapeLayer1.strokeColor = UIColor.red.cgColor
        let openCirclePath1 = UIBezierPath(arcCenter: CGPoint(x: 60.0, y: 60.0),
                                           radius: 80.0,
                                           startAngle: 0.0,
                                           endAngle: CGFloat.pi,
                                           clockwise: true)
        
        shapeLayer1.path = openCirclePath1.cgPath
        layer.addSublayer(shapeLayer1)
        shapeLayer2.lineWidth = 50.0
        shapeLayer2.fillColor = UIColor.white.cgColor
        shapeLayer2.strokeColor = UIColor.green.cgColor
        let openCirclePath2 = UIBezierPath(arcCenter: CGPoint(x: 60.0, y: 60.0),
                                           radius: 80.0,
                                           startAngle: CGFloat.pi,
                                           endAngle: CGFloat.pi * 3 / 2,
                                           clockwise: true)
        shapeLayer2.path = openCirclePath2.cgPath
        layer.addSublayer(shapeLayer2)
        shapeLayer3.lineWidth = 50.0
        shapeLayer3.fillColor = UIColor.white.cgColor
        shapeLayer3.strokeColor = UIColor.gray.cgColor
        let openCirclePath3 = UIBezierPath(arcCenter: CGPoint(x: 60.0, y: 60.0),
                                           radius: 80.0,
                                           startAngle: CGFloat.pi * 3 / 2,
                                           endAngle: CGFloat.pi * 2,
                                           clockwise: true)
        shapeLayer3.path = openCirclePath3.cgPath
        layer.addSublayer(shapeLayer3)
    }
}
