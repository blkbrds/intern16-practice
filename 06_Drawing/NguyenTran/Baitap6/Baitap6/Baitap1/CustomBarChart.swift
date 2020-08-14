//
//  CustomBarChart.swift
//  Baitap6
//
//  Created by MBA0245P on 8/12/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit
import Foundation

enum ButtonType {
    case value
    case date
}

class GraphicsDraw: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawLine(start: CGPoint, end: CGPoint) {
        let line =  UIBezierPath()
        line.move(to: start)
        line.addLine(to: end)
        line.close()
        
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.darkGray.cgColor
        layer.lineWidth = 1.0
        layer.path = line.cgPath
        
        self.layer.addSublayer(layer)
    }
    
//    func addLabel(type: buttonType, number: Int, text: String, fontSize: CGFloat? = nil) {
//        let label = UILabel()
//        label.frame.size = CGSize(width: 30, height: 40)
//        switch type {
//        case .value:
//            label.center.x = CGFloat(35 + (number - 1) * (self.frame.width - 50))
//            label.center.y = 45 / 2
//        case .date:
//            label.center.x = 35 / 2
//            label.center.y =
//
//        }
//        let label = UILabel(frame: CGRect(x: position.x, y: position.y, width: 30, height: 50))
//
//        label.text = text
//        label.textAlignment = .center
//        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
//    }
    
    func addLabel(position: CGPoint, text: String, fontSize: CGFloat? = nil) {
        let label = UILabel(frame: CGRect(x: position.x, y: position.y, width: 30, height: 50))
        label.text = text
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        if let size = fontSize {
            label.font = UIFont.systemFont(ofSize: size)
        } else {
            label.adjustsFontSizeToFitWidth = true
        }
        self.addSubview(label)
    }
    

}
