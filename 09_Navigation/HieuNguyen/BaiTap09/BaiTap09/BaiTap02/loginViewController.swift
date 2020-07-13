//
//  loginViewController.swift
//  BaiTap09
//
//  Created by hieungq on 7/8/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        let buttonBarItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(loginToNextScreen))
        navigationItem.rightBarButtonItem = buttonBarItem
        messageLabel.isHidden = true
        userNameTextField.delegate = self
        passWordTextField.delegate = self        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        userNameTextField.text = ""
        passWordTextField.text = ""
    }
    
    @objc func loginToNextScreen() {
        // get data from data.plist
        if let path = Bundle.main.path(forResource: "data", ofType: "plist") {
            if let dic = NSDictionary(contentsOfFile: path) as? [String: String] {
                for user in dic {
                    if userNameTextField.text == user.key && passWordTextField.text == user.value {
                        let homeVC = HomeViewController()
                        homeVC.userName = user.key
                        messageLabel.isHidden = true
                        navigationController?.pushViewController(homeVC, animated: true)
                        return
                    }
                    messageLabel.isHidden = false
                    messageLabel.text = "Something was wrong"
                }
            }
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .next {
            passWordTextField.becomeFirstResponder()
        } else {
            loginToNextScreen()
        }
        return true
    }
}
