//
//  AvatarView.swift
//  Protocol
//
//  Created by Trung Le D. on 7/24/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit
protocol AvatarViewDelegate {
    func updateUser( userName: String, image: String, index: Int)
}
class AvatarView: UIView {
    var avatarViewDelegate: AvatarViewDelegate?
    @IBOutlet weak var avatarViewImageView: UIImageView!
      @IBOutlet weak var nameLabel: UILabel!
      var userName: String = ""
       var imageView: String = "1"

      func updateName() {
          nameLabel.text = userName
      }
      
      @IBAction func profileButtonTouchUpInSide(_ sender: Any) {
          if let delegate = avatarViewDelegate {
            delegate.updateUser(userName: userName, image: imageView, index: tag)
          }
      }
}
