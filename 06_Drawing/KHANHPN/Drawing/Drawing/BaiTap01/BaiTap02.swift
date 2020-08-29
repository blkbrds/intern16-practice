//
//  BaiTap02VC.swift
//  BaiTap06
//
//  Created by PCI0020 on 7/3/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

final class BaiTap02: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDrawingView()
    }

    // MARK: - Private function
    private func setupDrawingView() {
        drawCircle(startAngle: CGFloat(Double.pi * 1 / 2), endAngle: CGFloat(Double.pi / 3), color: .green)
        drawCircle(startAngle: CGFloat(Double.pi / 4), endAngle: CGFloat(2 * Double.pi / 3), color: .yellow)
        drawCircle(startAngle: CGFloat(2 * Double.pi / 3), endAngle: CGFloat(Double.pi * 3 / 2), color: .systemTeal)
    }
    
    private func drawCircle(startAngle: CGFloat, endAngle: CGFloat, color: UIColor) {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height / 2), radius: CGFloat(100), startAngle: startAngle, endAngle: endAngle, clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 50
        view.layer.addSublayer(shapeLayer)
    }
}
