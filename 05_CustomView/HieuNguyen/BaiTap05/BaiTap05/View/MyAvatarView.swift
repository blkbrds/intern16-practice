//
//  MyAvatarView.swift
//  BaiTap05
//
//  Created by PCI0020 on 6/30/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

protocol MyAvatarDelegate: class {
    func view(_ view: MyAvatarView, needPerformAction action: MyAvatarView.Action)
}

class MyAvatarView: UIView {
    
    weak var delegate: MyAvatarDelegate?
    private var name: String = ""
    
    enum Action {
        case selectAvatar(name: String)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, name: String, image: UIImage) {
        self.init(frame: frame)
        self.name = name
        setupAvatarView(name: name, image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAvatarView(name: String, image: UIImage) {
        let profileView = UIView()
        profileView.frame = bounds
        let avatarImageView = UIImageView(image: image)
        avatarImageView.contentMode = .scaleAspectFit
        profileView.addSubview(avatarImageView)
        avatarImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)

        let nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.font = UIFont(name: "Menlo", size: 16)
        nameLabel.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        nameLabel.minimumScaleFactor = 0.5
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        nameLabel.textAlignment = .center
        nameLabel.isUserInteractionEnabled = true
        profileView.addSubview(nameLabel)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(printInfo(_:)))
        profileView.addGestureRecognizer(tapGesture)
        profileView.isUserInteractionEnabled = true
        addSubview(profileView)
    }

    @objc private func printInfo(_ gesture: UITapGestureRecognizer) {
        delegate?.view(self, needPerformAction: .selectAvatar(name: self.name))
    }
}
