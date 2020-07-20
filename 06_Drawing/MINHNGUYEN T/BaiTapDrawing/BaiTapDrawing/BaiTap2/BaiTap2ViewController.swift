//
//  BaiTap2ViewController.swift
//  BaiTapDrawing
//
//  Created by MacBook Pro on 7/9/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap2ViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        drawPieChart()
    }

    // MARK: - Private functions
    private func drawPieChart() {
        let pieChartView = BaiTap2View()
        pieChartView.backgroundColor = .lightGray
        pieChartView.frame = CGRect(x: 10, y: 30, width: UIScreen.main.bounds.width - 20, height: 400)
        pieChartView.segments = [
            Segment(color: #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1) ,value: 50),
            Segment(color: #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), value: 30),
            Segment(color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), value: 25),
            Segment(color: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), value: 40)
        ]
        view.addSubview(pieChartView)
    }
}
