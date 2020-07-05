//
//  BaiTap02VC.swift
//  BaiTap05
//
//  Created by PCI0020 on 7/1/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class BaiTap02VC: UIViewController {
    
    var point: Int = 10
    @IBOutlet private weak var buttonDemo: UIButton!
    @IBOutlet private weak var pointView: UIView!
    @IBOutlet private weak var pointNumberLabel: UILabel!
    
    @IBOutlet private weak var buttonDemo2: UIButton!
    @IBOutlet private weak var pointView2: UIView!
    @IBOutlet private weak var pointNumberLabel2: UILabel!
    
    @IBOutlet private weak var buttonDemo3: UIButton!
    @IBOutlet private weak var pointView3: UIView!
    @IBOutlet private weak var pointNumberLabel3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        point = 10
        setupButton(button: buttonDemo)
        setupPointView(pointNumView: pointView)
        setupPointNumberLabel(numberLabel: pointNumberLabel,numberView: pointView)
        point = 200
        setupButton(button: buttonDemo2)
        setupPointView(pointNumView: pointView2)
        setupPointNumberLabel(numberLabel: pointNumberLabel2,numberView: pointView2)
        point = 8
        setupButton(button: buttonDemo3)
        setupPointView(pointNumView: pointView3)
        setupPointNumberLabel(numberLabel: pointNumberLabel3,numberView: pointView3)
    }
    
    private func setupButton(button: UIButton) {
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
    }
    
    private func setupPointView(pointNumView: UIView) {
        if point == 0 {
            pointNumView.isHidden = true
        }
        pointNumView.layer.masksToBounds = true
        if point < 10 {
            pointNumView.frame.size.width = 24
            pointNumView.frame.size.height = 32
            pointNumView.layer.cornerRadius = 12
        } else if point < 99 {
            pointNumView.frame.size.width = 32
            pointNumView.frame.size.height = 32
            pointNumView.layer.cornerRadius = 12
            
        } else if point > 99 {
            pointNumView.frame.size.width = 48
            pointNumView.frame.size.height = 32
            pointNumView.layer.cornerRadius = 12
            
        }
    }
    
    private func setupPointNumberLabel(numberLabel: UILabel,numberView: UIView) {
        numberLabel.frame = numberView.bounds
        numberLabel.textAlignment = .center
        if point > 99 {
            numberLabel.text = "99+"
            
        } else {
            numberLabel.text = "\(point)"
            
        }
    }
}
