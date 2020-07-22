//
//  bai4ViewController.swift
//  Bai4Navigation
//
//  Created by Trung Le D. on 7/22/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class bai4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            title = "New Feed"
        let search = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButton))
        navigationItem.leftBarButtonItem = search
     let listUser = UIBarButtonItem(image: UIImage(named: "listUser"), style: .plain, target: self, action: #selector(searchButton))
           navigationItem.rightBarButtonItem = listUser
    }
    @objc func searchButton() {
        
    }
    @objc func listUserButton() {
        
    }
}
