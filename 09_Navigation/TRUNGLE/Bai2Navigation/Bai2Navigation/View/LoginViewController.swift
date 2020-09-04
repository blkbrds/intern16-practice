//
//  LoginViewController.swift
//  Bai2Navigation
//
//  Created by Trung Le D. on 7/21/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Private methods
    private func configUI() {
        title = "Login"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(pushHomeViewTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }
    @objc private func pushHomeViewTouchUpInside() {
        if let path = Bundle.main.path(forResource: "user", ofType: "plist") {
            if let dic = NSDictionary(contentsOfFile: path) as? [String: String] {
                for user in dic {
                    if userNameTextField.text == user.key && passwordTextField.text == user.value {
                        let homeVC = HomeViewController()
                        homeVC.userName = userNameTextField.text!
                        navigationController?.pushViewController(homeVC, animated: true)
                        return
                    }
                }
            }
        }
    }
}
