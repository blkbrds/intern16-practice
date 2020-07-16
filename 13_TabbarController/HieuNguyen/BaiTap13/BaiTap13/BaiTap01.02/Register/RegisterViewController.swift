//
//  EditProfileViewController.swift
//  BaiTap09
//
//  Created by PCI0020 on 7/9/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit"
    }
    
    @IBAction func registerButtonTouchUpInside(_ sender: Any) {
        if userNameTextField.text != "" && newPasswordTextField.text != "" {
            SceneDelegate.shared.changeRootViewController(root: .tabbar)
        }
    }
}
