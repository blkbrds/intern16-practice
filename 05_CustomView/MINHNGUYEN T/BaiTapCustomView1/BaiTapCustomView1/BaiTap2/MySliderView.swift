//
//  BaiTap4ViewController.swift
//  BaiTapCustomView1
//
//  Created by MacBook Pro on 7/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

// MARK: - Protocol
protocol MySliderViewDelegate: class {
    func view(_ view: MySliderView, needsPerform action: MySliderView.Action)
}

final class MySliderView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var blueImageView: UIImageView!
    @IBOutlet private weak var whiteImageView: UIImageView!
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var thumbView: UIView!

    // MARK: - Properties
    weak var delegate: MySliderViewDelegate?
    var valueSlider: Int?

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Override funtions
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: whiteImageView)
        guard let position = location else { return }
        if position.y < whiteImageView.bounds.minY {
            thumbView.center.y = whiteImageView.bounds.minY
        } else if position.y > whiteImageView.bounds.maxY {
            thumbView.center.y = whiteImageView.bounds.maxY
        } else {
            thumbView.center.y = position.y
        }
        blueImageView.frame = CGRect(x: blueImageView.frame.origin.x, y: thumbView.center.y, width: blueImageView.frame.width, height: whiteImageView.frame.height - thumbView.center.y)
        let number = Int((blueImageView.frame.height / whiteImageView.frame.height) * 100)
        valueLabel.text = String(number)
        delegate?.view(self, needsPerform: .changeValueSlider(valueSlide: number))
    }
    
    // MARK: - Public funtions
    func setSliderView() {
        guard let num = valueSlider else { return }
        let newHeight = (whiteImageView.bounds.height * CGFloat(num)) / 100
        let newY = whiteImageView.bounds.height - newHeight
        blueImageView.frame = CGRect(x: blueImageView.frame.origin.x, y: newY, width: blueImageView.frame.width, height: newHeight)
        thumbView.center.y = newY
        valueLabel.text = String(num)
    }
}

// MARK: - Config 
extension MySliderView {
    enum Action {
        case changeValueSlider(valueSlide: Int)
    }
}
