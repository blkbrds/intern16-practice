//
//  LoginViewController.swift
//  TabbarController
//
//  Created by Abcd on 8/12/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - IBoutlet
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var userNameTextField: UITextField!
    
    //MARK: - Properties
    private let userName = "trung"
    private let passWord = "123"
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction private func loginPressed(_ sender: UIButton) {
        guard let userNameLogin = userNameTextField.text, userName == userNameLogin,
              let passWordLogin = passwordTextField.text, passWord == passWordLogin else {
            return
        }
        UserDefaults.standard.set(userName, forKey: "userName")
        SceneDelegate.shared.configRootView(with: .login)
    }
}
