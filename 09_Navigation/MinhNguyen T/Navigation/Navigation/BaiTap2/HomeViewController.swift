//
//  HomeViewController.swift
//  Navigation
//
//  Created by MacBook Pro on 7/21/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - IBOulets
    @IBOutlet private weak var usenameLabel: UILabel!
    
    // MARK: - Preroperties
    var username = ""
    
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
        super.viewWillAppear(true)
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
    @objc func logoutAction(){
        navigationController?.popViewController(animated: true)
    }

    @objc func editAction() {
        let nextUI = EditViewController()
        nextUI.delegate = self
        navigationController?.pushViewController(nextUI, animated: true)
    }
}

extension HomeViewController: EditViewControllerDelegate {
    func updateUsename(_ controller: EditViewController, needsPerform action: EditViewController.Action) {
        switch action {
        case .UpdateName(username: let username):
            self.username = username
            usenameLabel.text = username
        }
    }
}
