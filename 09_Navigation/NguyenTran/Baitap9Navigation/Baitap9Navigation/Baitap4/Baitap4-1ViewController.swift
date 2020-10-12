//
//  Baitap4-1ViewController.swift
//  Baitap9Navigation
//
//  Created by MBA0245P on 10/12/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap4_1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News Feed"
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.barTintColor = UIColor.init(red: 0/250, green: 95/250, blue: 177/250, alpha: 1)
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            navigationBar.tintColor = .white
            let searchItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
            navigationItem.leftBarButtonItem = searchItem
            let profileItem = UIBarButtonItem(image: UIImage(named: "profile"), style: .plain, target: self, action: nil)
            navigationItem.rightBarButtonItem = profileItem
    }
    
    }

}
