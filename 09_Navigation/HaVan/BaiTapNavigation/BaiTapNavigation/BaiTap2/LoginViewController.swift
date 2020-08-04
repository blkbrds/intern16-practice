//
//  LoginViewController.swift
//  BaiTapNavigation
//
//  Created by NganHa on 7/21/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    //MARK: - Properties
    private var count = 0
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
        configErrorLabel()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        errorLabel.isHidden = true
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        count += 1
//        if count > 1 {
//            usernameTextField.text = ""
//            passwordTextField.text = ""
//        }
//    }
    
    // MARK: - Override functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    // MARK: - Private functions
    private func configNavigation() {
        title = "Login"
        let doneBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneBarButtonItemPressed))
        navigationItem.rightBarButtonItem = doneBarButtonItem
    }
    
    private func configErrorLabel() {
        errorLabel.font = UIFont(name: "Arial", size: 15)
        errorLabel.textColor = .red
    }
    
    private func login() {
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            errorLabel.isHidden = false
            errorLabel.text = "You must enter username and password"
            return
        }
        let checkResult = ManagementData.checkInformation(username: username, pass: password)
        if checkResult {
            let homeViewController = HomeViewController()
            homeViewController.username = username
            navigationController?.pushViewController(homeViewController, animated: true)
        } else {
            errorLabel.isHidden = false
            errorLabel.text = "You entered the wrong name or password"
        }
    }
    
    // MARK: - Objc functions
    @objc private func doneBarButtonItemPressed() {
        login()
    }
}

//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            login()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField === usernameTextField {
            textField.text?.removeAll()
        } else {
            passwordTextField.text?.removeAll()
        }
    }
}
