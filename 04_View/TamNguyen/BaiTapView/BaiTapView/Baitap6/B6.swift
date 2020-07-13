//
//  B6.swift
//  TAMNGUYEN
//
//  Created by PCI0001 on 7/2/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai6ViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet private weak var monkeyImageView: UIImageView!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createGesture()
    }
    
    //MARK: - Private Method
    private func createGesture() {
        let pinGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinch))
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotate))
        
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        
        monkeyImageView.isUserInteractionEnabled = true
        monkeyImageView.addGestureRecognizer(pinGesture)
        monkeyImageView.addGestureRecognizer(rotateGesture)
        monkeyImageView.addGestureRecognizer(longPressGesture)
    }
    
    @objc private func pinch(gestureRecognizer :UIPinchGestureRecognizer) {
        guard let viewPinch = gestureRecognizer.view, gestureRecognizer.scale <= 2 && gestureRecognizer.scale >= 0.5 else {
            return
        }
        viewPinch.transform = viewPinch.transform.scaledBy(x: gestureRecognizer.scale, y: gestureRecognizer.scale)
    }
    
    @objc private func rotate(gestureRecognizer :UIRotationGestureRecognizer) {
        guard let viewRotate = gestureRecognizer.view else { return }
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            viewRotate.transform = viewRotate.transform.rotated(by: gestureRecognizer.rotation)
            gestureRecognizer.rotation = 0
        }
    }
    
    @objc private func longPress(gestureRecognizer :UILongPressGestureRecognizer) {
        if let viewLongPress = gestureRecognizer.view {
            UIView.animate(withDuration: 1) {
                viewLongPress.transform = CGAffineTransform(rotationAngle: 0)
            }
        }
    }
}
