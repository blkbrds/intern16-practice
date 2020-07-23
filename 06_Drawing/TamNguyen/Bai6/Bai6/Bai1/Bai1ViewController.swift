//
//  Bai1ViewController.swift
//  Bai6
//
//  Created by PCI0001 on 7/10/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai1ViewController: UIViewController {
    
    //MARK: - Properties
    struct InforChart {
        var heightY: Int
        var name: String
    }
    
    let inforChar: [InforChart] = [
        InforChart(heightY: 200, name: "Monday"),
        InforChart(heightY: 250, name: "Tuesday"),
        InforChart(heightY: 150, name: "Wednesday"),
        InforChart(heightY: 200, name: "Thursday"),
        InforChart(heightY: 270, name: "Friday")
    ]
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        drawChart()
        view.backgroundColor = .white
    }
    
    //MARK: - Private Methods
    private func drawChart() {
        
        // Draw OXY
        let lineX = LineView(frame: CGRect(x: 30, y: 200, width: 3, height: 300), backgroundColor: UIColor.black.cgColor)
        let lineY = LineView(frame: CGRect(x: lineX.frame.origin.x, y: lineX.frame.maxY, width: 320, height: 3), backgroundColor: UIColor.black.cgColor)
        view.addSubview(lineY)
        view.addSubview(lineX)
        
        // Draw Column
        let width: Int = 30
        let space: Int = 30
        for (i,inforCharts) in inforChar.enumerated() {
            let x: Int = Int(lineX.frame.origin.x) + space + i * space + i * width
            let column = ColumnView(frame: CGRect(x: x, y: Int(lineY.frame.origin.y) - inforCharts.heightY + Int(ColumnView.labelHeight), width: width, height: inforCharts.heightY), name: inforCharts.name, backgroundColor: UIColor.green.cgColor, nameColor: .black)
            view.addSubview(column)
        }
    }
}
