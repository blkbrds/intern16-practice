//
//  AvatarView.swift
//  CustomView
//
//  Created by PCI0007 on 7/3/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

protocol AvatarViewDelegate: class {
    func avatarView(_ avatarView: UIView, getName index: String)
}

class AvatarView: UIView {
    
    weak var delegate: AvatarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    // convinience init khởi tạo phụ trợ cho hàm init
    convenience init(frame: CGRect, index: Int) { // thêm 1 đối số index để lấy giá trị
        self.init(frame: frame)
        userView(index: String(index))
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGuesture))
        tapGesture.name = String(index)
        self.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Functions
    func userView(index: String) {
        // Add avatar
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "img-avatar"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        addSubview(userAvatar)
        
        // Add user name
        let userName = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        userName.text = "User \(index)"
        userName.textAlignment = .center
        userName.textColor = .white
        userName.backgroundColor = .lightGray
        addSubview(userName)
    }
    
    @objc func handleTapGuesture(_ sender: UIGestureRecognizer) {
        delegate?.avatarView(self, getName: sender.name!)
    }
}
