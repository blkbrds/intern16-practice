//
//  RegisterViewController.swift
//  BaiTapTabbarController
//
//  Created by NganHa on 8/7/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class RegisterViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    // MARK: - Properties
    var viewModel = RegisterViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        configTextField()
    }
    
    // MARK: - Override functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    // MARK: - Private functions
    func configTextField() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func register() {
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            errorLabel.isHidden = false
            errorLabel.text = "You must filled username and password"
            return
        }
        viewModel.fetchUser()
        viewModel.save(username: username, password: password, completion: { result in
            if result {
                UserDefaults.standard.set(true, forKey: "state")
                let state: Bool = UserDefaults.standard.bool(forKey: "state")
                let rootType: RootType = state ? .login : .tabbar
                AppDelegate.shared.changeRoot(rootType: rootType)
            } else {
                errorLabel.isHidden = false
                errorLabel.text = "the username has already exist"
            }
        })
    }
    
    
    // MARK: - IBActions
    @IBAction private func registerButtonTouchUpInside(_ sender: UIButton) {
        register()
    }
}

// MARK: - UITextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            usernameTextField.resignFirstResponder()
            passwordTextField.resignFirstResponder()
            register()
        }
        return true
    }
}
