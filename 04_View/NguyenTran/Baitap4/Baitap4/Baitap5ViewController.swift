//
//  Baitap5ViewController.swift
//  Baitap4
//
//  Created by MBA0245P on 7/5/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap5ViewController: UIViewController {

    @IBOutlet weak var maxSlider: UIView!

    @IBOutlet weak var minSlider: UIView!

    @IBOutlet weak var thumbButtonView: UIView!

    @IBOutlet weak var thumbButtonLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        thumbButtonView.addSubview(thumbButtonLabel)
        thumbButtonLabel.text = "50"

        maxSlider.addSubview(minSlider)
        maxSlider.addSubview(thumbButtonView)
        
        let panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(customSlider))
        thumbButtonView.addGestureRecognizer(panGesture)
        thumbButtonView.layer.cornerRadius = thumbButtonView.frame.height / 2
        thumbButtonView.isUserInteractionEnabled = true
    }

    @objc func customSlider(sender: UIPanGestureRecognizer) {
        let thumbHeight = thumbButtonView.frame.height
        let maxHeight = maxSlider.frame.height

        let translate = sender.translation(in: maxSlider)
        sender.view?.center = CGPoint(x: maxSlider.frame.width / 2, y: (sender.view?.center.y)! + translate.y)
        sender.setTranslation(CGPoint.zero, in: maxSlider)
        
        if thumbButtonView.center.y <= 0 {
            thumbButtonView.center.y = 0
        }
        if thumbButtonView.center.y >= maxHeight {
            thumbButtonView.center.y = maxHeight
        }
        minSlider.frame.origin.y = thumbButtonView.center.y

        if minSlider.frame.origin.y >= maxHeight {
            minSlider.frame.size = CGSize(width: minSlider.frame.width, height: 0)
        } else {
            minSlider.frame.size = CGSize(width: minSlider.frame.width, height: maxSlider.frame.height - thumbButtonView.center.y)
        }
        let percentage: Float = Float(maxHeight - thumbButtonView.center.y + thumbHeight / 2) / Float(maxHeight)
        thumbButtonLabel.text = "\(Int(percentage * 100) - 6)"
    }
}


