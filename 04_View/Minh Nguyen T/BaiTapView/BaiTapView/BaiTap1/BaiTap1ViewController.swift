//
//  BaiTap1ViewController.swift
//  BaiTapView
//
//  Created by MacBook Pro on 7/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap1ViewController: UIViewController {

        //MARK: - Life Cycle
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // add vartar
            let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
            let userAvartar = UIImageView(image: UIImage(named: "avartar"))
            userAvartar.frame = frame
            userAvartar.contentMode = .scaleToFill
            view.addSubview(userAvartar)
            
            // add name
            let username = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 30))
            username.text = "user name"
            username.backgroundColor = .lightGray
            username.textColor = .blue
            // ra giua
            username.textAlignment = .center
            view.addSubview(username)
            
            // add button
            let button = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 230))
            button.backgroundColor = .clear
            button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
            view.addSubview(button)
        }
        
        //MARK: - Objc Funtion
        @objc func clickButton(){
            print("click")
        }
}
