//
//  Bai1ViewController.swift
//  BaiTapView
//
//  Created by Trung Le D. on 7/1/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit
var count = 0
class Bai1ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: BAi 1
        // Add user avatar
        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        
        // Add user name
        
        let userName = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 50))
        userName.text = "User name"
        userName.backgroundColor = .lightGray
        userName.textColor = .blue
        view.addSubview(userName)
        
        // Add button
        
        let button  = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 150))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside )
        view.addSubview(button)
        
    }
    @objc func buttonDidClick () {
        count += 1
        print("alo alo : \(count)")
    }
    
    
    
    
    
}
