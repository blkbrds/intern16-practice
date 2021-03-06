//
//  BaiTap01.swift
//  BaiTapDraw
//
//  Created by PCI0004 on 7/9/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class BaiTap01: UIViewController {

    // MARK: - Propeties
    var columnX: Int = 30
    var columnY: Int = 550

    struct Chart {
        var heightColumn: Int
        var name: String
    }

    let charts: [Chart] = [
        Chart(heightColumn: 200, name: "Monday"),
        Chart(heightColumn: 250, name: "Tuesday"),
        Chart(heightColumn: 150, name: "Wednesday"),
        Chart(heightColumn: 300, name: "Thusday"),
        Chart(heightColumn: 225, name: "Friday")
    ]

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        drawChart()
    }

    // MARK: - Private Function
    private func random() -> UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }

    private func drawChart() {

        // Draw OXY
        let lineX = ChartLineView(frame: CGRect(x: 30, y: 200, width: 3, height: 300),
            backgroundColor: UIColor.black.cgColor)
        let lineY = ChartLineView(frame: CGRect(x: lineX.frame.origin.x, y: lineX.frame.maxY, width: 350, height: 3),
            backgroundColor: UIColor.black.cgColor)
        view.addSubview(lineX)
        view.addSubview(lineY)

        let widthColumn: Int = 30
        let space: Int = 30

        // Draw columns
        for (index, chart) in charts.enumerated() {
            let x: Int = Int(lineX.frame.origin.x) + space + index * space + index * widthColumn
            let y: Int = Int(lineY.frame.origin.y) - chart.heightColumn + Int(ChartColumnView.labelHeight)
            let column = ChartColumnView(frame: CGRect(x: x, y: y, width: widthColumn, height: chart.heightColumn),
                name: chart.name,
                backgroundColor: random().cgColor,
                nameColor: .black)
            view.addSubview(column)
        }
    }
}
