//
//  CustomSiderView.swift
//  Baitap5
//
//  Created by MBA0245P on 7/18/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

protocol CustomSliderViewDelegate: class {
    func view(_ view: CustomSiderView, needsPerform action: CustomSiderView.Action)
}

@IBDesignable
class CustomSiderView: UIView {

    @IBOutlet weak var maxSliderView: TriangleView!

    @IBOutlet weak var minSliderView: TriangleView!

    @IBOutlet weak var thumbButtonView: UIView!

    @IBOutlet weak var thumbButtonLabel: UILabel!

    var thumbValue: Int = 50
    var panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer()
    weak var delegate: CustomSliderViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        createSlider()
    }

    private func createSlider() {
//        maxSliderView.color = #colorLiteral(red: 0.8629845977, green: 0.9938684106, blue: 0.8738953471, alpha: 1)
//        minSliderView.color = #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)
//        thumbButtonView.addSubview(thumbButtonLabel)
        thumbButtonLabel.text = "50"

        maxSliderView.addSubview(minSliderView)
        maxSliderView.addSubview(thumbButtonView)

        panGesture = UIPanGestureRecognizer(target: self, action: #selector(configThumbButton))
        thumbButtonView.addGestureRecognizer(panGesture)
        thumbButtonView.isUserInteractionEnabled = true
    }

    @objc func configThumbButton(sender: UIPanGestureRecognizer) {
        let thumbHeight = thumbButtonView.frame.height
        let maxHeight = maxSliderView.frame.height

        let translate = sender.translation(in: maxSliderView)
        sender.view?.center = CGPoint(x: maxSliderView.frame.width / 2, y: (sender.view?.center.y)! + translate.y)
        sender.setTranslation(CGPoint.zero, in: maxSliderView)

        if thumbButtonView.center.y <= 0 {
            thumbButtonView.center.y = 0
        }
        if thumbButtonView.center.y >= maxHeight {
            thumbButtonView.center.y = maxHeight
        }
        minSliderView.frame.origin.y = thumbButtonView.center.y

        let percentage: Float = Float(maxHeight - thumbButtonView.center.y + thumbHeight / 2) / Float(maxHeight)

        if minSliderView.frame.origin.y >= maxHeight {
            minSliderView.frame.size = CGSize(width: minSliderView.frame.width, height: 0)
        } else {
            minSliderView.frame.size = CGSize(width: minSliderView.frame.width, height: maxSliderView.frame.height - thumbButtonView.center.y)
            minSliderView.setMargin = (100 - percentage * 100) / 2
        }
        thumbButtonLabel.text = "\(Int(percentage * 100))"
        thumbValue = Int(percentage * 100)
        delegate?.view(self, needsPerform: .didChangeThumbValue(thumbValue: thumbValue))
    }
}

extension CustomSiderView {
    enum Action {
        case didChangeThumbValue(thumbValue: Int)
    }
}
