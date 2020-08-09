//
//  ProfileViewController.swift
//  BaitapTabbarController
//
//  Created by PCI0001 on 8/7/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //MARK: - Private methods
    private func configUI() {
        title = "Profile"
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTouchUpInside))
        
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: nil)
        
        navigationItem.rightBarButtonItem = logoutButton
        navigationItem.leftBarButtonItem = editButton
    }
    
    @objc private func logoutButtonTouchUpInside() {
        AppDelegate.shared.changeRootViewController(changeRoot: .login)
    }
}
