//
//  BaiTap3ViewController.swift
//  BaiTapView
//
//  Created by NganHa on 6/30/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap3ViewController: UIViewController{
    
    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorNameLabel: UILabel!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var clearButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpForButton(with: loginButton)
        setUpForButton(with: clearButton)
        setUpForTextField(with: usernameTextField)
        setUpForTextField(with: passwordTextField)
        errorNameLabel.textColor = UIColor.red
        errorNameLabel.isHidden = true
    }
    
    // MARK: - Override functions
    //touch in screen with hidden keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - Private functions
    private func setUpForButton(with button : UIButton) {
        button.layer.cornerRadius = 5
    }
    
    private func setUpForTextField(with textField: UITextField) {
        textField.delegate = self
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        if textField === usernameTextField {
            usernameTextField.placeholder = "username"
        } else {
            usernameTextField.placeholder = "password"
        }
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "enter something", attributes: [.font : UIFont.italicSystemFont(ofSize: 14)])
    }
    
    private func login() {
        guard let username = usernameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        errorNameLabel.isHidden = false
        if usernameTextField.text == "Admin" && passwordTextField.text == "Admin123" {
            errorNameLabel.text = "Congratulation on successful login"
        } else if username.isEmpty || password.isEmpty {
            errorNameLabel.text = "You have to fill all of fields"
        } else {
            errorNameLabel.text = "You entered the wrong name or password"
        }
    }
    
    // MARK: - IBActions
    @IBAction private func loginButtonTouchUpInside(_ sender: UIButton) {
        login()
    }
    
    @IBAction private func clearButtonTouchUpInside(_ sender: UIButton) {
        usernameTextField.text = ""
        passwordTextField.text = ""
        errorNameLabel.isHidden = true
    }
}

//MARK: - Extension
extension BaiTap3ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // compare the address of textField and usernameTextField
        if textField === usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            view.endEditing(true)
            login()
        }
        return true
    }
}
