//
//  BaiTap3ViewController.swift
//  BaiTapView
//
//  Created by NganHa on 6/30/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

class BaiTap3ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorName: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpForButton(with: loginButton)
        setUpForButton(with: clearButton)
        setUpForTextField(with: usernameTextField)
        setUpForTextField(with: passwordTextField)
        errorName.textColor = UIColor.red
        errorName.isHidden = true
        usernameTextField.delegate =  self
        passwordTextField.delegate =  self
       
    }
    
    func setUpForButton(with button : UIButton) {
        button.layer.cornerRadius = 5
    }
    
    func setUpForTextField(with textField: UITextField) {
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
    
    //touch in screen with hidden keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func login(){
        errorName.isHidden = false
        if usernameTextField.text == "Admin" && passwordTextField.text == "Admin123" {
            errorName.text = "Congratulation on successful login"
        } else if usernameTextField.text == "" || passwordTextField.text == "" {
            errorName.text = "You have to fill all of fields"
        } else {
            errorName.text = "You entered the wrong name or password"
        }
    }
    
    @IBAction func loginButtonTouchUpInside(_ sender: UIButton) {
        login()
    }
    
    @IBAction func clearButtonTouchUpInside(_ sender: UIButton) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // compare the address of textField and usernameTextField
        if textField === usernameTextField {
            passwordTextField.becomeFirstResponder()
            return true
        } else {
            login()
            view.endEditing(true)
            return true
        }
        
    }

}
