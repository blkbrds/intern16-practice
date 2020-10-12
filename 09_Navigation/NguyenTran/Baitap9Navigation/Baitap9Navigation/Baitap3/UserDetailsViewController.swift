//
//  UserDetailsViewController.swift
//  Baitap9Navigation
//
//  Created by MBA0245P on 10/5/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

protocol UserDetailsViewControllerDelegate: class {
    func controller(_ viewController: UserDetailsViewController, needsPerform action: UserDetailsViewController.Action)
}

class UserDetailsViewController: UIViewController {

    var username = ""
    var index : Int?
    weak var delegate: UserDetailsViewControllerDelegate?
    
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
            errorLabel.text = "Không được để trống username"
        } else {
            guard let newName = usernameTextField.text, let index = index else { return }
            delegate?.controller(self, needsPerform: .updateInfo(newUsername: newName, index: index))
            self.navigationController?.popViewController(animated: true)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension UserDetailsViewController {
    enum Action {
        case updateInfo(newUsername: String, index: Int)
    }
}
