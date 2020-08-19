//
//  LoginViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/22/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var erorLabel: UILabel!

    // MARK: - Configure
    private struct Configure {
        static let titleName = "Login"
        static let titleDoneButton = "Done"
        static let titleLogoutButton = "Logout"
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Configure.titleName
        configUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }

    // MARK: - Private function
    private func configUI() {
        let doneButton = UIBarButtonItem(title: Configure.titleDoneButton, style: .plain, target: self, action: #selector(processLogin))
        navigationItem.rightBarButtonItem = doneButton
        let backButton = UIBarButtonItem(title: Configure.titleLogoutButton, style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
    }

    @objc private func processLogin() {
        let username = usernameTextField.text
        let password = passwordTextField.text
        if let path = Bundle.main.path(forResource: "Data", ofType: "plist"), let myDict = NSDictionary(contentsOfFile: path) as? [String: String] {
            for i in myDict {
                if i.key == username && i.value == password {
                    let homeViewController = HomeViewController()
                    navigationController?.pushViewController(homeViewController, animated: true)
                    homeViewController.username = i.key
                }
            }
        }
    }
}
