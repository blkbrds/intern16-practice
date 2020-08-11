//
//  HomeViewController.swift
//  baitap09
//
//  Created by NXH on 7/15/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private var usernameLabel: UILabel!
    
    // MARK: - Properties
    private let userdefault: UserDefaults = UserDefaults()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = userdefault.value(forKey: "username") as? String
        configUIBarButton()
    }
    
    // MARK: - Private Function
    private func configUIBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(tapOnEditButtonBar))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(tapOnLogoutButtonBar))
    }
    
    // MARK: - Objc Function
    @objc private func tapOnEditButtonBar() {
        let editViewController = EditViewController()
        editViewController.delegate = self
        navigationController?.pushViewController(editViewController, animated: true)
    }
    
    @objc private func tapOnLogoutButtonBar() {
        navigationController?.popViewController(animated: true)
    }
}

extension HomeViewController: EditViewControllerDelegate {
    func controller(_ controller: EditViewController, needsPerform action: EditViewController.Action) {
        switch action {
        case .updateUsername:
            guard let username = userdefault.value(forKey: "username") as? String else { return }
            usernameLabel.text = username
        }
    }
}
