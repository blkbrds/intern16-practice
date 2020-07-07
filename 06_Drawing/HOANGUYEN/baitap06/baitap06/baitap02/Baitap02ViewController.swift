//
//  Baitap02ViewController.swift
//  baitap06
//
//  Created by NXH on 7/7/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class Baitap02ViewController: UIViewController {

// MARK: -Properties
    private let values: [CGFloat] = [40, 30, 15, 10, 5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pieChart = DrawPieChart()
        pieChart.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        pieChart.backgroundColor = .white
        pieChart.transform(values: values)
        view.addSubview(pieChart)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
