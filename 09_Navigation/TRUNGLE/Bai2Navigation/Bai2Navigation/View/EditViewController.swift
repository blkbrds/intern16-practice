//
//  EditViewController.swift
//  Bai2Navigation
//
//  Created by Trung Le D. on 7/21/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate: class {
    func editUserName(userName: String?)
}

class EditViewController: UIViewController {
    
    weak var delegate: EditViewControllerDelegate?
    @IBOutlet weak var userNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "EDIT"
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButton))
        navigationItem.leftBarButtonItem = cancel
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButton))
        navigationItem.rightBarButtonItem = done
    }
    
    @objc func cancelButton() {
        navigationController?.popViewController(animated: true)
    }
    @objc func doneButton() {
        if let delegate = delegate {
            delegate.editUserName(userName: userNameTextField.text)
        }
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
}


