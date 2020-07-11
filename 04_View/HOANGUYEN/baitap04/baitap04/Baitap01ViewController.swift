//
//  baitap01ViewController.swift
//  baitap04
//
//  Created by NXH on 6/30/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class Baitap01ViewController: UIViewController {

     let nameLabel: UILabel = {
          let lbl = UILabel()
          lbl.text = "Name"
          lbl.textAlignment = .center
          lbl.backgroundColor = .blue
          lbl.translatesAutoresizingMaskIntoConstraints = false
          return lbl
      }()
      let avatarImage: UIImageView = UIImageView()
      
      override func viewDidLoad() {
          super.viewDidLoad()
          view.addSubview(avatarImage)
          view.addSubview(nameLabel)
          avatarImage.image = UIImage(named: "avatar")
          avatarImage.frame = CGRect(x: 30, y: 30, width: 100, height: 100)
          nameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 0).isActive = true
          nameLabel.leadingAnchor.constraint(equalTo: avatarImage.leadingAnchor, constant: 0).isActive = true
          nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
          nameLabel.widthAnchor.constraint(equalTo: avatarImage.widthAnchor, constant: 0).isActive = true
    }
}
