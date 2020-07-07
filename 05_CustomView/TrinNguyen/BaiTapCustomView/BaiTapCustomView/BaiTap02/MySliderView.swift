//
//  MySliderView.swift
//  BaiTapCustomView
//
//  Created by PCI0004 on 7/6/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

protocol MySliderViewDelegate: class {
    func sliderView(_ sliderView: MySliderView, didSelcect: Int)
}

class MySliderView: UIView {

    // MARK: IBOutlets
    @IBOutlet private weak var grayImageView: UIImageView!
    @IBOutlet private weak var blueImageView: UIImageView!
    @IBOutlet private weak var sliderView: UIView!
    @IBOutlet private weak var valueLabel: UILabel!

    weak var delegate: MySliderViewDelegate?
    var value: Int?
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
    
    func changeView(y: CGFloat) {
        blueImageView.frame = CGRect(x: blueImageView.frame.origin.x, y: y, width: blueImageView.frame.width, height: grayImageView.frame.height - y)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
            if position.y < grayImageView.bounds.minY {
                sliderView.center.y = grayImageView.bounds.minY
            } else if position.y > grayImageView.bounds.maxY {
                sliderView.center.y = grayImageView.bounds.maxY
            } else {
                sliderView.center.y = position.y
            }
            // Thay doi blueView
            changeView(y: sliderView.center.y)
            let temp = "\(Int(blueImageView.frame.height / grayImageView.frame.height * 100))"
            valueLabel.text = temp
            // Ban so % qua ViewController
            delegate?.sliderView(self, didSelcect: Int(temp)!)
        }
    }
    
    func setView() {
        // Kiem tra neu khong co value thi return
        guard let temp = value else { return }
        let newHeight = (grayImageView.frame.height * CGFloat(temp)) / 100
        let newY = grayImageView.frame.height - newHeight
        blueImageView.frame = CGRect(x: blueImageView.frame.origin.x, y: newY, width: blueImageView.frame.width, height: newHeight)
        sliderView.center.y = newY
        valueLabel.text = String(temp)
    }
}

