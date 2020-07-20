//
//  MySliderView.swift
//  Bai5
//
//  Created by PCI0001 on 7/6/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

//MARK: - Protocol
protocol MySliderViewDelegate: class {
    func view(view: MySliderView, needPerform action: MySliderView.Action)
}

final class MySliderView: UIView {
    
    //MARK: IBOulet
    @IBOutlet private weak var grayImageView: UIImageView!
    @IBOutlet private weak var blueImageView: UIImageView!
    @IBOutlet private weak var percentLabel: UILabel!
    
    enum Action {
        case updatePercent(percent: Int)
    }
    
    //  MARK: - Properties
    weak var delegate: MySliderViewDelegate?
    var value: Int?
    
    // MARK: - Override
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        let touchMoved = touches.first
        guard let location = touchMoved?.location(in: grayImageView) else { return }
        if location.y < grayImageView.bounds.minY {
            percentLabel.center.y = grayImageView.bounds.minY
        } else if location.y > grayImageView.bounds.maxY {
            percentLabel.center.y = grayImageView.bounds.maxY
        } else {
            percentLabel.center.y = location.y
        }
        blueImageView.frame = CGRect(x: blueImageView.frame.origin.x, y: percentLabel.center.y, width: blueImageView.frame.width, height: grayImageView.frame.height - percentLabel.center.y)
        
        let numberThumb = Int((blueImageView.frame.height / grayImageView.frame.height) * 100)
        percentLabel.text = String(numberThumb)
        delegate?.view(view: self, needPerform: .updatePercent(percent: numberThumb))
    }
    
    func updatePercent() {
        guard let tempValue = value else { return }
        let newHeight = (grayImageView.frame.height * CGFloat(tempValue)) / 100
        let newY = grayImageView.frame.height - newHeight
        blueImageView.frame = CGRect(x: blueImageView.frame.origin.x, y: newY, width: blueImageView.frame.width, height: newHeight)
        percentLabel.center.y = newY
        percentLabel.text = String(tempValue)
    }
}
