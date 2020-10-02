//
//  EditViewController.swift
//  Baitap9Navigation
//
//  Created by MBA0245P on 9/6/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {

    var username = ""

    @IBOutlet weak var usernameTextField: UITextField!

    @IBOutlet weak var newPasswordTextField: UITextField!

    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Edit"
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAction))
        navigationItem.leftBarButtonItem = cancelButton

        let doneButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(doneAction))
        navigationItem.rightBarButtonItem = doneButton
        usernameTextField.text = username
        usernameTextField.delegate = self
        newPasswordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }

    @objc func doneAction() {
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
