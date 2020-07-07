//
//  BaiTap01.swift
//  BaiTapCustomView
//
//  Created by PCI0004 on 7/6/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

// MARK: Protocol
protocol MyAvatarDelegate: class {
    func myAvatar(_ myAvatar: MyAvatar, didSelect index: Int)
}
final class MyAvatar: UIView {

    //MARK: Propeties
    var x: CGFloat = 40
    var y: CGFloat = 80
    weak var delegate: MyAvatarDelegate?

    struct Avatar {
        var name: String
        var image: UIImageView
    }

    let avatars: [Avatar] = [
        Avatar(name: "1", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        Avatar(name: "2", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        Avatar(name: "3", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        Avatar(name: "4", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        Avatar(name: "5", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        Avatar(name: "6", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        Avatar(name: "7", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        Avatar(name: "8", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        Avatar(name: "9", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        Avatar(name: "10", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        Avatar(name: "11", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        Avatar(name: "12", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        Avatar(name: "13", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        Avatar(name: "14", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        Avatar(name: "15", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        Avatar(name: "16", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        Avatar(name: "17", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        Avatar(name: "18", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        Avatar(name: "19", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        Avatar(name: "20", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        Avatar(name: "21", image: UIImageView(image: UIImage(named: "img_avatar_01")))
    ]

    // MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configAvatar()
    }

    // MARK: Private Methods
    private func configAvatar() {
        for index in 1...avatars.count {
            // Add user avatar
            let frame = CGRect(x: x, y: y, width: 100, height: 100)
            let userAvatarImageView = avatars[index - 1].image
            userAvatarImageView.frame = frame
            userAvatarImageView.contentMode = .scaleToFill
            addSubview(userAvatarImageView)

            // Add user name
            let userNameLabel = UILabel(frame: CGRect(x: x, y: y + 100, width: 100, height: 50))
            userNameLabel.text = avatars[index - 1].name
            userNameLabel.backgroundColor = .lightGray
            userNameLabel.textColor = .blue
            userNameLabel.textAlignment = .center
            addSubview(userNameLabel)

            // Add button
            let clickButton = UIButton(frame: CGRect(x: x, y: y, width: 100, height: 250))
            clickButton.backgroundColor = .clear
            clickButton.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
            addSubview(clickButton)
            x += 120
            if index % 3 == 0 {
                y += 160
                x = 40
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }

    @objc private func buttonDidClick() {
        print("abc")
        delegate?.myAvatar(self, didSelect: 10)
    }
}
