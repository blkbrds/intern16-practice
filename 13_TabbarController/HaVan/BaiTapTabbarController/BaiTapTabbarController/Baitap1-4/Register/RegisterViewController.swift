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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextField.text?.removeAll()
        passwordTextField.text?.removeAll()
    }
    
    // MARK: - Override functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        getKeyboardDown()
    }
    
    // MARK: - Private functions
    private func configTextField() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func register() {
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            errorLabel.text = "You must filled username and password"
            return
        }
        guard let resultError = InformationFactory.shared.createNewAccount(username: username, password: password) else {
            UserDefaults.standard.set(true, forKey: "state")
            AppDelegate.shared.changeRoot(rootType: .tabbar)
            return
        }
        errorLabel.isHidden = false
        errorLabel.text = resultError
        getKeyboardDown()
    }
    
    private func getKeyboardDown() {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    // MARK: - IBActions
    @IBAction private func registerButtonTouchUpInside(_ sender: UIButton) {
        register()
    }
}

// MARK: - UITextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameTextField:
            passwordTextField.becomeFirstResponder()
        default:
            register()
        }
        return true
    }
}
