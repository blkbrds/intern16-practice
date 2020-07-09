//
//  Baitap1ViewController.swift
//  Baitap5
//
//  Created by MBA0245P on 7/8/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userView = UserView(frame: CGRect(x: 50, y: 100, width: 100, height: 250))
        userView.delegate = self
        userView.userAvatar?.image = UIImage(named: "avatar.png")
        userView.userName?.text = "Nguyên"
        view.addSubview(userView)
    }
}

extension Baitap1ViewController: UserViewDelegate {
    func userView(_ userView: UserView, didSelect index: Int) {
        print("Select user view with index \(index).")
    }
}
