//
//  BaiTap1ViewController.swift
//  BaiTapDrawing
//
//  Created by MacBook Pro on 7/8/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class BaiTap1ViewController: UIViewController {
    private let values: [CGFloat] = [10, 40, 25, 40, 50, 60, 70]
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        drawColumeChart()
    }
    // MARK: - Private Function
    private func drawColumeChart() {
        let columnChartView = ColumnChartView()
        let frame = CGRect(x: 30, y: 30, width: view.bounds.width - 70, height: view.bounds.height / 2)
        columnChartView.frame = frame
        columnChartView.backgroundColor = .white
        columnChartView.getValue(values: values)
        columnChartView.addDate()
       // columnChartView.addValue()
        view.addSubview(columnChartView)
    }
}
