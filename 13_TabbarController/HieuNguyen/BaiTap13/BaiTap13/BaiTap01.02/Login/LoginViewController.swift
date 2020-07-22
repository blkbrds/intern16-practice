//
//  LoginViewController.swift
//  BaiTap09
//
//  Created by hieungq on 7/8/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passWordTextField: UITextField!
    @IBOutlet private weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        messageLabel.isHidden = true
        userNameTextField.delegate = self
        passWordTextField.delegate = self        
    }
        
    override func viewDidDisappear(_ animated: Bool) {
        userNameTextField.text = ""
        passWordTextField.text = ""
    }
    
    @IBAction private func loginButtonTouchUpInside(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "data", ofType: "plist") {
            if let dic = NSDictionary(contentsOfFile: path) as? [String: String] {
                for user in dic {
                    if userNameTextField.text == user.key && passWordTextField.text == user.value {
                        SceneDelegate.shared.changeRootViewController(root: .tabbar)
                        return
                    }
                    messageLabel.isHidden = false
                    messageLabel.text = "Something was wrong"
                }
            }
        }
    }
    
    @IBAction private func registerButtonTouchUpInside(_ sender: Any) {
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    @IBAction private func forgotPasswordButtonTouchUpInside(_ sender: Any) {
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .next {
            passWordTextField.becomeFirstResponder()
        } else {
            loginButtonTouchUpInside(self)
        }
        return true
    }
}
