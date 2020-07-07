//
//  CustomView.swift
//  Bai5
//
//  Created by PCI0001 on 7/6/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

class CustomView: UIView {

    var numberBadge: Int = 0
    
    //Tao doi duong button
    var button: UIButton =  {
        let but: UIButton = UIButton()
        but.layer.cornerRadius = 10
        but.layer.borderWidth = 1
        but.frame.origin = CGPoint(x: 0,y: 0)
        return but
    }()
    
    //Tao doi tuong badge label
    var badgeNumber: UILabel = {
        let badge: UILabel = UILabel()
        badge.layer.cornerRadius = 10
        badge.layer.borderWidth = 1
        badge.textAlignment = .center
        badge.frame.size = CGSize(width: 25, height: 25)
        return badge
    }()
    
        init(origin: CGPoint, numberBadge: Int) {
        super.init(frame: CGRect(x: origin.x, y: origin.y, width: 100, height: 70))
        self.numberBadge = numberBadge
        self.addSubview(button)
        self.addSubview(badgeNumber)
        button.frame.size = self.frame.size
        checkBadge()
    }
        
         func checkBadge() {
            if numberBadge != 0 {
                switch numberBadge {
                    case 1...10:
                    badgeNumber.frame.size = CGSize(width: 20, height: 20)
                   badgeNumber.text = String(numberBadge)
                    case 11...98:
                    badgeNumber.frame.size = CGSize(width: 30, height: 20)
                    badgeNumber.text = String(numberBadge)
                    default:
                    badgeNumber.frame.size = CGSize(width: 40, height: 20)
                    badgeNumber.text = String("99+")
                    
                    
                   
                }
                    
            } else {
                badgeNumber.isHidden = true
            }
            }
            // neu khong thi isHidden
        

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
