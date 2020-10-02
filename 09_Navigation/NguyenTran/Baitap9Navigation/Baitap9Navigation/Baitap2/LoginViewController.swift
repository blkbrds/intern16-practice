//
//  LoginViewController.swift
//  Baitap9Navigation
//
//  Created by MBA0245P on 9/6/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Login"

        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneAction))
        navigationItem.rightBarButtonItem = doneButton

        errorLabel.isHidden = true
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
    }

    @objc func doneAction() {
        checkLogin()
    }

    func checkLogin() {
        if usernameTextField.text == "" || passwordTextField.text == "" {
            errorLabel.isHidden = false
            errorLabel.text = "Không được để trống username hoặc password."
            errorLabel.textColor = .systemRed
            passwordTextField.text?.removeAll()

            return
        }
        guard let username = usernameTextField.text, let password = passwordTextField.text else { return }
        let check = InfoManagement.checkInfo(username: username, pass: password)
        if check {
            let homeViewController = HomeViewController()
            guard let username = usernameTextField.text else { return }
            homeViewController.username = username
            homeViewController.delegate = self
            self.navigationController?.pushViewController(homeViewController, animated: true)
        } else {
            errorLabel.isHidden = false
            errorLabel.text = "Nhập sai username hoặc password."
            errorLabel.textColor = .systemRed
            passwordTextField.text?.removeAll()
        }
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            textField.resignFirstResponder()
            let homeViewController = HomeViewController()
            let editViewController = EditViewController ()
            guard let username = usernameTextField.text else { return false }
            homeViewController.username = username
            editViewController.username = username
            self.navigationController?.pushViewController(homeViewController, animated: true)
        }
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension LoginViewController: HomeViewControllerDelegate {
    func controller(_ controller: HomeViewController, needsPerform action: HomeViewController.Action) {
        switch action {
        case .resetValue:
            usernameTextField.text?.removeAll()
            passwordTextField.text?.removeAll()
            errorLabel.text?.removeAll()
        }
    }
}
