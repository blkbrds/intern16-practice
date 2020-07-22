//
//  ChartLine.swift
//  Bai6
//
//  Created by PCI0001 on 7/11/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class ChartLine: UIView {
    
    //MARK: - Properties
    static let heightLabel: CGFloat = 40
    let widthLabel: CGFloat = 70
    
    init(frame: CGRect, backgroundColor: CGColor) {
        super.init(frame: frame)
        createRectangle(backgroundColor: backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    private func createRectangle(backgroundColor: CGColor) {
        let path = UIBezierPath(rect: bounds)
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = backgroundColor
        shapeLayer.lineWidth = 1
        shapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
    }
}
