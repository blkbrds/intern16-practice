//
//  LoginViewController.swift
//  BaitapMVVM
//
//  Created by PCI0001 on 8/12/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    // MARK: - Properties
    var viewModel = LoginViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        getBaseData()
    }

    // MARK: - Private methods
    private func configUI() {
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }

    private func getBaseData() {
        viewModel.getUserInfoLocal(completion: { userInforDict in
            let userName = userInforDict.keys.first ?? ""
            userNameTextField.text = userName
            passwordTextField.text = userInforDict[userName]
        })
    }
    
    // MARK: - IBAction
   @IBAction private func loginButtonTouchUpInSide(_ sender: UIButton) {
    viewModel.validateUserNamePassword(userName: userNameTextField.text ?? "", password: passwordTextField.text ?? "", completion: {isValidate in
            if isValidate {
                AppDelegate.shared.changeRoot(rootType: .tabbar)
            }
        })
    }
}
    
// MARK: - Extension UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
}
