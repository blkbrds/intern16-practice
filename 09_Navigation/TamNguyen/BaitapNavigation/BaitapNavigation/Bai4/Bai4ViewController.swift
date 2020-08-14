//
//  Bai4ViewController.swift
//  BaitapNavigation
//
//  Created by PCI0001 on 7/23/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai4ViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        title = "Gradient NavigationBar"
        let image = UIImage(named: "bg-nav-bar-e1522125676147.jpg")
        navigationController?.navigationBar.setBackgroundImage(image, for: .default)
    }
}
