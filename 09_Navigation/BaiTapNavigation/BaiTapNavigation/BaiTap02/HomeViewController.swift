//
//  HomeViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/22/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var usernameLabel: UILabel!

    // MARK: - Configure
    private struct Configure {
        static let titleName = "Home"
    }

    // MARK: - Properties
    var username: String = ""

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Configure.titleName
        configUI()
    }

    // MARK: Private Function
    private func configUI() {
        usernameLabel.text = "\(username)"
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(processCancel))
        navigationItem.backBarButtonItem = cancelButton
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(processEdit))
        navigationItem.rightBarButtonItem = editButton
    }

    @objc private func processCancel() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func processEdit() {
        let editViewController = EditViewController()
        editViewController.delegate = self
        navigationController?.pushViewController(editViewController, animated: true)
    }
}

// MARK: - EditViewControllerDelegate
extension HomeViewController: EditViewControllerDelegate {
    func setValue(_ viewController: EditViewController, needsPerform action: EditViewController.Action) {
        switch action {
        case .setName(name: let name):
            self.username = name
            usernameLabel.text = name
        }
    }
}
