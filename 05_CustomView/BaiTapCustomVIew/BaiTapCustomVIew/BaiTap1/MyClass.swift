//
//  MyClass.swift
//  BaiTapCustomVIew
//
//  Created by NganHa on 7/3/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

class MyClass: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // add avatar
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let image = UIImageView(image: UIImage(named: "avatar.png"))
        image.frame = frame
        image.contentMode = .scaleToFill
        addSubview(image)
        
        //add name
        let username = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        username.backgroundColor = .systemPink
        username.textColor = .white
        username.text = "abc"
        addSubview(username)
        
        //add button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 130))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func clickButton() {
        print("abc")
    }

}
