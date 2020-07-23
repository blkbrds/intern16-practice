//
//  4cViewController.swift
//  Bai4Navigation
//
//  Created by Trung Le D. on 7/23/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class bai4cViewController: UIViewController, UISearchBarDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        searchBar.placeholder = "Nhap vao day"
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        let searchButtonBar = UIBarButtonItem(customView: searchBar)
        navigationItem.leftBarButtonItem = searchButtonBar
    }
}

