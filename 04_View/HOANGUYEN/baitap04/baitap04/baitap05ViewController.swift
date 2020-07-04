//
//  baitap05ViewController.swift
//  baitap04
//
//  Created by NXH on 7/1/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class baitap05ViewController: UIViewController {
    @IBOutlet weak var parentsUIView: UIView!
    @IBOutlet weak var minTrackSlider: UIView!
    @IBOutlet weak var thumpValueSlider: UILabel!
    @IBOutlet weak var thumpSlider: UIView!
    @IBOutlet weak var maxTrackSlider: UIView!
    
    private let panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        setFisrtUI()
        addGesture()
    }
    
    final func setFisrtUI(){
        thumpSlider.isUserInteractionEnabled = true
        minTrackSlider.layer.borderWidth = 1
        maxTrackSlider.layer.borderWidth = 1
        thumpSlider.layer.cornerRadius = thumpSlider.bounds.width / 2
        thumpSlider.layer.borderWidth = 1
    }
    
    final func addGesture() {
        thumpSlider.addGestureRecognizer(panGesture)
        panGesture.addTarget(self, action: #selector(actionPanGesture(pan:)))
    }

    @objc final func actionPanGesture(pan: UIPanGestureRecognizer) {
        
        let translate: CGPoint = pan.translation(in: parentsUIView)
      print(translate)
        thumpSlider.frame.origin.x = 0
        thumpSlider.frame.origin.y += translate.y
        pan.setTranslation(CGPoint.zero, in: parentsUIView)
        if thumpSlider.center.y <= maxTrackSlider.frame.origin.y {
            thumpSlider.center.y = maxTrackSlider.frame.origin.y
        }
        if thumpSlider.center.y >=  maxTrackSlider.frame.height + thumpSlider.frame.height / 2 {
            thumpSlider.frame.origin.y =  maxTrackSlider.frame.height
        }
        minTrackSlider.frame.origin.y = thumpSlider.center.y
        minTrackSlider.frame.size = CGSize(width: minTrackSlider.frame.width, height: maxTrackSlider.frame.height - thumpSlider.center.y + thumpSlider.frame.height / 2)
        thumpValueSlider.text = String(Int(maxTrackSlider.frame.height - thumpSlider.center.y + thumpSlider.bounds.height / 2))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
