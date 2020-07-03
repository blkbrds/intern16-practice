//
//  BaiTap02VC.swift
//  BaiTap06
//
//  Created by PCI0020 on 7/3/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class BaiTap02VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 100, y: 200), radius: CGFloat(100), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2 ), clockwise: true)
            
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 3.0
        view.layer.addSublayer(shapeLayer)
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
