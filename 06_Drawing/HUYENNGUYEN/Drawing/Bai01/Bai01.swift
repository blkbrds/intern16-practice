//
//  Bai01.swift
//  Drawing
//
//  Created by bu on 7/9/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

struct Value {
    var valueCGFloat: CGFloat
    var color: UIColor
}

final class Bai01View: UIView {
    
    //MARK: - Properties
    private var path: UIBezierPath?
    private var shapeLayer: CAShapeLayer?
    private let bottomPadding: CGFloat = 50
    private let leftPađding: CGFloat = 30
    private let rightPadding: CGFloat = 50
    private let lineWidth: CGFloat = 20
    private var spacePadding: CGFloat = 0
    
    var values: [Value] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        spacePadding = (bounds.width - 2 * rightPadding - CGFloat(values.count) * lineWidth) / 6
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Function
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawChart()
    }
    
    private func drawChart() {
        drawLineHorizontal()
        
        let valuesCGFloat = values.map { (item) -> CGFloat in
            return item.valueCGFloat
        }
        guard let maxValue = valuesCGFloat.max() else { return }
        
        var x: CGFloat = rightPadding
        let startY: CGFloat = bounds.height - bottomPadding
        var endY: CGFloat = startY
        
        for index in 0..<values.count {
            endY -= 150 * values[index].valueCGFloat / maxValue
            drawLineVertical(x: x, startY: startY, endY: endY, color: values[index].color)
            x += spacePadding
            endY = startY
        }
    }
    
    private func drawLineVertical(x: CGFloat, startY: CGFloat, endY: CGFloat, color: UIColor) {
        path = UIBezierPath()
        path?.move(to: CGPoint(x: x, y: startY))
        path?.addLine(to: CGPoint(x: x, y: endY))
        path?.close()
        
        shapeLayer = CAShapeLayer()
        shapeLayer?.strokeColor = color.cgColor
        shapeLayer?.lineWidth = lineWidth
        shapeLayer?.path = path?.cgPath
        guard let shapeLayer = shapeLayer else { return }
        layer.addSublayer(shapeLayer)
    }
    
    private func drawLineHorizontal() {
        path = UIBezierPath()
        path?.move(to: CGPoint(x: leftPađding, y: self.bounds.height - bottomPadding))
        path?.addLine(to: CGPoint(x: self.bounds.maxX - leftPađding, y: self.bounds.height - bottomPadding))
        path?.close()
        
        shapeLayer = CAShapeLayer()
        shapeLayer?.strokeColor = #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 0.4205372432)
        shapeLayer?.lineWidth = 2
        shapeLayer?.path = path?.cgPath
        guard let shapeLayer = shapeLayer else { return }
        layer.addSublayer(shapeLayer)
    }
}
