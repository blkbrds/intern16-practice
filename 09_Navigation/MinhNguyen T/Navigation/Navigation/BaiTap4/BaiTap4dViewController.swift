//
//  BaiTap4dViewController.swift
//  Navigation
//
//  Created by MacBook Pro on 7/23/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap4dViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNaviBar() 
    }
    
    // MARK: - Private functions
    private func configNaviBar() {
        view.backgroundColor = .white
        let searchItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        let bookMarkItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: nil)
        let mid1 = UIBarButtonItem(title: "mid1", style: .plain, target: self, action: nil)
        let mid2 = UIBarButtonItem(title: "mid2", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItems = [searchItem, bookMarkItem]
        navigationItem.leftBarButtonItems = [mid1, mid2]
    }
}
