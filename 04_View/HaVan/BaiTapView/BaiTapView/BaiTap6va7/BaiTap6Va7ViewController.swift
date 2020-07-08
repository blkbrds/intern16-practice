//
//  BaiTap6Va7ViewController.swift
//  BaiTapView
//
//  Created by NganHa on 7/2/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap6Va7ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var image: UIImageView!
    // MARK: - Propeties
    private var pinchGesture = UIPinchGestureRecognizer()
    private var rotationGesture = UIRotationGestureRecognizer()
    private var longPressGesture = UILongPressGestureRecognizer()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addBundleOfGesture()
    }
    
    // MARK: - Private functions
    @objc  func addPinchGesture(pinchGesture: UIPinchGestureRecognizer) {
        guard let viewPinch = pinchGesture.view else { return }
        if pinchGesture.scale >= 2 {
            //            viewPinch.transform = CGAffineTransform(scaleX: 2.0 , y: 2.0)
            viewPinch.transform = viewPinch.transform.scaledBy(x: 2.0, y: 2.0)
        } else if pinchGesture.scale <= 0.5 {
            //            viewPinch.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            viewPinch.transform = viewPinch.transform.scaledBy(x: 0.5, y: 0.5)
        } else {
            //            viewPinch.transform = CGAffineTransform(scaleX: pinchGesture.scale, y: pinchGesture.scale)
            viewPinch.transform = viewPinch.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale)
        }
        pinchGesture.scale = 1.0
        
    }
    
    @objc private func addRotationGesture(rotationGesture: UIRotationGestureRecognizer) {
        guard let viewRotation = rotationGesture.view else { return }
        if rotationGesture.state == .began || rotationGesture.state == .changed {
            //            viewRotation.transform = CGAffineTransform(rotationAngle: rotationGesture.rotation + rotationState)
            //            rotationState = rotationGesture.rotation
            viewRotation.transform = viewRotation.transform.rotated(by: rotationGesture.rotation)
            rotationGesture.rotation = 0
        }
    }
    
    @objc private func addLongPressGesture(longPressGesture: UILongPressGestureRecognizer) {
        if let viewLongPress = longPressGesture.view {
        longPressGesture.minimumPressDuration = 5.0
                UIView.animate(withDuration: 1.0) {
                    viewLongPress.transform = CGAffineTransform(rotationAngle: 0.0)
            }
        }
        
    }
    
    private func addBundleOfGesture() {
        pinchGesture.addTarget(self, action: #selector(addPinchGesture))
        rotationGesture.addTarget(self, action: #selector(addRotationGesture))
        longPressGesture.addTarget(self, action: #selector(addLongPressGesture))
        
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(pinchGesture)
        image.addGestureRecognizer(rotationGesture)
        image.addGestureRecognizer(longPressGesture)
        
    }
    
    // MARK: - Public functions
    // MARK: - IBActions
    
}

extension BaiTap6Va7ViewController: UIGestureRecognizerDelegate {
    
}
