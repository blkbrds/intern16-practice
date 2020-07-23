//
//  LoginView.swift
//  Navigation
//
//  Created by PCI0007 on 7/16/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var wrongLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
        dismissKey()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        usernameTextField.text = ""
        passwordTextField.text = ""
        wrongLabel.isHidden = true
    }

    @IBAction func doneTouchUpInside(_ sender: UIBarButtonItem) {
        let homeView = HomeViewController()
        if let path = Bundle.main.path(forResource: "Data", ofType: "plist") {
            if let dic = NSDictionary(contentsOfFile: path) as? [String: String] {
                for user in dic {
                    if usernameTextField.text == user.key && passwordTextField.text == user.value {
                        self.navigationController?.pushViewController(homeView, animated: true)
                        homeView.name = "Welcome, \(user.key)"
                    }
                    else {
                        wrongLabel.text = "Wrong username or password"
                        wrongLabel.isHidden = false
                    }
                }
            }
        }
    }
    
    func dismissKey() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
