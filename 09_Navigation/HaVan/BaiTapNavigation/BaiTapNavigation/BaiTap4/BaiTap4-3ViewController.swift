//
//  BaiTap4-3ViewController.swift
//  BaiTapNavigation
//
//  Created by NganHa on 7/23/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap4_3ViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
    }
    
    // MARK: - Private functions
    private func configNavigationBar() {
        let smallView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / 2 + UIScreen.main.bounds.width / 5 , height: 50))
        smallView.bounds = smallView.bounds.offsetBy(dx: -20, dy: 5)
        let searchbar = UISearchBar(frame: smallView.frame)
        searchbar.placeholder = "Search"
        smallView.addSubview(searchbar)
        let leftBarButton = UIBarButtonItem(customView: smallView)
        navigationItem.leftBarButtonItem = leftBarButton
        let rightBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: searchbar, action: nil)
        navigationItem.rightBarButtonItem = rightBarButton
        navigationController?.navigationBar.backgroundColor = .darkGray
    }
}
