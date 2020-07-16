//
//  MySliderView.swift
//  Bai5.1
//
//  Created by Trung Le D. on 7/6/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

// MARK: - Protocol
protocol MySliderViewDelegate: class {
    func view(view: MySliderView, needPerformAction action: MySliderView.Action)
}
final class MySliderView: UIView {
    // MARK: - Outlets
    @IBOutlet weak private var blue: UIImageView!
    @IBOutlet weak private var nut: UILabel!
    @IBOutlet weak private var white: UIImageView!
    enum Action {
        case updatePercent(percent: Int)
    }
    //MARK: - Properties
    weak var delegate: MySliderViewDelegate?
    var value: Int?
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    // MARK: - Override
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        let touch = touches.first
        guard let location = touch?.location(in: white) else { return }
        if location.y < white.bounds.minY {
            nut.center.y = white.bounds.minY
        } else if location.y > white.bounds.maxY {
            nut.center.y = white.bounds.maxY
        } else {
            nut.center.y = location.y
        }
        blue.frame = CGRect(x: blue.frame.origin.x, y: nut.center.y, width: blue.frame.width, height: white.frame.height - nut.center.y)
        let number = Int((blue.frame.height / white.frame.height) * 100)
        nut.text = String(number)
        delegate?.view(view: self, needPerformAction: .updatePercent(percent: number))
    }
    func updatePercent() {
        guard let temp = value else { return }
        let newHeight = (white.frame.height * CGFloat(temp)) / 100
        let newY = white.frame.height - newHeight
        blue.frame = CGRect(x: blue.frame.origin.x, y: newY, width: blue.frame.width, height: newHeight)
        nut.center.y = newY
        nut.text = String(temp)
    }
}
