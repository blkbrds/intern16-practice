//
//  ColumnChartView.swift
//  BaiTapDrawing
//
//  Created by MacBook Pro on 7/8/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class ColumnChartView: UIView {

    // MARK: - Properties
    private var valueForColumn: [CGFloat] = []
    private var columnWidth: CGFloat = 0
    private var arrayDate: [String] = ["Tue", "Wed", "Thu", "Fri", "Sat", "Sun", "Today"]

    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    convenience init(frame: CGRect, valueForColumn: [CGFloat] = []) {
        self.init(frame: frame)
        guard let max = valueForColumn.max() else { return }
        for value in valueForColumn {
            self.valueForColumn.append(value * (bounds.height - 50) / max)
        }
        columnWidth = bounds.width / CGFloat(self.valueForColumn.count) / 2
    }

    // MARK: - Override functions
    override func draw(_ rect: CGRect) {
        var parameter: CGFloat = 0.3
        addValue()
        drawLine()
        for (index, height) in valueForColumn.enumerated() {
            drawOneComlumnChart(height: height, width: columnWidth, space: columnWidth * parameter)
            addRawDate(width: columnWidth, space: columnWidth * parameter, index: index)
            parameter += 2
        }
    }

    // MARK: - Private functions
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
        // Truc X
        let xPath = UIBezierPath()
        xPath.move(to: CGPoint(x :bounds.minX, y: bounds.maxY))
        xPath.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        xPath.close()
        UIColor.red.set()
        xPath.lineWidth = 1
        xPath.stroke()

        // Truc Y
        let yPath = UIBezierPath()
        yPath.move(to: CGPoint(x : bounds.minX, y: bounds.maxY))
        yPath.addLine(to: CGPoint(x: bounds.minX, y: bounds.minY))
        yPath.close()
        UIColor.red.set()
        yPath.lineWidth = 1
        yPath.stroke()
    }
    
    // MARK: - Public functions
    func addValue() {
        let startLabel: UILabel = UILabel()
        startLabel.frame = CGRect(x: bounds.minX - 20, y: bounds.maxY - 13, width: 20, height: 20)
        startLabel.text = "0"
        startLabel.font = startLabel.font.withSize(12)

        let startLabel1: UILabel = UILabel()
        startLabel1.frame = CGRect(x: bounds.minX - 20, y: (bounds.maxY) / 2 - 10, width: 20, height: 20)
        startLabel1.text = "50"
        startLabel1.font = startLabel.font.withSize(12)
        let xPath = UIBezierPath()
        xPath.move(to: CGPoint(x: bounds.minX, y: bounds.maxY / 2))
        xPath.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY / 2))
        xPath.close()
        UIColor.red.set()
        xPath.lineWidth = 1
        xPath.stroke()

        let startLabel2: UILabel = UILabel()
        startLabel2.frame = CGRect(x: bounds.minX - 25, y: bounds.minY - 10, width: 30, height: 20)
        startLabel2.text = "100"
        startLabel2.font = startLabel.font.withSize(12)

        addSubview(startLabel)
        addSubview(startLabel1)
        addSubview(startLabel2)
    }
    
    func addRawDate(width: CGFloat, space: CGFloat, index: Int) {
        let dateLabel: UILabel = UILabel()
        dateLabel.frame = CGRect(x: bounds.minX + space - 5, y: bounds.maxY + 10, width: columnWidth + 10, height: 20)
        dateLabel.font = dateLabel.font.withSize(11)
        dateLabel.textAlignment = .center
        dateLabel.text = arrayDate[index]
        addSubview(dateLabel)
    }
}
