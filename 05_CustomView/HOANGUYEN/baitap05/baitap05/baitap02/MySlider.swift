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
    func mySlider(_ view: MySlider, needsPerform action: MySlider.Action)
}

final class MySlider: UIView {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var maxTrackSliderImage: UIImageView!
    @IBOutlet private weak var minTrackSliderImage: UIImageView!
    @IBOutlet private weak var thumpLabel: UILabel!
    
    //MARK: - Properties
    private var value: Int = 50
    var panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer()
    weak var delegate: MySliderDelegate?
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configThumpSlider()
    }
    
    // MARK: - Private functions
    private func configThumpSlider(){
        thumpLabel.text = String(value)
        minTrackSliderImage.contentMode = .bottom
        minTrackSliderImage.clipsToBounds = true
        thumpLabel.center.y = maxTrackSliderImage.center.y
        thumpLabel.isUserInteractionEnabled = true
        thumpLabel.addGestureRecognizer(panGesture)
        panGesture.addTarget(self, action: #selector(panThump(pan:)))
    }
    
    // MARK: - Public functions
    func changeValueSlider(value: String) {
        if let val = Int(value), val <= 100 {
            thumpLabel.text = value
            thumpLabel.center.y = maxTrackSliderImage.frame.size.height - (CGFloat(val) / CGFloat(100.0)) * maxTrackSliderImage.frame.size.height
            minTrackSliderImage.frame.origin.y = thumpLabel.center.y
            minTrackSliderImage.frame.size.height = maxTrackSliderImage.frame.size.height - thumpLabel.center.y
        }
    }
    
    // MARK: - Objc functions
    @objc private func panThump(pan: UIPanGestureRecognizer) {
        let translate: CGPoint = pan.translation(in: self)
        thumpLabel.frame.origin.x = maxTrackSliderImage.frame.origin.x
        thumpLabel.frame.origin.y = thumpLabel.frame.origin.y + translate.y
        pan.setTranslation(CGPoint.zero, in: self)
        if thumpLabel.center.y <= 0 {
            thumpLabel.center.y = maxTrackSliderImage.frame.origin.y
        }
        if thumpLabel.center.y >=  maxTrackSliderImage.frame.height {
            thumpLabel.center.y =  maxTrackSliderImage.frame.height
        }
        minTrackSliderImage.frame.origin.y = thumpLabel.center.y
        minTrackSliderImage.frame.size.height = maxTrackSliderImage.frame.size.height - thumpLabel.center.y
        value = Int((100 / maxTrackSliderImage.frame.height) * minTrackSliderImage.frame.height)
        thumpLabel.text = String(value)
        delegate?.mySlider(self, needsPerform: .dragThumb(value: value))
    }
}

extension MySlider {
    enum Action {
        case dragThumb(value: Int)
    }
}
