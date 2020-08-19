//
//  ProfileViewController.swift
//  Tab bar Controller
//
//  Created by Ngoc Khanh Phan on 8/17/20.
//  Copyright © 2020 Ngoc Khanh Phan. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    
    private func setupNavigation() {
        title = "Profile"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(popToLogin))
        navigationController?.navigationBar.tintColor = .systemOrange
    }
    
    @objc private func popToLogin() {
        SceneDelegate.shared.changeRootViewController(root: .login)
    }
}
