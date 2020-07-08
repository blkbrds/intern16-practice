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
    @IBOutlet private weak var errorName: UILabel!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var clearButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpForButton(with: loginButton)
        setUpForButton(with: clearButton)
        setUpForTextField(with: usernameTextField)
        setUpForTextField(with: passwordTextField)
        errorName.textColor = UIColor.red
        errorName.isHidden = true
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
        usernameTextField.delegate =  self
        passwordTextField.delegate =  self
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        var placeHolder = "abc"
        if textField === usernameTextField {
            placeHolder = "username"
        } else {
            placeHolder = "password"
        }
        textField.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [.font : UIFont.italicSystemFont(ofSize: 14)])
    }
    
    private func login() {
        errorName.isHidden = false
        if usernameTextField.text == "Admin" && passwordTextField.text == "Admin123" {
            errorName.text = "Congratulation on successful login"
        } else if usernameTextField.text == "" || passwordTextField.text == "" {
            errorName.text = "You have to fill all of fields"
        } else {
            errorName.text = "You entered the wrong name or password"
        }
    }
    
    // MARK: - IBActions
    @IBAction private func loginButtonTouchUpInside(_ sender: UIButton) {
        login()
    }
    
    @IBAction private func clearButtonTouchUpInside(_ sender: UIButton) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}

//MARK: - Extension
extension BaiTap3ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // compare the address of textField and usernameTextField
        if textField === usernameTextField {
            passwordTextField.becomeFirstResponder()
            return true
        } else {
            view.endEditing(true)
            login()
            return true
        }
    }
}
