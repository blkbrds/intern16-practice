//
//  BaiTap4aViewController.swift
//  Navigation
//
//  Created by MacBook Pro on 7/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap4aViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configNaviBar()
    }
    
    // MARK: - Private functions
    private func configNaviBar() {
        title = "News Feed"
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.backgroundColor = .blue
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        navigationController?.navigationBar.tintColor = .white
        navigationItem.leftBarButtonItem = searchButton
        let addButton = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: nil)
        navigationController?.navigationBar.tintColor = .systemRed
        navigationItem.rightBarButtonItem = addButton
        
    }
    
}
