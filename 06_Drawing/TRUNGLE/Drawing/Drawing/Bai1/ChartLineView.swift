//
//  TLLineView.swift
//  Drawing
//
//  Created by Abcd on 7/8/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class GraphicsDraw: UIView {
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public functions
    //draw frame
    func drawLine(start: CGPoint, end: CGPoint) {
        // PATH
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        path.close()
        //LAYER
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.gray.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.path = path.cgPath
        //ADD LAYER
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
        //ADD LAYER
        self.layer.addSublayer(shapeLayer)
    }
    
    // add label
    func addLabel(position: CGPoint, name: String) {
        let label = UILabel(frame: CGRect(x: position.x, y: position.y, width: 50, height: 50))
        label.text = name
        label.adjustsFontSizeToFitWidth = true
        self.addSubview(label)
    }
}
