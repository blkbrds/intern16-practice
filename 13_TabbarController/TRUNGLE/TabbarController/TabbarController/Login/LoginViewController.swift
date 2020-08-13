//
//  LoginViewController.swift
//  TabbarController
//
//  Created by Abcd on 8/12/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class LoginViewController: MainTabbarController {
    //MARK: - IBoutlet
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var userNameTextField: UITextField!
    
    //MARK: - Properties
    private let userName = "trung"
    private let passWord = "123"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction private func loginPressed(_ sender: UIButton) {
        guard let checkUserName = userNameTextField.text, userName == checkUserName,
            let checkPassWord = passwordTextField.text, passWord == checkPassWord else { return }
        UserDefaults.standard.set(userName, forKey: "userName")
        SceneDelegate.shared.configRootView(with: .login)
    }
}
