//
//  BaiTap6ViewController.swift
//  BaiTapView
//
//  Created by MacBook Pro on 7/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class BaiTap6ViewController: UIViewController {

    //MARK: - IBOulets
    
    @IBOutlet weak private var thongbaoLabel: UILabel!
    @IBOutlet weak private var thongbaoImage: UIImageView!
    @IBOutlet private var rotationGesture: UIRotationGestureRecognizer!
    @IBOutlet weak private var image: UIImageView!
    @IBOutlet private var pinchImage: UIPinchGestureRecognizer!
    
    //MARK: - Propeties
    
    let minScale: Float = 0.5
    let maxScale: Float = 2.0
    var recognizerScale: CGFloat = 1.0
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //pinchImage.scale = 2
        // Do any additional setup after loading the view.
        thongbaoImage.isHidden = true
        thongbaoLabel.isHidden = true
        image.isUserInteractionEnabled = true
        
        
        let singleTap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(singleTapGesture(_:)))
        singleTap.numberOfTapsRequired = 1
        image.addGestureRecognizer(singleTap)
        
        let doubleTap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(doubleTapGesture(_:)))
        doubleTap.numberOfTapsRequired = 2
        image.addGestureRecognizer(doubleTap)
        singleTap.require(toFail: doubleTap)
    }
    
    // MARK: - IBActions

    @IBAction func longGesTure(_ sender: Any) {
        let long = sender as! UILongPressGestureRecognizer
        long.minimumPressDuration = 5.0
        rotationGesture.view?.transform = CGAffineTransform(rotationAngle: 0)
        
    }
    
    @IBAction func rotationGesture(_ sender: Any) {
        let rotation: UIRotationGestureRecognizer = sender as! UIRotationGestureRecognizer
        //TODO: cach 1
        //image.transform = image.transform.rotated(by: rotation.rotation)
        
        //TODO: rotation nam trong view
        rotation.view?.transform = (rotation.view?.transform.rotated(by: rotation.rotation))!
        rotation.rotation = 0
    }
    
    @IBAction func pinchGesture(_ sender: Any) {
        let pinch: UIPinchGestureRecognizer = sender as! UIPinchGestureRecognizer
        guard pinch.view != nil  else { return }
        if pinch.state == .began || pinch.state == .changed {
            if recognizerScale < CGFloat(maxScale) && pinch.scale > 1.0 {
                pinch.view?.transform = (pinch.view?.transform.scaledBy(x: pinch.scale, y: pinch.scale))!
                recognizerScale *= pinch.scale
                pinch.scale = 1.0
            }
            if recognizerScale > CGFloat(minScale) && pinch.scale < 1.0 {
                pinch.view?.transform = (pinch.view?.transform.scaledBy(x: pinch.scale, y: pinch.scale))!
                recognizerScale *= pinch.scale
                pinch.scale = 1.0
            }
        }
    }
    
    //MARK: - Objc Funtions
    @objc func singleTapGesture(_ sender: UITapGestureRecognizer) {
        thongbaoImage.isHidden = false
        thongbaoLabel.isHidden = false
        thongbaoLabel.text = "Tôi Là Táo"
        self.thongbaoImage.alpha = 1
        self.thongbaoLabel.alpha = 1
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
            UIView.animate(withDuration: 1) {
                self.thongbaoImage.alpha = 0
                self.thongbaoLabel.alpha = 0
            }
        }
    }
    
    @objc func doubleTapGesture(_ sender: UITapGestureRecognizer){
        thongbaoImage.isHidden = false
        thongbaoLabel.isHidden = false
        thongbaoLabel.text = "Táo Là Tôi"
        self.thongbaoImage.alpha = 1
        self.thongbaoLabel.alpha = 1
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
            UIView.animate(withDuration: 1) {
                self.thongbaoImage.alpha = 0
                self.thongbaoLabel.alpha = 0
            }
        }
    }
}
