//
//  MySliderView.swift
//  BaiTapCustomView
//
//  Created by PCI0004 on 7/6/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

// MARK: Protocol
protocol MySliderViewDelegate: class {
    func sliderView(_ sliderView: MySliderView, didSelect: Int)
}

final class MySliderView: UIView {

    // MARK: IBOutlets
    @IBOutlet private weak var grayImageView: UIImageView!
    @IBOutlet private weak var blueImageView: UIImageView!
    @IBOutlet private weak var sliderView: UIView!
    @IBOutlet private weak var valueLabel: UILabel!

    // MARK: Propeties
    weak var delegate: MySliderViewDelegate?
    var value: Int?


    // MARK: Private Methods
    func changeView(y: CGFloat) {
        let newBluePoint = blueImageView.frame.origin
        let newBlueSize = blueImageView.frame.size
        let newGraySize = grayImageView.frame.size
        blueImageView.frame = CGRect(x: newBluePoint.x, y: y, width: newBlueSize.width, height: newGraySize.height - y)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)

            let grayBounds = grayImageView.bounds
            var centerYofSliderView = sliderView.center.y

            if position.y < grayBounds.minY {
                centerYofSliderView = grayBounds.minY
            } else if position.y > grayBounds.maxY {
                centerYofSliderView = grayBounds.maxY
            } else {
                centerYofSliderView = position.y
            }
            // Thay doi blueView
            changeView(y: centerYofSliderView)
            let temp = "\(Int(blueImageView.frame.height / grayImageView.frame.height * 100))"
            valueLabel.text = temp
            // Ban so % qua ViewController
            delegate?.sliderView(self, didSelect: Int(temp)!)
        }
    }

    func setView() {
        let newBluePoint = blueImageView.frame.origin
        let newBlueSize = blueImageView.frame.size
        let newGraySize = grayImageView.frame.size
        // Kiem tra neu khong co value thi return
        guard let temp = value else { return }
        let newHeight = (newGraySize.height * CGFloat(temp)) / 100
        let newY = newGraySize.height - newHeight
        blueImageView.frame = CGRect(x: newBluePoint.x, y: newY, width: newBlueSize.width, height: newHeight)
        sliderView.center.y = newY
        valueLabel.text = String(temp)
    }
}
