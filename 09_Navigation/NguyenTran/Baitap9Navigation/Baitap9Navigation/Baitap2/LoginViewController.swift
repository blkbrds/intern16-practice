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
    }

    @objc func doneAction() {
        checkLogin()
    }

    func checkLogin() {
        errorLabel.isHidden = false
        if usernameTextField.text == "" || passwordTextField.text == "" {
            errorLabel.text = "Không được để trống username và password."
            errorLabel.textColor = .systemRed
        } else if usernameTextField.text == "Admin" && passwordTextField.text == "Admin123" {
            let homeViewController = HomeViewController()
            let editViewController = EditViewController ()
            guard let username = usernameTextField.text else { return }
            homeViewController.username = username
            editViewController.username = username
            self.navigationController?.pushViewController(homeViewController, animated: true)
        } else {
            errorLabel.text = "Nhập sai username và password."
            errorLabel.textColor = .systemRed
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
