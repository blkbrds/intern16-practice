//
//  BaiTap6ViewController.swift
//  BaiTapView
//
//  Created by MacBook Pro on 7/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap6ViewController: UIViewController {

    //MARK: - IBOulets
    @IBOutlet weak private var thongbaoLabel: UILabel!
    @IBOutlet weak private var thongbaoImageView: UIImageView!
    @IBOutlet weak private var rotationGestureRecognizer: UIRotationGestureRecognizer!
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var pinchImagePinchGestureRecognizer: UIPinchGestureRecognizer!
    
    //MARK: - Propeties
    private let minScale: Float = 0.5
    private let maxScale: Float = 2.0
    private var recognizerScale: CGFloat = 1.0
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        thongbaoImageView.isHidden = true
        thongbaoLabel.isHidden = true
        imageView.isUserInteractionEnabled = true
        configTapGesture()
    }
    
    //MARK: - Private Funtion
    private func configTapGesture() {
        let singleTap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(singleTapGesture(_:)))
        singleTap.numberOfTapsRequired = 1
        imageView.addGestureRecognizer(singleTap)
        let doubleTap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(doubleTapGesture(_:)))
        doubleTap.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(doubleTap)
        singleTap.require(toFail: doubleTap)
    }
    
    // MARK: - IBActions
    @IBAction private func longGesTure(_ sender: Any) {
        //let long = sender as! UILongPressGestureRecognizer
        guard let long = sender as? UILongPressGestureRecognizer else { return }
        long.minimumPressDuration = 5.0
        long.view?.transform = CGAffineTransform(rotationAngle: 0)
    }
    
    @IBAction private func rotationGesture(_ sender: UIRotationGestureRecognizer) {
        let rotation: UIRotationGestureRecognizer = sender
        guard let rotationView = rotation.view else { return }
        rotationView.transform = rotationView.transform.rotated(by: rotation.rotation)
        rotation.rotation = 0
    }

    @IBAction private func pinchGesture(_ sender: UIPinchGestureRecognizer) {
        let pinch: UIPinchGestureRecognizer = sender
        guard pinch.view != nil  else { return }
        if pinch.state == .began || pinch.state == .changed {
            if recognizerScale < CGFloat(maxScale) && pinch.scale > 1.0 {
                pinch.view?.transform = pinch.view!.transform.scaledBy(x: pinch.scale, y: pinch.scale)
                recognizerScale *= pinch.scale
                pinch.scale = 1.0
            }
            if recognizerScale > CGFloat(minScale) && pinch.scale < 1.0 {
                pinch.view?.transform = pinch.view!.transform.scaledBy(x: pinch.scale, y: pinch.scale)
                recognizerScale *= pinch.scale
                pinch.scale = 1.0
            }
        }
    }

    //MARK: - Objc Funtions
    @objc private func singleTapGesture(_ sender: UITapGestureRecognizer) {
        thongbaoImageView.isHidden = false
        thongbaoLabel.isHidden = false
        thongbaoLabel.text = "Tôi Là Táo"
        thongbaoImageView.alpha = 1
        thongbaoLabel.alpha = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            UIView.animate(withDuration: 1) {
                self.thongbaoImageView.alpha = 0
                self.thongbaoLabel.alpha = 0
            }
        }
    }
    
    @objc private func doubleTapGesture(_ sender: UITapGestureRecognizer) {
        thongbaoImageView.isHidden = false
        thongbaoLabel.isHidden = false
        thongbaoLabel.text = "Táo Là Tôi"
        thongbaoImageView.alpha = 1
        thongbaoLabel.alpha = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            UIView.animate(withDuration: 1) {
                self.thongbaoImageView.alpha = 0
                self.thongbaoLabel.alpha = 0
            }
        }
    }
}
