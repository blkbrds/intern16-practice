//
//  CircleChart.swift
//  Drawing
//
//  Created by Abcd on 7/16/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit
final class CircleChart: UIView {
    // MARK: - Properties
    private var path = UIBezierPath()
    private let shapeLayer1 = CAShapeLayer()
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.masksToBounds = false
    }
    
    convenience init(frame: CGRect,percent value: Int) {
        self.init(frame: frame)
        createCircle(with: value)
        createLabel(with: value)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    private func createCircle(with value: Int) {
        // background layer
        let frameWidth = min(bounds.width, bounds.height)
        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: frameWidth, height: frameWidth))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.gray.cgColor
        shapeLayer.strokeStart = 0.0
        shapeLayer.strokeEnd = 1
        shapeLayer.lineWidth = 20
        self.layer.addSublayer(shapeLayer)
        
        //ADD LAYER
        let center = CGPoint(x: bounds.height / 2, y: bounds.width / 2)
        let path1 = UIBezierPath(arcCenter: center, radius: frameWidth / 2, startAngle: -.pi / 2, endAngle: 3 * .pi / 2, clockwise: true)
        shapeLayer1.path = path1.cgPath
        shapeLayer1.fillColor = UIColor.clear.cgColor
        shapeLayer1.strokeColor = UIColor.red.cgColor
        shapeLayer1.strokeStart = 0.0
        shapeLayer1.strokeEnd = CGFloat(value) / 100
        shapeLayer1.lineCap = .round
        shapeLayer1.lineWidth = 20
        self.layer.addSublayer(shapeLayer1)
    }
    
    //create a number
    private func createLabel(with num: Int) {
        let numberLabel = UILabel()
        numberLabel.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.width)
        numberLabel.textAlignment = .center
        numberLabel.text = String(num) + " %"
        self.addSubview(numberLabel)
    }
}
