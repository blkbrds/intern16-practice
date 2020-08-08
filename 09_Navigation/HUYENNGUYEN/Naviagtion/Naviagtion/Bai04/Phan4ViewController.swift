//
//  Phan4ViewController.swift
//  Naviagtion
//
//  Created by bu on 7/23/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class Phan4ViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Function
    private func configUI() {
        title = "Bar Button Test"

        let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(handleClickEdit))
        navigationItem.rightBarButtonItem = button
        
        let navBackgroundImage = UIImage(named: "Image")
        navigationController?.navigationBar.setBackgroundImage(navBackgroundImage, for: .default)
    }
    
    // MARK: - Objc
    @objc func handleClickEdit(){}
}
