//
//  baitap06ViewController.swift
//  baitap04
//
//  Created by NXH on 6/30/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class Baitap06ViewController: UIViewController {
    
//    MARK: - IBOutlet
    @IBOutlet weak private var smsView: UIView!
    @IBOutlet weak private var smsLabel: UILabel!
    @IBOutlet weak private var smsImageView: UIImageView!
    @IBOutlet weak private var mainImageView: UIImageView!
// MARK: - Properties
    let rotationGesture: UIRotationGestureRecognizer = UIRotationGestureRecognizer()
    var recognizerScale: CGFloat = 1.0
// MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        smsView.alpha = 0
        mainImageView.isUserInteractionEnabled = true
        configGesture()
    }
//  MARK: - Private function
    @objc private func zoomImage(pinch: UIPinchGestureRecognizer) {
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

    @objc private func rotationImage(rotation: UIRotationGestureRecognizer) {
        rotation.view!.transform = rotation.view!.transform.rotated(by: rotation.rotation)
          rotation.rotation = 0
    }
    @objc private func longPressToDefault(longPress: UILongPressGestureRecognizer) {
        longPress.minimumPressDuration = 5.0
        rotationGesture.view?.transform = CGAffineTransform(rotationAngle: 0)
    }
    
    @objc private func tapGestureImage(tap: UITapGestureRecognizer) {
        if tap.numberOfTapsRequired == 2 {
            smsLabel.text = "Hoá là tôi!"
        }
        else {
            smsLabel.text = "Tôi là Hoá!"
        }
        if self.smsView.alpha == 0 {
            
            UIView.transition(with: smsView, duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: {
                                self.smsView.alpha = 1
                                self.view.layoutIfNeeded()
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                UIView.transition(with: self.smsView, duration: 1,
                                  options: .transitionCrossDissolve,
                                  animations: {
                                    self.smsView.alpha = 0
                                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    private func configGesture() {
        let pinchGesture: UIPinchGestureRecognizer = UIPinchGestureRecognizer()
        let longGesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer()
        let tapGesture1: UITapGestureRecognizer = UITapGestureRecognizer()
        let tapGesture2: UITapGestureRecognizer = UITapGestureRecognizer()
        mainImageView.addGestureRecognizer(tapGesture1)
        mainImageView.addGestureRecognizer(tapGesture2)
        mainImageView.addGestureRecognizer(longGesture)
        mainImageView.addGestureRecognizer(pinchGesture)
        mainImageView.addGestureRecognizer(rotationGesture)
        tapGesture1.numberOfTapsRequired = 1
        tapGesture1.addTarget(self, action: #selector(tapGestureImage(tap:)))
        tapGesture2.numberOfTapsRequired = 2
        tapGesture2.addTarget(self, action: #selector(tapGestureImage(tap:)))
        pinchGesture.addTarget(self, action: #selector(zoomImage(pinch:)))
        rotationGesture.addTarget(self, action: #selector(rotationImage(rotation:)))
        longGesture.addTarget(self, action: #selector(longPressToDefault(longPress:)))
    }
}
