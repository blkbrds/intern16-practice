//
//  BaiTap06.swift
//  ViewExample
//
//  Created by PCI0007 on 7/2/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class BaiTap06: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - Properties
    private var pinchGesture = UIPinchGestureRecognizer()
    private var rotationGesture = UIRotationGestureRecognizer()
    private var longPressGesture = UILongPressGestureRecognizer()
    private var imageViewScale: CGFloat = 1.0
    private let maxScale: CGFloat = 2.0
    private let minScale: CGFloat = 0.5
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configGestureRecognizer()
    }
    
    // MARK: - Private Methods
    private func configGestureRecognizer() {
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
    
    // MARK: - Action
    @objc private func pincheGestureHandler(recognizer: UIPinchGestureRecognizer) {
        if recognizer.state == .began || recognizer.state == .changed {
            let pinchScale: CGFloat = recognizer.scale
            
            if imageViewScale * pinchScale < maxScale && imageViewScale * pinchScale > minScale {
                imageViewScale *= pinchScale
                imageView.transform = (imageView.transform.scaledBy(x: pinchScale, y: pinchScale))
            }
            recognizer.scale = 1.0
        }
    }
    
    @objc private func rotationGestureHandler(recognizer: UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
    }
    
    @objc private func longPressGestureHandler(recognizer: UIPinchGestureRecognizer) {
        imageView.transform = CGAffineTransform.identity
    }
}
