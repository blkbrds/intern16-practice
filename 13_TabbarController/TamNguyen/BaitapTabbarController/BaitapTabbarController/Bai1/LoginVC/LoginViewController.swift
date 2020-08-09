//
//  LoginViewController.swift
//  BaitapTabbarController
//
//  Created by PCI0001 on 8/7/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IBOUlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: - Properties
    private let user: (username: String, password: String) = ("tam","tam")
    
    enum Error: String {
        case fullEmpty = "Bạn phải nhập đầy đủ mới sử dụng được app"
        case halfEmpty = "Bạn nhập thiếu"
        case wrong = "Bạn nhập sai username hoặc mật khẩu"
    }
    
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
    
    private func checkInformation() -> Bool {
        return usernameTextField.text == user.username && passwordTextField.text == user.password
    }
    
    private func clickLogin() {
        if checkInformation() {
            AppDelegate.shared.changeRootViewController(changeRoot: .tabbar)
        }
        //check error
        switch (usernameTextField.text, passwordTextField.text) {
        case ("", ""):
            createAlert(title: "Error", message: Error.fullEmpty.rawValue)
            usernameTextField.becomeFirstResponder()
        case ("", _), (_, ""):
            createAlert(title: "Error", message: Error.halfEmpty.rawValue)
            usernameTextField.becomeFirstResponder()
        default:
            createAlert(title: "Error", message: Error.wrong.rawValue)
            usernameTextField.becomeFirstResponder()
        }
    }
    
    private func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in alert.dismiss(animated: true, completion: nil)}))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - IBActions
    @IBAction private func loginButtonTouchUpInside(_ sender: UIButton) {
        clickLogin()
        usernameTextField.text = ""
        passwordTextField.text = ""
        usernameTextField.becomeFirstResponder()
    }
}

// MARK: - Extension UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            clickLogin()
        }
        return true
    }
}
