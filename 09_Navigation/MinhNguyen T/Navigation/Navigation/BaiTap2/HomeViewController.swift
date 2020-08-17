//
//  HomeViewController.swift
//  Navigation
//
//  Created by MacBook Pro on 7/21/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate: class {
    func resetTextField(_ controller: HomeViewController, needsPerform action: HomeViewController.Action)
}

final class HomeViewController: UIViewController {

    // MARK: - IBOulets
    @IBOutlet private weak var usenameLabel: UILabel!
    
    // MARK: - Preroperties
    var username = ""
    weak var delegate: HomeViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        configLogoutButton()
        configEditButton()
        usenameLabel.text = "\(username)"
    }

    // MARK: - Override functions
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usenameLabel.text = username
    }

    // MARK: - Frivate functions
    private func configLogoutButton() {
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutAction))
        navigationItem.leftBarButtonItem = logoutButton
    }
    
    private func configEditButton() {
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAction))
        navigationItem.rightBarButtonItem = editButton
    }

    // MARK: - Objc functions
    @objc private func logoutAction() {
        delegate?.resetTextField(self, needsPerform: .resetTextField)
        navigationController?.popViewController(animated: true)
    }

    @objc private func editAction() {
        let nextVC = EditViewController()
        nextVC.delegate = self
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension HomeViewController {
    enum Action {
        case resetTextField
    }
}

extension HomeViewController: EditViewControllerDelegate {
    func updateUsename(_ controller: EditViewController, needsPerform action: EditViewController.Action) {
        switch action {
        case .updateName(username: let username):
            self.username = username
            usenameLabel.text = username
        }
    }
}

