//
//  RegisterViewController.swift
//  Tab bar Controller
//
//  Created by Ngoc Khanh Phan on 8/17/20.
//  Copyright © 2020 Ngoc Khanh Phan. All rights reserved.
//

import UIKit

final class RegisterViewController: UIViewController {
    
    // MARK: - IBOutlets:
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPWTextField: UITextField!
    @IBOutlet weak var createAccountTextField: UIButton!
    @IBOutlet weak var wrongConfirmingLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customRegisterView()
        setupNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Private functions
    private func customRegisterView() {
        usernameTextField.layer.masksToBounds = true
        usernameTextField.layer.cornerRadius = 20
        usernameTextField.layer.borderColor = UIColor.systemOrange.cgColor
        usernameTextField.layer.borderWidth = 1
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.layer.borderColor = UIColor.systemOrange.cgColor
        passwordTextField.layer.borderWidth = 1
        confirmPWTextField.layer.masksToBounds = true
        confirmPWTextField.layer.cornerRadius = 20
        confirmPWTextField.layer.borderColor = UIColor.systemOrange.cgColor
        confirmPWTextField.layer.borderWidth = 1
        createAccountTextField.layer.cornerRadius = 20
    }
    
    private func setupNavigation() {
        title = "Register"
        navigationController?.navigationBar.tintColor = .systemOrange
    }
    
    @IBAction private func signupTouchUpInside(_ sender: Any) {
        if passwordTextField.text == confirmPWTextField.text {
            SceneDelegate.shared.changeRootViewController(root: .tabbar)
        } else {
            wrongConfirmingLabel.isHidden = false
        }
    }
    
    @objc private func popToLogin() {
        navigationController?.popViewController(animated: true)
    }
}
