//
//  MySliderView.swift
//  Bai5
//
//  Created by PCI0001 on 7/6/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

protocol SliderViewDelegate: class {
    func sliderView(_ sliderView: MySliderView , didSelect index: Int)
}
class MySliderView: UIView {
    
    @IBOutlet weak var grayImageView: UIImageView!
    @IBOutlet weak var blueImageView: UIImageView!
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var valueLabel: UILabel!
    
    weak var delegate: SliderViewDelegate?
    
        override func awakeFromNib() {
          super.awakeFromNib()
        }
    
        // MARK: - Override Functions
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            if let touch = touches.first {
                let position = touch.location(in: blueImageView)
                if position.y <= blueImageView.frame.maxY && position.y >= blueImageView.frame.minY {
                    sliderView.center = CGPoint(x: blueImageView.center.x, y: position.y)
                    grayImageView.frame = CGRect(x: blueImageView.frame.origin.x, y: blueImageView.frame.origin.y, width: grayImageView.frame.width, height: position.y - blueImageView.frame.origin.y)
                    let percentage = 100 * (1 - (grayImageView.frame.height / blueImageView.frame.height))
                    valueLabel.text = "\(Int(percentage))"
                    delegate?.sliderView(self, didSelect: Int(percentage))
                }
            }
        }
    }
    
