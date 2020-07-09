//
//  HomeViewController.swift
//  BaiTap09
//
//  Created by PCI0020 on 7/9/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var userName: String = "user name"

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        nameLabel.text = userName
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(goToLoginScreen))
        navigationItem.leftBarButtonItem = logoutButton
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(goToEditProfileScreen))
        navigationItem.rightBarButtonItem = editButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(userName)
        nameLabel.text = userName
    }

    @objc func goToLoginScreen() {
        navigationController?.popViewController(animated: true)
    }

    @objc func goToEditProfileScreen() {
        let editVC = EditProfileViewController()
        navigationController?.pushViewController(editVC, animated: true)
    }

}
