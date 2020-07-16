//
//  BaiTap03.swift
//  BaiTapView
//
//  Created by PCI0004 on 7/1/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class BaiTap03: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var clearButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passWordTextField: UITextField!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextField()
    }

    // MARK: - Private Methods
    private func configTextField() {
        errorLabel.text = ""
        userNameTextField.delegate = self
        passWordTextField.delegate = self
        userNameTextField.returnKeyType = .next
        passWordTextField.returnKeyType = .done

        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }

    // MARK: - Private Methods
    private func processLogin() {
        if userNameTextField.text == "Admin" && passWordTextField.text == "Admin123" {
            errorLabel.isHidden = true
        } else if userNameTextField.text == "" || passWordTextField.text == "" {
            errorLabel.isHidden = false
            errorLabel.text = "Nhập sai Username và Password"
        }
    }

    // MARK: - IBActions
    @IBAction private func clearValueButton(_ sender: UIButton) {
        userNameTextField.text = ""
        passWordTextField.text = ""
        errorLabel.text = ""
    }

    @IBAction private func loginClickButton(_ sender: UIButton) {
        processLogin()
    }
}

// MARK: - UITextFieldDelegate
extension BaiTap03: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            userNameTextField.resignFirstResponder()
            passWordTextField.becomeFirstResponder()
        } else if textField == passWordTextField {
            processLogin()
        }
        return false
    }
}
