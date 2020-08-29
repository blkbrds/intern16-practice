//
//  AvatarView.swift
//  CustomView
//
//  Created by PCI0007 on 7/3/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

protocol AvatarViewDelegate: class {
    func avatarView(_ avatarView: UIView, getName name: String)
}

final class AvatarView: UIView {
    
    weak var delegate: AvatarViewDelegate?
    
    private var userName: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(frame: CGRect, name: String, image: UIImage) {
        self.init(frame: frame)
        userView(name: name, image: image)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGuesture))
        self.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func userView(name: String, image: UIImage) {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let userAvatar = UIImageView()
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        addSubview(userAvatar)
        let userName = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        userName.text = name
        userName.textAlignment = .center
        userName.textColor = .white
        userName.backgroundColor = .lightGray
        self.userName = name
        addSubview(userName)
    }
    
    @objc func handleTapGuesture(_ sender: UIGestureRecognizer) {
        guard let name = userName else { return }
        delegate?.avatarView(self, getName: name)
    }
}
