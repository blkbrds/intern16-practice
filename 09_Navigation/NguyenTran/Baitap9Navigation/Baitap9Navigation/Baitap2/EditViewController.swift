//
//  EditViewController.swift
//  Baitap9Navigation
//
//  Created by MBA0245P on 9/6/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate: class {
    func controller(_ controller: EditViewController, needsPerform action: EditViewController.Action)
}

class EditViewController: UIViewController, UITextFieldDelegate {

    var username = ""
    weak var delegate: EditViewControllerDelegate?

    @IBOutlet weak var usernameTextField: UITextField!

    @IBOutlet weak var newPasswordTextField: UITextField!

    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Edit"

        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAction))
        navigationItem.leftBarButtonItem = cancelButton

        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneAction))
        navigationItem.rightBarButtonItem = doneButton
        usernameTextField.text = username
        usernameTextField.delegate = self
        newPasswordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        errorLabel.isHidden = true
    }

    func updateInfo() {
        if usernameTextField.text == "" || newPasswordTextField.text == "" || confirmPasswordTextField.text == "" {
            errorLabel.isHidden = false
            errorLabel.text = "Hãy nhập tất cả các trường"
            errorLabel.textColor = .systemRed
        } else {
            guard let username = usernameTextField.text, let newPassword = newPasswordTextField.text, let confirmPassword = confirmPasswordTextField.text else { return }
            if newPassword != confirmPassword {
                errorLabel.isHidden = false
                errorLabel.text = "Hãy nhập password ở 2 trường giống nhau"
                errorLabel.textColor = .systemRed
            } else {
                delegate?.controller(self, needsPerform: .updateInfo(username: username, pass: newPassword))
            }
        }

    }

    @objc func doneAction() {
        updateInfo()
        navigationController?.popViewController(animated: true)
    }

    @objc func cancelAction() {
        navigationController?.popViewController(animated: true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            textField.resignFirstResponder()
            newPasswordTextField.becomeFirstResponder()
        } else if textField == newPasswordTextField {
            textField.resignFirstResponder()
            confirmPasswordTextField.becomeFirstResponder()
        } else if textField == confirmPasswordTextField {
//            let homeViewController = HomeViewController()
//            let editViewController = EditViewController ()
//            guard let username = usernameTextField.text else { return false }
//            homeViewController.username = username
//            editViewController.username = username
            navigationController?.popViewController(animated: true)
        }
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension EditViewController {
    enum Action {
        case updateInfo(username: String, pass: String)
    }
}
