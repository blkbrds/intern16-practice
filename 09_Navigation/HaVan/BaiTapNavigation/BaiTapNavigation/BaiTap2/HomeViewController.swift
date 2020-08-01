//
//  HomeViewController.swift
//  BaiTapNavigation
//
//  Created by NganHa on 7/22/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
   
    // MARK: - IBOutlets
    @IBOutlet private weak var usernameLabel: UILabel!
    
    // MARK: - Properties
    var username = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        showUsername()
    }
    
    // MARK: - Private functions
    private func configNavigationBar() {
        title = "Home"
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(backLoginController))
        navigationItem.leftBarButtonItem = logoutButton
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(turnToEditController))
        navigationItem.rightBarButtonItem = editButton
    }
    
    private func showUsername() {
        usernameLabel.text = username
    }
    
    // MARK: - Objc functions
    @objc private func backLoginController() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func turnToEditController() {
        let editViewController = EditViewController()
        navigationController?.pushViewController(editViewController, animated: true)
        editViewController.delegate = self
    }
}

//MARK: -Extension
extension HomeViewController: EditViewControllerDelegate {
    func controller(_ controller: EditViewController, needsPerform action: EditViewController.Action) {
        switch action {
        case .changeValue(with: let name):
            usernameLabel.text = name
        }
    }
}
