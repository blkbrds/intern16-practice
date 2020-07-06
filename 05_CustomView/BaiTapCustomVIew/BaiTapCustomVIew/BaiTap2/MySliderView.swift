//
//  MySliderView.swift
//  BaiTapCustomVIew
//
//  Created by NganHa on 7/5/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

protocol ProcessValue : class {
    func sendValue(with num: Float)
}

final class MySliderView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var processView: UIImageView!
    @IBOutlet private weak var thumpView: UIView!
    @IBOutlet private weak var processValue: UILabel!
    @IBOutlet weak var whiteView: UIImageView!
    
    // MARK: - Propeties
    var processNum: Float?
    weak var delegate: ProcessValue?
    // MARK: - Life cycle
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: - Private functions
    private func changeProcessView(with y: CGFloat) {
        
        let preciousY = processView.frame.origin.y
        let height = processView.bounds.height
        processView.frame = CGRect(x: processView.frame.origin.x , y: y, width: processView.frame.width, height: height + (preciousY - y))
        print("height: \(processView.frame.height)")
        let number =  ( processView.frame.height / whiteView.frame.height) * 100
        processValue.text = String(format: "%.0f", number)
        delegate?.sendValue(with: Float(number) )
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: whiteView)
        
        if location!.y < whiteView.bounds.minY {
            thumpView.center.y = whiteView.bounds.minY
        } else if location!.y > whiteView.bounds.maxY {
            thumpView.center.y = whiteView.bounds.maxY
        } else {
            thumpView.center.y = location!.y
        }
        changeProcessView(with: thumpView.center.y)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: whiteView)
        if location!.y < whiteView.bounds.minY {
            thumpView.center.y = whiteView.bounds.minY
        } else if location!.y > whiteView.bounds.maxY {
            thumpView.center.y = whiteView.bounds.maxY
        } else {
            thumpView.center.y = location!.y
        }
        print(thumpView.center.y)
        print(whiteView.bounds.minY)
        changeProcessView(with: thumpView.center.y)
    }
    //MARK: -Public functions
    func setViewAndProcess() {
        guard let num = processNum else { return }
        let newHeight = (whiteView.bounds.height * CGFloat(num)) / 100
        let newY = whiteView.bounds.height - newHeight
        processView.frame = CGRect(x: processView.frame.origin.x, y: newY, width: processView.frame.width, height: newHeight)
        thumpView.center.y = newY
        processValue.text = String(format: "%.0f", num)
    }
    
    
    
}
