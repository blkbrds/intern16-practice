//
//  HomeView.swift
//  Navigation
//
//  Created by PCI0007 on 7/16/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: -IBOutlet
    @IBOutlet weak var welcomeLabel: UILabel!
    
    // MARK: - Properties
    var name: String = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        setupBarButton()
        welcomeLabel.text = name
    }
    
    // MARK: - Private functions
    private func setupBarButton() {
        let logoutButton = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logoutTouchUpInside))
        navigationItem.leftBarButtonItem = logoutButton
        let editButton = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(editTouchUpInside))
        navigationItem.rightBarButtonItem = editButton
    }

    @IBAction private func logoutTouchUpInside(_ sender: UIBarButtonItem) {
            self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction private func editTouchUpInside(_ sender: UIBarButtonItem) {
            let editView = EditViewController()
            self.navigationController?.pushViewController(editView, animated: true)
    }
}
