//
//  Bai55ViewController.swift
//  BaiTapView
//
//  Created by Trung Le D. on 7/2/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class Bai55ViewController: UIViewController {
    
    @IBOutlet weak var nut: UILabel!
    @IBOutlet weak var thanhNho: UIView!
    @IBOutlet weak var thanhTo: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNut()
    }
    
    private func setUpNut() {
        nut.text = "50%"
        nut.textColor = UIColor.white
        nut.textAlignment = .center
        nut.font = UIFont.systemFont(ofSize: 24.0)
        nut.layer.cornerRadius = nut.frame.height / 2
        nut.layer.borderWidth = 3.0
        nut.layer.masksToBounds = true
        nut.layer.borderColor = UIColor.orange.cgColor
        nut.translatesAutoresizingMaskIntoConstraints = false
        nut.center = CGPoint(x: thanhTo.frame.midX, y: thanhTo.frame.midY)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first {
            let localtion = touch.location(in: self.view)
            if   localtion.y >= thanhTo.frame.minY,
                localtion.y <= thanhTo.frame.maxY {
                nut.center = CGPoint(x: thanhTo.center.x, y: localtion.y)
                thanhNho.frame = CGRect(x: thanhTo.frame.origin.x, y: thanhTo.frame.origin.y, width: thanhNho.frame.width, height: localtion.y - thanhTo.frame.origin.y)
                let phanTram = 100 * (1 - thanhNho.frame.height / thanhTo.frame.height)
                nut.text = "\(Int(phanTram))%"
            }
        }
    }
    
    
    
    
}
