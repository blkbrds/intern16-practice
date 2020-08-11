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
            errorLabel.text = "You must filled username and password"
            return
        }
        
        if InformationFactory.shared.createNewAccount(username: username, password: password) {
            UserDefaults.standard.set(true, forKey: "state")
            AppDelegate.shared.changeRoot(with: UserDefaults.standard.bool(forKey: "state"))
        } else {
            errorLabel.isHidden = true
            errorLabel.text = "the username has already exist"
        }
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
            register()
        }
        return true
    }
}
