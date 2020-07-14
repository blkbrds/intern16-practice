//
//  BadgeButton.swift
//  BaiTap3_CustomView
//
//  Created by MBA0168 on 7/8/20.
//  Copyright © 2020 chungiOS. All rights reserved.
//

import UIKit

class BadgeButton: UIButton {

    var button: UIButton  =  UIButton()
    enum Position {
    case topLeft
    case topRight
    case topCenter
    case centerLeft
    case centerRight
    case bottomLeft
    case bottomRight
    case bottomCenter
        
        func positionBadge(frame: CGRect) -> CGPoint {
            switch self {
            case .topLeft:
                return CGPoint(x: frame.minX, y: frame.minY)
            case .topRight:
                return CGPoint(x: frame.maxX, y: frame.minX)
            case .topCenter:
                return CGPoint(x: frame.midX, y: frame.minY)
            case .centerLeft:
                return CGPoint(x: frame.minX, y: frame.midY)
            case .centerRight:
                return CGPoint(x: frame.maxX, y: frame.midY)
            case .bottomLeft:
                return CGPoint(x: frame.minX, y: frame.maxY)
            case .bottomRight:
                return CGPoint(x: frame.maxX, y: frame.maxY)
            case .bottomCenter:
                return CGPoint(x: frame.midX, y: frame.maxY)
            }
            
        }
    }
    var badgeLabel: UILabel = UILabel()
    
    var badge:String?{
        didSet{
        addBadgeToButton(badge: badge)
        }
    }
    func addpositionBadge(position: Position){
        badgeLabel.center = position.positionBadge(frame: bounds)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addBadgeToButton(badge: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addBadgeToButton(badge: nil)
        fatalError("init(coder:) has not been implemented")
    }
    func addBadgeToButton(badge:String?) {
        // badge label
        badgeLabel.text = badge
        badgeLabel.backgroundColor = .red
        badgeLabel.textColor = .white
        badgeLabel.layer.cornerRadius = badgeLabel.bounds.size.height / 2
        badgeLabel.layer.masksToBounds = true
        badgeLabel.font = badgeLabel.font.withSize(12)
        badgeLabel.sizeToFit()
        badgeLabel.frame.size = CGSize(width: 30, height: 20)
        badgeLabel.textAlignment = .center
        
        //add Badgelabel
        addSubview(badgeLabel)
        badgeLabel.isHidden = badge != nil ? false : true
    }

}
