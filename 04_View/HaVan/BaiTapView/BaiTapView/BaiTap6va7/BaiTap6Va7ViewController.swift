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
    @IBOutlet private weak var tellImage: UIImageView!
    @IBOutlet private weak var tellLabel: UILabel!
    
    // MARK: - Propeties
    private var pinchGesture = UIPinchGestureRecognizer()
    private var rotationGesture = UIRotationGestureRecognizer()
    private var longPressGesture = UILongPressGestureRecognizer()
    private var singleTapGesture = UITapGestureRecognizer()
    private var doubleTapGesture = UITapGestureRecognizer()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tellLabel.isHidden = true
        tellImage.isHidden = true
        addBundleOfGesture()
    }
    
    // MARK: - Private functions
    @objc private func addPinchGesture(pinchGesture: UIPinchGestureRecognizer) {
        guard let pinchView = pinchGesture.view else {
return }
        if pinchGesture.state == .began || pinchGesture.state == .changed {
            let currentScale: CGFloat = pinchView.layer.value(forKeyPath: "transform.scale.x") as! CGFloat
            let minScale: CGFloat = 0.5
            let maxScale: CGFloat = 2.0
            let zoomSpeed: CGFloat = 0.5
            var deltaScale = pinchGesture.scale
            deltaScale = ((deltaScale - 1) * zoomSpeed) + 1
            deltaScale = min(deltaScale, maxScale / currentScale)
            deltaScale = max(deltaScale, minScale / currentScale)
            let zoomTransform = pinchView.transform.scaledBy(x: deltaScale, y: deltaScale)
            pinchGesture.view?.transform = zoomTransform
            pinchGesture.scale = 1
          }
    }
    
    @objc private func addRotationGesture(rotationGesture: UIRotationGestureRecognizer) {
        guard let viewRotation = rotationGesture.view else { return }
        if rotationGesture.state == .began || rotationGesture.state == .changed {
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
    
    @objc private func addTapGesture(tapGuesture: UITapGestureRecognizer) {
        guard tapGuesture.view != nil else { return }
        if tapGuesture.numberOfTapsRequired == 2 {
            UIView.animate(withDuration: 1.0) {
                self.tellImage.isHidden = false
                self.tellLabel.isHidden = false
                self.tellLabel.text = "tôi là panda"
            }
            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { (timer) in
                UIView.animate(withDuration: 1.0) {
                    self.tellImage.isHidden = true
                    self.tellLabel.isHidden = true
                }
            }
        } else {
            UIView.animate(withDuration: 1.0) {
                self.tellImage.isHidden = false
                self.tellLabel.isHidden = false
                self.tellLabel.text = "panda là tôi"
            }
            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { (timer) in
                UIView.animate(withDuration: 1.0) {
                    self.tellImage.isHidden = true
                    self.tellLabel.isHidden = true
                }
            }
        }
    }
    
    private func addBundleOfGesture() {
        pinchGesture.addTarget(self, action: #selector(addPinchGesture))
        rotationGesture.addTarget(self, action: #selector(addRotationGesture))
        longPressGesture.addTarget(self, action: #selector(addLongPressGesture))
        singleTapGesture.numberOfTapsRequired = 1
        singleTapGesture.addTarget(self, action: #selector(addTapGesture))
        doubleTapGesture.numberOfTapsRequired = 2
        doubleTapGesture.addTarget(self, action: #selector(addTapGesture))
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(pinchGesture)
        image.addGestureRecognizer(rotationGesture)
        image.addGestureRecognizer(longPressGesture)
        image.addGestureRecognizer(singleTapGesture)
        image.addGestureRecognizer(doubleTapGesture)
    }
}
