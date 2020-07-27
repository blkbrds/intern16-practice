//
//  EditViewController.swift
//  Navigation
//
//  Created by MacBook Pro on 7/21/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate: class {
    func updateUsename(_ controller: EditViewController, needsPerform action: EditViewController.Action)
}

final class EditViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var newPasswordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var notificationLabel: UILabel!

    // MARK: - Properties
    var userName: String?
    weak var delegate: EditViewControllerDelegate?

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit"
        configCancelButton()
        configDoneButton()
    }

    // MARK: Private funtions
    private func configCancelButton() {
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAction))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    private func configDoneButton() {
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneAction))
        navigationItem.rightBarButtonItem = doneButton
    }

    // MARK: - Objc funtions
    @objc func cancelAction(){
        navigationController?.popViewController(animated: true)
    }

    @objc private func doneAction(){
        if newPasswordTextField.text == confirmPasswordTextField.text {
            guard let newName = usernameTextField.text else { return }
            delegate?.updateUsename(self, needsPerform: .UpdateName(username: newName))
            navigationController?.popViewController(animated: true)
        } else {
            notificationLabel.text = "nhap sai password"
        }
    }
}

extension EditViewController {
    enum Action {
        case UpdateName(username : String)
    }
}

