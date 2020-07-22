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

    // MARK: - Properties
    var username: String = ""

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        configUI()

    }
    // MARK: Private Function
    private func configUI() {
        usernameLabel.text = "\(username)"
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: nil)
    }
}
