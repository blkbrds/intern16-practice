//
//  MyViewController.swift
//  Baitap4
//
//  Created by MBA0245P on 7/1/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Add user avatar
        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        userAvatar.layer.borderWidth = 1
        userAvatar.layer.borderColor = UIColor.black.cgColor
        view.addSubview(userAvatar)
        
        //Add user name
        let userName = UILabel(frame: CGRect(x:50, y:200, width: 100, height: 50))
        userName.text = "Name"
        userName.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9333333333, blue: 0.7529411765, alpha: 1)
        userName.textColor = #colorLiteral(red: 0, green: 0.568627451, blue: 1, alpha: 1)
        userName.textAlignment = .center
        view.addSubview(userName)
        
        //Add button
        let button = UIButton(frame: CGRect(x:50, y:100, width: 100, height: 250))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func buttonDidClick() {
        print("Button is clicked!")
    }
}
