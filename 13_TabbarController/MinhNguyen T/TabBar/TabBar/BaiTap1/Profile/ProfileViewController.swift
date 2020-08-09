//
//  ProfileViewController.swift
//  TabBar
//
//  Created by MacBook Pro on 8/8/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
    }
    
    // MARK: - @IBAction
    @IBAction func handleLogoutButtonTouchUpInside(_ sender: UIButton) {
        AppDelegate.shared.changeRoot(rootType: .login)
    }
}
