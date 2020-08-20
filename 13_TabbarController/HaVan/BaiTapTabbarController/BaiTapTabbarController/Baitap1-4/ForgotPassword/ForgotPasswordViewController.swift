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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextField.text?.removeAll()
        newPasswordTextField.text?.removeAll()
        confirmNewPasswordTextField.text?.removeAll()
    }
    
    // MARK: - Override functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        getKeyboardDown()
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
        guard let resultError = InformationFactory.shared.changePassword(username: username, newpassword: password, confirmNewPassword: confirmPassword) else {
            navigationController?.popViewController(animated: true)
            return
        }
        errorLabel.isHidden = false
        errorLabel.text = resultError
        getKeyboardDown()
    }
    
    private func getKeyboardDown() {
        usernameTextField.resignFirstResponder()
        newPasswordTextField.resignFirstResponder()
        confirmNewPasswordTextField.resignFirstResponder()
    }
    
    // MARK: - IBActions
    @IBAction private func resetPasswordButtonTouchUpInside(_ sender: UIButton) {
        resetPassword()
    }
}

// MARK: - UITextFieldDelegate
extension ForgotPasswordViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameTextField:
            newPasswordTextField.becomeFirstResponder()
        case newPasswordTextField:
            confirmNewPasswordTextField.becomeFirstResponder()
        default:
            resetPassword()
        }
        return true
    }
}
