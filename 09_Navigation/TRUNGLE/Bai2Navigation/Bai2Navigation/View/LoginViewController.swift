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
            title = "Login"
            let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(pushHomeViewTouchUpInside))
            navigationItem.rightBarButtonItem = doneButton
        }
        
        @objc private func pushHomeViewTouchUpInside() {
            if let path = Bundle.main.path(forResource: "user", ofType: "plist") {
                if let dic = NSDictionary(contentsOfFile: path) as? [String:String] {
                    for account in dic {
//                        let result: (String?, String?) = (userNameTextField.text, passwordTextField.text)
//                        switch result {
//                        case ("",""):
//                            informationLabel.text = Notifications.fullEmpty.rawValue
//                        case ("", _), (_, ""):
//                            informationLabel.text = Notifications.halfEmpty.rawValue
//                        case (account.key, account.value):
//                            let nextHomeView = HomeViewController()
//                            navigationController?.pushViewController(nextHomeView, animated: true)
//                        default:
//                            informationLabel.text = Notifications.wrongInformation.rawValue
                        print(account)
                        
                        }
                    }
                }
            }
        }
    //}
