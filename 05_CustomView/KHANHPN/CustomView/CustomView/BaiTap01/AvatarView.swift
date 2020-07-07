//
//  AvatarView.swift
//  CustomView
//
//  Created by PCI0007 on 7/3/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

protocol AvatarViewDelegate: class {
    func userView(_ useView: AvatarView , didSelect index: Int)
}

class AvatarView: UIView {
    
    var avatarImageView: UIImageView?
    var usernameLabel: UILabel?
    weak var delegate: AvatarViewDelegate?
    

    override init(frame: CGRect) {
        super.init(frame: frame)

        // Add user avatar
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        avatarImageView? = UIImageView(image: UIImage(named: "img-avatar.png"))
        avatarImageView?.frame = frame
        addSubview(avatarImageView!)

        // Add user name
        usernameLabel = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        usernameLabel?.text = "Tokuda"
        usernameLabel?.backgroundColor = .lightGray
        usernameLabel?.textColor = .white
        usernameLabel?.textAlignment = .center
        addSubview(usernameLabel!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
