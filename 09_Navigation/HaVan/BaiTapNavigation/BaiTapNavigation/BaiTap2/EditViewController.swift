//
//  EditViewController.swift
//  BaiTapNavigation
//
//  Created by NganHa on 7/22/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate: class {
    func controller(_ controller: EditViewController, perform action: EditViewController.Action)
}

final class EditViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var newPasswordTextField: UITextField!
    @IBOutlet private weak var confirmNewPasswordTextField: UITextField!
    
    // MARK: - Propeties
    weak var delegate: EditViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        errorLabel.isHidden = true
        configTextField()
    }
    
    // MARK: - Override functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - Private functions
    private func configTextField() {
        usernameTextField.delegate = self
        newPasswordTextField.delegate = self
        confirmNewPasswordTextField.delegate = self
    }
    
    private func configNavigationBar() {
        title = "Edit"
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(backToHomeWithoutEdit))
        navigationItem.leftBarButtonItem = cancelButton
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(backToHomeWithEdit))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    private func checkConditionTextField() -> Bool {
        guard let newPassword = newPasswordTextField.text, let confirmNewPassword = confirmNewPasswordTextField.text,let username = usernameTextField.text else {
            errorLabel.isHidden = false
            errorLabel.text = "You must to fill all the field"
            return false
        }
        if newPassword.isEmpty || confirmNewPassword.isEmpty || username.isEmpty {
            errorLabel.isHidden = false
            errorLabel.text = "You must to fill all the field"
            return false
        }
        if newPassword != confirmNewPassword {
            errorLabel.isHidden = false
            errorLabel.text = "Confirm new password and new password must to be the same"
            return false
        } else {
            return true
        }
    }
    
    private func updateInformation() {
        if checkConditionTextField() {
            guard let name = usernameTextField.text else { return }
            delegate?.controller(self, perform: .changeValue(with: name))
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    // MARK: - Objc functions
    @objc func backToHomeWithoutEdit() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func backToHomeWithEdit() {
        updateInformation()
    }
}

//MARK: -Extension
extension EditViewController {
    enum Action {
        case changeValue(with : String)
    }
}

extension EditViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === usernameTextField {
            newPasswordTextField.becomeFirstResponder()
            return true
        } else if textField === newPasswordTextField  {
            confirmNewPasswordTextField.becomeFirstResponder()
            return true
        } else {
            updateInformation()
            return true
        }
    }
}
