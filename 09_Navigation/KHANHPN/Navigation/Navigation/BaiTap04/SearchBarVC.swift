//
//  SearchBar.swift
//  Navigation
//
//  Created by PCI0007 on 7/20/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class SearchBarVC: UIViewController {
    
    // MARK: - Liffe cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customBar()
    }
    
    // MARK: - Private function
    private func customBar() {
        let searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        searchBar.placeholder = "Muốn gì?"
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: nil)
    }
}
