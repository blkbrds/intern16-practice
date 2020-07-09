//
//  ChartView.swift
//  BaiTap06
//
//  Created by PCI0020 on 7/9/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class ChartView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect,color: UIColor, view: UIView, value: Int, pointX0: Int) {
        self.init(frame: frame)
        drawLine(color: color, view: view, value: value, pointX0: pointX0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawLine(color: UIColor, view: UIView, value: Int, pointX0: Int) {
        let pointX0: Int = pointX0
        let pointY0: Int = Int(view.frame.size.height)
        let width: Int = 25
        let height = pointY0 - Int(pointY0) / 15 * (value - 90)
        print(pointX0)
        print(pointY0)
        let path = UIBezierPath()
        path.move(to: CGPoint(x: pointX0, y: pointY0))
        path.addLine(to: CGPoint(x: pointX0, y: height))
        path.addLine(to: CGPoint(x: pointX0 + width, y: height))
        path.addLine(to: CGPoint(x: pointX0 + width, y: pointY0))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = color.cgColor
        shapeLayer.lineWidth = 1.0

        view.layer.addSublayer(shapeLayer)
    }
}
