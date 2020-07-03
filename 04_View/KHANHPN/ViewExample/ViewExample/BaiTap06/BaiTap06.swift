//
//  BaiTap06.swift
//  ViewExample
//
//  Created by PCI0007 on 7/2/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

class BaiTap06: UIViewController {

    var pinchGesture = UIPinchGestureRecognizer()
    var rotationGesture = UIRotationGestureRecognizer()
    var longPressGesture = UILongPressGestureRecognizer()
    var imageViewScale: CGFloat = 1.0
    let maxScale: CGFloat = 2.0
    let minScale: CGFloat = 0.5

    // MARK: - Outlets

    @IBOutlet weak var imageView: UIImageView!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Pinch
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pincheGestureHandler))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(pinchGesture)

        // Rotation
        rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(self.rotationGestureHandler))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(rotationGesture)

        // Long press
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressGestureHandler))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(longPressGesture)

    }



    // MARK: - Functions
    @objc func pincheGestureHandler(recognizer: UIPinchGestureRecognizer) {
        if recognizer.state == .began || recognizer.state == .changed {
            let pinchScale: CGFloat = recognizer.scale

            if imageViewScale * pinchScale < maxScale && imageViewScale * pinchScale > minScale {
                imageViewScale *= pinchScale
                imageView.transform = (imageView.transform.scaledBy(x: pinchScale, y: pinchScale))
            }
            recognizer.scale = 1.0
        }
    }

    @objc func rotationGestureHandler(recognizer: UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
    }

    @objc func longPressGestureHandler(recognizer: UIPinchGestureRecognizer) {
        imageView.transform = CGAffineTransform.identity
    }

    // MARK: - Test



}
