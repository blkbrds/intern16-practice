//
//  BaiTap03.swift
//  ViewExample
//
//  Created by PCI0007 on 7/1/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class BaiTap03: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var usernameTextField: UITextField!

    @IBOutlet weak var passwordField: UITextField!

    @IBOutlet weak var loginNotice: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    // MARK: - Actions

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func login(_ sender: Any) {

        if usernameTextField.text == "" && passwordField.text == "" {
            loginNotice.text = "Input username/password"
        } else if usernameTextField.text != "admin" && passwordField.text != "123" {
            loginNotice.text = "Wrong username/password"
        } else if usernameTextField.text == "" || passwordField.text == "" {
            loginNotice.text = "Missing username/password"
        } else if usernameTextField.text == "admin" && passwordField.text == "123" {
            loginNotice.text = ""
        }
    }

    @IBAction func clear(_ sender: UITextField) {
        usernameTextField.text = ""
        passwordField.text = ""
    }
    
}

