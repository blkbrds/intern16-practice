//
//  LoginViewController.swift
//  baitap09
//
//  Created by NXH on 7/15/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class LoginViewController: BaseViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var notificationLabel: UILabel!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: - Properties
    var users: [String:String] = [:]
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        configUIBarButton()
        readData()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: - Override Function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - Objc Function
    @objc private func tapOnDoneButton(_ sender: UIBarButtonItem) {
        view.endEditing(true)
        if checkLogin() {
            passwordTextField.text = ""
            usernameTextField.text = ""
            notificationLabel.text = ""
            view.endEditing(true)
            SceneDelegate.shared.changeRoot(rootType: .tabbar)
        } else {
            notificationLabel.text = "Login fail"
        }
    }
    
    // MARK: Private Function
    private func configUIBarButton() {
        navigationController?.isToolbarHidden = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(tapOnDoneButton(_:)))
    }
    
    private func checkLogin() -> Bool {
        if let text = usernameTextField.text,
            let password = users[text],
            passwordTextField.text == password {
            UserDefaults.standard.setValue(text, forKey: "user")
            return true
        }
        return false
    }
    
    private func readData() {
        if let path = Bundle.main.path(forResource: "users", ofType: "plist") {
            if let data = NSDictionary(contentsOfFile: path) as? [String : String] {
                users = data
            }
        }
    }
}

// MARK: - Extension
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameTextField:
            passwordTextField.becomeFirstResponder()
        default:
            view.endEditing(true)
        }
        return true
    }
}
