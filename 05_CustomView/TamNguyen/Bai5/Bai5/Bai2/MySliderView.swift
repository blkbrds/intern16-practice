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
    func view(view: MySliderView, percentAction action: MySliderView.action)
}

final class MySliderView: UIView {
 
    //MARK: IBOulet
    @IBOutlet weak var grayImageView: UIImageView!
    @IBOutlet weak var blueImageView: UIImageView!
    @IBOutlet weak var percentLabel: UILabel!
    
    enum action {
        case updadePercent(percent: Int)
    }
    
    weak var delegate: MySliderViewDelegate?
    var value: Int?
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
          super.awakeFromNib()
        }
    
    //MARK: - Override
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        let touch = touches.first
        guard let location = touch?.location(in: grayImageView) else {
            return
        }
        if location.y < grayImageView.bounds.minY {
            percentLabel.center.y = grayImageView.bounds.minY
        } else if location.y > grayImageView.bounds.maxY {
            percentLabel.center.y = grayImageView.bounds.maxY
        } else {
            percentLabel.center.y = location.y
        }
        blueImageView.frame = CGRect(x: blueImageView.frame.origin.x, y: percentLabel.center.y, width: blueImageView.frame.width, height: grayImageView.frame.height - percentLabel.center.y)
        
        let number = Int(blueImageView.frame.height / grayImageView.frame.height) * 100
        percentLabel.text = String(number)
        delegate?.view(view: self, percentAction: .updadePercent(percent: number))
    }
    
    func updatePercent() {
        guard let temp = value else {
            return
        }
        let newHeight = (grayImageView.frame.height * CGFloat(temp)) / 100
        let newY = grayImageView.frame.height - newHeight
        blueImageView.frame = CGRect(x: blueImageView.frame.origin.x, y: newY, width: blueImageView.frame.width, height: newHeight)
    }
}
       
