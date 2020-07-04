//
//  baitap06ViewController.swift
//  baitap04
//
//  Created by NXH on 6/30/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class baitap06ViewController: UIViewController {
    @IBOutlet weak var smsUIView: UIView!
    
    @IBOutlet weak var smsLabel: UILabel!
    @IBOutlet weak var smsImage: UIImageView!
    @IBOutlet weak var outletImage: UIImageView!
    let pinchGesture: UIPinchGestureRecognizer = UIPinchGestureRecognizer()
    let rotationGesture: UIRotationGestureRecognizer = UIRotationGestureRecognizer()
    let longGesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer()
    let tapGesture1: UITapGestureRecognizer = UITapGestureRecognizer()
    let tapGesture2: UITapGestureRecognizer = UITapGestureRecognizer()
    var recognizerScale: CGFloat = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        smsUIView.alpha = 0
        outletImage.isUserInteractionEnabled = true
        configGesture()
    }
    
    @objc func zoomImage(pinch: UIPinchGestureRecognizer) {
        if recognizerScale < 2.0 && pinch.scale > 1.0 {
               pinch.view?.transform = (pinch.view?.transform.scaledBy(x: pinch.scale, y: pinch.scale))!
               recognizerScale *= pinch.scale
               pinch.scale = 1.0
             }
        if recognizerScale > 0.5 && pinch.scale < 1.0 {
               pinch.view?.transform = (pinch.view?.transform.scaledBy(x: pinch.scale, y: pinch.scale))!
               recognizerScale *= pinch.scale
               pinch.scale = 1.0
             }
    }
    
//    bug bug bug
    @objc func rotationImage(rotation: UIRotationGestureRecognizer) {
        rotation.view!.transform = rotation.view!.transform.rotated(by: rotation.rotation)
          rotation.rotation = 0
    }
    @objc func longPressToDefault(longPress: UILongPressGestureRecognizer) {
        longPress.minimumPressDuration = 5.0
        rotationGesture.view?.transform = CGAffineTransform(rotationAngle: 0)
    }
    
    @objc func tapGestureImage(tap: UITapGestureRecognizer) {
        if tap.numberOfTapsRequired == 2 {
            smsLabel.text = "Hoá là tôi!"
        }
        else {
            smsLabel.text = "Tôi là Hoá!"
        }
        if self.smsUIView.alpha == 0 {
            
            UIView.transition(with: smsUIView, duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: {
                                self.smsUIView.alpha = 1
                                self.view.layoutIfNeeded()
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                UIView.transition(with: self.smsUIView, duration: 1,
                                  options: .transitionCrossDissolve,
                                  animations: {
                                    self.smsUIView.alpha = 0
                                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    func configGesture() {
        outletImage.addGestureRecognizer(tapGesture1)
        outletImage.addGestureRecognizer(tapGesture2)
        outletImage.addGestureRecognizer(longGesture)
        outletImage.addGestureRecognizer(pinchGesture)
        outletImage.addGestureRecognizer(rotationGesture)
        tapGesture1.numberOfTapsRequired = 1
        tapGesture1.addTarget(self, action: #selector(tapGestureImage(tap:)))
        tapGesture2.numberOfTapsRequired = 2
        tapGesture2.addTarget(self, action: #selector(tapGestureImage(tap:)))
        pinchGesture.addTarget(self, action: #selector(zoomImage(pinch:)))
        rotationGesture.addTarget(self, action: #selector(rotationImage(rotation:)))
        longGesture.addTarget(self, action: #selector(longPressToDefault(longPress:)))
    }
    
}
