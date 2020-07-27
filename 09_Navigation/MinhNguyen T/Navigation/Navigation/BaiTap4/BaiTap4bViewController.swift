//
//  BaiTap4bViewController.swift
//  Navigation
//
//  Created by MacBook Pro on 7/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap4bViewController: UIViewController {
    
    // MARK: - Properties
    private var searchBar:UISearchBar = UISearchBar()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavi()
    }
    
    // MARK: - Private functions
    private func configNavi() {
        navigationController?.navigationBar.backgroundColor = .gray
        let searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        searchBar.placeholder = "Search"
        let leftNavBarButton = UIBarButtonItem(customView: searchBar)
        navigationItem.leftBarButtonItem = leftNavBarButton
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action:nil)
        navigationItem.rightBarButtonItem = cancelButton
    }
}
