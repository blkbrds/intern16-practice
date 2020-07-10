//
//  BaiTap03VC.swift
//  BaiTap09
//
//  Created by PCI0020 on 7/10/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class BaiTap03VC: UIViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        navigationItem.titleView = searchBar
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
        navigationItem.rightBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    }

}
