//
//  MyButtonView.swift
//  BaiTapCustomVIew
//
//  Created by NganHa on 7/6/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class MyButtonView: UIView {
    
    // MARK: - Propeties
    private var featureButton: UIButton?
    private var notificateLabel: UILabel?
    private var buttonColor: String?
    private var badgeNumber: Int = 0
    
    // MARK: - Life cycle
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
    
    // MARK: - Private functions
    func configNotification(with badgeNum: Int,_ position: NotificationNumber, name button: String) {
        featureButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        featureButton?.backgroundColor = UIColor.init(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        featureButton?.layer.cornerRadius = 5
        featureButton?.setTitle(button, for: .normal)
        featureButton?.titleLabel?.textColor = .black
        notificateLabel = UILabel()
        notificateLabel?.textAlignment = .center
        notificateLabel?.frame.size = CGSize(width: 30, height: 30)
        notificateLabel?.layer.cornerRadius = 15
        notificateLabel?.clipsToBounds = true
        
        if badgeNum == 0 {
            notificateLabel?.isHidden = true
        } else {
            configPositionOfBadge(position)
            notificateLabel?.adjustsFontSizeToFitWidth = true
            notificateLabel?.backgroundColor = .red
            notificateLabel?.frame.size.width = CGFloat(labelSize(with: badgeNum))
            notificateLabel?.layer.cornerRadius = 15
            notificateLabel?.clipsToBounds = true
        }
        self.addSubview(featureButton!)
        self.addSubview(notificateLabel!)
    }
    
    private func configPositionOfBadge(_ position: NotificationNumber) {
        guard let featureWidth = featureButton?.frame.width else {return}
        guard let featureHeight = featureButton?.frame.height else {return}
        switch position {
        case .topLeft:
            notificateLabel?.center.x = 0
            notificateLabel?.center.y = 0
        case .topCenter:
            notificateLabel?.center.x = featureWidth / 2
            notificateLabel?.center.y = 0
        case .topRight:
            notificateLabel?.center.x = featureWidth / 2
            notificateLabel?.center.y = 0
        case .centerLeft:
            notificateLabel?.center.y = featureHeight / 2
            notificateLabel?.center.x = 0
        case .centerRight:
            notificateLabel?.center.x = featureWidth
            notificateLabel?.center.y = featureHeight / 2
        case .bottomLeft:
            notificateLabel?.center.x = 0
            notificateLabel?.center.y = featureHeight
        case .bottomRight:
            notificateLabel?.center.x = featureWidth
            notificateLabel?.center.y = featureHeight
        case .bottomCenter:
            notificateLabel?.center.x = featureWidth / 2
            notificateLabel?.center.y = featureHeight
        }
    }
    
    private func labelSize(with number: Int) -> Float  {
        switch number {
        case 0...9:
            notificateLabel?.text = String(number)
            return 20
        case 10..<99:
            notificateLabel?.text = String(number)
            return 30
        default:
            notificateLabel?.text = String("99+")
            return 40
        }
    }
}
