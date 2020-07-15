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
    func view(view: MySliderView, needPerformAction action: MySliderView.Action)
}

final class MySliderView: UIView {
    
    //MARK: IBOulet
    @IBOutlet private weak var grayViewImage: UIImageView!
    @IBOutlet private weak var blueViewImage: UIImageView!
    @IBOutlet private weak var percentLabel: UILabel!
    
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
        let touchMoved = touches.first
        guard let location = touchMoved?.location(in: grayViewImage) else { return }
        if location.y < grayViewImage.bounds.minY {
            percentLabel.center.y = grayViewImage.bounds.minY
        } else if location.y > grayViewImage.bounds.maxY {
            percentLabel.center.y = grayViewImage.bounds.maxY
        } else {
            percentLabel.center.y = location.y
        }
        blueViewImage.frame = CGRect(x: blueViewImage.frame.origin.x, y: percentLabel.center.y, width: blueViewImage.frame.width, height: grayViewImage.frame.height - percentLabel.center.y)
        
        let numberThumb = Int((blueViewImage.frame.height / grayViewImage.frame.height) * 100)
        percentLabel.text = String(numberThumb)
        delegate?.view(view: self, needPerformAction: .updatePercent(percent: numberThumb))
    }
    
    func updatePercent() {
        guard let tempValue = value else { return }
        let newHeight = (grayViewImage.frame.height * CGFloat(tempValue)) / 100
        let newY = grayViewImage.frame.height - newHeight
        blueViewImage.frame = CGRect(x: blueViewImage.frame.origin.x, y: newY, width: blueViewImage.frame.width, height: newHeight)
        percentLabel.center.y = newY
        percentLabel.text = String(tempValue)
    }
}
