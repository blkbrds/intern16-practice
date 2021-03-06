//
//  CustomView.swift
//  Bai5
//
//  Created by PCI0001 on 7/6/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class CustomView: UIView {
    
    enum NotificationNumber {
        case topLeft
        case topRight
        case topCenter
        case centerLeft
        case centerRight
        case bottomLeft
        case bottomRight
        case bottomCenter
    }
    
    //MARK: Properties
    private var featureButton: UIButton?
    private var notifyLabel: UILabel?
    private var buttonColor: String?
    private var badgeNumver: Int = 0
    
    //MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, number: Int, position: NotificationNumber, nameButton: String) {
        self.init(frame: frame)
        configNotification(with: number, position, name: nameButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    func configNotification(with badgeNum: Int,_ position: NotificationNumber, name button: String) {
        featureButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        featureButton?.backgroundColor = UIColor.init(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        featureButton?.layer.cornerRadius = 5
        featureButton?.setTitle(button, for: .normal)
        featureButton?.titleLabel?.textColor = .black
        notifyLabel = UILabel()
        notifyLabel?.textAlignment = .center
        notifyLabel?.frame.size = CGSize(width: 30, height: 30)
        notifyLabel?.layer.cornerRadius = 15
        notifyLabel?.clipsToBounds = true
        
        if badgeNum == 0 {
            notifyLabel?.isHidden = true
        } else {
            configPositionOfBadge(position)
            notifyLabel?.adjustsFontSizeToFitWidth = true
            notifyLabel?.backgroundColor = .red
            notifyLabel?.frame.size.width = CGFloat(labelSize(with: badgeNum))
            notifyLabel?.layer.cornerRadius = 15
            notifyLabel?.clipsToBounds = true
        }
        addSubview(featureButton!)
        addSubview(notifyLabel!)
    }
    
    private func configPositionOfBadge(_ position: NotificationNumber) {
        guard let featureWidth = featureButton?.frame.width else { return }
        guard let featureHeight = featureButton?.frame.height else { return }
        switch position {
        case .topLeft:
            notifyLabel?.center.x = 0
            notifyLabel?.center.y = 0
        case .topCenter:
            notifyLabel?.center.x = featureWidth / 2
            notifyLabel?.center.y = 0
        case .topRight:
            notifyLabel?.center.x = featureWidth / 2
            notifyLabel?.center.y = 0
        case .centerLeft:
            notifyLabel?.center.y = featureHeight / 2
            notifyLabel?.center.x = 0
        case .centerRight:
            notifyLabel?.center.x = featureWidth
            notifyLabel?.center.y = featureHeight / 2
        case .bottomLeft:
            notifyLabel?.center.x = 0
            notifyLabel?.center.y = featureHeight
        case .bottomRight:
            notifyLabel?.center.x = featureWidth
            notifyLabel?.center.y = featureHeight
        case .bottomCenter:
            notifyLabel?.center.x = featureWidth / 2
            notifyLabel?.center.y = featureHeight
        }
    }
    
    private func labelSize(with number: Int) -> Float  {
        switch number {
        case 0...9:
            notifyLabel?.text = String(number)
            return 20
        case 10..<99:
            notifyLabel?.text = String(number)
            return 30
        default:
            notifyLabel?.text = String("99+")
            return 40
        }
    }
}
