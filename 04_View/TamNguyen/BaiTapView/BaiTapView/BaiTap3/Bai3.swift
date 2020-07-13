//
//  Bai3.swift
//  Bai4
//
//  Created by PCI0001 on 7/1/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai3ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!
    
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
        usernameTextField.returnKeyType = .next
        passwordTextField.tag = 1
        passwordTextField.returnKeyType = .done
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func checkIDAndPassword() {
        if usernameTextField.text == "Admin" && passwordTextField.text == "Admin123" {
            resultLabel.isHidden = true
        } else {
            resultLabel.isHidden = false
            resultLabel.text = "Nhap sai user va password"
        }
        if usernameTextField.text?.isEmpty == true || passwordTextField.text?.isEmpty == true {
            resultLabel.text = "Nhap thieu user va password"
        }
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: - IBAction
    @IBAction private func loginTouchUpInside(_ sender: UIButton) {
        checkIDAndPassword()
    }
    
    @IBAction private func clearTouchUpInside(_ sender: UIButton) {
        usernameTextField.text = ""
        passwordTextField.text = ""
        resultLabel.text = ""
    }
}

//MARK: - UITextFieldDelegate
extension Bai3ViewController :UITextFieldDelegate {
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
