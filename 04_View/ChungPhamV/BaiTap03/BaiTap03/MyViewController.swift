//
//  MyViewController.swift
//  BaiTap03
//
//  Created by MBA0168 on 6/7/20.
//  Copyright © 2020 chungiOS. All rights reserved.
//

import UIKit

final class MyViewController: UIViewController {
    
    let userName: String = "Admin"
    let password: String = "Admin123"
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    enum LoginValidation: String{
        case blankPassandUsername = "Please input username and password."
        case blankUserName = "Please input username."
        case blankPassword =  "Please input password."
        case invalid = "Invalid username or password."
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Place holder
        userNameTextField.placeholder = "Username"
        passwordTextField.placeholder = "Password"
        
        // Secure password
        passwordTextField.isSecureTextEntry = true
        // delegate
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        // Hide keyboard when touch outsidde
        dismissKey()
        //view.endEditing(true)
    }
    func checkLogin() -> LoginValidation{
        if userNameTextField.text == "" && passwordTextField.text == "" {
            return .blankPassandUsername
        }else if userNameTextField.text == "" {
            return .blankUserName
        } else if passwordTextField.text == "" {
            return .blankPassword
        } else {
            return .invalid
        }
    }
    
    func login(){
        if userNameTextField.text == userName && passwordTextField.text == password{
            errorLabel.isHidden = true
            userNameTextField.endEditing(true)
            passwordTextField.endEditing(true)
        }
        else {
            errorLabel.isHidden = false
            errorLabel.text = checkLogin().rawValue
            userNameTextField.endEditing(true)
            passwordTextField.endEditing(true)
        }
    }
    
    
    
    @IBAction func loginButton(_ sender: Any) {
        login()
    }
    
    @IBAction func clearButton(_ sender: Any) {
        userNameTextField.text = ""
        passwordTextField.text = ""
        userNameTextField.endEditing(true)
        view.endEditing(true)
    }

}
extension UIViewController {
    func dismissKey(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboard))
        //tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)

    }

    @objc func dismissKeyboard(){
    view.endEditing(true)
    }

}
extension MyViewController : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == userNameTextField {
            textField.tag = 0
            textField.returnKeyType = UIReturnKeyType.next
        } else if textField == passwordTextField{
            textField.tag = 1
            textField.returnKeyType = UIReturnKeyType.done
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            passwordTextField.becomeFirstResponder()
        } else {
            login()
        }
    }
}

