//
//  NewsFeedViewController.swift
//  BaitapNavigation
//
//  Created by PCI0001 on 7/23/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class NewsFeedViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        title = "News Feed"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .systemBlue
        view.backgroundColor = .white
        // add search button custom
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        navigationItem.leftBarButtonItem = searchButton
        // add profile  button custom
        let profileButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
        navigationItem.rightBarButtonItem = profileButton
    }
}
