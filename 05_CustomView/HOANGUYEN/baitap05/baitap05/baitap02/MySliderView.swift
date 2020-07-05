//
//  MySliderView.swift
//  baitap05
//
//  Created by NXH on 7/3/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

// MARK: - protocol
protocol MySliderDelegate: class {
    func mySlider(_ view: MySliderView, panTo value: Int)
}

class MySliderView: UIView {

// MARK: - IBOutlet
    @IBOutlet weak private var maxTrackSlider: UIImageView!
    @IBOutlet weak private var minTrackSlider: UIImageView!
    @IBOutlet weak private var thumpLabel: UILabel!
    
//MARK: - Properties
    private var value: Int = 50
    var panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer()
    weak var delegate: MySliderDelegate?
// MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configThumpSlider()
    }
    
// MARK: - Private Function
    private func configThumpSlider(){
        thumpLabel.text = String(value)
        minTrackSlider.contentMode = .bottom
        minTrackSlider.clipsToBounds = true
        thumpLabel.center.y = maxTrackSlider.center.y
        thumpLabel.isUserInteractionEnabled = true
        thumpLabel.addGestureRecognizer(panGesture)
        panGesture.addTarget(self, action: #selector(panThump(pan:)))
    }

    @objc private func panThump(pan: UIPanGestureRecognizer) {
        let translate: CGPoint = pan.translation(in: self)
        thumpLabel.frame.origin.x = maxTrackSlider.frame.origin.x
        thumpLabel.frame.origin.y = thumpLabel.frame.origin.y + translate.y
        pan.setTranslation(CGPoint.zero, in: self)
        if thumpLabel.center.y <= 0 {
            thumpLabel.center.y = maxTrackSlider.frame.origin.y
        }
        if thumpLabel.center.y >=  maxTrackSlider.frame.height {
            thumpLabel.center.y =  maxTrackSlider.frame.height
        }
        minTrackSlider.frame.origin.y = thumpLabel.center.y
        minTrackSlider.frame.size.height = maxTrackSlider.frame.size.height - thumpLabel.center.y
        value = Int((100 / maxTrackSlider.frame.height) * minTrackSlider.frame.height)
        thumpLabel.text = String(value)
        delegate?.mySlider(self, panTo: value)
    }
}

// MARK: - extension
extension MySliderView: Baitap02Delegate {
    func changeValueSlider(_ view: Baitap02ViewController, value: String) {
        if let val = Int(value), val <= 100 {
            thumpLabel.text = value
            print(maxTrackSlider.frame.size.height)
            thumpLabel.center.y = maxTrackSlider.frame.size.height - (CGFloat(val) / CGFloat(100.0)) * maxTrackSlider.frame.size.height
            minTrackSlider.frame.origin.y = thumpLabel.center.y
            minTrackSlider.frame.size.height = maxTrackSlider.frame.size.height - thumpLabel.center.y
        }
    }
}
