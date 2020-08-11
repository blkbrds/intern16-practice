//
//  LoginViewController.swift
//  baitap09
//
//  Created by NXH on 7/15/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Properties
    var users: [String:String] = [:]
    var nameUser: UserDefaults = UserDefaults()
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
            let homeViewController = HomeViewController()
            navigationController?.pushViewController(homeViewController, animated: true)
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
            nameUser.setValue(text, forKey: "username")
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
        if textField === usernameTextField {
            passwordTextField.becomeFirstResponder()
        }
        if textField == passwordTextField {
            view.endEditing(true)
        }
        return true
    }
}
