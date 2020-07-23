//
//  BaiTap4-2ViewController.swift
//  BaiTapNavigation
//
//  Created by NganHa on 7/22/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap4_2ViewController: UIViewController {

    // MARK: - IBOutlets
    
    // MARK: - Propeties
    
    // MARK: - Initialize
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
    }
    // MARK: - Override functions
    
    // MARK: - Private functions
    private func configNavigationBar() {
        title = "News Feed"
        navigationController?.navigationBar.barTintColor = .blue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        navigationItem.leftBarButtonItem = searchButton
        let peopleButton = UIBarButtonItem(image: UIImage(named: "profile"), style: .plain, target: searchButton
            , action: nil)
        navigationItem.rightBarButtonItem = peopleButton
    }
    // MARK: - Public functions
    
    // MARK: - Objc functions
    
    // MARK: - IBActions


}
