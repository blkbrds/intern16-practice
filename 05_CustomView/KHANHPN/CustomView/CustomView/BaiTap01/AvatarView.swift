//
//  AvatarView.swift
//  CustomView
//
//  Created by PCI0007 on 7/3/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

class AvatarView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        let frameView = UIView()
        frameView.frame = frame

        // Add user avatar
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "img-avatar.png"))
        userAvatar.frame = frame
        frameView.addSubview(userAvatar)

        // Add user name
        let userName = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        userName.text = "Tokuda"
        userName.backgroundColor = .lightGray
        userName.textColor = .white
        userName.textAlignment = .center
        frameView.addSubview(userName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
