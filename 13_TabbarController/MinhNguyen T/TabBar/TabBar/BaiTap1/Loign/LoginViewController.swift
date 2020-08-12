//
//  LoginViewController.swift
//  TabBar
//
//  Created by MacBook Pro on 8/8/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {

    enum Suit: String {
        case emty = "-> khong duoc de trong"
        case onlyemty = "-> nhap het cac truong"
        case wrongdata = "-> sai password/mat khau"
    }

    // MARK: - @IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var notificationLabel: UILabel!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Private functions
    private func handleLogin() {
        guard let username = usernameTextField.text, let password = passwordTextField.text else { return }
        let result: (String?, String?) = (username, password)
        switch result {
        case ("", ""), (nil, nil):
            notificationLabel.text =  Suit.emty.rawValue
        case ("", _), (_, ""):
            notificationLabel.text = Suit.onlyemty.rawValue
        case (username, password):
            if LoginManager.shared.checkAccount(username: username, password: password) {
                AppDelegate.shared.changeRoot(rootType: .tabbar)
            }
        default:
            notificationLabel.text = Suit.wrongdata.rawValue
        }
    }

    // MARK: - @IBActions
    @IBAction private func handleLoginButtonTouchUpInside(_ sender: UIButton) {
        handleLogin()
    }

    @IBAction private func handleSignUpButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }

    @IBAction private func handleForgotButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.pushViewController(ForgotPasswordViewController(), animated: true)
    }
}
