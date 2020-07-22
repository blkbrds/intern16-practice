//
//  LoginViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/22/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate: class {
    func setValue(_ loginViewController: LoginViewController, username: String)
}

final class LoginViewController: UIViewController {

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        configUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    // MARK: - Private function
    private func configUI() {
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(processLogin))
        navigationItem.rightBarButtonItem = doneButton
        let backButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
    @objc private func processLogin() {
        let username = usernameTextField.text
        let password = passwordTextField.text
        if username == "admin123" && password == "admin" {
            let homeViewController = HomeViewController()
            navigationController?.pushViewController(homeViewController, animated: true)
            guard let username = username else { return }
            homeViewController.username = username
        }
    }
}
