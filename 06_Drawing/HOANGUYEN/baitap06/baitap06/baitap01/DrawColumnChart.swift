//
//  drawRect.swift
//  baitap06
//
//  Created by NXH on 7/5/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class DrawColumnChart: UIView {
    
    // MARK: - Properties
    private var transValue: [CGFloat] = []
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    // MARK: - Overrride function
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let range: CGFloat = 20
        var space: CGFloat = 30
        for index in transValue {
            drawColumn(height: index, width: range, space: space)
            space += 50
            drawFrameChart()
        }
    }
    // MARK: - Private function
    private func drawFrameChart(){
        let dateInWeekList: [String] = ["Mon", "Tue", "Wes", "Thu", "Fri", "Sat", "Sun"]
        let context = UIGraphicsGetCurrentContext()
        context!.move(to: CGPoint(x: bounds.minX + 20, y: bounds.minY + 10))
        context!.addLine(to: CGPoint(x: bounds.minX + 20, y: bounds.maxY))
        context!.addLine(to: CGPoint(x: bounds.maxX - 5, y: bounds.maxY))
        context!.setLineWidth(3)
        context!.strokePath()
        let valueLabel: UILabel = UILabel()
        valueLabel.frame = CGRect(x: bounds.minX - 10, y: bounds.minY, width: 30, height: 20)
        valueLabel.text = "100"
        let zeroLabel: UILabel = UILabel()
        zeroLabel.frame = CGRect(x: bounds.minX, y: bounds.maxY - 15, width: 30, height: 20)
        zeroLabel.text = "0"
        self.addSubview(valueLabel)
        self.addSubview(zeroLabel)
        var currentX: CGFloat = bounds.minX + 30
        for i in dateInWeekList {
            let dateInWeekLabel: UILabel = UILabel()
            dateInWeekLabel.frame = CGRect(x: currentX, y: bounds.maxY, width: 40, height: 30)
            dateInWeekLabel.text = i
            currentX += 50
            addSubview(dateInWeekLabel)
        }
    }
    
    private func drawColumn(height: CGFloat, width: CGFloat, space: CGFloat) {
        let context = UIGraphicsGetCurrentContext()
        context!.move(to: CGPoint(x: bounds.minX + space, y: bounds.maxY))
        context!.addLine(to: CGPoint(x: bounds.minX + space, y: bounds.maxY - height))
        context!.addLine(to: CGPoint(x: bounds.minX + width + space, y: bounds.maxY - height))
        context!.addLine(to: CGPoint(x: bounds.minX + width + space, y: bounds.maxY))
        context!.setFillColor(UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1).cgColor)
        context!.fillPath()
    }
    
    // MARK: - Public Function
    func transform(values: [CGFloat]) {
        for value in values {
            transValue.append(value * (bounds.height) / 100)
        }
    }
}
