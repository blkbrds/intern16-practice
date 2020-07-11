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
    func mySlider(_ view: MySlider, action: MySlider.Action )
}

class MySlider: UIView {
    
    // MARK: - IBOutlet
    @IBOutlet weak private var maxTrackSliderView: UIImageView!
    @IBOutlet weak private var minTrackSliderView: UIImageView!
    @IBOutlet weak private var thumpLabel: UILabel!
    
    //MARK: - Properties
    enum Action {
        case dragThumb(value: Int)
    }
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
        minTrackSliderView.contentMode = .bottom
        minTrackSliderView.clipsToBounds = true
        thumpLabel.center.y = maxTrackSliderView.center.y
        thumpLabel.isUserInteractionEnabled = true
        thumpLabel.addGestureRecognizer(panGesture)
        panGesture.addTarget(self, action: #selector(panThump(pan:)))
    }
    
    @objc private func panThump(pan: UIPanGestureRecognizer) {
        let translate: CGPoint = pan.translation(in: self)
        thumpLabel.frame.origin.x = maxTrackSliderView.frame.origin.x
        thumpLabel.frame.origin.y = thumpLabel.frame.origin.y + translate.y
        pan.setTranslation(CGPoint.zero, in: self)
        if thumpLabel.center.y <= 0 {
            thumpLabel.center.y = maxTrackSliderView.frame.origin.y
        }
        if thumpLabel.center.y >=  maxTrackSliderView.frame.height {
            thumpLabel.center.y =  maxTrackSliderView.frame.height
        }
        minTrackSliderView.frame.origin.y = thumpLabel.center.y
        minTrackSliderView.frame.size.height = maxTrackSliderView.frame.size.height - thumpLabel.center.y
        value = Int((100 / maxTrackSliderView.frame.height) * minTrackSliderView.frame.height)
        thumpLabel.text = String(value)
        delegate?.mySlider(self, panTo: value)
    }
}

// MARK: - extension
extension MySlider {
    func changeValueSlider(value: String) {
        if let val = Int(value), val <= 100 {
            thumpLabel.text = value
            thumpLabel.center.y = maxTrackSliderView.frame.size.height - (CGFloat(val) / CGFloat(100.0)) * maxTrackSliderView.frame.size.height
            minTrackSliderView.frame.origin.y = thumpLabel.center.y
            minTrackSliderView.frame.size.height = maxTrackSliderView.frame.size.height - thumpLabel.center.y
        }
    }
}
