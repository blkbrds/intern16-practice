//
//  ProfileViewController.swift
//  baitap13
//
//  Created by NXH on 8/6/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class ProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
    }
    
    @IBAction private func logoutButtonTouchUpInside() {
        UserDefaults.standard.set(nil, forKey: "user")
        SceneDelegate.shared.changeRoot(rootType: .navi)
    }
}
