//
//  Baitap02ViewController.swift
//  baitap06
//
//  Created by NXH on 7/7/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap02ViewController: UIViewController {
    
    // MARK: - Properties
    private let values: [CGFloat] = [40, 30, 15, 10, 5]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configChart()
    }
    
    // MARK: - Private Function
    private func configChart() {
        let pieChart = DrawPieChart()
        pieChart.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        pieChart.backgroundColor = .white
        pieChart.transform(values: values)
        view.addSubview(pieChart)
    }
}
