//
//  CustomAvatarView.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/22/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

protocol CustomAvatarViewDelegate {
    func setValue(_ customAvatarView: CustomAvatarView, setValueAvatar action: CustomAvatarView.Action)
}

final class CustomAvatarView: UIView {

    var avatarImageView: UIImageView = UIImageView()
    var usernameLabel: UILabel = UILabel()
    var delegate: CustomAvatarViewDelegate?

    // MARK: - Initilaze
    override init(frame: CGRect) {
        super.init(frame: frame)

        // Add user avatar
        avatarImageView = UIImageView(image: UIImage(named: "img_avatar_01"))
        avatarImageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height * 4 / 5)
        avatarImageView.contentMode = .scaleAspectFit
        self.addSubview(avatarImageView)

        // Add user name
        usernameLabel = UILabel(frame: CGRect(x: 0, y: frame.size.height * 4 / 5, width: frame.size.width, height: frame.size.height / 5))
        usernameLabel.text = "Fx Studio"
        usernameLabel.backgroundColor = .lightGray
        usernameLabel.textAlignment = .center
        usernameLabel.textColor = .blue
        self.addSubview(usernameLabel)

        // Add button
        let clickButton = UIButton(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        clickButton.backgroundColor = .clear
        clickButton.addTarget(self, action: #selector(changeValue), for: .touchUpInside)
        self.addSubview(clickButton)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func changeValue() {
        delegate?.setValue(self, setValueAvatar: .setValueAvatar(usernameLabel.text ?? "", avatarImageView.image))
    }
}

extension CustomAvatarView {
    enum Action {
        case setValueAvatar(String, UIImage?)
    }
}

