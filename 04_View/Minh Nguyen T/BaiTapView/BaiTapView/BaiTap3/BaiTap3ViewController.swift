//
//  BaiTap3ViewController.swift
//  BaiTapView
//
//  Created by MacBook Pro on 7/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap3ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak private var usernameTextField: UITextField!
    @IBOutlet weak private var thongbaoLabel: UILabel!
    @IBOutlet weak private var loginButton: UIButton!
    @IBOutlet weak private var clearButton: UIButton!
    @IBOutlet weak private var passwordTextField: UITextField!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.layer.borderWidth = 1.5
        usernameTextField.layer.cornerRadius = 7
        passwordTextField.layer.borderWidth = 1.5
        passwordTextField.layer.cornerRadius = 7
        loginButton.layer.cornerRadius = 7
        clearButton.layer.cornerRadius = 7
        
        //TODO: lây sự kiện nhân vào màn hinh để ẩn ban phim
        configureTapGesture()
        
        //TODO:
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    //MARK: - Enum
    // Các trường hợp trả về cho login
    enum Suit: String {
        case khongnhap = "-> khong duoc de trong"
        case trong1 = "-> nhap het cac truong"
        case nhapsai = "-> sai password/mat khau"
    }
    //MARK: - Private Funtions
    private func Login() {
        if usernameTextField.text == "" && passwordTextField.text == "" {
            thongbaoLabel.text =  Suit.khongnhap.rawValue
        } else if usernameTextField.text == ""  || passwordTextField.text == "" {
            thongbaoLabel.text = Suit.trong1.rawValue
        } else if usernameTextField.text != "admin" && passwordTextField.text != "admin123" {
            thongbaoLabel.text = Suit.nhapsai.rawValue
        } else {
            thongbaoLabel.text = ""
            print("OKKKKKK")
        }
    }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    //MARK: - Objc Funtions
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    //MARK: - IBAction Funtion
    // Sự kiện khi nhấn vào "login"
    @IBAction func Login(_ sender: Any) {
        Login()
    }
    
    // Sự kiên cho "clear"
    @IBAction func Clear(_ sender: Any) {
        thongbaoLabel.text = ""
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}

// MARK: - Extention
extension BaiTap3ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // TODO: return key action
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField === usernameTextField {
            passwordTextField.becomeFirstResponder()
        }
        if textField === passwordTextField {
            Login()
        }
    }
    
    
}
