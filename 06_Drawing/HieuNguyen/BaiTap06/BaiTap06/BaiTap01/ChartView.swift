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
    
    convenience init(frame: CGRect, verticalAxisData: [Int], horizontalAxisData: [String]) {
        self.init(frame: frame)
        
        var verticalLabelX: CGFloat = 30
        var verticalLabelY: CGFloat =  30
        
        for value in verticalAxisData {
            axisLabel(frameCenter: CGPoint(x: verticalLabelX, y: verticalLabelY), value: String(value))
            
            // drawLine
            let path = UIBezierPath()
            path.move(to: CGPoint(x: verticalLabelX + 35, y: verticalLabelY))
            path.addLine(to: CGPoint(x: frame.size.width, y: verticalLabelY))
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.strokeColor = UIColor.white.cgColor
            shapeLayer.lineWidth = 1
            self.layer.addSublayer(shapeLayer)
            
            verticalLabelY += frame.size.height / CGFloat((verticalAxisData.count + 1))
        }
        // setupVerticalAxis
        verticalLabelX += 50
        verticalLabelY -= 120
        for value in horizontalAxisData {
            axisLabel(frameCenter: CGPoint(x: verticalLabelX, y: verticalLabelY), value: value)
            // drawLine
            let path = UIBezierPath()
            path.move(to: CGPoint(x: verticalLabelX, y: verticalLabelY - 40))
            path.addLine(to: CGPoint(x: verticalLabelX, y: CGFloat.random(in: 0..<frame.size.height / 2)))
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.strokeColor = UIColor.random.cgColor
            shapeLayer.lineWidth = 25
            self.layer.addSublayer(shapeLayer)
            
            verticalLabelX += frame.size.width / CGFloat((horizontalAxisData.count + 2))
        }
    }
    
    func axisLabel(frameCenter: CGPoint, value: String) {
        let verticalLabel = UILabel()
        let verticalLabelSize = CGSize(width: 50, height: 20)
        verticalLabel.frame.size = verticalLabelSize
        verticalLabel.center = frameCenter
        verticalLabel.text = String(value)
        verticalLabel.textAlignment = .center
        verticalLabel.font = UIFont(name: "Menlo", size: 12)
        verticalLabel.textColor = .black
        self.addSubview(verticalLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIColor {
    static var random: UIColor {
        let r:CGFloat  = .random(in: 0...1)
        let g:CGFloat  = .random(in: 0...1)
        let b:CGFloat  = .random(in: 0...1)
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}
