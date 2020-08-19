//
//  LoginViewController.swift
//  Tab bar Controller
//
//  Created by Ngoc Khanh Phan on 8/17/20.
//  Copyright © 2020 Ngoc Khanh Phan. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var noticeLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customLoginView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: - Private functions
    private func customLoginView() {
        usernameTextField.layer.masksToBounds = true
        usernameTextField.layer.cornerRadius = 20
        usernameTextField.layer.borderColor = UIColor.systemOrange.cgColor
        usernameTextField.layer.borderWidth = 1
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.layer.borderColor = UIColor.systemOrange.cgColor
        passwordTextField.layer.borderWidth = 1
        loginButton.layer.cornerRadius = 20
    }
    
    @IBAction private func loginTouchUpInside(_ sender: UIButton) {
        if let path = Bundle.main.path(forResource: "Data", ofType: "plist") {
            if let dic = NSDictionary(contentsOfFile: path) as? [String: String] {
                for user in dic {
                    if usernameTextField.text == user.key && passwordTextField.text == user.value {
                        SceneDelegate.shared.changeRootViewController(root: .tabbar)
                        return
                    }
                    noticeLabel.isHidden = false
                }
            }
        }
    }
    
    @IBAction private func signupTouchUpInside(_ sender: UIButton) {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
}
