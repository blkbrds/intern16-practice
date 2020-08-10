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

    @IBOutlet weak var maxSliderView: UIImageView!
    
    @IBOutlet weak var minSliderView: UIImageView!
    
    @IBOutlet weak var thumbButtonView: UIView!
    
    @IBOutlet weak var thumbButtonLabel: UILabel!
    
    var panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer()
    weak var delegate: CustomSliderViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // createSlider()
    }

    private func createSlider() {
//        thumbButtonLabel.text = "50"
        minSliderView.center.x = maxSliderView.center.x
        thumbButtonView.center.x = maxSliderView.center.x

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
        }
        thumbButtonLabel.text = "\(Int(percentage * 100))"
        delegate?.view(self, needsPerform: .didChangeThumbValue(thumbValue: Int(percentage * 100)))
    }
}

extension CustomSiderView {
    enum Action {
        case didChangeThumbValue(thumbValue: Int)
    }
}
