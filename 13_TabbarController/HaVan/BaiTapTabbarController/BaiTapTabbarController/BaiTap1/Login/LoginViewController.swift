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
    
    // MARK: - Propeties
    
    // MARK: - Initialize
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextField()
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
    
    private func checkInformation(username: String?, password: String?) -> Bool {
        guard let username = username, let password = password else { return false }
        if username == Information.username && password == Information.password {
            return true
        }
        return false
    }
    
    private func login() {
        if checkInformation(username: usernameTextField.text, password: passwordTextField.text) {
            print("thanh cong")
        } else {
            print("that bai")
        }
    }
    
    // MARK: - Public functions
    
    // MARK: - Objc functions
    
    // MARK: - IBActions
    @IBAction private func loginButtonTouchUpInside(_ sender: UIButton) {
        login()
    }
}

// MARK:
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
