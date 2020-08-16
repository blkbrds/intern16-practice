//
//  LoginViewController.swift
//  BaiTapTabbarController
//
//  Created by NganHa on 8/7/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    // MARK: - Properties
    var viewModel = LoginViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextField()
        errorLabel.isHidden = true
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    
    // MARK: - Override functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    // MARK: - Private functions
    private func configTextField() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func login() {
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            errorLabel.text = "You must filled username and password"
            return
        }
        viewModel.fetchUser()
        viewModel.login(username: username, password: password) { result in
            if result {
                UserDefaults.standard.set(true, forKey: "state")
                let isLogined = UserDefaults.standard.bool(forKey: "state")
                let rootType: RootType = isLogined ? . tabbar : . login
                 AppDelegate.shared.changeRoot(rootType: rootType)
            } else {
                errorLabel.isHidden = false
                errorLabel.text = "You entered the wrong username or password"
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction private func loginButtonTouchUpInside(_ sender: UIButton) {
        login()
    }
    
    @IBAction private func clickMeButtonTouchUpInside(_ sender: UIButton) {
        let forgotPasswordVC = ForgotPasswordViewController()
        navigationController?.pushViewController(forgotPasswordVC, animated: true)
    }
    
    @IBAction private func registerButtonTouchUpInside(_ sender: UIButton) {
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            login()
        }
        return true
    }
}
