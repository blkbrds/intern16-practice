//
//  Bai3ViewController.swift
//  BaiTapView
//
//  Created by Trung Le D. on 7/1/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class Bai3ViewController: UIViewController {
    //MARK: - Outlet
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnClear: UIButton!
    //MARK: - Properties
    let userName = "Admin"
    let admin = "Admin123"
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        userNameTextField.delegate = self
        passWordTextField.delegate = self
        let tapToScreen = UITapGestureRecognizer(target: self, action: #selector(tapToScreen(_:)))
        view.addGestureRecognizer(tapToScreen)
        btnLogin.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        btnClear.addTarget(self, action: #selector(clearPressed), for: .touchUpInside)
    }
    //MARK: - Function
    func setUpTextField(textField : UITextField) {
        if textField.tag == 0 {
            textField.returnKeyType = .next
        } else {
            textField.returnKeyType = .done
        }
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 3
        textField.layer.shadowOffset = CGSize(width: 5, height: 5)
        textField.layer.shadowOpacity = 0.7
        textField.layer.shadowRadius = 5
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
    }
    
    func setUpButton( button : UIButton) {
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor(white: 0x000000, alpha: 1.0).cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 0
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
    }
    private func initView() {
        userNameTextField.tag = 0
        passWordTextField.tag = 1
        setUpTextField(textField: userNameTextField)
        setUpTextField(textField: passWordTextField)
        setUpButton(button: btnLogin)
        setUpButton(button: btnClear)
        errorLabel.isHidden = true
        passWordTextField.isSecureTextEntry = true
    }

    func exception(stringData: (String, String)) -> String {
        var errorString = ""
        switch stringData {
        case ("", ""):
            errorString = "Bạn chưa nhập dữ liệu"
        case ("", _):
            errorString = "Bạn chưa điền username"
        case (_, ""):
            errorString = "Bạn chưa điền password"
        default:
            errorString = "Nhập sai tên username hoặc password"
        }
        return errorString
    }
    func login() {
        if let userName = userNameTextField.text, let password = passWordTextField.text {
            let stringData: (String, String) = (userName, password)
            if stringData == (userName, admin) {
                errorLabel.isHidden = true
                print("Đăng nhập thành công")
            } else {
                errorLabel.isHidden = false
                errorLabel.text = exception(stringData: stringData)
                errorLabel.textColor = .red
            }
        }
    }
    //MARK: - Action
    @IBAction func loginPressed(_ sender: Any) {
        login()
        passWordTextField.endEditing(true)
    }
    @IBAction func clearPressed(_ sender: Any) {
        userNameTextField.text = nil
        passWordTextField.text = nil
        errorLabel.isHidden = true
    }
    @objc private func tapToScreen(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
//MARK: - Extension
extension Bai3ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            passWordTextField.becomeFirstResponder()
        }
        if textField.tag == 1 {
            login()
        }
    }
}

