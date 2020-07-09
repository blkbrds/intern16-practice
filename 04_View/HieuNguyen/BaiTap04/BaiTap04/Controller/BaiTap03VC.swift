//
//  BaiTap03VC.swift
//  BaiTap04
//
//  Created by PCI0020 on 6/29/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class BaiTap03VC: UIViewController {
    
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        userNameTextField.delegate = self
        passWordTextField.delegate = self
    }

    @IBAction func loginButtonTouchUpInside(_ sender: Any) {
        if userNameTextField.text == "" || passWordTextField.text != ""{
            errorLabel.isHidden = false
            errorLabel.text = "Fill all input"
            loginButton.isEnabled = false
        }
        if userNameTextField.text != "Admin" || passWordTextField.text != "Admin123" {
            errorLabel.isHidden = false
            errorLabel.text = "Login Fail"
        } else {
            errorLabel.isHidden = false
            errorLabel.text = "Login Success"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func clearBtnWasPressed(_ sender: Any) {
        userNameTextField.text = ""
        passWordTextField.text = ""
    }
    
}

extension BaiTap03VC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == self.userNameTextField) {
            self.passWordTextField.becomeFirstResponder()
        } else {
            loginButtonTouchUpInside(UIButton?.self)
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        loginButton.isEnabled = true
        if (textField == self.userNameTextField) {
            userNameTextField.returnKeyType = UIReturnKeyType.next
        } else {
            passWordTextField.returnKeyType = UIReturnKeyType.done
        }
    }
}
