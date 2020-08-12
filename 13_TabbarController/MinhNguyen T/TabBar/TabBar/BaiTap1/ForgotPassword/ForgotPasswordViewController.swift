//
//  ForgotPasswordViewController.swift
//  TabBar
//
//  Created by MacBook Pro on 8/9/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class ForgotPasswordViewController: UIViewController {
    
    enum Suit: String {
        case emty = "-> khong duoc de trong"
        case onlyemty = "-> nhap het cac truong"
        case wrongdata = "-> ten dang nhap khong ton tai"
    }

    // MARK: - @IBOutlets
    @IBOutlet private weak var usernameTexField: UITextField!
    @IBOutlet private weak var newPassword: UITextField!
    @IBOutlet private weak var confirmNewPassword: UITextField!
    @IBOutlet private weak var notificationLabel: UILabel!
    @IBOutlet private weak var submitButton: UIButton!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.layer.cornerRadius = 10
    }

    // MARK: - Private functions
    private func handleSubmit() {
        guard let username = usernameTexField.text, let password = newPassword.text, let confirmpw = confirmNewPassword.text else { return }
        let result: (String?, String?, String?) = (username, password,confirmpw)
        switch result {
        case ("","",""), (nil, nil, nil):
            notificationLabel.text =  Suit.emty.rawValue
        case ("", _, ""), (_, "",""), (_,"",""):
            notificationLabel.text = Suit.onlyemty.rawValue
        case (username, password, confirmpw):
            if LoginManager.shared.forgotPassword(username: username, newPass: password, confirmNewPass: confirmpw){
                AppDelegate.shared.changeRoot(rootType: .login)
            } else {
                notificationLabel.text = Suit.wrongdata.rawValue
            }
        default:
            notificationLabel.text = Suit.wrongdata.rawValue
        }
    }

    // MARK: @IBActions
    @IBAction private func handleSubmitButtonTouchUpInside(_ sender: UIButton) {
        handleSubmit()
    }
}
