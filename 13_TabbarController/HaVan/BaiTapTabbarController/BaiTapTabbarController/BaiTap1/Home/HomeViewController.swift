//
//  HomeViewController.swift
//  BaiTapTabbarController
//
//  Created by NganHa on 8/7/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
    }
    
    // MARK: - Private functions
    func configNavigation() {
        title = "HOME"
    }
    
    // MARK: - IBAction functions
    @IBAction private func loginButtonTouchUpInside(_ sender: UIButton) {
    }
}
