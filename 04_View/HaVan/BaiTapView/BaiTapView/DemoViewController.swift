//
//  DemoViewController.swift
//  BaiTapView
//
//  Created by NganHa on 6/29/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // add user avatar
               let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
               let userAvatar = UIImageView(image: UIImage(named: "no_avatar"))
               userAvatar.frame = frame
               userAvatar.contentMode = .scaleToFill
               view.addSubview(userAvatar)
               
               // add user name
               let userName = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 25))
               userName.text = "Fx Studio"
               userName.backgroundColor = .lightGray
               userName.textAlignment = .center
               userName.textColor = .blue
               view.addSubview(userName)
               
               // add button
               let button = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 225))
               button.backgroundColor = .clear
               button.addTarget(self, action: #selector(tap), for: .touchDragInside)
               view.addSubview(button)
               
           }
        
        
           @objc func tap() {
               print("tap tap tap")
           }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


