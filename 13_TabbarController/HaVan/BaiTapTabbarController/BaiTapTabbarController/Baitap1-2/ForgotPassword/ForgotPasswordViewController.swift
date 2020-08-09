//
//  ForgotPasswordViewController.swift
//  BaiTapTabbarController
//
//  Created by NganHa on 8/7/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class ForgotPasswordViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var newPasswordTextField: UITextField!
    @IBOutlet private weak var confirmNewPasswordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        configTextField()
    }
    
    // MARK: - Override functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameTextField.resignFirstResponder()
        newPasswordTextField.resignFirstResponder()
        confirmNewPasswordTextField.resignFirstResponder()
    }
    
    // MARK: - Private functions
    private func configTextField() {
        usernameTextField.delegate = self
        newPasswordTextField.delegate = self
        confirmNewPasswordTextField.delegate = self
    }
    
    private func resetPassword() {
        guard let username = usernameTextField.text, let password = newPasswordTextField.text,
            let confirmPassword = confirmNewPasswordTextField.text else {
                errorLabel.isHidden = false
                errorLabel.text = "You need to filled all the textfields"
                return
        }
        if !InformationFactory.shared.checkPassword(newpassword: password, confirmNewPassword: confirmPassword) {
            errorLabel.isHidden = false
            errorLabel.text = "The new password and confirm new password have to be the same"
        } else if InformationFactory.shared.changePassword(username: username, newpassword: password, confirmNewPassword: confirmPassword) {
            navigationController?.popToRootViewController(animated: true)
        } else {
            errorLabel.isHidden = false
            errorLabel.text = "The username doesn't exist"
        }
    }
    
    // MARK: - IBActions
    @IBAction private func resetPasswordButtonTouchUpInside(_ sender: UIButton) {
        resetPassword()
    }
}

// MARK: - UITextFieldDelegate
extension ForgotPasswordViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === usernameTextField {
            newPasswordTextField.becomeFirstResponder()
        } else if textField === newPasswordTextField {
            confirmNewPasswordTextField.becomeFirstResponder()
        } else {
            resetPassword()
        }
        return true
    }
}
