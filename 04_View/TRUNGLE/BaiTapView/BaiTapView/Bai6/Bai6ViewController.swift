//
//  Bai6ViewController.swift
//  BaiTapView
//
//  Created by Abcd on 7/1/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class Bai6ViewController: UIViewController {
    
    
    @IBOutlet weak var viewRotate: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pinGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinch))
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotate))
        
        let panGesture = UIPanGestureRecognizer (target: self, action: #selector(pan))
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(long))
        viewRotate.isUserInteractionEnabled = true
        viewRotate.addGestureRecognizer(pinGesture)
        viewRotate.addGestureRecognizer(rotateGesture)
        viewRotate.addGestureRecognizer(panGesture)
        viewRotate.addGestureRecognizer(longPressGesture)
    }
    
    @objc func pinch ( gestureRecognizer: UIPinchGestureRecognizer) {
        guard let viewPinch = gestureRecognizer.view, gestureRecognizer.scale <= 2 && gestureRecognizer.scale >= 0.5 else {
            return
        }
        viewPinch.transform = viewPinch.transform.scaledBy(x: gestureRecognizer.scale, y: gestureRecognizer.scale)
    }   
    @objc func rotate ( gestureRecognizer : UIRotationGestureRecognizer) {
        guard gestureRecognizer.view != nil else { return }
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            gestureRecognizer.view?.transform = gestureRecognizer.view!.transform.rotated(by: gestureRecognizer.rotation)
            gestureRecognizer.rotation = 0
        }
    }
    var initialCenter = CGPoint()
    @objc func pan ( gestureRecognizer : UIPanGestureRecognizer) {
        
        guard gestureRecognizer.view != nil else {return}
        let piece = gestureRecognizer.view!
        // Get the changes in the X and Y directions relative to
        // the superview's coordinate space.
        let translation = gestureRecognizer.translation(in: piece.superview)
        if gestureRecognizer.state == .began {
            // Save the view's original position.
            self.initialCenter = piece.center
        }
        // Update the position for the .began, .changed, and .ended states
        if gestureRecognizer.state != .cancelled {
            // Add the X and Y translation to the view's original position.
            let newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
            piece.center = newCenter
        }
        else {
            // On cancellation, return the piece to its original location.
            piece.center = initialCenter
        }
    }
    @objc func long ( gestureRecognizer : UILongPressGestureRecognizer) {
        if let view =  gestureRecognizer.view {
            UIView.animate(withDuration: 1) {
                view.transform = CGAffineTransform(rotationAngle: 0)
            }
        }
        
        
    }
    
}
