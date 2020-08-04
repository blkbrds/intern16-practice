//
//  BaiTap2ViewController.swift
//  Navigation
//
//  Created by MacBook Pro on 7/21/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap2ViewController: UIViewController {
    
    enum Suit: String {
        case emty = "-> khong duoc de trong"
        case onlyemty = "-> nhap het cac truong"
        case wrongdata = "-> sai password/mat khau"
    }
    
    // MARK: - IBOulets
    @IBOutlet private weak var usernameTexField: UITextField!
    @IBOutlet private weak var passwordTexField: UITextField!
    @IBOutlet private weak var notificationLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        navigationController?.navigationBar.barTintColor = .red
        configDoneButton()
    }
    
    // MARK: - Private functions
    private func configDoneButton() {
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(loginView))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    private func login() {
        if let path = Bundle.main.path(forResource: "data", ofType: "plist") {
            if let dic = NSDictionary(contentsOfFile: path) as? [String: String] {
                for account in dic {
                    let result: (String?, String?) = (usernameTexField.text, passwordTexField.text)
                    switch result {
                    case ("", ""), (nil, nil):
                        notificationLabel.text =  Suit.emty.rawValue
                    case ("", _), (_, ""):
                        notificationLabel.text = Suit.onlyemty.rawValue
                    case (account.key, account.value):
                        let nextVC = HomeViewController()
                        nextVC.delegate = self
                        navigationController?.pushViewController(nextVC, animated: true)
                        nextVC.username = account.key
                    default:
                        notificationLabel.text = Suit.wrongdata.rawValue
                    }
                }
            }
        }
    }
    
    // MARK: - Objc funtions
    @objc private func loginView() {
        login()
    }
}

// MARK: - HomeViewControllerDelegate
extension BaiTap2ViewController: HomeViewControllerDelegate {
    func resetTextField(_ controller: HomeViewController, needsPerform action: HomeViewController.Action) {
        switch action {
        case .resetTextField:
            usernameTexField.text = ""
            passwordTexField.text = ""
            notificationLabel.text = ""
        }
    }
}
