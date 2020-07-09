//
//  baitap05ViewController.swift
//  baitap04
//
//  Created by NXH on 7/1/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class Baitap05ViewController: UIViewController {
    @IBOutlet weak var parentsView: UIView!
    @IBOutlet weak var minTrackSliderView: UIView!
    @IBOutlet weak var thumpValueSliderView: UILabel!
    @IBOutlet weak var thumpSliderView: UIView!
    @IBOutlet weak var maxTrackSliderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFisrtUI()
        addGesture()
    }
    
    final func setFisrtUI(){
        thumpSliderView.isUserInteractionEnabled = true
        minTrackSliderView.layer.borderWidth = 1
        maxTrackSliderView.layer.borderWidth = 1
        thumpSliderView.layer.cornerRadius = thumpSliderView.bounds.width / 2
        thumpSliderView.layer.borderWidth = 1
    }
    
    final func addGesture() {
        let panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer()
        thumpSliderView.addGestureRecognizer(panGesture)
        panGesture.addTarget(self, action: #selector(actionPanGesture(pan:)))
    }

    @objc final func actionPanGesture(pan: UIPanGestureRecognizer) {
        let translate: CGPoint = pan.translation(in: parentsView)
        thumpSliderView.frame.origin.x = 0
        thumpSliderView.frame.origin.y += translate.y
        pan.setTranslation(CGPoint.zero, in: parentsView)
        if thumpSliderView.center.y <= maxTrackSliderView.frame.origin.y {
            thumpSliderView.center.y = maxTrackSliderView.frame.origin.y
        }
        if thumpSliderView.center.y >=  maxTrackSliderView.frame.height + thumpSliderView.frame.height / 2 {
            thumpSliderView.frame.origin.y =  maxTrackSliderView.frame.height
        }
        minTrackSliderView.frame.origin.y = thumpSliderView.center.y
        minTrackSliderView.frame.size = CGSize(width: minTrackSliderView.frame.width, height: maxTrackSliderView.frame.height - thumpSliderView.center.y + thumpSliderView.frame.height / 2)
        thumpValueSliderView.text = String(Int(maxTrackSliderView.frame.height - thumpSliderView.center.y + thumpSliderView.bounds.height / 2))
    }
}
