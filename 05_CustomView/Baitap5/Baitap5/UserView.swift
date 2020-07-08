//
//  UserView.swift
//  Baitap5
//
//  Created by MBA0245P on 7/8/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

protocol UserViewDelegate: class {
    func userView(_ userView: UserView, didSelect index: Int)
}

class UserView: UIView {
    
    var userAvatar: UIImageView?
    var userName: UILabel?
    
    weak var delegate: UserViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        //Add user avatar
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        userAvatar.layer.borderWidth = 1
        userAvatar.layer.borderColor = UIColor.black.cgColor
        addSubview(userAvatar)

        //Add user name
        let userName = UILabel(frame: CGRect(x: userAvatar.frame.origin.x, y: userAvatar.frame.origin.y + 100, width: 100, height: 50))
        userName.text = "Name"
        userName.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9333333333, blue: 0.7529411765, alpha: 1)
        userName.textColor = #colorLiteral(red: 0, green: 0.568627451, blue: 1, alpha: 1)
        userName.textAlignment = .center
        addSubview(userName)

        //Add button
        let userButton = UIButton(frame: CGRect(x: userAvatar.frame.origin.x, y: userAvatar.frame.origin.y, width: 100, height: 250))
        userButton.backgroundColor = .clear
        let uiTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonDidClick))
        uiTapGestureRecognizer.name = userName.text
        userButton.addGestureRecognizer(uiTapGestureRecognizer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonDidClick(_ sender: UITapGestureRecognizer) {
        let userName = sender.name
        print("\(userName ?? "no name")")
        delegate?.userView(self, didSelect: 10)
    }
}
