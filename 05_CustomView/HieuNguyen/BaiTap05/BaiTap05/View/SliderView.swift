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
    let numberLabel = UILabel()
    var numberValue: CGFloat = 50
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(frame: CGRect, value: Int) {
        self.init(frame: frame)
        setupSlider(value: Int(numberValue))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupSlider(value: Int) {
        print(bounds)
        backgroundSlider.image = UIImage(named: "backgroundSlider")
        backgroundSlider.contentMode = .top
        backgroundSlider.frame = bounds
        addSubview(backgroundSlider)

        valueSlider.image = UIImage(named: "valueSlider")
        valueSlider.frame = bounds
        valueSlider.contentMode = .top
        valueSlider.clipsToBounds = true
        valueSlider.frame.size.height = bounds.size.height / 2
        addSubview(valueSlider)
        
        thumbSlider.frame.size = CGSize(width: 150, height: 50)
        thumbSlider.center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
        thumbSlider.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleSlider))
        thumbSlider.isUserInteractionEnabled = true
        thumbSlider.addGestureRecognizer(panGesture)
        addSubview(thumbSlider)
        
        numberLabel.text = "\(value)"
        numberLabel.textColor = .white
        numberLabel.frame = thumbSlider.bounds
        numberLabel.textAlignment = .center
        thumbSlider.addSubview(numberLabel)
    }
    @objc func handleSlider(_ tapGesture: UIPanGestureRecognizer) {
        let sliderY = self.bounds.origin.y
        let sliderHeight = self.bounds.height
        if let tapGestureView = tapGesture.view {
            let heightValue = tapGestureView.center.y
            if tapGesture.state == .began || tapGesture.state == .changed {
                let translation = tapGesture.translation(in: self)
                let gestureY = tapGestureView.center.y + translation.y
                if gestureY > sliderY && gestureY < (sliderY + sliderHeight) {
                    tapGestureView.center = CGPoint(x: tapGestureView.center.x, y: tapGestureView.center.y + translation.y)
                    tapGesture.setTranslation(CGPoint.zero, in: self)
                    valueSlider.frame.size.height = heightValue
                    numberValue = ((sliderHeight - heightValue) / sliderHeight) * 100
                    numberValue = CGFloat(round(numberValue))
                    numberLabel.text = "\(Int(numberValue))"
                    delegate?.sendValue(self, Int(numberValue))
                }
            }
        }

    }
}
protocol SliderViewDelegate: class {
    func sendValue(_ view: UIView, _ value: Int)
}
