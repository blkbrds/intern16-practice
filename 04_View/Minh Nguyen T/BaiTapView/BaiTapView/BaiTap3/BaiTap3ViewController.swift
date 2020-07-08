//
//  BaiTap3ViewController.swift
//  BaiTapView
//
//  Created by MacBook Pro on 7/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap3ViewController: UIViewController {
    //MARK: - Enum
    // Các trường hợp trả về cho login
    enum Suit: String {
        case khongnhap = "-> khong duoc de trong"
        case trong1 = "-> nhap het cac truong"
        case nhapsai = "-> sai password/mat khau"
    }
    
    // MARK: - IBOutlets Properties
    @IBOutlet weak private var usernameTextField: UITextField!
    @IBOutlet weak private var thongbaoLabel: UILabel!
    @IBOutlet weak private var loginButton: UIButton!
    @IBOutlet weak private var clearButton: UIButton!
    @IBOutlet weak private var passwordTextField: UITextField!
    
    //MARK: - Private Properties
    private let username: String = "admin"
    private let password: String = "admin123"
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextField()
        configureTapGesture()
    }
    
    //MARK: - Private Funtions
    private func configTextField() {
        usernameTextField.layer.borderWidth = 1.5
        usernameTextField.layer.cornerRadius = 7
        passwordTextField.layer.borderWidth = 1.5
        passwordTextField.layer.cornerRadius = 7
        loginButton.layer.cornerRadius = 7
        clearButton.layer.cornerRadius = 7
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func login() {
        if usernameTextField.text!.isEmpty && passwordTextField.text!.isEmpty {
            thongbaoLabel.text =  Suit.khongnhap.rawValue
        } else if (usernameTextField.text)!.isEmpty || (passwordTextField.text)!.isEmpty {
            thongbaoLabel.text = Suit.trong1.rawValue
        } else if usernameTextField.text != "admin" && passwordTextField.text != "admin123" {
            thongbaoLabel.text = Suit.nhapsai.rawValue
        } else {
            thongbaoLabel.text = ""
        }
    }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    //MARK: - Objc Funtions
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: - IBAction Funtion
    // Sự kiện khi nhấn vào "login"
    @IBAction private func loginButtonTouchUpInIsde(_ sender: UIButton) {
        login()
    }
    
    // Sự kiên cho "clear"
    @IBAction private func clearButtonTouchUpInIsde(_ sender: UIButton) {
        thongbaoLabel.text = ""
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}

// MARK: - UITextFieldDelegate
extension BaiTap3ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // TODO: return key action
        if textField === usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField === passwordTextField {
            login()
        }
        return true
    }
}
