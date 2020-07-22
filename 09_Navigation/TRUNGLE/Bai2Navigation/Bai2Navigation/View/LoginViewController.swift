//
//  LoginViewController.swift
//  Bai2Navigation
//
//  Created by Trung Le D. on 7/21/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    enum Notifications: String {
        case fullEmpty = "Yêu cầu bạn nhập đầy đủ"
        case halfEmpty = "Bạn nhập thiếu "
        case wrongInformation = " Không đúng"
    }
    
    // MARK: - IBOulets
    @IBOutlet weak var informationLabel: UILabel!
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
        informationLabel.text = ""
    }
    
    // MARK: - Private methods
    private func configUI() {
        userNameTextField.delegate = self
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
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .next {
            passwordTextField.becomeFirstResponder()
        } else {
            pushHomeViewTouchUpInside()
        }
        return true
    }
}
