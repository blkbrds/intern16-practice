//
//  ChartViewViewController.swift
//  Drawing
//
//  Created by Abcd on 7/8/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class ChartViewViewController: UIViewController {

    private var datas: [Segment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        getData()
        drawPieChart()
    }
    
    func drawPieChart() {
        let pieChartView = TL1ChartView()
        pieChartView.backgroundColor = .lightGray
        pieChartView.frame = CGRect(x: 10, y: 30, width: view.frame.size.width - 20, height: 400)
        pieChartView.segments = datas
        view.addSubview(pieChartView)
    }
    
    private func getData() {
        #warning("This random data for test")
        for _ in 0...4 {
            datas.append(Segment(color: UIColor(red:CGFloat.random(in: 0...1),
                                                green:CGFloat.random(in: 0...1),
                                                blue: CGFloat.random(in: 0...1),
                                                alpha: 1),
                                 value: 20))
        }
    }
}
