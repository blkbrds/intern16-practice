//
//  EditProfileViewController.swift
//  BaiTap09
//
//  Created by PCI0020 on 7/9/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit"
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(preHomeScreen))
        navigationItem.leftBarButtonItem = cancelButton
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(finishEditProfile))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func preHomeScreen() {
        navigationController?.popViewController(animated: true)
    }

    @objc func finishEditProfile() {
          let viewControllers = navigationController?.viewControllers
            for vc in viewControllers! {
                if let homeViewController = vc as? HomeViewController {
                    homeViewController.userName = userNameTextField.text!
                    navigationController?.popViewController(animated: true)
                }
            }
    }
}
