//
//  Bai3.swift
//  Bai4
//
//  Created by PCI0001 on 7/1/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai3: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var label: UILabel!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextField()
    }

    // MARK: - Private Methods
    private func configTextField() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        usernameTextField.tag = 0
        usernameTextField.returnKeyType = UIReturnKeyType.next
        passwordTextField.tag = 1
        passwordTextField.returnKeyType = UIReturnKeyType.done
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    private func checkIDAndPassword() {
        if usernameTextField.text == "Admin" && passwordTextField.text == "Admin123" {
            label.isHidden = true
        } else {
            label.isHidden = false
            label.text = "Nhap sai user va password"
        }

        if usernameTextField.text == "" || passwordTextField.text == "" {
            label.text = "Nhap thieu user va password"
        }
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    //MARK: - IBAction
    @IBAction private func loginTouchUpInside(_ sender: Any) {
        checkIDAndPassword()
    }

    @IBAction private func clearTouchUpInside(_ sender: Any) {
        usernameTextField.text = ""
        passwordTextField.text = ""
        label.text = ""
    }
}

//MARK: - UITextFieldDelegate
extension Bai3 : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            usernameTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
            return true
        } else if textField == passwordTextField {
            checkIDAndPassword()
        }
        return false
    }
}
