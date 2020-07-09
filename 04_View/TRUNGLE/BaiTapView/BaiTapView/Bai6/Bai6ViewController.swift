//
//  Bai6ViewController.swift
//  BaiTapView
//
//  Created by Abcd on 7/1/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit
class Bai6ViewController: UIViewController {
    //MARK: - Outlet
    @IBOutlet weak var viewRotate: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let pinGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinch))
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotate))
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressHandler))
        viewRotate.isUserInteractionEnabled = true
        viewRotate.addGestureRecognizer(pinGesture)
        viewRotate.addGestureRecognizer(rotateGesture)
        viewRotate.addGestureRecognizer(longPressGesture)
    }
    //MARK: -Function
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
    @objc func longPressHandler ( gestureRecognizer : UILongPressGestureRecognizer) {
        if let view =  gestureRecognizer.view {
            UIView.animate(withDuration: 1) {
                view.transform = CGAffineTransform(rotationAngle: 0)
            }
        }
    }
}
