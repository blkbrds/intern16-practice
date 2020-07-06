//
//  BaiTap02VC.swift
//  BaiTap05
//
//  Created by PCI0020 on 7/1/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class BaiTap02VC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button1 = BadgeButton(frame: CGRect(x: 100, y: 100, width: 200, height: 100), pointNumber: 5, name: "Email", colorBtn: #colorLiteral(red: 0.4401525557, green: 0.6798833013, blue: 0.2787234783, alpha: 1), position: .topRight)
        self.view.addSubview(button1)
//        point = 10
//        setupButton(button: buttonDemo)
//        setupPointView(pointNumView: pointView)
//        setupPointNumberLabel(numberLabel: pointNumberLabel,numberView: pointView)
//        point = 200
//        setupButton(button: buttonDemo2)
//        setupPointView(pointNumView: pointView2)
//        setupPointNumberLabel(numberLabel: pointNumberLabel2,numberView: pointView2)
//        point = 8
//        setupButton(button: buttonDemo3)
//        setupPointView(pointNumView: pointView3)
//        setupPointNumberLabel(numberLabel: pointNumberLabel3,numberView: pointView3)
    }
    
//    private func setupButton(button: UIButton) {
//        button.layer.masksToBounds = true
//        button.layer.cornerRadius = 15
//    }
//
//    private func setupPointView(pointNumView: UIView) {
//        if point == 0 {
//            pointNumView.isHidden = true
//        }
//        pointNumView.layer.masksToBounds = true
//        if point < 10 {
//            pointNumView.frame.size.width = 24
//            pointNumView.frame.size.height = 32
//            pointNumView.layer.cornerRadius = 12
//        } else if point < 99 {
//            pointNumView.frame.size.width = 32
//            pointNumView.frame.size.height = 32
//            pointNumView.layer.cornerRadius = 12
//
//        } else if point > 99 {
//            pointNumView.frame.size.width = 48
//            pointNumView.frame.size.height = 32
//            pointNumView.layer.cornerRadius = 12
//
//        }
//    }
//
//    private func setupPointNumberLabel(numberLabel: UILabel,numberView: UIView) {
//        numberLabel.frame = numberView.bounds
//        numberLabel.textAlignment = .center
//        if point > 99 {
//            numberLabel.text = "99+"
//
//        } else {
//            numberLabel.text = "\(point)"
//
//        }
//    }
}
