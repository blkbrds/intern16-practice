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
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var loginNoticeLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    // MARK: - Actions
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction private func loginTouchUpInside(_ sender: Any) {
        if usernameTextField.text == "" && passwordField.text == "" {
            loginNoticeLabel.text = "Input username/password"
        } else if usernameTextField.text != "admin" && passwordField.text != "123" {
            loginNoticeLabel.text = "Wrong username/password"
        } else if usernameTextField.text == "" || passwordField.text == "" {
            loginNoticeLabel.text = "Missing username/password"
        } else if usernameTextField.text == "admin" && passwordField.text == "123" {
            loginNoticeLabel.text = ""
        }
    }

    @IBAction private func clearTouchUpInside(_ sender: UITextField) {
        usernameTextField.text = ""
        passwordField.text = ""
    }
}
