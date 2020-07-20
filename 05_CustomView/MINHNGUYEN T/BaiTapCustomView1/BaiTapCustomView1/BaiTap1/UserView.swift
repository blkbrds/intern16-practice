//
//  BaiTap4ViewController.swift
//  BaiTapCustomView1
//
//  Created by MacBook Pro on 7/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol UserViewDelegate : class {
    func view(_ view: UserView, needsPerform action: UserView.Action)
}

final class UserView: UIView {

    // MARK: - Private Properties
    private var userAvartarImageView: UIImageView = UIImageView()
    var usernameLabel: UILabel = UILabel()
    weak var delegate: UserViewDelegate?
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        let frame = CGRect(x: 0, y: 0, width: 110, height: 100)
        userAvartarImageView = UIImageView(image: UIImage(named: "avartar"))
        userAvartarImageView.frame = frame
        userAvartarImageView.contentMode = .scaleToFill
        addSubview(userAvartarImageView)
        // add name
        usernameLabel = UILabel(frame: CGRect(x: 0, y: 100, width: 110, height: 30))
        usernameLabel.backgroundColor = .lightGray
        usernameLabel.textColor = .blue
        usernameLabel.textAlignment = .center
        addSubview(usernameLabel)
        // add button
        let userButton = UIButton(frame: CGRect(x: 0, y: 0, width: 110, height: 130))
        userButton.backgroundColor = .clear
        let uiTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleClickButton))
        userButton.addGestureRecognizer(uiTapGestureRecognizer)
        addSubview(userButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Funtion
    @objc private func handleClickButton() {
        delegate?.view(self, needsPerform: .didTapImage(nameLabel: usernameLabel.text ?? ""))
    }
}

// MARK: - Config UserView
extension UserView {
    enum Action {
        case didTapImage(nameLabel : String)
    }
}
