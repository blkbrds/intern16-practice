//
//  B6.swift
//  TAMNGUYEN
//
//  Created by PCI0001 on 7/2/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class B6: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var monkeyImage: UIImageView!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createGesture()
    }
    
    //MARK: - Private Methods
    private func createGesture() {
        let pinGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinch))
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotate))
        
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        
        monkeyImage.isUserInteractionEnabled = true
        monkeyImage.addGestureRecognizer(pinGesture)
        monkeyImage.addGestureRecognizer(rotateGesture)
        monkeyImage.addGestureRecognizer(longPressGesture)
    }
    
    @objc private func pinch(gestureRecognizer: UIPinchGestureRecognizer) {
        guard let viewPinch = gestureRecognizer.view, gestureRecognizer.scale <= 2 && gestureRecognizer.scale >= 0.5 else {
            return
        }
        viewPinch.transform = viewPinch.transform.scaledBy(x: gestureRecognizer.scale, y: gestureRecognizer.scale)
    }
    
    @objc private func rotate(gestureRecognizer : UIRotationGestureRecognizer) {
        guard gestureRecognizer.view != nil else { return }
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            gestureRecognizer.view?.transform = gestureRecognizer.view!.transform.rotated(by: gestureRecognizer.rotation)
            gestureRecognizer.rotation = 0
        }
    }
    
    @objc private func longPress(gestureRecognizer : UILongPressGestureRecognizer) {
        if let view =  gestureRecognizer.view {
            UIView.animate(withDuration: 1) {
                view.transform = CGAffineTransform(rotationAngle: 0)
            }
        }
    }
}
