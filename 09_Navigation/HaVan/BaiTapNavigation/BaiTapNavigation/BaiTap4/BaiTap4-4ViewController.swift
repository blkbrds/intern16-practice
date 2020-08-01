//
//  BaiTap4-4ViewController.swift
//  BaiTapNavigation
//
//  Created by NganHa on 7/23/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap4_4ViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
    }
    
    // MARK: - Private functions
    private func configNavigationBar() {
        title = "Bar button test"
        let questionMarkButton = UIBarButtonItem(image: UIImage(named: "questionmark"), style: .plain, target: self, action: #selector(turnTo5ViewController))
        navigationItem.rightBarButtonItem = questionMarkButton
    }
    
    // MARK: - Objc functions
    @objc private func turnTo5ViewController() {
        let vc = BaiTap4_5ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
