//
//  MyAvatar.swift
//  BaiTap1_CustomView
//
//  Created by MBA0168 on 7/5/20.
//  Copyright © 2020 chungiOS. All rights reserved.
//

import UIKit
protocol MyAvatarDelegate: class{
    func myAvatar(_ myAvatar: MyAvatar, didSelect index: Int)
}
class MyAvatar: UIView {

    var userAvatar : UIImageView?
    var userName: UILabel?
    
    weak var delegate: MyAvatarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        userAvatar = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 3 * frame.height / 4))
        userAvatar?.frame = frame
        userAvatar?.contentMode = .scaleAspectFit
        guard let userAvt = userAvatar else { return }
        addSubview(userAvt)
        
        //add user name
        userName = UILabel(frame: CGRect(x: 0, y: userAvt.frame.height + 10, width: frame.width, height: userAvt.frame.height - (4 * userAvt.frame.height / 5)))
        userName?.text = "Hello"
        userName?.backgroundColor = .blue
        userName?.textColor = .white
        userName?.textAlignment = .center
        guard let userName1 = userName else { return }
        addSubview(userName1)
            
        //add button
        let button = UIButton(frame: CGRect(x: 0, y: userAvt.frame.height, width: frame.width, height: frame.height - userAvt.frame.height))
        button.backgroundColor = .clear
        let buttonTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonDidClick(sender:)))
        button.addGestureRecognizer(buttonTapGestureRecognizer)
        addSubview(button)
    }
    
    @objc func buttonDidClick(sender: UITapGestureRecognizer) {
        print("Button is clicked")
        delegate?.myAvatar(self, didSelect: 10)
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
