//
//  ChartViewController.swift
//  BaiTap06
//
//  Created by PCI0020 on 7/9/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController {
    
    let verticalAxisData:[Int] = [90, 95, 100, 105]
    let horizontalAxisData:[String] = ["Tue", "Wed", "Thu", "Fri", "Sat", "Sun" , "Today"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let chartFrame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        let chartView = ChartView(frame: chartFrame, verticalAxisData: verticalAxisData.reversed(), horizontalAxisData: horizontalAxisData)
        view.addSubview(chartView)
    }
        
    


}
