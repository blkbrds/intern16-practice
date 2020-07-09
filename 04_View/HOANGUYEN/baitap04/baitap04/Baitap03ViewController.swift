//
//  baitap03ViewController.swift
//  baitap04
//
//  Created by NXH on 6/30/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class Baitap03ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var outletLoginButton: UIButton!
    @IBOutlet weak var outletClearButton: UIButton!
    @IBOutlet weak var checkLoginLabel: UILabel!
    
    let userName: String = "Admin"
    let pass: String = "Admin123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customBtn(btn: outletLoginButton)
        customBtn(btn: outletClearButton)
        passwordTextField.isSecureTextEntry = true
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    //    chạm vào màn hình thì gọi hàm này
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        view.endEditing(true)
    }
    
    @IBAction func actionLoginButtonTouchUpInside(_ sender: UIButton) {
        userLogin()
    }
    
    @IBAction func actionClearButtonTouchUpInside(_ sender: UIButton) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    func customBtn(btn: UIButton) -> UIButton {
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.black.cgColor
        return btn
    }
    
    func userLogin(){
        if userNameTextField.text == "Admin" && passwordTextField.text == "Admin123" {
            checkLoginLabel.text = "Login thành công"
        }
        else if userNameTextField.text! == "", passwordTextField.text! == "" {
            print("Nhập gì đi chứ sao lại để trống thế kia :((")
        }
        else {
            checkLoginLabel.text = "Nhập username và password sai"
        }
    }
    
    //    nếu nhấn "return" trên keyboard thì gọi hàm này
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === userNameTextField {
            passwordTextField.becomeFirstResponder()
        }
        if textField === passwordTextField {
            userLogin()
        }
        return true
    }
}
