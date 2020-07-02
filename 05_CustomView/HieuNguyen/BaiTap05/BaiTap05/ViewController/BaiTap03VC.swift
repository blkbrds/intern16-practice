//
//  BaiTap03VC.swift
//  BaiTap05
//
//  Created by PCI0020 on 7/2/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class BaiTap03VC: UIViewController {

    @IBOutlet weak var triangleView: UIView!
    @IBOutlet weak var valueSlider: UIView!
    @IBOutlet weak var thumbSlider: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRightTriangle()
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        self.thumbSlider.addGestureRecognizer(gestureRecognizer)
        thumbSlider.isUserInteractionEnabled = true
    }

    func setRightTriangle() {
        let widthValue = triangleView.frame.size.width
        let heightValue = triangleView.frame.size.height
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: widthValue / 2, y: heightValue))
        path.addLine(to: CGPoint(x: widthValue, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))
        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        triangleView.layer.insertSublayer(shape, at: 0)
    }
    
    func setValueSliderView(translation: CGFloat) {
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 0))
//        let pointA = CGpo
    }
    
    @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        let sliderY = self.triangleView.frame.origin.y
        let sliderHeight = self.triangleView.frame.height
        let heightValue = gestureRecognizer.view!.center.y - sliderY
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            let translation = gestureRecognizer.translation(in: self.view)
            let gestureY = gestureRecognizer.view!.center.y + translation.y
            if gestureY > sliderY && gestureY < (sliderY + sliderHeight) {
                gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x, y: gestureRecognizer.view!.center.y + translation.y)
                gestureRecognizer.setTranslation(CGPoint.zero, in: self.view)
//                valueSlider.frame = CGRect(x: self.backgroundSlider.frame.origin.x, y: self.backgroundSlider.frame.origin.y, width: self.backgroundSlider.frame.width, height: heightValue)
            }
        }
    }

}
