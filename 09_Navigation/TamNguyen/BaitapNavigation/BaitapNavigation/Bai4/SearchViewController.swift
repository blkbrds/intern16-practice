//
//  SearchViewController.swift
//  BaitapNavigation
//
//  Created by PCI0001 on 7/23/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        // add cancel  button custom
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
        navigationItem.rightBarButtonItem = cancelButton
        let searchBar = UISearchBar(frame: CGRect(x: 20, y: 20, width: 250, height: 35))
        let leftBar = UIBarButtonItem(customView: searchBar)
        navigationItem.leftBarButtonItem = leftBar
        navigationController?.navigationBar.backgroundColor = .lightGray
        view.backgroundColor = .white
    }
}
