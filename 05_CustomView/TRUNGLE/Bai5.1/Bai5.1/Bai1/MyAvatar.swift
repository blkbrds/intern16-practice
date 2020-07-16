//
//  MyAvatar.swift
//  Bai5.1
//
//  Created by Abcd on 7/4/20.
//  Copyright © 2020 abc. All rights reserved.
//

import UIKit

protocol SubViewDelegate: class {
    func didTapOnAvatar(_ myAvatar: MyAvatar)
}
final class MyAvatar: UIView {
    // MARK: - Properties
    var myAvatarDelegate :SubViewDelegate?
    var userAvatar : UIImageView!
    var userName : UILabel = UILabel()
    var button : UIButton!
    var count: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    // MARK: - Function
    private func setupView() {
       let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvatar = UIImageView(image: UIImage(named: "avatar"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        userAvatar.layer.cornerRadius = 15
        userAvatar.backgroundColor = .green
        userAvatar.layer.masksToBounds = true
        userAvatar.tag = 1
        addSubview(userAvatar)
        
        // Add user name
        userName = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 50))
        userName.layer.cornerRadius = 15
        userName.backgroundColor = .yellow
        userName.layer.masksToBounds = true
        userName.textColor = .red
        userName.textAlignment = .center
        addSubview(userName)
        
        // add Button
        button  = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 150))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        addSubview(button)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func buttonClicked() {
        myAvatarDelegate?.didTapOnAvatar(self)
    }
}
