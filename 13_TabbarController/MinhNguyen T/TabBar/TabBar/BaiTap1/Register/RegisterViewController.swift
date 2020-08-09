//
//  RegisterViewController.swift
//  TabBar
//
//  Created by MacBook Pro on 8/8/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class RegisterViewController: UIViewController {
    
    enum Suit: String {
        case emty = "-> khong duoc de trong"
        case onlyemty = "-> nhap het cac truong"
        case wrongdata = "-> ten dang nhap da ton tai"
    }
    
    // MARK: - @IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var registerButton: UIButton!
    @IBOutlet private weak var notificationLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.layer.cornerRadius = 10
    }

    // MARK: - Private functions
    private func handleRegister() {
        guard let username = usernameTextField.text, let password = passwordTextField.text, let confirmpw = confirmPasswordTextField.text else { return }
        let result: (String?, String?, String?) = (username, password,confirmpw)
        switch result {
        case ("","",""), (nil, nil, nil):
            notificationLabel.text =  Suit.emty.rawValue
        case ("", _, ""), (_, "",""),(_,"",""):
            notificationLabel.text = Suit.onlyemty.rawValue
        case (username, password,confirmpw):
            if LoginManager.shared.registerAccount(username: username, password: password, confirmpw: confirmpw){
                AppDelegate.shared.changeRoot(rootType: .login)
            } else {
                notificationLabel.text = Suit.wrongdata.rawValue
            }
        default:
            notificationLabel.text = Suit.wrongdata.rawValue
        }
    }
    
    // MARK: - @IBActions
    @IBAction func handleRegisterButtonTouchUpInside(_ sender: UIButton) {
        handleRegister()
    }
}
