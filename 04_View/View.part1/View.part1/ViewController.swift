//
//  ViewController.swift
//  View.part1
//
//  Created by MBA0036 on 7/8/20.
//  Copyright © 2020 MBA0036. All rights reserved.
//

//bai tap 1 View - Tạo UI với 1 useravatar và 1 label -

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let view = UIView()
        view.backgroundColor = .white
        
        //Add userimage
        let tranhImage = UIImage(named: "tranh.jpg")
        let frame = CGRect(x: 10, y: 100, width: 150, height: 150)
        let userImage = UIImageView(image: UIImage(named: "tranh.jpg"))
        userImage.frame=frame
        userImage.contentMode = .scaleToFill
        view.addSubview(userImage)

  userImage.image = tranhImage
        
    //Add user name (label)
        let username = UILabel()
        username.frame.size.width = 150
        username.frame.size.height = 30
        username.frame.origin.y = userImage.frame.height + userImage.frame.origin.y
        username.frame.origin.x = 10
        username.text = "Name"
        username.textAlignment = .center
        username.backgroundColor = .yellow
        username.textColor = .darkGray
              view.addSubview(username)

    }
}

//bai tap 1 View - Tạo UI với 1 useravatar và 1 label - End



