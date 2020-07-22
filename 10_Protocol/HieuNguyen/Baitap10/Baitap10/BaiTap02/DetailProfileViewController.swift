//
//  DetailProfileViewController.swift
//  BaiTap09
//
//  Created by PCI0020 on 7/9/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

final class DetailProfileViewController: UIViewController {

    @IBOutlet private weak var userNameTextField: UITextField!
    var userName:String = "user name"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(finishExit))
        navigationItem.rightBarButtonItem = doneButton
        userNameTextField.text = userName
    }
    
    @objc private func finishExit() {
        let viewControllers = navigationController?.viewControllers
        for vc in viewControllers! {
            if let profilesViewController = vc as? ProfilesViewController {
                for i in 0..<profilesViewController.Datas.count {
                    if profilesViewController.Datas[i].name == userName {
                        profilesViewController.Datas[i].name = userNameTextField.text!
                        profilesViewController.scrollView.removeFromSuperview()
                    }
                    navigationController?.popViewController(animated: true)
                }
            }
        }
    }


}
