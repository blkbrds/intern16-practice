//
//  EditViewController.swift
//  Bai2Navigation
//
//  Created by Trung Le D. on 7/21/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
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
        let viewcontroller = navigationController?.viewControllers
        for vc in viewcontroller! {
            if let homeViewController = vc as? HomeViewController {
                homeViewController.userName = userNameTextField.text!
                navigationController?.popViewController(animated: true)
            }
        }
    }
}



