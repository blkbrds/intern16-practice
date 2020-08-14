//
//  Baitap1ViewController.swift
//  Baitap6
//
//  Created by MBA0245P on 8/12/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap1ViewController: UIViewController {
    
    var barChart = GraphicsDraw()

    override func viewDidLoad() {
        super.viewDidLoad()
        createXYasis()
        createValueLabel(startValue: 999, gap: 1)
        view.addSubview(barChart)
    }
    
    private func createXYasis() {
        barChart.backgroundColor = #colorLiteral(red: 0.8629845977, green: 0.9938684106, blue: 0.8738953471, alpha: 1)
        let frame = CGRect(x: 20, y: UIScreen.main.bounds.height / 3, width: UIScreen.main.bounds.width - 40 , height: UIScreen.main.bounds.height / 3)
        barChart.frame = frame
        barChart.drawLine(start: CGPoint(x: 35, y: 30), end: CGPoint(x: 35, y: frame.size.height - 45))
        barChart.drawLine(start: CGPoint(x: 35, y: frame.size.height - 45), end: CGPoint(x: frame.size.width - 20, y: frame.size.height - 45))
    }
    
    private func createValueLabel(startValue: Int, gap: Int) {
        let xStart: Int = 0
        var yStart: Int = 200
        var valueLabel: Int = startValue
        for _ in 1...3 {
            barChart.addLabel(position: CGPoint(x: xStart, y: yStart), text: String(valueLabel))
            valueLabel += gap
            yStart -= ((Int(barChart.frame.size.height) - 85) / 3)
        }
    }
    


}

extension String {
    func contentWidth(font: UIFont) -> CGFloat {
        let size = (self as NSString).size(withAttributes: [.font: font])
        return size.width + 30 - 6.67
    }
}
