//
//  Baitap4-2ViewController.swift
//  Baitap9Navigation
//
//  Created by MBA0245P on 10/12/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap4_2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 20))
        searchBar.placeholder = "Search"
        let leftBarButton = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = leftBarButton
        let rightBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightBarButton
        navigationController?.navigationBar.backgroundColor = .darkGray
        navigationController?.navigationBar.tintColor = .systemPurple
    }
}
