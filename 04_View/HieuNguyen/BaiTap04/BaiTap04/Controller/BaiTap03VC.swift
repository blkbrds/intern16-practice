//
//  BaiTap03VC.swift
//  BaiTap04
//
//  Created by PCI0020 on 6/29/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class BaiTap03VC: UIViewController {
    
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        userNameTF.delegate = self
        passwordTF.delegate = self
        
    }

    @IBAction func loginBtnWasPressed(_ sender: Any) {
        if userNameTF.text != "Admin" || passwordTF.text != "Admin123" {
            errorLabel.isHidden = false
            errorLabel.text = "Login Fail"
        } else {
            
            errorLabel.isHidden = false
            errorLabel.text = "Login Success"
            
            
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func clearBtnWasPressed(_ sender: Any) {
    }
    
}

extension BaiTap03VC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("press ok")
        return true
    }
}
