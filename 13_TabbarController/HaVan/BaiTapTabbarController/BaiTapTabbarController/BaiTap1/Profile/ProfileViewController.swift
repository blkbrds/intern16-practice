//
//  ProfileViewController.swift
//  BaiTapTabbarController
//
//  Created by NganHa on 8/7/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
    }
    
    // MARK: - Private functions
    func configNavigation() {
        title = "PROFILE"
    }
    
    // MARK: - IBAction functions
    @IBAction private func logoutButtonTouchUpInside(_ sender: UIButton) {
        AppDelegate.shared.changeRoot(rootType: .login)
    }
}
