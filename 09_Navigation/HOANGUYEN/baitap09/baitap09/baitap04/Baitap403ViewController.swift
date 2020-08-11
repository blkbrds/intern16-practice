//
//  Baitap403ViewController.swift
//  baitap09
//
//  Created by NXH on 7/20/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap403ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
        configToolBar()
    }
    
    // MARK: - Private function
    private func configNavigation() {
        guard let widthBar = navigationController?.navigationBar.frame.width else {return}
        let searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: widthBar - 100, height: 30))
        let searchBarButton: UIBarButtonItem = UIBarButtonItem(customView: searchBar)
        searchBar.placeholder = "Search"
        navigationItem.leftBarButtonItem = searchBarButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: nil)
    }
    private func configToolBar() {
        guard let heighBar = navigationController?.navigationBar.frame.height else {return}
        let items = ["option 1", "option 2"]
        let segment: UISegmentedControl = UISegmentedControl(items: items)
        segment.selectedSegmentIndex = 1
        let navigateUIToolBar = UIToolbar(frame: CGRect(x: 0, y: heighBar, width: UIScreen.main.bounds.width, height: 50))
        navigationController?.navigationBar.addSubview(navigateUIToolBar)
        navigateUIToolBar.addSubview(segment)
        segment.backgroundColor = .blue
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.centerXAnchor.constraint(equalTo: navigateUIToolBar.centerXAnchor).isActive = true
        segment.centerYAnchor.constraint(equalTo: navigateUIToolBar.centerYAnchor).isActive = true
    }
}
