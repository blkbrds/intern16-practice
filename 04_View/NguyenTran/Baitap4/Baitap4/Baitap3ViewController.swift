//
//  Baitap3ViewController.swift
//  Baitap4
//
//  Created by MBA0245P on 7/4/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap3ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessageLabel.isHidden = true
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func clearButtonTouchUpInside(_ sender: UIButton) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }

    @IBAction func loginButtonTouchUpInside(_ sender: UIButton) {
        checkLogin()
    }

    func checkLogin() {
        errorMessageLabel.isHidden = false
        if usernameTextField.text == "" || passwordTextField.text == "" {
            errorMessageLabel.text = "Không được để trống username và password."
            errorMessageLabel.textColor = .systemRed
        } else if usernameTextField.text == "Admin" && passwordTextField.text == "Admin123" {
            errorMessageLabel.text = "Login thành công."
            errorMessageLabel.textColor = .blue
        } else {
            errorMessageLabel.text = "Nhập sai username và password."
            errorMessageLabel.textColor = .systemRed
        }
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            textField.resignFirstResponder()
            checkLogin()
        }
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
