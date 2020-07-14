//
//  BaiTap05VC.swift
//  BaiTap04
//
//  Created by PCI0020 on 7/1/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class BaiTap05VC: UIViewController {


    @IBOutlet weak var valueSlider: UIView!
    @IBOutlet weak var backgroundSlider: UIView!
    @IBOutlet weak var thumbIcon: UIView!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        self.thumbIcon.addGestureRecognizer(gestureRecognizer)
        thumbIcon.isUserInteractionEnabled = true
        valueLabel.textAlignment = .center
        valueLabel.text = "45"
    }

    func setupSlider() {
        backgroundSlider.layer.masksToBounds = true
        backgroundSlider.layer.borderWidth = 1.0
        backgroundSlider.layer.borderColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        valueSlider.layer.masksToBounds = true
        valueSlider.layer.borderWidth = 1.0
        valueSlider.layer.borderColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        valueSlider.backgroundColor = .white
    }

    @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        let sliderY = self.backgroundSlider.frame.origin.y
        let sliderHeight = self.backgroundSlider.frame.height
        let heightValue = gestureRecognizer.view!.center.y - sliderY
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            let translation = gestureRecognizer.translation(in: self.view)
            let gestureY = gestureRecognizer.view!.center.y + translation.y
            if gestureY > sliderY && gestureY < (sliderY + sliderHeight) {
                gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x, y: gestureRecognizer.view!.center.y + translation.y)
                gestureRecognizer.setTranslation(CGPoint.zero, in: self.view)
                valueSlider.frame = CGRect(x: self.backgroundSlider.frame.origin.x, y: self.backgroundSlider.frame.origin.y, width: self.backgroundSlider.frame.width, height: heightValue)
            }
        } else {
            let value = ((sliderHeight - heightValue) / sliderHeight) * 100
            let realValue = Double(round(value))
            valueLabel.text = " \(Int(realValue))"
            print(realValue)
        }
    }

}
