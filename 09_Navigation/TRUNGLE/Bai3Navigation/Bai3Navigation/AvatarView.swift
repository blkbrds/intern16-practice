//
//  AvatarView.swift
//  Bai3Navigation
//
//  Created by Trung Le D. on 7/22/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

protocol AvatarViewDelegate: class {
    func touchesAvatar(userName: String, imageView: String, index: Int)
}
class AvatarView: UIView {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var avatarLabel: UILabel!
    
     var avatarviewDelegate : AvatarViewDelegate?
    var userName: String = ""
    var imageView: String = "avatar"
        
    func updateUser(){
        avatarLabel.text = userName
    }

    @IBAction func touchesInImageView(_ sender: Any) {
        if let delegate = avatarviewDelegate {
            print(imageView.count)
           delegate.touchesAvatar(userName: userName, imageView: imageView, index: tag)
            
        }
    }
}
