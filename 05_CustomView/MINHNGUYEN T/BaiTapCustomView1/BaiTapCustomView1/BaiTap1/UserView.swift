//
//  BaiTap4ViewController.swift
//  BaiTapCustomView1
//
//  Created by MacBook Pro on 7/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
// MARK: - Protocol
protocol UserViewDelegate : class {
    func view(_ view: UserView, needsPerform action: UserView.Action)
}

class UserView: UIView {
    // MARK: - Properties
    var userAvartar: UIImageView?
    var username: UILabel?
    weak var delegate: UserViewDelegate?
    
    // MARK: - Lift Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvartar = UIImageView(image: UIImage(named: "avartar"))
        userAvartar?.frame = frame
        userAvartar?.contentMode = .scaleToFill
        addSubview(userAvartar!)
        // add name
        username = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        username?.text = "user name"
        username?.backgroundColor = .lightGray
        username?.textColor = .blue
        // ra giua
        username?.textAlignment = .center
        addSubview(username!)
        // add button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 130))
        button.backgroundColor = .clear
        let uiTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(clickButton))
        //uiTapGestureRecognizer.name = names[index]
        button.addGestureRecognizer(uiTapGestureRecognizer)
        //button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Objc Funtion
    @objc func clickButton() {
     delegate?.view(self, needsPerform: .didTapImage(nameLabel: username?.text ?? ""))
    }
}

//  MARK: - extension UserView
extension UserView {
    enum Action {
        case didTapImage(nameLabel : String)
    }
}
