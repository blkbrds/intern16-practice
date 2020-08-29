//
//  UserDetailsViewController.swift
//  Navigation
//
//  Created by PCI0007 on 7/20/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class UserDetailsViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var editNameTextField: UITextField!
    
    // MARK: - Properties
    var userName:String = "user name"
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(finishExit))
        editNameTextField.text = userName
    }
    
    // MARK: - Private function
    @objc private func finishExit() {
        let viewControllers = navigationController?.viewControllers
        for vc in viewControllers! {
            if let profilesViewController = vc as? UserProfileViewController {
                for i in 0..<profilesViewController.datas.count {
                    if profilesViewController.datas[i].name == userName {
                        profilesViewController.datas[i].name = editNameTextField.text!
                        profilesViewController.scrollView.removeFromSuperview()
                    }
                    navigationController?.popViewController(animated: true)
                }
            }
        }
    }
}
