//
//  ProfileViewController.swift
//  BaiTap13
//
//  Created by PCI0020 on 7/16/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        setupView()
    }
    
    private func setupView() {
        let logoutButton = UIBarButtonItem(title: "LogOut", style: .plain, target: self, action: #selector(logOut))
        navigationItem.rightBarButtonItem = logoutButton
    }

    @objc private func logOut() {
        SceneDelegate.shared.changeRootViewController(root: .login)
    }
}
