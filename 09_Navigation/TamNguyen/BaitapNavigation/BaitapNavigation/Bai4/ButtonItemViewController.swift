//
//  ButtonItemViewController.swift
//  BaitapNavigation
//
//  Created by PCI0001 on 7/23/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class ButtonItemViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK : - Private methods
    private func configUI() {
        view.backgroundColor = .white
        let rightButton = UIBarButtonItem(title: "Right", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightButton
        let backButton = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: nil)
        let composeButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: nil)
        let organizeButton = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: nil)
        navigationItem.leftBarButtonItems = [backButton, composeButton, organizeButton]
    }
}
