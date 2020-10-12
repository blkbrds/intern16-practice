//
//  UserView.swift
//  Baitap9Navigation
//
//  Created by MBA0245P on 10/5/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

protocol UserViewDelegate: class {
    func view(_ view: UserView, needsPerform action: UserView.Action)
}

class UserView: UIView {

    var userAvatarImageView: UIImageView = UIImageView()
    var userNameLabel: UILabel = UILabel()
    var userInfo: UserInfo?
    var index: Int = 0
    
    weak var delegate: UserViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(frame: CGRect, userInfo: UserInfo?, index: Int) {
        self.init(frame: frame)
        createUser()
        self.index = index
        self.userInfo = userInfo
        createUserInfo()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createUserInfo() {
        guard let userInfo = userInfo else { return }
        userNameLabel.text = userInfo.userNameIndex
        userAvatarImageView.image = UIImage(named: userInfo.userImageIndex)
    }

    func createUser() {
        //Add user avatar
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvatarImageView.frame = frame
        userAvatarImageView.contentMode = .scaleToFill
        userAvatarImageView.layer.borderWidth = 1
        userAvatarImageView.layer.borderColor = UIColor.black.cgColor
        addSubview(userAvatarImageView)

        //Add user name
        userNameLabel = UILabel(frame: CGRect(x: userAvatarImageView.frame.origin.x, y: userAvatarImageView.frame.origin.y + 100, width: 100, height: 50))
        userNameLabel.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9333333333, blue: 0.7529411765, alpha: 1)
        userNameLabel.textColor = #colorLiteral(red: 0, green: 0.568627451, blue: 1, alpha: 1)
        userNameLabel.textAlignment = .center
        addSubview(userNameLabel)

        //Add button
        let userButton = UIButton(frame: CGRect(x: userAvatarImageView.frame.origin.x, y: userAvatarImageView.frame.origin.y, width: 100, height: 150))
        userButton.backgroundColor = .clear
        userButton.tag = index
        userButton.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        addSubview(userButton)
    }
    
    func updateUsername(newName: String) {
        userNameLabel.text = newName
    }

    @objc func buttonDidClick(sender: UIButton) {
        delegate?.view(self, needsPerform: .didTapSendUsername(index: index))
    }
}

extension UserView {
    enum Action {
        case didTapSendUsername(index: Int)
    }
}
