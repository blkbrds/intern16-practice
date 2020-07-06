//
//  Baitap6ViewController.swift
//  Baitap4
//
//  Created by MBA0245P on 7/6/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap6ViewController: UIViewController {

    @IBOutlet weak var monkeyImage: UIImageView!

    var currentScale: CGFloat = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let pinchGesture: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(zoomMonkey))
        pinchGesture.scale = 1
        monkeyImage.addGestureRecognizer(pinchGesture)
        
        let rotationGesture: UIRotationGestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(rotationMonkey))
        rotationGesture.rotation = 0
        monkeyImage.addGestureRecognizer(rotationGesture)
        
        let longPressGesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressMonkey))
        longPressGesture.minimumPressDuration = 1
        monkeyImage.addGestureRecognizer(longPressGesture)
        
        monkeyImage.isUserInteractionEnabled = true
    }

    @objc func zoomMonkey(sender: UIPinchGestureRecognizer) {
        if sender.scale >= 1 && currentScale <= 2 {
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
            currentScale = currentScale * sender.scale
            sender.scale = 1
        }
        if sender.scale <= 1 && currentScale >= 0.5 {
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
            currentScale = currentScale * sender.scale
            sender.scale = 1
        }
    }
    
    @objc func rotationMonkey(sender: UIRotationGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform.rotated(by: sender.rotation))!
        sender.rotation = 0
    }
    
    @objc func longPressMonkey(sender: UILongPressGestureRecognizer) {
        sender.view?.transform = CGAffineTransform(rotationAngle: 0)
    }

}
