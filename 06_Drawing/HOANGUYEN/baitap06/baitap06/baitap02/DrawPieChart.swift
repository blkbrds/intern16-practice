//
//  DrawPieChart.swift
//  baitap06
//
//  Created by NXH on 7/7/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class DrawPieChart: UIView {
    
    // MARK: - Properties
    private var transValue: [CGFloat] = []
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Override function
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if transValue.isEmpty { return }
        var starAngle: CGFloat = 0
        var endAngle: CGFloat = 0
        for i in transValue {
            endAngle = endAngle + i
            drawPie(radius: 150, startAngle: starAngle, endAngle: endAngle)
            starAngle = endAngle
        }
        drawPieWhite()
    }
    
    // MARK: - Public Function
    func transform(values: [CGFloat]) {
        for value in values {
            transValue.append(value * 2 * .pi / 100)
        }
    }
    
    // MARK: - Private function
    private func drawPie(radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat) {
        let center: CGPoint = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        let pathBig = UIBezierPath()
        pathBig.move(to: center)
        pathBig.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1).setFill()
        pathBig.close()
        pathBig.fill()
    }
    
    private func drawPieWhite() {
        let center: CGPoint = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        let pathInside = UIBezierPath()
        pathInside.move(to: center)
        pathInside.addArc(withCenter: center, radius: 100, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        pathInside.close()
        UIColor.white.setFill()
        pathInside.fill()
    }
}
