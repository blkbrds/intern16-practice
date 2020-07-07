//
//  Baitap01ViewController.swift
//  baitap06
//
//  Created by NXH on 7/5/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class Baitap01ViewController: UIViewController {
    
// MARK: - Properties
    private let values: [CGFloat] = [41, 30, 57, 84, 90, 46, 66]
    
// MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let columnChartView = DrawColumnChart()
        columnChartView.frame = CGRect(x: 10, y: 50, width: view.bounds.width - 20, height: view.bounds.height - 100)
        columnChartView.backgroundColor = .white
        columnChartView.transform(values: values)
        view.addSubview(columnChartView)
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
