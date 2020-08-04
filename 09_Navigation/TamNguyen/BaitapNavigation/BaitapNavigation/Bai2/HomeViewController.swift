//
//  HomeViewController.swift
//  BaitapNavigation
//
//  Created by PCI0001 on 7/21/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - IBOulet
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        title = "Home"
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(popLoginButtonTouchUpInside))
        navigationItem.leftBarButtonItem = logoutButton
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(pushEditButtonTouchUpInside))
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc private func popLoginButtonTouchUpInside() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func pushEditButtonTouchUpInside() {
        let nextEditView = EditViewController()
        nextEditView.delegate = self
        navigationController?.pushViewController(nextEditView, animated: true)
    }
}

// MARK: - Extension EditViewDelegate
extension HomeViewController: EditViewDelegate {
    func updateUser(view: EditViewController, user: String) {
        nameLabel.text = user
    }
}
