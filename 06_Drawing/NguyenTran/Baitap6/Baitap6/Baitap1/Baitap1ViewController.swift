//
//  Baitap1ViewController.swift
//  Baitap6
//
//  Created by MBA0245P on 8/12/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit
import Foundation

struct YValueData {
    var startValue: CGFloat
    var gap: CGFloat
}

class Baitap1ViewController: UIViewController {

    var barChart = GraphicsDraw()
    let dateData = ["今日", "2021/01/01"]
    let yValueData = YValueData(startValue: 500, gap: 50)
    let pointData: Array<CGFloat> = [500, 510, 530, 557, 568, 590, 600]

    override func viewDidLoad() {
        super.viewDidLoad()
        createXYasis()
        createValueLabel(startValue: yValueData.startValue, gap: yValueData.gap)
        createDateLabel(dateValue: dateData)
        createChart(data: pointData)
        createPoint(data: pointData)
        view.addSubview(barChart)
    }

    private func createXYasis() {
        barChart.backgroundColor = #colorLiteral(red: 0.8629845977, green: 0.9938684106, blue: 0.8738953471, alpha: 1)
        let frame = CGRect(x: 20, y: 200, width: UIScreen.main.bounds.width - 40, height: 350)
        barChart.frame = frame
        barChart.drawLine(start: CGPoint(x: 40, y: 30), end: CGPoint(x: 40, y: 310))
        barChart.drawLine(start: CGPoint(x: 40, y: 310), end: CGPoint(x: frame.size.width - 20, y: 310))
        barChart.drawLine(start: CGPoint(x: frame.size.width - 25, y: 300), end: CGPoint(x: frame.size.width - 25, y: 310))
    }

    private func createValueLabel(startValue: CGFloat, gap: CGFloat) {
        let xStart: CGFloat = 5
        var yStart: CGFloat = 275
        var valueLabel: CGFloat = startValue
        for _ in 1...3 {
            barChart.addLabel(position: CGPoint(x: xStart, y: yStart - 15), text: String(Int(valueLabel)), fontSize: 14)
            valueLabel += gap
            yStart -= 120
        }
    }

    private func createDateLabel(dateValue: [String]) {
        barChart.addLabel(position: CGPoint(x: 30, y: barChart.frame.size.height - 35), text: dateValue[0], fontSize: 15)
        barChart.addLabel(position: CGPoint(x: barChart.frame.size.width - 80, y: barChart.frame.size.height - 35), text: dateValue[1], fontSize: 15)
    }

    private func configPointData(data: [CGFloat]) -> [CGPoint] {
        let fullGap: CGFloat = yValueData.gap * 2
        let barWidth = barChart.frame.size.width - 75
        var result = [CGPoint]()
        var yValue: CGFloat = 0
        var xValue: CGFloat = 0
        var tempY: CGFloat = 0
        var tempX: CGFloat = 0
        for i in 0...data.count - 1 {
            tempY = (data[i] - yValueData.startValue) / fullGap
            yValue = 275 - tempY * 240
            tempX = CGFloat(Float(i) / Float((data.count - 1)))
            xValue = tempX * (barWidth) + 40
            result.append(CGPoint(x: xValue, y: yValue))
        }
        return result
    }

    private func createChart(data: [CGFloat]) {
        var finalData = configPointData(data: data)
        finalData.append(CGPoint(x: barChart.frame.size.width - 35, y: barChart.frame.size.height - 40))
        finalData.append(CGPoint(x: 40, y: 310))
        barChart.drawChart(pointValue: finalData)
    }

    private func createPoint(data: [CGFloat]) {
        let finalData = configPointData(data: data)
        print(finalData)
        for i in 0...finalData.count - 1 {
            barChart.addCirclePoint(position: CGPoint(x: finalData[i].x - 8, y: finalData[i].y - 8))
        }
    }
}

