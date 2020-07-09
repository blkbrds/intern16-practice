//
//  BaiTap2View.swift
//  BaiTapDrawing
//
//  Created by MacBook Pro on 7/9/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

// MARK: - Struct
struct Segment {
    var color: UIColor
    var value: CGFloat
}

class BaiTap2View: UIView {
    
    // MARK: - Properties
    var segments = [Segment]() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - Override
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let radius = min(frame.size.width, frame.size.height) * 0.5
        let viewCenter = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
        let valueCount = segments.reduce(0, {$0 + $1.value})
        var startAngle = -CGFloat.pi / 2
        
        for segment in segments {
            context?.setFillColor(segment.color.cgColor)
            let endAngle = startAngle + 2 * .pi * (segment.value / valueCount)
            context?.move(to: viewCenter)
            context?.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            context?.fillPath()
            startAngle = endAngle
        }
    }
}
