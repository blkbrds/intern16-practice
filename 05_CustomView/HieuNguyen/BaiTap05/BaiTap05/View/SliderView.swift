//
//  SliderView.swift
//  BaiTap05
//
//  Created by hieungq on 7/5/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class SliderView: UIView {

    weak var delegate: SliderViewDelegate?
    let valueSlider = UIImageView()
    let thumbSlider = UIView()
    let backgroundSlider = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(frame: CGRect, value: Int) {
        self.init(frame: frame)
        setupSlider(value: value)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupSlider(value: Int) {
        backgroundSlider.image = UIImage(named: "backgroundSlider")
        self.addSubview(backgroundSlider)
        backgroundSlider.frame = bounds

        valueSlider.image = UIImage(named: "valueSlider")
        valueSlider.frame = bounds
//        valueSlider.contentMode = .bottom
        valueSlider.clipsToBounds = true
//        valueSlider.frame.origin.y = thumbSlider.frame.origin.y
//        valueSlider.frame.size.height = heightValue
        self.addSubview(valueSlider)
        
        thumbSlider.frame.size = CGSize(width: 150, height: 50)
        thumbSlider.center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
        thumbSlider.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleSlider))
        thumbSlider.isUserInteractionEnabled = true
        thumbSlider.addGestureRecognizer(panGesture)
        self.addSubview(thumbSlider)
        print(value)
    }
    @objc func handleSlider(_ tapGesture: UIPanGestureRecognizer) {
        let sliderY = self.bounds.origin.y
        let sliderHeight = self.bounds.height
        let heightValue = sliderHeight - tapGesture.view!.center.y
        print("\(sliderY) \(sliderHeight) \(heightValue)")
        if tapGesture.state == .began || tapGesture.state == .changed {
            let translation = tapGesture.translation(in: self)
            let gestureY = tapGesture.view!.center.y + translation.y
            if gestureY > sliderY && gestureY < (sliderY + sliderHeight) {
                tapGesture.view!.center = CGPoint(x: tapGesture.view!.center.x, y: tapGesture.view!.center.y + translation.y)
                tapGesture.setTranslation(CGPoint.zero, in: self)
                valueSlider.frame.origin.y = thumbSlider.frame.origin.y
                valueSlider.frame.size.height = heightValue
            }
        } else {
//            let value = ((sliderHeight - heightValue) / sliderHeight) * 100
//            let realValue = Double(round(value))
//            valueLabel.text = " \(Int(realValue))"
//            print(realValue)
        }
    }
}
protocol SliderViewDelegate: class {
    func sendValue(_ view: UIView, _ value: Int)
}
