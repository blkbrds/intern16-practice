//
//  TriangleView.swift
//  Baitap5
//
//  Created by MBA0245P on 7/19/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

@IBDesignable
class TriangleView : UIView {
    var color: UIColor! = UIColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var margin: CGFloat! = 0

    @IBInspectable var setMargin: Float {
        get { return Float(margin)}
        set { margin = CGFloat(newValue)}
    }

    @IBInspectable var fillColor: UIColor? {
        get { return color }
        set{ color = newValue }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else { return }

        context.beginPath()
        context.move(to: CGPoint(x: rect.minX + margin, y: rect.minY))
        context.addLine(to: CGPoint(x: rect.maxX - margin, y: rect.minY))
        context.addLine(to: CGPoint(x: (rect.maxX / 2.0), y: rect.maxY))
        context.closePath()

        context.setFillColor(color.cgColor)
        context.fillPath()
    }
}


