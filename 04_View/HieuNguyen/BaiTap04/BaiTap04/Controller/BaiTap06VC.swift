//
//  BaiTap06VC.swift
//  BaiTap04
//
//  Created by hieungq on 6/29/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class BaiTap06VC: UIViewController {

    var imageViewScale: CGFloat = 1.0
    let maxScale: CGFloat = 2.0
    let minScale: CGFloat = 0.5
    @IBOutlet weak var monkeyImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        monkeyImage.isUserInteractionEnabled = true

        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture))
        monkeyImage.addGestureRecognizer(pinchGesture)
        let rotatedGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotatedGesture))
        monkeyImage.addGestureRecognizer(rotatedGesture)
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressedGesture))
        longPressRecognizer.minimumPressDuration = 2
        monkeyImage.addGestureRecognizer(longPressRecognizer)


    }

    @objc func handlePinchGesture(recognizer: UIPinchGestureRecognizer) {
        if recognizer.state == .began || recognizer.state == .changed {
            let pinchScale: CGFloat = recognizer.scale

            if imageViewScale * pinchScale < maxScale && imageViewScale * pinchScale > minScale {
                imageViewScale *= pinchScale
                monkeyImage.transform = (monkeyImage.transform.scaledBy(x: pinchScale, y: pinchScale))
            }
            recognizer.scale = 1.0
        }
    }
    @objc func handleRotatedGesture(recognizer: UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
    }
    @objc func handleLongPressedGesture(recognizer: UILongPressGestureRecognizer){
        monkeyImage.transform = CGAffineTransform.identity
    }
}
