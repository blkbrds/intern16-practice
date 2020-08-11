//
//  EditViewController.swift
//  baitap09
//
//  Created by NXH on 7/15/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate: class {
    func controller(_ controller: EditViewController, needsPerform action: EditViewController.Action)
}

final class EditViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var newPaswordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    
    // MARK: - Properties
    private var userDefault: UserDefaults = UserDefaults()
    weak var delegate: EditViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUIBarButton()
        usernameTextField.delegate = self
        newPaswordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
    
    // MARK: - Override Function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    // MARK: - Private Function
    private func configUIBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(tapOnDoneButtonBar))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(tapOnCancelButtonBar))
    }
    
    private func checkNewUserPassword() -> Bool {
        if let newName = usernameTextField.text,
            let password = newPaswordTextField.text,
            let confirm = confirmPasswordTextField.text,
            confirm == password {
            userDefault.set(newName, forKey: "username")
            return true
        }
        return false
    }
    
    // MARK: - Objc Function
    @objc private func tapOnDoneButtonBar() {
        view.endEditing(true)
        if checkNewUserPassword() {
            delegate?.controller(self, needsPerform: .updateUsername)
            navigationController?.popViewController(animated: true)
        } else {
            notificationLabel.text = "Change Fail"
        }
    }
    
    @objc private func tapOnCancelButtonBar() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Extension
extension EditViewController {
    enum Action {
        case updateUsername
    }
}

extension EditViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === usernameTextField {
            newPaswordTextField.becomeFirstResponder()
        }
        if textField === newPaswordTextField {
            confirmPasswordTextField.becomeFirstResponder()
        }
        if textField === confirmPasswordTextField {
            view.endEditing(true)
        }
        return true
    }
}
