//
//  HomeViewController.swift
//  Baitap9Navigation
//
//  Created by MBA0245P on 9/6/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate: class {
    func controller(_ controller: HomeViewController, needsPerform action: HomeViewController.Action)
}

class HomeViewController: UIViewController {
    
    var username = ""
    weak var delegate: HomeViewControllerDelegate?

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
        editViewController.username = username
        navigationController?.pushViewController(editViewController, animated: true)
        }
    
    @objc func logoutAction() {
        delegate?.controller(self, needsPerform: .resetValue)
        navigationController?.popViewController(animated: true)
    }
}

extension HomeViewController {
    enum Action {
        case resetValue
    }
}
