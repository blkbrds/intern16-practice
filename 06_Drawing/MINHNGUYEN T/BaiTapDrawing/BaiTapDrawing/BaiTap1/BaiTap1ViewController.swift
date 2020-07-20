//
//  BaiTap1ViewController.swift
//  BaiTapDrawing
//
//  Created by MacBook Pro on 7/8/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap1ViewController: UIViewController {

    // MARK: - Properties
    private let values: [CGFloat] = [10, 40, 25, 40, 50, 60, 70]

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        drawColumeChart()
    }

    // MARK: - Private functions
    private func drawColumeChart() {
        let screenSize = UIScreen.main.bounds
        let frame = CGRect(x: 30, y: 30, width: screenSize.width - 55, height: screenSize.height / 2)
        let columnChartView = ColumnChartView(frame: frame, valueForColumn: values)
        view.addSubview(columnChartView)
    }
}
