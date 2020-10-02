//
//  HomeViewController.swift
//  Baitap9Navigation
//
//  Created by MBA0245P on 9/6/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var username = ""

    @IBOutlet weak var welcomeTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"
        
        let logOutButton = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logoutAction))
        navigationItem.leftBarButtonItem = logOutButton
        
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAction))
        navigationItem.rightBarButtonItem = editButton
        
        welcomeTextField.text = "Welcome\n\(username)"
        
    }
    
    @objc func editAction() {
        let editViewController = EditViewController()
        navigationController?.pushViewController(editViewController, animated: true)
        }
    
    @objc func logoutAction() {
        navigationController?.popViewController(animated: true)
    }
}
