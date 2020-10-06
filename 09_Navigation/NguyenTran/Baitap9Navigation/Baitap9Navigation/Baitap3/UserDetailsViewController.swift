//
//  UserDetailsViewController.swift
//  Baitap9Navigation
//
//  Created by MBA0245P on 10/5/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    var username = ""

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneAction))
        navigationItem.rightBarButtonItem = doneButton
        usernameTextField.text = username
        errorLabel.isHidden = true
    }
    
    @objc func doneAction() {
        if usernameTextField.text == "" {
            errorLabel.isHidden = false

            
        }
    }

}
