//
//  CustomSiderView.swift
//  Baitap5
//
//  Created by MBA0245P on 7/18/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

protocol CustomSliderViewDelegate: class {
    func view(value: Float)
}

class CustomSiderView: UIView {

    @IBOutlet weak var maxSliderView: UIImageView!
    @IBOutlet weak var minSliderView: UIImageView!
    @IBOutlet weak var thumbButtonView: UIView!
    @IBOutlet weak var thumbButtonLabel: UILabel!

    var thumbValue: Float? {
        didSet {
            configSlider()
        }
    }
    weak var delegate: CustomSliderViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let currentLocation = touch.location(in: maxSliderView)
        if currentLocation.y < maxSliderView.bounds.minY {
            thumbButtonView.center.y = maxSliderView.bounds.minY
        } else if currentLocation.y > maxSliderView.bounds.maxY {
            thumbButtonView.center.y = maxSliderView.bounds.maxY
        } else {
            thumbButtonView.center.y = currentLocation.y
        }
        changeMinSliderView(y: thumbButtonView.center.y)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let currentLocation = touch.location(in: maxSliderView)
        if currentLocation.y < maxSliderView.bounds.minY {
            thumbButtonView.center.y = maxSliderView.bounds.minY
        } else if currentLocation.y > maxSliderView.bounds.maxY {
            thumbButtonView.center.y = maxSliderView.bounds.maxY
        } else {
            thumbButtonView.center.y = currentLocation.y
        }
        changeMinSliderView(y: thumbButtonView.center.y)
    }

    private func changeMinSliderView(y: CGFloat) {
        let minSliderY = minSliderView.frame.origin.y
        let minSliderHeight = minSliderView.bounds.height
        minSliderView.frame = CGRect(x: minSliderView.frame.origin.x, y: y, width: minSliderView.frame.width, height: minSliderHeight + (minSliderY - y))
        let thumbValue = (minSliderView.frame.height / maxSliderView.frame.height) * 100
        thumbButtonLabel.text = String(format: "%.0f", thumbValue)
        delegate?.view(value: Float(thumbValue))
    }

    private func configSlider() {
        guard let value = thumbValue else { return }
        let newMinSliderHeight = (maxSliderView.bounds.height * CGFloat(value)) / 100
        let newMinSliderY = maxSliderView.bounds.height - newMinSliderHeight
        minSliderView.frame = CGRect(x: minSliderView.frame.origin.x, y: newMinSliderY, width: minSliderView.frame.width, height: newMinSliderHeight)
        thumbButtonView.center.y = newMinSliderY
        thumbButtonLabel.text = String(format: "%.0f", value)
    }
}
