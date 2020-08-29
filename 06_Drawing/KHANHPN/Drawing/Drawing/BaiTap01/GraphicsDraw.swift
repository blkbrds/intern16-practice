//
//  GraphicDraw.swift
//  Drawing
//
//  Created by Ngoc Khanh Phan on 8/29/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

@IBDesignable
final class GraphicsDraw: UIView {

    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public functions
    func drawLine(start: CGPoint, end: CGPoint) {
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        path.close()
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.gray.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.path = path.cgPath
        self.layer.addSublayer(shapeLayer)
    }
    
    func createRectangle(position: CGPoint, height: Float){
        let path = UIBezierPath(rect: CGRect(x: position.x, y: position.y, width: 30, height: CGFloat(height)))
        let shapeLayer = CAShapeLayer()
        let color: UIColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = color.cgColor
        self.layer.addSublayer(shapeLayer)
    }

    func addLabel(position: CGPoint, name: String, fontSize: CGFloat? = nil) {
        let label = UILabel(frame: CGRect(x: position.x, y: position.y, width: 30, height: 50))
        label.text = name
        label.textAlignment = .center
        if let size = fontSize {
            label.font = UIFont.systemFont(ofSize: size)
        } else {
            label.adjustsFontSizeToFitWidth = true
        }
        self.addSubview(label)
    }
}
