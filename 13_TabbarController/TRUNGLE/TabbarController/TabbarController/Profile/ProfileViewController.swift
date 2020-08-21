//
//  ProfileViewController.swift
//  TabbarController
//
//  Created by Abcd on 8/11/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PROFILE"
    }



    @IBAction func logoutPressed(_ sender: Any) {
        UserDefaults.standard.set(nil,forKey: "userName")
        SceneDelegate.shared.changeScreen(with: .logOut)
    }
    
}
