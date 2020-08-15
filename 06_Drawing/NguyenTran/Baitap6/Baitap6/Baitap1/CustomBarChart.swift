//
//  CustomBarChart.swift
//  Baitap6
//
//  Created by MBA0245P on 8/12/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class GraphicsDraw: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func drawLine(start: CGPoint, end: CGPoint) {
        let line = UIBezierPath()
        line.move(to: start)
        line.addLine(to: end)
        line.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.darkGray.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.path = line.cgPath

        self.layer.addSublayer(shapeLayer)
    }

    func addLabel(position: CGPoint, text: String, fontSize: Float) {
        let label = UILabel(frame: CGRect(x: position.x, y: position.y, width: 30, height: 30))
        label.text = text
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        guard let font = UIFont(name: "Arial", size: CGFloat(fontSize)) else { return }
        label.font = label.font.withSize(CGFloat(fontSize))
        label.frame.size.width = String(text).textWidth(font: font)
        label.clipsToBounds = true
        label.backgroundColor = .clear
        self.addSubview(label)
    }
    
    func drawChart(pointValue: [CGPoint]) {
        let path = UIBezierPath()
        for (i, p) in pointValue.enumerated() {
            if i == 0 {
                path.move(to: p)
            } else {
                path.addLine(to: p)
            }
        }
        path.addLine(to: pointValue[0])
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        shapeLayer.lineWidth = 0
        shapeLayer.strokeColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        shapeLayer.path = path.cgPath
        
        self.layer.addSublayer(shapeLayer)
    }
    
    func addCirclePoint(position: CGPoint) {
        let label = UILabel(frame: CGRect(x: position.x, y: position.y, width: 16, height: 16))
        label.layer.cornerRadius = 8
        label.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        label.clipsToBounds = true
        self.addSubview(label)
    }

}

extension String {
    func textWidth(font: UIFont) -> CGFloat {
        let size = (self as NSString).size(withAttributes: [.font: font])
        return size.width + 5
    }
}
