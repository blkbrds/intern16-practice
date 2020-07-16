//
//  MySliderView.swift
//  BaiTapCustomView
//
//  Created by PCI0004 on 7/6/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

// MARK: - Protocol
protocol MySliderViewDelegate: class {
    func sliderView(_ sliderView: MySliderView, percentInput: Int)
}

final class MySliderView: UIView {

    // MARK: - IBOutlets
    @IBOutlet private weak var grayImageView: UIImageView!
    @IBOutlet private weak var blueImageView: UIImageView!
    @IBOutlet private weak var sliderView: UIView!
    @IBOutlet private weak var valueLabel: UILabel!

    // MARK: - Properties
    weak var delegate: MySliderViewDelegate?
    var value: Int?
    var newBluePoint: CGPoint {
        return blueImageView.frame.origin
    }
    var newBlueSize: CGSize {
        return blueImageView.frame.size
    }
    var newGraySize: CGSize {
        return grayImageView.frame.size
    }
    var grayBounds: CGRect {
        return grayImageView.bounds
    }

    // MARK: - Private Methods
    func changeView(y: CGFloat) {
        blueImageView.frame = CGRect(x: newBluePoint.x, y: y, width: newBlueSize.width, height: newGraySize.height - y)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
            if position.y < grayBounds.minY {
                sliderView.center.y = grayBounds.minY
            } else if position.y > grayBounds.maxY {
                sliderView.center.y = grayBounds.maxY
            } else {
                sliderView.center.y = position.y
            }
            // Thay doi blueView
            changeView(y: sliderView.center.y)
            let temp = "\(Int(newBlueSize.height / newGraySize.height * 100))"
            valueLabel.text = temp
            // Ban so % qua ViewController
            guard let delegate = delegate else { return }
            delegate.sliderView(self, percentInput: Int(temp) ?? 50)
        }
    }

    func setView() {
        // Kiem tra neu khong co value thi return
        guard let temp = value else { return }
        let newHeight = (newGraySize.height * CGFloat(temp)) / 100
        let newY = newGraySize.height - newHeight
        blueImageView.frame = CGRect(x: newBluePoint.x, y: newY, width: newBlueSize.width, height: newHeight)
        sliderView.center.y = newY
        valueLabel.text = String(temp)
    }
}
