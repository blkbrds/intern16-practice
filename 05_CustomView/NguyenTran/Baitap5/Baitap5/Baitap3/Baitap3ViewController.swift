//
//  Baitap3ViewController.swift
//  Baitap5
//
//  Created by MBA0245P on 8/12/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let emailButton = CustomBadgeButton(frame: CGRect(x:100, y: 100, width: 150, height: 60), badgeValue: 10, position: .topRight, buttonText: "Email", buttonColor: "#2E8B57")
        view.addSubview(emailButton)
        
        let friendButton = CustomBadgeButton(frame: CGRect(x:100, y: 200, width: 150, height: 60), badgeValue: 1000, position: .centerLeft, buttonText: "Friends", buttonColor: "#FF9966")
        view.addSubview(friendButton)
        
        let photoButton = CustomBadgeButton(frame: CGRect(x:100, y: 300, width: 150, height: 60), badgeValue: 8, position: .bottomCenter, buttonText: "Photos", buttonColor: "#9370DB")
        view.addSubview(photoButton)
    }

}
