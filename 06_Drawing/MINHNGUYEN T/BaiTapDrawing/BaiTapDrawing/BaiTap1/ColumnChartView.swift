//
//  ColumnChartView.swift
//  BaiTapDrawing
//
//  Created by MacBook Pro on 7/8/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class ColumnChartView: UIView {
    // MARK: - Private Properties
    private  var valueForColume: [CGFloat] = []
    private var arrayDate:[String] = ["Tue","Wed","Thu","Fri","Sat","Sun","Today"]

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Override
    override func draw(_ rect: CGRect) {
        let range = bounds.width / CGFloat(valueForColume.count) / 2
        var parameter: CGFloat = 0.3
        for index in valueForColume {
            drawOneComlumnChart(height: index, width: range, space: parameter * range)
            parameter += 2
        }
        drawLine()
    }

    // MARK: - Private Function
    private func drawOneComlumnChart(height: CGFloat, width: CGFloat, space: CGFloat) {
        if let context = UIGraphicsGetCurrentContext(){
            context.move(to: CGPoint(x: bounds.minX + space, y: bounds.maxY))
            context.addLine(to: CGPoint(x: bounds.minX + space, y: bounds.maxY - height))
            context.addLine(to: CGPoint(x: bounds.minX + width + space, y: bounds.maxY - height))
            context.addLine(to: CGPoint(x: bounds.minX + width + space, y: bounds.maxY))
            let red = CGFloat.random(in: 0...255)
            let green = CGFloat.random(in: 0...255)
            let blue = CGFloat.random(in: 0...255)
            context.setFillColor(UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1).cgColor)
            context.fillPath()
        }
    }
    
    private func drawLine() {
        let aPath = UIBezierPath()
        aPath.move(to: CGPoint(x:bounds.minX + 7, y:bounds.maxY))
        aPath.addLine(to: CGPoint(x: bounds.maxX - 18, y: bounds.maxY))
        aPath.close()
        UIColor.red.set()
        aPath.lineWidth = 1
        aPath.stroke()
    }
    
    // MARK: - Public Function
    func addValue() {
        let startLabel: UILabel = UILabel()
        startLabel.frame = CGRect(x: bounds.minX - 20, y: bounds.maxY - 13, width: 20, height: 20)
        startLabel.text = "0"
        startLabel.font = startLabel.font.withSize(12)
        let startLabel1: UILabel = UILabel()
        startLabel1.frame = CGRect(x: bounds.minX - 20, y: (bounds.maxY - 60) / 2, width: 20, height: 20)
        startLabel1.text = "50"
        startLabel1.font = startLabel.font.withSize(12)
        let startLabel2: UILabel = UILabel()
        startLabel2.frame = CGRect(x: bounds.minX - 25, y: bounds.minY, width: 30, height: 20)
        startLabel2.text = "100"
        startLabel2.font = startLabel.font.withSize(12)
        addSubview(startLabel)
        addSubview(startLabel1)
        addSubview(startLabel2)
    }
    
    func addRawDate() {
        var spaceX = bounds.minX
        for i in arrayDate {
            let dateLabel: UILabel = UILabel()
            dateLabel.frame = CGRect(x: spaceX - 10, y: bounds.maxY + 10, width: 50, height: 20)
            dateLabel.font = dateLabel.font.withSize(11)
            dateLabel.textAlignment = .center
            dateLabel.text = i
            spaceX += 50
            addSubview(dateLabel)
        }
    }
    
    func getValue(values: [CGFloat]) {
        for value in values {
            valueForColume.append(value * (bounds.height - 50) / values.max()!)
        }
    }
}
