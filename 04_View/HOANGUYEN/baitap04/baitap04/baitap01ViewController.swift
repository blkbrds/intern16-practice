//
//  baitap01ViewController.swift
//  baitap04
//
//  Created by NXH on 6/30/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class baitap01ViewController: UIViewController {

     let lblName: UILabel = {
          let lbl = UILabel()
          lbl.text = "Name"
          lbl.textAlignment = .center
          lbl.backgroundColor = .blue
          lbl.translatesAutoresizingMaskIntoConstraints = false
          return lbl
      }()
      let imgAvatar: UIImageView = UIImageView()
      
      override func viewDidLoad() {
          super.viewDidLoad()
          view.addSubview(imgAvatar)
          view.addSubview(lblName)
          imgAvatar.image = UIImage(named: "avatar")
          imgAvatar.frame = CGRect(x: 30, y: 30, width: 100, height: 100)
          lblName.topAnchor.constraint(equalTo: imgAvatar.bottomAnchor, constant: 0).isActive = true
          lblName.leadingAnchor.constraint(equalTo: imgAvatar.leadingAnchor, constant: 0).isActive = true
          lblName.heightAnchor.constraint(equalToConstant: 30).isActive = true
          lblName.widthAnchor.constraint(equalTo: imgAvatar.widthAnchor, constant: 0).isActive = true
          
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
