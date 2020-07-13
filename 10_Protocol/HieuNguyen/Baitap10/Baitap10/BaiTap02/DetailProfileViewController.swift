//
//  DetailProfileViewController.swift
//  BaiTap09
//
//  Created by PCI0020 on 7/9/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class DetailProfileViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    var userName:String = "user name"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(finishExit))
        navigationItem.rightBarButtonItem = doneButton
        userNameTextField.text = userName
    }
    
    @objc func finishExit() {
        let viewControllers = navigationController?.viewControllers
        for vc in viewControllers! {
            if let profilesViewController = vc as? ProfilesViewController {
                for i in 0..<profilesViewController.Data.count {
                    if profilesViewController.Data[i].name == userName {
                        profilesViewController.Data[i].name = userNameTextField.text!
                    }
                    navigationController?.popViewController(animated: true)
                }
            }
        }
    }


}
