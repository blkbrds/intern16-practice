//
//  BarButtonViewController.swift
//  BaitapNavigation
//
//  Created by PCI0001 on 7/23/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class BarButtonViewController: UIViewController {
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        title = "Bar Button Test"
        view.backgroundColor = .white
        let bookmarkButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: nil)
        navigationItem.rightBarButtonItem = bookmarkButton
    }
}
