//
//  Baitap2ViewController.swift
//  Baitap6
//
//  Created by MBA0245P on 8/14/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap2ViewController: UIViewController {

    let inputData: [Int] = [200, 300, 500, 400]

    override func viewDidLoad() {
        super.viewDidLoad()
        createPieChart(inputData: inputData)
    }

    func createPieChart(inputData: [Int]) {
        let pieChart = CustomPieChart(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
        pieChart.backgroundColor = .brown

        //configData
        let newData = inputData.sorted()
        let valueCount = newData.reduce(0) { $0 + $1 }
        var radius: CGFloat = 100
        var startAngle: CGFloat = 0

        //draw PieChart
        for i in 0...newData.count - 1 {
            let percent = CGFloat(newData[i]) / CGFloat(valueCount)
            let endAngle = startAngle + percent * CGFloat.pi * 2
            pieChart.createPieChart(value: newData[i], startAngle: startAngle, endAngle: endAngle, radius: radius)
            startAngle = endAngle
            radius += 20
        }
        view.addSubview(pieChart)
    }
}
