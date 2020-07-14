//
//  BaiTap01VC.swift
//  BaiTap06
//
//  Created by PCI0020 on 7/2/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class BaiTap01: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var viewGrid: UIView!
    var data:[Int] = [98, 95, 103, 102, 99, 97, 98]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configView()
    }
    
    // MARK: - Function
    func drawLine(color: UIColor, view: UIView, value: Int, pointX0: Int) {
        let x0: Int = pointX0
        let y0: Int = Int(view.frame.size.height)
        let width: Int = 25
        let height = y0 - Int(y0) / 15 * (value - 90)
        let path = UIBezierPath()
        path.move(to: CGPoint(x: x0, y: y0))
        path.addLine(to: CGPoint(x: x0, y: height))
        path.addLine(to: CGPoint(x: x0 + width, y: height))
        path.addLine(to: CGPoint(x: x0 + width, y: y0))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = color.cgColor
        shapeLayer.lineWidth = 1.0

        view.layer.addSublayer(shapeLayer)
    }
    
    func configView() {
        var x0 = 0
        var colorView:UIColor?
        for i in 0..<data.count {
            if data[i] > 100 {
                colorView = .red
            } else if data[i] > 95 && data[i] < 100 {
                colorView = .green
            } else {
                colorView = .orange
            }
            drawLine(color: colorView!, view: viewGrid, value: data[i], pointX0: x0)
            x0 = x0 + 45
        }
    }
}
